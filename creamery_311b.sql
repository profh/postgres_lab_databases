--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

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
-- Name: assignments; Type: TABLE; Schema: public; Owner: profh; Tablespace: 
--

CREATE TABLE assignments (
    id integer NOT NULL,
    store_id integer,
    employee_id integer,
    start_date date,
    end_date date,
    pay_level integer
);


ALTER TABLE public.assignments OWNER TO profh;

--
-- Name: assignments_id_seq; Type: SEQUENCE; Schema: public; Owner: profh
--

CREATE SEQUENCE assignments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.assignments_id_seq OWNER TO profh;

--
-- Name: assignments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: profh
--

ALTER SEQUENCE assignments_id_seq OWNED BY assignments.id;


--
-- Name: assignments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: profh
--

SELECT pg_catalog.setval('assignments_id_seq', 172, true);


--
-- Name: employees; Type: TABLE; Schema: public; Owner: profh; Tablespace: 
--

CREATE TABLE employees (
    id integer NOT NULL,
    first_name character varying(50),
    last_name character varying(50),
    ssn character varying(12),
    date_of_birth date,
    phone character varying(12),
    role character varying(12),
    active boolean DEFAULT true
);


ALTER TABLE public.employees OWNER TO profh;

--
-- Name: employees_id_seq; Type: SEQUENCE; Schema: public; Owner: profh
--

CREATE SEQUENCE employees_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.employees_id_seq OWNER TO profh;

--
-- Name: employees_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: profh
--

ALTER SEQUENCE employees_id_seq OWNED BY employees.id;


--
-- Name: employees_id_seq; Type: SEQUENCE SET; Schema: public; Owner: profh
--

SELECT pg_catalog.setval('employees_id_seq', 110, true);


--
-- Name: jobs; Type: TABLE; Schema: public; Owner: profh; Tablespace: 
--

CREATE TABLE jobs (
    id integer NOT NULL,
    name character varying(50),
    description text,
    active boolean DEFAULT true
);


ALTER TABLE public.jobs OWNER TO profh;

--
-- Name: jobs_id_seq; Type: SEQUENCE; Schema: public; Owner: profh
--

CREATE SEQUENCE jobs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.jobs_id_seq OWNER TO profh;

--
-- Name: jobs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: profh
--

ALTER SEQUENCE jobs_id_seq OWNED BY jobs.id;


--
-- Name: jobs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: profh
--

SELECT pg_catalog.setval('jobs_id_seq', 4, true);


--
-- Name: shift_jobs; Type: TABLE; Schema: public; Owner: profh; Tablespace: 
--

CREATE TABLE shift_jobs (
    id integer NOT NULL,
    shift_id integer,
    job_id integer
);


ALTER TABLE public.shift_jobs OWNER TO profh;

--
-- Name: shift_jobs_id_seq; Type: SEQUENCE; Schema: public; Owner: profh
--

CREATE SEQUENCE shift_jobs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.shift_jobs_id_seq OWNER TO profh;

--
-- Name: shift_jobs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: profh
--

ALTER SEQUENCE shift_jobs_id_seq OWNED BY shift_jobs.id;


--
-- Name: shift_jobs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: profh
--

SELECT pg_catalog.setval('shift_jobs_id_seq', 1, false);


--
-- Name: shifts; Type: TABLE; Schema: public; Owner: profh; Tablespace: 
--

CREATE TABLE shifts (
    id integer NOT NULL,
    assignment_id integer,
    date date,
    start_time time without time zone,
    end_time time without time zone,
    notes text
);


ALTER TABLE public.shifts OWNER TO profh;

--
-- Name: shifts_id_seq; Type: SEQUENCE; Schema: public; Owner: profh
--

CREATE SEQUENCE shifts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.shifts_id_seq OWNER TO profh;

--
-- Name: shifts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: profh
--

ALTER SEQUENCE shifts_id_seq OWNED BY shifts.id;


--
-- Name: shifts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: profh
--

SELECT pg_catalog.setval('shifts_id_seq', 136, true);


--
-- Name: stores; Type: TABLE; Schema: public; Owner: profh; Tablespace: 
--

CREATE TABLE stores (
    id integer NOT NULL,
    name character varying(50),
    street character varying(255),
    city character varying(50),
    state character varying(2) DEFAULT 'PA'::character varying,
    zip character varying(12),
    phone character varying(12),
    active boolean DEFAULT true,
    lat double precision,
    lon double precision
);


ALTER TABLE public.stores OWNER TO profh;

--
-- Name: stores_id_seq; Type: SEQUENCE; Schema: public; Owner: profh
--

CREATE SEQUENCE stores_id_seq
    START WITH 100
    INCREMENT BY 10
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.stores_id_seq OWNER TO profh;

