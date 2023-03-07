--
-- PostgreSQL database cluster dump
--

SET default_transaction_read_only = off;

SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;

--
-- Roles
--

CREATE ROLE admin;
ALTER ROLE admin WITH SUPERUSER INHERIT CREATEROLE CREATEDB LOGIN REPLICATION BYPASSRLS PASSWORD 'SCRAM-SHA-256$4096:GZYx3Ng4zEelRpvjX5RJlQ==$Mv5u8AkPQ1widgH3hNQVWFNKcm5R25l4IFOfp3mo8pU=:JWfRm+1fpu5eO2UjshuarQiTYr0MH6JdUFJPvQ3+hfA=';






--
-- Databases
--

--
-- Database "template1" dump
--

\connect template1

--
-- PostgreSQL database dump
--

-- Dumped from database version 14.3
-- Dumped by pg_dump version 14.3

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- PostgreSQL database dump complete
--

--
-- Database "otus_store" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 14.3
-- Dumped by pg_dump version 14.3

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: otus_store; Type: DATABASE; Schema: -; Owner: admin
--

CREATE DATABASE otus_store WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'en_US.utf8';


ALTER DATABASE otus_store OWNER TO admin;

\connect otus_store

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: category; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.category (
    id integer NOT NULL,
    name character varying(20) NOT NULL,
    fk_parent_category integer
);


ALTER TABLE public.category OWNER TO admin;

--
-- Name: category_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.category_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.category_id_seq OWNER TO admin;

--
-- Name: category_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.category_id_seq OWNED BY public.category.id;


--
-- Name: customer; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.customer (
    id integer NOT NULL,
    name character varying(100) NOT NULL
);


ALTER TABLE public.customer OWNER TO admin;

--
-- Name: customer_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.customer_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.customer_id_seq OWNER TO admin;

--
-- Name: customer_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.customer_id_seq OWNED BY public.customer.id;


--
-- Name: manufacturer; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.manufacturer (
    id integer NOT NULL,
    name character varying(100) NOT NULL
);


ALTER TABLE public.manufacturer OWNER TO admin;

--
-- Name: manufacturer_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.manufacturer_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.manufacturer_id_seq OWNER TO admin;

--
-- Name: manufacturer_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.manufacturer_id_seq OWNED BY public.manufacturer.id;


--
-- Name: price_type; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.price_type (
    id integer NOT NULL,
    type_name character varying(10) NOT NULL
);


ALTER TABLE public.price_type OWNER TO admin;

--
-- Name: price_type_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.price_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.price_type_id_seq OWNER TO admin;

--
-- Name: price_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.price_type_id_seq OWNED BY public.price_type.id;


--
-- Name: product; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.product (
    id integer NOT NULL,
    description character varying(255),
    barcode bigint,
    fk_manufacturer integer NOT NULL,
    fk_category integer NOT NULL
);


ALTER TABLE public.product OWNER TO admin;

--
-- Name: product_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.product_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.product_id_seq OWNER TO admin;

--
-- Name: product_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.product_id_seq OWNED BY public.product.id;


--
-- Name: product_price; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.product_price (
    fk_product bigint NOT NULL,
    fk_price_type integer NOT NULL,
    value numeric NOT NULL
);


ALTER TABLE public.product_price OWNER TO admin;

--
-- Name: product_sale; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.product_sale (
    fk_product bigint NOT NULL,
    fk_sale bigint NOT NULL,
    amount integer NOT NULL,
    price integer NOT NULL
);


ALTER TABLE public.product_sale OWNER TO admin;

--
-- Name: product_supply; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.product_supply (
    fk_supply bigint NOT NULL,
    fk_product bigint NOT NULL,
    amount integer NOT NULL
);


ALTER TABLE public.product_supply OWNER TO admin;

--
-- Name: sale; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.sale (
    id integer NOT NULL,
    fk_customer bigint NOT NULL,
    date date NOT NULL
);


ALTER TABLE public.sale OWNER TO admin;

--
-- Name: sale_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.sale_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sale_id_seq OWNER TO admin;

--
-- Name: sale_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.sale_id_seq OWNED BY public.sale.id;


