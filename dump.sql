--
-- PostgreSQL database dump
--

-- Dumped from database version 14.2
-- Dumped by pg_dump version 14.2

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
-- Name: 123; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA "123";


ALTER SCHEMA "123" OWNER TO postgres;

--
-- Name: publicr; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA publicr;


ALTER SCHEMA publicr OWNER TO postgres;

--
-- Name: SCHEMA publicr; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON SCHEMA publicr IS 'standard public schema';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: 1233; Type: TABLE; Schema: 123; Owner: postgres
--

CREATE TABLE "123"."1233" (
    id integer NOT NULL,
    txt text
);


ALTER TABLE "123"."1233" OWNER TO postgres;

--
-- Name: 1233_id_seq; Type: SEQUENCE; Schema: 123; Owner: postgres
--

CREATE SEQUENCE "123"."1233_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "123"."1233_id_seq" OWNER TO postgres;

--
-- Name: 1233_id_seq; Type: SEQUENCE OWNED BY; Schema: 123; Owner: postgres
--

ALTER SEQUENCE "123"."1233_id_seq" OWNED BY "123"."1233".id;


--
-- Name: busket; Type: TABLE; Schema: publicr; Owner: postgres
--

CREATE TABLE publicr.busket (
    id integer NOT NULL,
    id_user integer NOT NULL,
    id_product integer NOT NULL
);


ALTER TABLE publicr.busket OWNER TO postgres;

--
-- Name: busket_id_seq; Type: SEQUENCE; Schema: publicr; Owner: postgres
--

CREATE SEQUENCE publicr.busket_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE publicr.busket_id_seq OWNER TO postgres;

--
-- Name: busket_id_seq; Type: SEQUENCE OWNED BY; Schema: publicr; Owner: postgres
--

ALTER SEQUENCE publicr.busket_id_seq OWNED BY publicr.busket.id;


--
-- Name: buys; Type: TABLE; Schema: publicr; Owner: postgres
--

CREATE TABLE publicr.buys (
    buys_id integer NOT NULL,
    id_user integer,
    id_article integer
);


ALTER TABLE publicr.buys OWNER TO postgres;

--
-- Name: buys_buys_id_seq; Type: SEQUENCE; Schema: publicr; Owner: postgres
--

CREATE SEQUENCE publicr.buys_buys_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE publicr.buys_buys_id_seq OWNER TO postgres;

--
-- Name: buys_buys_id_seq; Type: SEQUENCE OWNED BY; Schema: publicr; Owner: postgres
--

ALTER SEQUENCE publicr.buys_buys_id_seq OWNED BY publicr.buys.buys_id;


--
-- Name: product; Type: TABLE; Schema: publicr; Owner: postgres
--

CREATE TABLE publicr.product (
    id integer NOT NULL,
    name text,
    type text,
    price integer,
    duration integer,
    description text,
    art integer,
    id_lector integer NOT NULL,
    date date
);


ALTER TABLE publicr.product OWNER TO postgres;

--
-- Name: product_id_seq; Type: SEQUENCE; Schema: publicr; Owner: postgres
--

CREATE SEQUENCE publicr.product_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE publicr.product_id_seq OWNER TO postgres;

--
-- Name: product_id_seq; Type: SEQUENCE OWNED BY; Schema: publicr; Owner: postgres
--

ALTER SEQUENCE publicr.product_id_seq OWNED BY publicr.product.id;


--
-- Name: comment; Type: TABLE; Schema: publicr; Owner: postgres
--

CREATE TABLE publicr.comment (
    id_comment integer DEFAULT nextval('publicr.product_id_seq'::regclass) NOT NULL,
    comment text NOT NULL,
    id_user integer NOT NULL,
    id_article integer NOT NULL
);


ALTER TABLE publicr.comment OWNER TO postgres;

--
-- Name: favorite; Type: TABLE; Schema: publicr; Owner: postgres
--

CREATE TABLE publicr.favorite (
    id_favorite integer DEFAULT nextval('publicr.busket_id_seq'::regclass) NOT NULL,
    id_user integer,
    id_article integer
);


ALTER TABLE publicr.favorite OWNER TO postgres;

--
-- Name: lectors; Type: TABLE; Schema: publicr; Owner: postgres
--

CREATE TABLE publicr.lectors (
    id_lector integer NOT NULL,
    name_lector text NOT NULL,
    id_user integer NOT NULL,
    experience integer,
    reward text,
    rating integer
);


ALTER TABLE publicr.lectors OWNER TO postgres;

--
-- Name: lectors_id_lector_seq; Type: SEQUENCE; Schema: publicr; Owner: postgres
--

CREATE SEQUENCE publicr.lectors_id_lector_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE publicr.lectors_id_lector_seq OWNER TO postgres;

--
-- Name: lectors_id_lector_seq; Type: SEQUENCE OWNED BY; Schema: publicr; Owner: postgres
--

ALTER SEQUENCE publicr.lectors_id_lector_seq OWNED BY publicr.lectors.id_lector;