--
-- Name: stores_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: profh
--

ALTER SEQUENCE stores_id_seq OWNED BY stores.id;


--
-- Name: stores_id_seq; Type: SEQUENCE SET; Schema: public; Owner: profh
--

SELECT pg_catalog.setval('stores_id_seq', 140, true);


--
-- Name: users; Type: TABLE; Schema: public; Owner: profh; Tablespace: 
--

CREATE TABLE users (
    id integer NOT NULL,
    email character varying(100),
    password_digest character varying(255),
    employee_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.users OWNER TO profh;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: profh
--

CREATE SEQUENCE users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO profh;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: profh
--

ALTER SEQUENCE users_id_seq OWNED BY users.id;


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: profh
--

SELECT pg_catalog.setval('users_id_seq', 4, true);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: profh
--

ALTER TABLE ONLY assignments ALTER COLUMN id SET DEFAULT nextval('assignments_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: profh
--

ALTER TABLE ONLY employees ALTER COLUMN id SET DEFAULT nextval('employees_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: profh
--

ALTER TABLE ONLY jobs ALTER COLUMN id SET DEFAULT nextval('jobs_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: profh
--

ALTER TABLE ONLY shift_jobs ALTER COLUMN id SET DEFAULT nextval('shift_jobs_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: profh
--

ALTER TABLE ONLY shifts ALTER COLUMN id SET DEFAULT nextval('shifts_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: profh
--

ALTER TABLE ONLY stores ALTER COLUMN id SET DEFAULT nextval('stores_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: profh
--

ALTER TABLE ONLY users ALTER COLUMN id SET DEFAULT nextval('users_id_seq'::regclass);


--
-- Data for Name: assignments; Type: TABLE DATA; Schema: public; Owner: profh
--

COPY assignments (id, store_id, employee_id, start_date, end_date, pay_level) FROM stdin;
3	110	7	2012-04-22	\N	5
4	110	8	2011-11-22	\N	4
13	110	15	2011-01-04	2012-07-01	1
18	110	20	2011-09-12	2012-08-15	1
22	110	24	2010-09-20	2012-08-09	1
25	140	27	2011-04-10	\N	1
30	110	32	2011-08-12	2012-08-01	2
45	110	47	2010-09-13	2012-07-30	3
48	110	50	2010-09-29	2012-07-21	3
50	110	52	2011-09-29	\N	2
53	110	55	2010-10-26	2012-06-22	2
76	110	78	2011-11-03	\N	2
87	110	89	2010-11-17	\N	1
94	110	96	2012-02-24	2012-07-17	1
96	110	98	2012-03-20	\N	3
97	110	99	2011-01-07	2012-08-16	2
100	110	102	2010-10-07	\N	3
101	110	103	2011-03-30	\N	3
16	110	18	2012-02-13	2012-08-16	1
114	110	18	2012-08-16	\N	2
19	110	21	2011-10-11	2012-07-04	1
20	110	22	2012-03-21	2012-07-07	1
117	110	22	2012-07-07	\N	2
23	110	25	2012-05-22	2012-07-07	3
27	110	29	2011-09-10	2012-08-14	2
29	110	31	2012-01-22	2012-07-28	1
33	110	35	2010-12-20	2012-08-18	3
35	110	37	2012-04-25	2012-08-19	1
40	110	42	2012-02-21	2012-07-22	3
43	110	45	2011-03-04	2012-07-05	2
56	110	58	2011-07-25	2012-07-07	1
65	110	67	2011-07-22	2012-08-11	2
68	110	70	2011-03-19	2012-07-11	1
84	110	86	2011-07-04	2012-07-18	3
85	110	87	2010-08-31	2012-08-11	1
93	110	95	2010-12-06	2012-07-18	1
104	110	106	2011-05-06	2012-08-16	3
108	110	110	2010-11-21	2012-07-23	1
121	110	28	2012-07-25	\N	2
122	110	29	2012-08-14	\N	3
125	110	33	2012-08-06	\N	2
128	110	37	2012-08-19	\N	2
133	110	42	2012-07-22	\N	4
134	110	43	2012-07-30	\N	3
5	120	9	2012-06-22	\N	5
6	120	10	2012-02-22	\N	4
34	120	36	2011-05-10	2012-07-13	1
44	120	46	2011-05-03	2012-07-04	3
46	120	48	2012-05-13	2012-07-03	3
62	120	64	2011-01-09	\N	3
64	120	66	2012-01-16	2012-07-21	2
67	120	69	2011-01-09	\N	2
71	120	73	2011-08-11	\N	2
72	120	74	2011-04-23	2012-07-28	1
75	120	77	2011-08-16	2012-07-20	2
80	120	82	2010-09-29	\N	3
89	120	91	2011-12-28	2012-07-02	1
98	120	100	2010-08-31	\N	2
9	120	11	2012-02-01	2012-08-08	1
12	120	14	2010-12-09	2012-08-16	1
14	120	16	2011-07-15	2012-08-14	2
113	120	16	2012-08-14	\N	3
17	120	19	2012-04-14	2012-08-02	3
21	120	23	2011-01-11	2012-07-17	2
24	120	26	2012-01-03	2012-07-15	3
26	120	28	2011-11-09	2012-07-25	1
28	120	30	2011-12-13	2012-07-07	2
31	120	33	2011-11-02	2012-08-06	1
37	120	39	2012-03-25	2012-07-08	1
38	120	40	2011-09-28	2012-08-08	2
39	120	41	2011-06-22	2012-08-12	1
47	120	49	2010-12-30	2012-07-06	1
49	120	51	2010-11-02	2012-08-05	2
51	120	53	2011-05-11	2012-08-09	3
52	120	54	2012-05-02	2012-07-25	1
57	120	59	2011-05-21	2012-07-31	1
59	120	61	2010-10-30	2012-07-16	1
60	120	62	2010-10-19	2012-08-01	1
66	120	68	2012-02-02	2012-08-12	3
70	120	72	2012-02-19	2012-08-02	2
73	120	75	2011-12-11	2012-07-09	1
79	120	81	2012-02-12	2012-07-14	3
81	120	83	2011-04-16	2012-07-18	3
86	120	88	2011-03-30	2012-07-22	1
88	120	90	2011-02-13	2012-08-17	2
90	120	92	2011-11-22	2012-07-08	3
99	120	101	2011-10-26	2012-08-18	2
102	120	104	2011-12-25	2012-07-06	3
1	100	5	2012-06-22	\N	4
2	100	6	2012-06-22	\N	4
7	100	3	2011-08-22	\N	5
11	100	13	2011-05-08	\N	2
15	100	17	2011-07-28	2012-07-08	2
54	100	56	2012-01-02	2012-07-29	3
58	100	60	2010-10-15	\N	2
63	100	65	2012-04-25	2012-07-13	2
69	100	71	2011-08-06	\N	3
78	100	80	2011-12-15	2012-06-26	2
82	100	84	2010-12-21	2012-08-16	3
95	100	97	2011-09-21	\N	2
8	100	4	2012-05-22	2012-08-18	2
109	100	4	2012-08-18	\N	3
110	100	11	2012-08-08	\N	2
10	100	12	2011-06-29	2012-08-16	3
111	100	12	2012-08-16	\N	4
112	100	14	2012-08-16	\N	2
115	100	19	2012-08-02	\N	4
116	100	21	2012-07-04	\N	2
118	100	23	2012-07-17	\N	3
32	100	34	2011-06-23	2012-07-12	3
41	100	43	2011-11-01	2012-07-30	2
42	100	44	2012-04-27	2012-07-28	2
55	100	57	2012-01-30	2012-08-07	2
74	100	76	2011-05-29	2012-07-19	2
77	100	79	2011-06-16	2012-07-08	1
83	100	85	2012-03-22	2012-08-10	2
91	100	93	2011-02-18	2012-08-13	2
103	100	105	2011-05-22	2012-07-07	2
106	100	108	2011-05-30	2012-08-13	1
123	100	30	2012-07-07	\N	3
124	100	31	2012-07-28	\N	2
36	100	38	2011-01-25	2012-08-08	2
130	100	39	2012-07-08	\N	2
131	100	40	2012-08-08	\N	3
135	100	44	2012-07-28	\N	3
137	100	49	2012-07-06	\N	2
138	100	51	2012-08-05	\N	3
139	100	53	2012-08-09	\N	4
142	100	58	2012-07-07	\N	2
143	100	59	2012-07-31	\N	2
61	100	63	2011-05-22	2012-07-06	2
147	100	67	2012-08-11	\N	3
150	100	72	2012-08-02	\N	3
151	100	75	2012-07-09	\N	2
155	100	83	2012-07-18	\N	4
158	100	87	2012-08-11	\N	2
168	100	106	2012-08-16	\N	4
169	100	107	2012-07-25	\N	4
140	110	54	2012-07-25	\N	2
145	110	62	2012-08-01	\N	2
149	110	70	2012-07-11	\N	2
156	110	85	2012-08-10	\N	3
160	110	90	2012-08-17	\N	3
162	110	93	2012-08-13	\N	3
92	110	94	2011-02-12	2012-08-10	3
165	110	101	2012-08-18	\N	3
172	110	110	2012-07-23	\N	2
105	120	107	2011-04-15	2012-07-25	3
107	120	109	2012-05-14	2012-07-27	2
119	120	25	2012-07-07	\N	4
120	120	26	2012-07-15	\N	4
126	120	34	2012-07-12	\N	4
127	120	35	2012-08-18	\N	4
129	120	38	2012-08-08	\N	3
132	120	41	2012-08-12	\N	2
136	120	45	2012-07-05	\N	3
141	120	57	2012-08-07	\N	3
144	120	61	2012-07-16	\N	2
146	120	63	2012-07-06	\N	3
148	120	68	2012-08-12	\N	4
152	120	76	2012-07-19	\N	3
153	120	79	2012-07-08	\N	2
154	120	81	2012-07-14	\N	4
157	120	86	2012-07-18	\N	4
159	120	88	2012-07-22	\N	2
161	120	92	2012-07-08	\N	4
163	120	94	2012-08-10	\N	4
164	120	95	2012-07-18	\N	2
166	120	104	2012-07-06	\N	4
167	120	105	2012-07-07	\N	3
170	120	108	2012-08-13	\N	2
171	120	109	2012-07-27	\N	3
\.


--
-- Data for Name: employees; Type: TABLE DATA; Schema: public; Owner: profh
--

COPY employees (id, first_name, last_name, ssn, date_of_birth, phone, role, active) FROM stdin;
1	Alex	Heimann	123456789	1993-01-25	4122683259	admin	t
2	Mark	Heimann	987654321	1993-01-25	4122688211	admin	t
3	Rachel	Heimann	013125299	1993-01-25	4122688211	manager	t
4	Dusty	Heimann	310521992	1993-01-25	4122688211	employee	t
5	Zaria	Kub	202472300	1988-08-22	1430398599	manager	t
6	Edwina	Donnelly	038223698	1985-08-22	0666629250	manager	t
7	Janis	Hammes	028209442	1984-08-22	3682054756	manager	t
8	Boris	Goyette	263122223	1985-08-22	6236102086	manager	t
9	Kallie	Volkman	027066003	1985-08-22	5543345216	manager	t
10	Joseph	Wunsch	009704653	1986-08-22	5295639088	manager	t
11	River	Windler	086418793	1993-05-04	0244771516	employee	t
12	Lydia	Dooley	182661551	1992-04-05	6482772009	employee	t
13	Dusty	Spencer	307239646	1996-08-02	9565693471	employee	t
14	Beau	Braun	029343201	1993-02-09	1413811333	employee	t
15	Reva	Jacobi	311157700	1993-01-10	2971519195	employee	f
16	Shaylee	Hayes	039573399	1994-06-05	4409394766	employee	t
17	Kaleigh	Ebert	216058421	1992-12-22	2196408673	employee	f
18	Alan	Schmitt	076613840	1994-12-11	3037938191	employee	t
19	Nicola	Leffler	197830487	1996-04-02	5473541393	employee	t
20	Marjorie	Gulgowski	041192249	1997-04-17	3944806707	employee	f
21	Rashad	Dickens	352989906	1996-01-31	5443411764	employee	t
22	Chyna	Quitzon	097749978	1991-01-16	9548275507	employee	t
23	Johnpaul	Murazik	072572759	1994-08-28	2541393785	employee	t
24	Margaret	Wehner	191104823	1996-06-21	6486264703	employee	f
25	Evans	Paucek	246006695	1990-09-09	5849383031	employee	t
26	Carter	Howe	364521495	1995-04-25	3551389232	employee	t
27	Lorenzo	Cartwright	076526829	1996-06-13	5687206983	employee	t
28	Rachelle	Rau	193918256	1994-12-28	7525874521	employee	t
30	Bridie	Pouros	038063314	1992-03-04	2086881055	employee	t
31	Kadin	Skiles	114616490	1991-12-12	9978226912	employee	t
32	Stuart	Cruickshank	018425612	1993-12-23	5860080653	employee	f
33	Cyril	Bogisich	315949211	1996-09-05	5048383038	employee	t
34	Kyla	Bechtelar	305081466	1992-06-20	5240060140	employee	t
35	Clotilde	Ferry	092005086	1990-12-19	9689248868	employee	t
36	Jaquelin	Marvin	003417975	1997-05-31	5817230819	employee	f
37	Lilly	Yundt	192092161	1992-01-22	2843396469	employee	t
38	Abel	Brown	379534888	1994-04-11	8789982421	employee	t
39	Leilani	Pfannerstill	267932683	1995-09-19	3095845652	employee	t
40	Leilani	Kreiger	067666076	1994-04-30	9531980825	employee	t
41	Leif	Gerhold	258485187	1994-01-07	7843106812	employee	t
42	Kellen	Huel	168299387	1996-10-06	9205455780	employee	t
43	Roger	Mosciski	198808532	1996-04-02	4084373592	employee	t
44	Susana	Connelly	170248069	1996-03-04	0886256383	employee	t
45	Tierra	Effertz	087317321	1993-04-01	2816037774	employee	t
46	Baby	Ondricka	355681387	1992-10-19	8584479920	employee	f
47	Rosemary	Ruecker	024816380	1995-07-16	9518860188	employee	f
48	Carter	Kutch	081709614	1994-06-01	1101278873	employee	f
49	Rosemary	Kreiger	077615250	1995-11-27	7438283762	employee	t
50	Monserrat	Hammes	237061124	1992-12-30	3892512538	employee	f
51	Shania	Konopelski	324205713	1997-01-29	8238586181	employee	t
52	Rex	Stamm	383194995	1995-11-08	5173087546	employee	t
53	Leland	Dare	337972752	1995-03-11	7648859015	employee	t
54	Zack	Stracke	035455614	1994-07-17	5857175324	employee	t
55	Estell	Goyette	025415629	1997-01-15	2862884851	employee	f
56	Camylle	Hudson	100375405	1992-12-03	0797466135	employee	f
57	Nils	Williamson	274664660	1991-05-27	2252121630	employee	t
58	Shana	Borer	249794883	1993-06-23	1581578786	employee	t
59	Casimer	Ortiz	191996624	1996-04-30	6138803459	employee	t
60	Sydney	Schneider	190344691	1993-05-17	1841374395	employee	t
61	Demarcus	Rowe	115548795	1996-12-26	4192554336	employee	t
62	Hazel	Pagac	359038160	1990-10-12	0069500250	employee	t
63	Brandt	Raynor	303400777	1993-08-11	7473375052	employee	t
64	Presley	Borer	225771697	1994-07-01	3006194565	employee	t
65	Casey	Carter	283416749	1992-08-18	7351543361	employee	f
66	Marilou	Rippin	297317602	1994-08-03	1065649624	employee	f
67	Pat	Bartell	148001222	1997-04-02	3688843099	employee	t
68	Hugh	Botsford	052267077	1992-06-25	5975813626	employee	t
69	Margarita	Howell	360669097	1993-01-26	1675158146	employee	t
70	Ted	Luettgen	130899920	1992-11-01	6826557068	employee	t
71	Wilfredo	Barton	034703704	1993-06-15	9655429471	employee	t
72	Sterling	Lubowitz	017622525	1996-02-08	7556067995	employee	t
73	Colten	Bahringer	114658673	1995-06-03	8536663910	employee	t
74	Fred	Purdy	147430777	1993-11-18	4918727035	employee	f
75	Marcia	Dibbert	181494786	1991-02-25	5714369716	employee	t
76	Armando	Ankunding	165876522	1992-02-07	8127787437	employee	t
77	Marjolaine	Welch	037335936	1997-01-05	0733014247	employee	f
78	Lupe	Hyatt	049101146	1991-05-01	1080180625	employee	t
79	Houston	Corkery	094185454	1997-01-26	9462037963	employee	t
80	Nathanael	Brekke	080366001	1996-05-09	3719455187	employee	f
81	Keshaun	Wintheiser	160685327	1993-12-22	6455601614	employee	t
82	Monty	Bernhard	156256560	1992-05-08	0342521039	employee	t
83	Gertrude	Gutkowski	011342787	1994-12-09	4574192980	employee	t
84	Viva	Schaefer	303114550	1992-01-13	1121695033	employee	f
85	Nat	Jacobson	262382652	1995-12-06	2583379542	employee	t
86	Solon	Bergnaum	036193359	1993-01-21	6951151279	employee	t
87	Madie	Roob	036843474	1995-02-25	5770418879	employee	t
88	Brando	Jacobs	065088762	1997-04-02	9181735182	employee	t
89	Drake	Boyle	327449783	1996-08-04	5236436748	employee	t
90	Jayne	Kreiger	281064467	1996-07-18	5923450666	employee	t
91	Olga	Schroeder	268369762	1991-08-07	1783485274	employee	f
92	Thomas	White	141699683	1996-12-27	9485829822	employee	t
93	Koby	Ankunding	040842010	1991-03-21	6178286675	employee	t
94	Janet	Mitchell	345032410	1996-08-25	3771434360	employee	t
95	Alda	Casper	259024490	1994-12-03	1834815546	employee	t
96	Evie	Zulauf	318571557	1993-04-18	9134622123	employee	f
97	Alva	Deckow	315409894	1997-07-08	2549395343	employee	t
98	Danielle	Larkin	215356406	1996-08-23	2127169878	employee	t
99	Colton	Weber	059990249	1991-09-18	5218059030	employee	f
100	Tyrell	Stiedemann	124441509	1996-04-13	1962503945	employee	t
101	Kianna	Walsh	223948810	1992-08-03	3689069004	employee	t
102	Nicolette	McGlynn	227007438	1993-06-28	6837562439	employee	t
103	Harley	Kuphal	148489570	1996-08-18	0800624732	employee	t
104	Erna	Torphy	100724363	1994-07-07	6198280821	employee	t
105	Jayson	Bins	151571274	1997-01-10	9734822529	employee	t
106	Marvin	Donnelly	243803965	1993-05-29	4830861646	employee	t
107	Loma	Satterfield	211653489	1995-01-27	9632509885	employee	t
108	Adella	Spencer	003063678	1994-01-17	9187824661	employee	t
109	Felipe	Heaney	377142173	1992-05-08	7143295571	employee	t
110	Lura	Jast	074918972	1994-02-19	4437546264	employee	t
29	Charlie	Sporer	256935523	1992-06-19	9512510689	employee	t
\.


--
-- Data for Name: jobs; Type: TABLE DATA; Schema: public; Owner: profh
--

COPY jobs (id, name, description, active) FROM stdin;
1	Cashier	Best job ever	t
2	Mopping	Best job ever	t
3	Make ice cream	Best job ever	t
4	Defrost freezers	Only needs to be done periodically	t
\.


--
-- Data for Name: shift_jobs; Type: TABLE DATA; Schema: public; Owner: profh
--

COPY shift_jobs (id, shift_id, job_id) FROM stdin;
\.


--
-- Data for Name: shifts; Type: TABLE DATA; Schema: public; Owner: profh
--

COPY shifts (id, assignment_id, date, start_time, end_time, notes) FROM stdin;
1	109	2012-08-19	22:00:00	01:00:00	\N
2	109	2012-08-20	19:00:00	22:00:00	\N
3	110	2012-08-09	16:00:00	19:00:00	\N
4	111	2012-08-17	19:00:00	22:00:00	\N
5	11	2011-05-09	16:00:00	19:00:00	\N
6	112	2012-08-17	22:00:00	01:00:00	\N
7	112	2012-08-18	17:00:00	20:00:00	\N
8	113	2012-08-15	17:00:00	20:00:00	\N
9	113	2012-08-16	22:00:00	01:00:00	\N
10	114	2012-08-17	16:00:00	19:00:00	\N
11	114	2012-08-18	19:00:00	22:00:00	\N
12	115	2012-08-03	18:00:00	21:00:00	\N
13	116	2012-07-05	19:00:00	22:00:00	\N
14	116	2012-07-06	19:00:00	22:00:00	\N
15	117	2012-07-08	17:00:00	20:00:00	\N
16	118	2012-07-18	22:00:00	01:00:00	\N
17	118	2012-07-19	18:00:00	21:00:00	\N
18	119	2012-07-08	17:00:00	20:00:00	\N
19	120	2012-07-16	23:00:00	02:00:00	\N
20	120	2012-07-17	18:00:00	21:00:00	\N
21	25	2011-04-11	18:00:00	21:00:00	\N
22	121	2012-07-26	16:00:00	19:00:00	\N
23	121	2012-07-27	20:00:00	23:00:00	\N
24	122	2012-08-15	19:00:00	22:00:00	\N
25	122	2012-08-16	19:00:00	22:00:00	\N
26	123	2012-07-08	22:00:00	01:00:00	\N
27	123	2012-07-09	22:00:00	01:00:00	\N
28	124	2012-07-29	19:00:00	22:00:00	\N
29	124	2012-07-30	17:00:00	20:00:00	\N
30	125	2012-08-07	20:00:00	23:00:00	\N
31	125	2012-08-08	23:00:00	02:00:00	\N
32	126	2012-07-13	22:00:00	01:00:00	\N
33	126	2012-07-14	23:00:00	02:00:00	\N
34	127	2012-08-19	18:00:00	21:00:00	\N
35	128	2012-08-20	20:00:00	23:00:00	\N
36	128	2012-08-21	16:00:00	19:00:00	\N
37	129	2012-08-09	21:00:00	00:00:00	\N
38	129	2012-08-10	23:00:00	02:00:00	\N
39	130	2012-07-09	22:00:00	01:00:00	\N
40	130	2012-07-10	21:00:00	00:00:00	\N
41	131	2012-08-09	19:00:00	22:00:00	\N
42	132	2012-08-13	22:00:00	01:00:00	\N
43	133	2012-07-23	20:00:00	23:00:00	\N
44	133	2012-07-24	19:00:00	22:00:00	\N
45	134	2012-07-31	22:00:00	01:00:00	\N
46	134	2012-08-01	18:00:00	21:00:00	\N
47	135	2012-07-29	22:00:00	01:00:00	\N
48	135	2012-07-30	16:00:00	19:00:00	\N
49	136	2012-07-06	19:00:00	22:00:00	\N
50	136	2012-07-07	23:00:00	02:00:00	\N
51	137	2012-07-07	17:00:00	20:00:00	\N
52	137	2012-07-08	16:00:00	19:00:00	\N
53	138	2012-08-06	21:00:00	00:00:00	\N
54	50	2011-09-30	20:00:00	23:00:00	\N
55	50	2011-10-01	16:00:00	19:00:00	\N
56	139	2012-08-10	20:00:00	23:00:00	\N
57	139	2012-08-11	20:00:00	23:00:00	\N
58	140	2012-07-26	17:00:00	20:00:00	\N
59	141	2012-08-08	23:00:00	02:00:00	\N
60	142	2012-07-08	18:00:00	21:00:00	\N
61	142	2012-07-09	21:00:00	00:00:00	\N
62	143	2012-08-01	16:00:00	19:00:00	\N
63	143	2012-08-02	17:00:00	20:00:00	\N
64	58	2010-10-16	20:00:00	23:00:00	\N
65	58	2010-10-17	16:00:00	19:00:00	\N
66	144	2012-07-17	18:00:00	21:00:00	\N
67	145	2012-08-02	20:00:00	23:00:00	\N
68	146	2012-07-07	19:00:00	22:00:00	\N
69	146	2012-07-08	19:00:00	22:00:00	\N
70	62	2011-01-10	16:00:00	19:00:00	\N
71	62	2011-01-11	20:00:00	23:00:00	\N
72	147	2012-08-12	21:00:00	00:00:00	\N
73	147	2012-08-13	20:00:00	23:00:00	\N
74	148	2012-08-13	22:00:00	01:00:00	\N
75	148	2012-08-14	23:00:00	02:00:00	\N
76	67	2011-01-10	19:00:00	22:00:00	\N
77	67	2011-01-11	17:00:00	20:00:00	\N
78	149	2012-07-12	21:00:00	00:00:00	\N
79	149	2012-07-13	21:00:00	00:00:00	\N
80	69	2011-08-07	22:00:00	01:00:00	\N
81	69	2011-08-08	19:00:00	22:00:00	\N
82	150	2012-08-03	23:00:00	02:00:00	\N
83	150	2012-08-04	22:00:00	01:00:00	\N
84	71	2011-08-12	20:00:00	23:00:00	\N
85	71	2011-08-13	21:00:00	00:00:00	\N
86	151	2012-07-10	19:00:00	22:00:00	\N
87	151	2012-07-11	20:00:00	23:00:00	\N
88	152	2012-07-20	23:00:00	02:00:00	\N
89	76	2011-11-04	18:00:00	21:00:00	\N
90	76	2011-11-05	21:00:00	00:00:00	\N
91	153	2012-07-09	20:00:00	23:00:00	\N
92	154	2012-07-15	22:00:00	01:00:00	\N
93	154	2012-07-16	23:00:00	02:00:00	\N
94	80	2010-09-30	20:00:00	23:00:00	\N
95	80	2010-10-01	20:00:00	23:00:00	\N
96	155	2012-07-19	16:00:00	19:00:00	\N
97	155	2012-07-20	20:00:00	23:00:00	\N
98	156	2012-08-11	20:00:00	23:00:00	\N
99	156	2012-08-12	17:00:00	20:00:00	\N
100	157	2012-07-19	16:00:00	19:00:00	\N
101	157	2012-07-20	20:00:00	23:00:00	\N
102	158	2012-08-12	19:00:00	22:00:00	\N
103	158	2012-08-13	20:00:00	23:00:00	\N
104	159	2012-07-23	21:00:00	00:00:00	\N
105	159	2012-07-24	18:00:00	21:00:00	\N
106	87	2010-11-18	19:00:00	22:00:00	\N
107	87	2010-11-19	18:00:00	21:00:00	\N
108	160	2012-08-18	23:00:00	02:00:00	\N
109	160	2012-08-19	19:00:00	22:00:00	\N
110	161	2012-07-09	17:00:00	20:00:00	\N
111	162	2012-08-14	21:00:00	00:00:00	\N
112	162	2012-08-15	22:00:00	01:00:00	\N
113	163	2012-08-11	16:00:00	19:00:00	\N
114	163	2012-08-12	21:00:00	00:00:00	\N
115	164	2012-07-19	21:00:00	00:00:00	\N
116	95	2011-09-22	22:00:00	01:00:00	\N
117	95	2011-09-23	16:00:00	19:00:00	\N
118	96	2012-03-21	17:00:00	20:00:00	\N
119	98	2010-09-01	17:00:00	20:00:00	\N
120	98	2010-09-02	16:00:00	19:00:00	\N
121	165	2012-08-19	21:00:00	00:00:00	\N
122	100	2010-10-08	20:00:00	23:00:00	\N
123	100	2010-10-09	21:00:00	00:00:00	\N
124	101	2011-03-31	17:00:00	20:00:00	\N
125	101	2011-04-01	17:00:00	20:00:00	\N
126	166	2012-07-07	17:00:00	20:00:00	\N
127	167	2012-07-08	22:00:00	01:00:00	\N
128	167	2012-07-09	21:00:00	00:00:00	\N
129	168	2012-08-17	16:00:00	19:00:00	\N
130	168	2012-08-18	21:00:00	00:00:00	\N
131	169	2012-07-26	18:00:00	21:00:00	\N
132	169	2012-07-27	16:00:00	19:00:00	\N
133	170	2012-08-14	21:00:00	00:00:00	\N
134	170	2012-08-15	21:00:00	00:00:00	\N
135	171	2012-07-28	20:00:00	23:00:00	\N
136	172	2012-07-24	20:00:00	23:00:00	\N
\.


--
-- Data for Name: stores; Type: TABLE DATA; Schema: public; Owner: profh
--

COPY stores (id, name, street, city, state, zip, phone, active, lat, lon) FROM stdin;
100	Carnegie Mellon	5000 Forbes Avenue	Pittsburgh	PA	15213	7036023739	t	\N	\N
110	Convention Center	1000 Fort Duquesne Blvd	Pittsburgh	PA	15222	9420887111	t	\N	\N
120	Point State Park	101 Commonwealth Place	Pittsburgh	PA	15222	8002221327	t	\N	\N
130	Oaks	1818 Oak Street	Wexford	PA	15237	4123669823	t	\N	\N
140	Wexford	143 North Court	Wexford	PA	15090	4123669087	f	\N	\N
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: profh
--

COPY users (id, email, password_digest, employee_id, created_at, updated_at) FROM stdin;
1	alex@example.com	$2a$10$bfuFfgye.ts1akGWnrSULu52JX4fMGARAPnybgG31Iupan/pVo.h2	1	2012-08-22 12:48:29.907989	2012-08-22 12:48:29.907989
2	mark@example.com	$2a$10$2YaljISyTSfVCcC.xENH6uXgwFIOZKY.f2RG1Ps5kjnp6QSiGB4KO	2	2012-08-22 12:48:30.005792	2012-08-22 12:48:30.005792
3	rachel@example.com	$2a$10$Eu2xPY/.J01oceSfsaz8auqgHCsf2IEb/lCFqkjT5IUDnpuI2squ6	3	2012-08-22 12:48:30.099453	2012-08-22 12:48:30.099453
4	dusty@example.com	$2a$10$s0kebrS/VvSCyyuEgHVuJea1oZlO7/WCb6E6p13XL1x6cuwveweXe	4	2012-08-22 12:48:30.193671	2012-08-22 12:48:30.193671
\.


--
-- Name: assignments_pkey; Type: CONSTRAINT; Schema: public; Owner: profh; Tablespace: 
--

ALTER TABLE ONLY assignments
    ADD CONSTRAINT assignments_pkey PRIMARY KEY (id);


--
-- Name: employees_pkey; Type: CONSTRAINT; Schema: public; Owner: profh; Tablespace: 
--

ALTER TABLE ONLY employees
    ADD CONSTRAINT employees_pkey PRIMARY KEY (id);


--
-- Name: jobs_pkey; Type: CONSTRAINT; Schema: public; Owner: profh; Tablespace: 
--

ALTER TABLE ONLY jobs
    ADD CONSTRAINT jobs_pkey PRIMARY KEY (id);


--
-- Name: shift_jobs_pkey; Type: CONSTRAINT; Schema: public; Owner: profh; Tablespace: 
--

ALTER TABLE ONLY shift_jobs
    ADD CONSTRAINT shift_jobs_pkey PRIMARY KEY (id);


--
-- Name: shifts_pkey; Type: CONSTRAINT; Schema: public; Owner: profh; Tablespace: 
--

ALTER TABLE ONLY shifts
    ADD CONSTRAINT shifts_pkey PRIMARY KEY (id);


--
-- Name: stores_pkey; Type: CONSTRAINT; Schema: public; Owner: profh; Tablespace: 
--

ALTER TABLE ONLY stores
    ADD CONSTRAINT stores_pkey PRIMARY KEY (id);


--
-- Name: users_pkey; Type: CONSTRAINT; Schema: public; Owner: profh; Tablespace: 
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: public; Type: ACL; Schema: -; Owner: profh
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM profh;
GRANT ALL ON SCHEMA public TO profh;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