--
-- Name: supplier; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.supplier (
    id integer NOT NULL,
    "INN" integer NOT NULL,
    name character varying(100) NOT NULL
);


ALTER TABLE public.supplier OWNER TO admin;

--
-- Name: supplier_INN_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public."supplier_INN_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."supplier_INN_seq" OWNER TO admin;

--
-- Name: supplier_INN_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public."supplier_INN_seq" OWNED BY public.supplier."INN";


--
-- Name: supplier_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.supplier_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.supplier_id_seq OWNER TO admin;

--
-- Name: supplier_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.supplier_id_seq OWNED BY public.supplier.id;


--
-- Name: supply; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.supply (
    fk_supplier integer NOT NULL,
    id integer NOT NULL,
    date date NOT NULL
);


ALTER TABLE public.supply OWNER TO admin;

--
-- Name: supply_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.supply_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.supply_id_seq OWNER TO admin;

--
-- Name: supply_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.supply_id_seq OWNED BY public.supply.id;


--
-- Name: category id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.category ALTER COLUMN id SET DEFAULT nextval('public.category_id_seq'::regclass);


--
-- Name: customer id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.customer ALTER COLUMN id SET DEFAULT nextval('public.customer_id_seq'::regclass);


--
-- Name: manufacturer id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.manufacturer ALTER COLUMN id SET DEFAULT nextval('public.manufacturer_id_seq'::regclass);


--
-- Name: price_type id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.price_type ALTER COLUMN id SET DEFAULT nextval('public.price_type_id_seq'::regclass);


--
-- Name: product id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.product ALTER COLUMN id SET DEFAULT nextval('public.product_id_seq'::regclass);


--
-- Name: sale id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.sale ALTER COLUMN id SET DEFAULT nextval('public.sale_id_seq'::regclass);


--
-- Name: supplier id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.supplier ALTER COLUMN id SET DEFAULT nextval('public.supplier_id_seq'::regclass);


--
-- Name: supplier INN; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.supplier ALTER COLUMN "INN" SET DEFAULT nextval('public."supplier_INN_seq"'::regclass);


--
-- Name: supply id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.supply ALTER COLUMN id SET DEFAULT nextval('public.supply_id_seq'::regclass);


--
-- Data for Name: category; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.category (id, name, fk_parent_category) FROM stdin;
\.


--
-- Data for Name: customer; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.customer (id, name) FROM stdin;
\.


--
-- Data for Name: manufacturer; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.manufacturer (id, name) FROM stdin;
\.


--
-- Data for Name: price_type; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.price_type (id, type_name) FROM stdin;
\.


--
-- Data for Name: product; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.product (id, description, barcode, fk_manufacturer, fk_category) FROM stdin;
\.


--
-- Data for Name: product_price; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.product_price (fk_product, fk_price_type, value) FROM stdin;
\.


--
-- Data for Name: product_sale; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.product_sale (fk_product, fk_sale, amount, price) FROM stdin;
\.


--
-- Data for Name: product_supply; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.product_supply (fk_supply, fk_product, amount) FROM stdin;
\.


--
-- Data for Name: sale; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.sale (id, fk_customer, date) FROM stdin;
\.


--
-- Data for Name: supplier; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.supplier (id, "INN", name) FROM stdin;
\.


--
-- Data for Name: supply; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.supply (fk_supplier, id, date) FROM stdin;
\.


--
-- Name: category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.category_id_seq', 1, false);


--
-- Name: customer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.customer_id_seq', 1, false);


--
-- Name: manufacturer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.manufacturer_id_seq', 1, false);


--
-- Name: price_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.price_type_id_seq', 1, false);


--
-- Name: product_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.product_id_seq', 1, false);


--
-- Name: sale_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.sale_id_seq', 1, false);


--
-- Name: supplier_INN_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public."supplier_INN_seq"', 1, false);


--
-- Name: supplier_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.supplier_id_seq', 1, false);


--
-- Name: supply_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.supply_id_seq', 1, false);


--
-- Name: category category_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.category
    ADD CONSTRAINT category_pkey PRIMARY KEY (id);


--
-- Name: customer customer_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.customer
    ADD CONSTRAINT customer_pkey PRIMARY KEY (id);