--
-- Name: user; Type: TABLE; Schema: publicr; Owner: postgres
--

CREATE TABLE publicr."user" (
    id bigint NOT NULL,
    login text NOT NULL,
    password text NOT NULL,
    hash text NOT NULL,
    email_confirmed integer DEFAULT 0 NOT NULL,
    admin integer DEFAULT 0,
    name text,
    surname text,
    patronymic text,
    telefon text,
    email text,
    age integer
);


ALTER TABLE publicr."user" OWNER TO postgres;

--
-- Name: user_id_seq; Type: SEQUENCE; Schema: publicr; Owner: postgres
--

CREATE SEQUENCE publicr.user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE publicr.user_id_seq OWNER TO postgres;

--
-- Name: user_id_seq; Type: SEQUENCE OWNED BY; Schema: publicr; Owner: postgres
--

ALTER SEQUENCE publicr.user_id_seq OWNED BY publicr."user".id;


--
-- Name: 1233 id; Type: DEFAULT; Schema: 123; Owner: postgres
--

ALTER TABLE ONLY "123"."1233" ALTER COLUMN id SET DEFAULT nextval('"123"."1233_id_seq"'::regclass);


--
-- Name: busket id; Type: DEFAULT; Schema: publicr; Owner: postgres
--

ALTER TABLE ONLY publicr.busket ALTER COLUMN id SET DEFAULT nextval('publicr.busket_id_seq'::regclass);


--
-- Name: buys buys_id; Type: DEFAULT; Schema: publicr; Owner: postgres
--

ALTER TABLE ONLY publicr.buys ALTER COLUMN buys_id SET DEFAULT nextval('publicr.buys_buys_id_seq'::regclass);


--
-- Name: lectors id_lector; Type: DEFAULT; Schema: publicr; Owner: postgres
--

ALTER TABLE ONLY publicr.lectors ALTER COLUMN id_lector SET DEFAULT nextval('publicr.lectors_id_lector_seq'::regclass);


--
-- Name: product id; Type: DEFAULT; Schema: publicr; Owner: postgres
--

ALTER TABLE ONLY publicr.product ALTER COLUMN id SET DEFAULT nextval('publicr.product_id_seq'::regclass);


--
-- Name: user id; Type: DEFAULT; Schema: publicr; Owner: postgres
--

ALTER TABLE ONLY publicr."user" ALTER COLUMN id SET DEFAULT nextval('publicr.user_id_seq'::regclass);


--
-- Data for Name: 1233; Type: TABLE DATA; Schema: 123; Owner: postgres
--

COPY "123"."1233" (id, txt) FROM stdin;
\.


--
-- Data for Name: busket; Type: TABLE DATA; Schema: publicr; Owner: postgres
--

COPY publicr.busket (id, id_user, id_product) FROM stdin;
25	23	3
\.


--
-- Data for Name: buys; Type: TABLE DATA; Schema: publicr; Owner: postgres
--

COPY publicr.buys (buys_id, id_user, id_article) FROM stdin;
1	24	3
5	24	1
6	24	6
7	13	3
\.


--
-- Data for Name: comment; Type: TABLE DATA; Schema: publicr; Owner: postgres
--

COPY publicr.comment (id_comment, comment, id_user, id_article) FROM stdin;
11	 hghjhg	13	6
12	 hghjhg	13	6
13	 hhhhhhhhhhhhhhhhhhh	13	6
14	 Луна-тян	13	6
15	 амапапапап	13	3
16	всмвам	13	3
27	 о	13	3
28	 вапр	13	3
29	 wedf	23	3
\.


--
-- Data for Name: favorite; Type: TABLE DATA; Schema: publicr; Owner: postgres
--

COPY publicr.favorite (id_favorite, id_user, id_article) FROM stdin;
32	24	6
34	24	1
\.


--
-- Data for Name: lectors; Type: TABLE DATA; Schema: publicr; Owner: postgres
--

COPY publicr.lectors (id_lector, name_lector, id_user, experience, reward, rating) FROM stdin;
1	Михаил Круг	13	\N	\N	\N
2	Иванов И.И.	16	\N	\N	\N
3	Иван Петрович(Трудовик)	23	10	 fgfgfgfgfgfg	10
\.


--
-- Data for Name: product; Type: TABLE DATA; Schema: publicr; Owner: postgres
--