--
-- Name: manufacturer manufacturer_name_key; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.manufacturer
    ADD CONSTRAINT manufacturer_name_key UNIQUE (name);


--
-- Name: manufacturer manufacturer_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.manufacturer
    ADD CONSTRAINT manufacturer_pkey PRIMARY KEY (id);


--
-- Name: price_type price_type_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.price_type
    ADD CONSTRAINT price_type_pkey PRIMARY KEY (id);


--
-- Name: price_type price_type_type_name_key; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.price_type
    ADD CONSTRAINT price_type_type_name_key UNIQUE (type_name);


--
-- Name: product product_barcode_key; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.product
    ADD CONSTRAINT product_barcode_key UNIQUE (barcode);


--
-- Name: product product_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.product
    ADD CONSTRAINT product_pkey PRIMARY KEY (id);


--
-- Name: product_price product_price_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.product_price
    ADD CONSTRAINT product_price_pkey PRIMARY KEY (fk_product, fk_price_type);


--
-- Name: product_sale product_sale_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.product_sale
    ADD CONSTRAINT product_sale_pkey PRIMARY KEY (fk_sale, fk_product);


--
-- Name: product_supply product_supply_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.product_supply
    ADD CONSTRAINT product_supply_pkey PRIMARY KEY (fk_product, fk_supply);


--
-- Name: sale sale_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.sale
    ADD CONSTRAINT sale_pkey PRIMARY KEY (id);


--
-- Name: supplier supplier_INN_key; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.supplier
    ADD CONSTRAINT "supplier_INN_key" UNIQUE ("INN");


--
-- Name: supplier supplier_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.supplier
    ADD CONSTRAINT supplier_pkey PRIMARY KEY (id);


--
-- Name: supply supply_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.supply
    ADD CONSTRAINT supply_pkey PRIMARY KEY (id);


--
-- Name: category category_fk_parent_category_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.category
    ADD CONSTRAINT category_fk_parent_category_fkey FOREIGN KEY (fk_parent_category) REFERENCES public.category(id);


--
-- Name: product product_fk0; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.product
    ADD CONSTRAINT product_fk0 FOREIGN KEY (fk_manufacturer) REFERENCES public.manufacturer(id);


--
-- Name: product product_fk_category_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.product
    ADD CONSTRAINT product_fk_category_fkey FOREIGN KEY (fk_category) REFERENCES public.category(id);


--
-- Name: product_price product_price_fk0; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.product_price
    ADD CONSTRAINT product_price_fk0 FOREIGN KEY (fk_product) REFERENCES public.product(id);


--
-- Name: product_price product_price_fk1; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.product_price
    ADD CONSTRAINT product_price_fk1 FOREIGN KEY (fk_price_type) REFERENCES public.price_type(id);


--
-- Name: product_sale product_sale_fk0; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.product_sale
    ADD CONSTRAINT product_sale_fk0 FOREIGN KEY (fk_sale) REFERENCES public.sale(id);


--
-- Name: product_sale product_sale_fk1; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.product_sale
    ADD CONSTRAINT product_sale_fk1 FOREIGN KEY (fk_product) REFERENCES public.product(id);


--
-- Name: product_supply product_supply_fk0; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.product_supply
    ADD CONSTRAINT product_supply_fk0 FOREIGN KEY (fk_product) REFERENCES public.product(id);


--
-- Name: product_supply product_supply_fk1; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.product_supply
    ADD CONSTRAINT product_supply_fk1 FOREIGN KEY (fk_supply) REFERENCES public.supply(id);


--
-- Name: sale sale_fk0; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.sale
    ADD CONSTRAINT sale_fk0 FOREIGN KEY (fk_customer) REFERENCES public.customer(id);


--
-- Name: supply supply_fk0; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.supply
    ADD CONSTRAINT supply_fk0 FOREIGN KEY (fk_supplier) REFERENCES public.supplier(id);


--
-- PostgreSQL database dump complete
--

--
-- Database "postgres" dump
--

\connect postgres

--
-- PostgreSQL database dump
--

-- Dumped from database version 14.3
-- Dumped by pg_dump version 14.3

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- PostgreSQL database dump complete
--

--
-- PostgreSQL database cluster dump complete
--