COPY publicr.product (id, name, type, price, duration, description, art, id_lector, date) FROM stdin;
6	Лекция о Луне	Планета	190	45	Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.	6	1	2022-12-18
3	Лекция о звездах	Звёзды	230	65	Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit, qui in ea voluptate velit esse, quam nihil molestiae consequatur, vel illum, qui dolorem eum fugiat, quo voluptas nulla pariatur? At vero eos et accusamus et iusto odio dignissimos ducimus, qui blanditiis praesentium voluptatum deleniti atque corrupti, quos dolores et quas molestias excepturi sint, obcaecati cupiditate non provident, similique sunt in culpa, qui officia deserunt mollitia animi, id est laborum et dolorum fuga.	3	2	2022-10-11
1	Лекция о Земле	Планета	40050	11	Lorem ipsum dolor sit amet, consectetur adipiscin...\t\n	1	1	2022-10-11
4	Лекция о Юпитере	Планета	349	135	Et harum quidem rerum facilis est et expedita distinctio. Nam libero tempore, cum soluta nobis est eligendi optio, cumque nihil impedit, quo minus id, quod maxime placeat, facere possimus, omnis voluptas assumenda est, omnis dolor repellendus. Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet, ut et voluptates repudiandae sint et molestiae non recusandae. Itaque earum rerum hic tenetur a sapiente delectus, ut aut reiciendis voluptatibus maiores alias consequatur aut perferendis doloribus asperiores repellat.	4	2	2022-10-11
5	Лекция о Звёздах	Звёзды	450	100	Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.	7	1	2022-10-11
\.


--
-- Data for Name: user; Type: TABLE DATA; Schema: publicr; Owner: postgres
--

COPY publicr."user" (id, login, password, hash, email_confirmed, admin, name, surname, patronymic, telefon, email, age) FROM stdin;
15	ghghgh	bd462d5d7e7d5f8416515c6b0f3ed640	b989b6642c5c5bc3dd7169c11a8de093	1	0	\N	\N	\N	\N	\N	\N
16	polukarov2002@mail.ru	1552c03e78d38d5005d4ce7b8018addf	1e797b5622b511f15644869a970a728a	1	0	\N	\N	\N	\N	\N	\N
13	guginot123@mail.ru	fe53d0f021ab330ad0bb0ed6f4909bd3	edb71e41841704d0c6095d8b1073c4e4	1	1	Miss322	2323	2323	911-292-3141	\N	1212
23	polukarov2001@gmail.com	de88e3e4ab202d87754078cbb2df6063	75aca41315d1cf5ac20ad09e8e7fb996	1	0	fgfgfgf	2	2	911-292-3141	\N	2
24	guginot121@mail.ru	243909c1499d9cd989e9ebd333b85bfe	cdac2b0aa65d140a064545cd8a8c1a6f	1	0	\N	\N	\N	\N	\N	\N
\.


--
-- Name: 1233_id_seq; Type: SEQUENCE SET; Schema: 123; Owner: postgres
--

SELECT pg_catalog.setval('"123"."1233_id_seq"', 1, false);


--
-- Name: busket_id_seq; Type: SEQUENCE SET; Schema: publicr; Owner: postgres
--

SELECT pg_catalog.setval('publicr.busket_id_seq', 42, true);


--
-- Name: buys_buys_id_seq; Type: SEQUENCE SET; Schema: publicr; Owner: postgres
--

SELECT pg_catalog.setval('publicr.buys_buys_id_seq', 7, true);


--
-- Name: lectors_id_lector_seq; Type: SEQUENCE SET; Schema: publicr; Owner: postgres
--

SELECT pg_catalog.setval('publicr.lectors_id_lector_seq', 3, true);


--
-- Name: product_id_seq; Type: SEQUENCE SET; Schema: publicr; Owner: postgres
--

SELECT pg_catalog.setval('publicr.product_id_seq', 29, true);


--
-- Name: user_id_seq; Type: SEQUENCE SET; Schema: publicr; Owner: postgres
--

SELECT pg_catalog.setval('publicr.user_id_seq', 24, true);


--
-- Name: busket busket_pkey; Type: CONSTRAINT; Schema: publicr; Owner: postgres
--

ALTER TABLE ONLY publicr.busket
    ADD CONSTRAINT busket_pkey PRIMARY KEY (id);


--
-- Name: buys buys_pkey; Type: CONSTRAINT; Schema: publicr; Owner: postgres
--

ALTER TABLE ONLY publicr.buys
    ADD CONSTRAINT buys_pkey PRIMARY KEY (buys_id);


--
-- Name: comment comment_pkey; Type: CONSTRAINT; Schema: publicr; Owner: postgres
--

ALTER TABLE ONLY publicr.comment
    ADD CONSTRAINT comment_pkey PRIMARY KEY (id_comment);


--
-- Name: favorite favorite_pkey; Type: CONSTRAINT; Schema: publicr; Owner: postgres
--

ALTER TABLE ONLY publicr.favorite
    ADD CONSTRAINT favorite_pkey PRIMARY KEY (id_favorite);


--
-- Name: lectors lectors_pkey; Type: CONSTRAINT; Schema: publicr; Owner: postgres
--

ALTER TABLE ONLY publicr.lectors
    ADD CONSTRAINT lectors_pkey PRIMARY KEY (id_lector);


--
-- Name: product product_pkey; Type: CONSTRAINT; Schema: publicr; Owner: postgres
--

ALTER TABLE ONLY publicr.product
    ADD CONSTRAINT product_pkey PRIMARY KEY (id);


--
-- Name: user user_pkey; Type: CONSTRAINT; Schema: publicr; Owner: postgres
--

ALTER TABLE ONLY publicr."user"
    ADD CONSTRAINT user_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

