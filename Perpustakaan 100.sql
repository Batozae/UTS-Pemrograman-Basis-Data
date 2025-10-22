--
-- PostgreSQL database dump
--

\restrict DYWac2pBDffZclNhSVRn4fQlNzXVijofpMKWNOzCXwne75T75SN4ibwP4WcdfUT

-- Dumped from database version 17.6
-- Dumped by pg_dump version 17.6

-- Started on 2025-10-22 12:32:34

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
-- TOC entry 217 (class 1259 OID 16684)
-- Name: anggota_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.anggota_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.anggota_seq OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 227 (class 1259 OID 16694)
-- Name: anggota; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.anggota (
    id_anggota integer DEFAULT nextval('public.anggota_seq'::regclass) NOT NULL,
    nama_anggota character varying(150) NOT NULL,
    alamat_anggota text,
    tgl_lahir date,
    no_telp character varying(30),
    email character varying(150)
);


ALTER TABLE public.anggota OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 16686)
-- Name: buku_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.buku_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.buku_seq OWNER TO postgres;

--
-- TOC entry 230 (class 1259 OID 16718)
-- Name: buku; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.buku (
    id_buku integer DEFAULT nextval('public.buku_seq'::regclass) NOT NULL,
    isbn character(13),
    judul text NOT NULL,
    stok integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.buku OWNER TO postgres;

--
-- TOC entry 231 (class 1259 OID 16729)
-- Name: buku_kategori; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.buku_kategori (
    id_buku integer NOT NULL,
    id_kategori integer NOT NULL
);


ALTER TABLE public.buku_kategori OWNER TO postgres;

--
-- TOC entry 226 (class 1259 OID 16693)
-- Name: detail_pembelian_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.detail_pembelian_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.detail_pembelian_seq OWNER TO postgres;

--
-- TOC entry 234 (class 1259 OID 16762)
-- Name: detail_pembelian; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.detail_pembelian (
    id_detail integer DEFAULT nextval('public.detail_pembelian_seq'::regclass) NOT NULL,
    id_pembelian integer NOT NULL,
    id_buku integer NOT NULL,
    jumlah integer NOT NULL,
    harga_satuan numeric(12,2) NOT NULL,
    total_harga numeric(14,2) GENERATED ALWAYS AS (((jumlah)::numeric * harga_satuan)) STORED,
    CONSTRAINT detail_pembelian_harga_satuan_check CHECK ((harga_satuan >= (0)::numeric)),
    CONSTRAINT detail_pembelian_jumlah_check CHECK ((jumlah > 0))
);


ALTER TABLE public.detail_pembelian OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 16690)
-- Name: detail_peminjaman_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.detail_peminjaman_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.detail_peminjaman_seq OWNER TO postgres;

--
-- TOC entry 236 (class 1259 OID 16798)
-- Name: detail_peminjaman; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.detail_peminjaman (
    id_detail integer DEFAULT nextval('public.detail_peminjaman_seq'::regclass) NOT NULL,
    id_peminjaman integer NOT NULL,
    id_buku integer NOT NULL
);


ALTER TABLE public.detail_peminjaman OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 16687)
-- Name: kategori_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.kategori_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.kategori_seq OWNER TO postgres;

--
-- TOC entry 229 (class 1259 OID 16710)
-- Name: kategori; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.kategori (
    id_kategori integer DEFAULT nextval('public.kategori_seq'::regclass) NOT NULL,
    nama_kategori character varying(100) NOT NULL
);


ALTER TABLE public.kategori OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 16685)
-- Name: pegawai_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.pegawai_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.pegawai_seq OWNER TO postgres;

--
-- TOC entry 228 (class 1259 OID 16702)
-- Name: pegawai; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pegawai (
    id_pegawai integer DEFAULT nextval('public.pegawai_seq'::regclass) NOT NULL,
    nama_pegawai character varying(150) NOT NULL,
    alamat_pegawai text,
    posisi character varying(100)
);


ALTER TABLE public.pegawai OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 16692)
-- Name: pembelian_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.pembelian_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.pembelian_seq OWNER TO postgres;

--
-- TOC entry 233 (class 1259 OID 16750)
-- Name: pembelian; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pembelian (
    id_pembelian integer DEFAULT nextval('public.pembelian_seq'::regclass) NOT NULL,
    id_supplier integer,
    tanggal_pembelian date DEFAULT CURRENT_DATE NOT NULL
);


ALTER TABLE public.pembelian OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 16689)
-- Name: peminjaman_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.peminjaman_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.peminjaman_seq OWNER TO postgres;

--
-- TOC entry 235 (class 1259 OID 16781)
-- Name: peminjaman; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.peminjaman (
    id_peminjaman integer DEFAULT nextval('public.peminjaman_seq'::regclass) NOT NULL,
    id_anggota integer NOT NULL,
    id_pegawai integer,
    tanggal_pinjam date DEFAULT CURRENT_DATE NOT NULL,
    tenggat_waktu date NOT NULL
);


ALTER TABLE public.peminjaman OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 16691)
-- Name: pengembalian_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.pengembalian_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.pengembalian_seq OWNER TO postgres;

--
-- TOC entry 237 (class 1259 OID 16814)
-- Name: pengembalian; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pengembalian (
    id_pengembalian integer DEFAULT nextval('public.pengembalian_seq'::regclass) NOT NULL,
    id_peminjaman integer NOT NULL,
    tanggal_pengembalian date NOT NULL,
    keterlambatan_hari integer DEFAULT 0 NOT NULL,
    denda numeric(12,2) NOT NULL
);


ALTER TABLE public.pengembalian OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 16688)
-- Name: supplier_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.supplier_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.supplier_seq OWNER TO postgres;

--
-- TOC entry 232 (class 1259 OID 16744)
-- Name: supplier; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.supplier (
    id_supplier integer DEFAULT nextval('public.supplier_seq'::regclass) NOT NULL,
    nama_supplier character varying(200) NOT NULL
);


ALTER TABLE public.supplier OWNER TO postgres;

--
-- TOC entry 5005 (class 0 OID 16694)
-- Dependencies: 227
-- Data for Name: anggota; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.anggota (id_anggota, nama_anggota, alamat_anggota, tgl_lahir, no_telp, email) FROM stdin;
1	Anggota 1	Alamat 1	2006-10-26	0810000001	anggota1@mail.test
2	Anggota 2	Alamat 2	2005-10-26	0810000002	anggota2@mail.test
3	Anggota 3	Alamat 3	2004-10-26	0810000003	anggota3@mail.test
4	Anggota 4	Alamat 4	2003-10-27	0810000004	anggota4@mail.test
5	Anggota 5	Alamat 5	2002-10-27	0810000005	anggota5@mail.test
6	Anggota 6	Alamat 6	2001-10-27	0810000006	anggota6@mail.test
7	Anggota 7	Alamat 7	2000-10-27	0810000007	anggota7@mail.test
8	Anggota 8	Alamat 8	1999-10-28	0810000008	anggota8@mail.test
9	Anggota 9	Alamat 9	1998-10-28	0810000009	anggota9@mail.test
10	Anggota 10	Alamat 10	1997-10-28	0810000010	anggota10@mail.test
11	Anggota 11	Alamat 11	1996-10-28	0810000011	anggota11@mail.test
12	Anggota 12	Alamat 12	1995-10-29	0810000012	anggota12@mail.test
13	Anggota 13	Alamat 13	1994-10-29	0810000013	anggota13@mail.test
14	Anggota 14	Alamat 14	1993-10-29	0810000014	anggota14@mail.test
15	Anggota 15	Alamat 15	1992-10-29	0810000015	anggota15@mail.test
16	Anggota 16	Alamat 16	1991-10-30	0810000016	anggota16@mail.test
17	Anggota 17	Alamat 17	1990-10-30	0810000017	anggota17@mail.test
18	Anggota 18	Alamat 18	1989-10-30	0810000018	anggota18@mail.test
19	Anggota 19	Alamat 19	1988-10-30	0810000019	anggota19@mail.test
20	Anggota 20	Alamat 20	1987-10-31	0810000020	anggota20@mail.test
\.


--
-- TOC entry 5008 (class 0 OID 16718)
-- Dependencies: 230
-- Data for Name: buku; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.buku (id_buku, isbn, judul, stok) FROM stdin;
1	1000000000001	Judul Buku 1	0
2	1000000000002	Judul Buku 2	0
3	1000000000003	Judul Buku 3	0
4	1000000000004	Judul Buku 4	0
5	1000000000005	Judul Buku 5	0
6	1000000000006	Judul Buku 6	0
7	1000000000007	Judul Buku 7	0
8	1000000000008	Judul Buku 8	0
9	1000000000009	Judul Buku 9	0
10	1000000000010	Judul Buku 10	0
11	1000000000011	Judul Buku 11	0
12	1000000000012	Judul Buku 12	0
13	1000000000013	Judul Buku 13	0
14	1000000000014	Judul Buku 14	0
15	1000000000015	Judul Buku 15	0
16	1000000000016	Judul Buku 16	0
17	1000000000017	Judul Buku 17	0
18	1000000000018	Judul Buku 18	0
19	1000000000019	Judul Buku 19	0
20	1000000000020	Judul Buku 20	0
21	1000000000021	Judul Buku 21	0
22	1000000000022	Judul Buku 22	0
23	1000000000023	Judul Buku 23	0
24	1000000000024	Judul Buku 24	0
25	1000000000025	Judul Buku 25	0
26	1000000000026	Judul Buku 26	0
27	1000000000027	Judul Buku 27	0
28	1000000000028	Judul Buku 28	0
29	1000000000029	Judul Buku 29	0
30	1000000000030	Judul Buku 30	0
31	1000000000031	Judul Buku 31	0
32	1000000000032	Judul Buku 32	0
33	1000000000033	Judul Buku 33	0
34	1000000000034	Judul Buku 34	0
35	1000000000035	Judul Buku 35	0
36	1000000000036	Judul Buku 36	0
37	1000000000037	Judul Buku 37	0
38	1000000000038	Judul Buku 38	0
39	1000000000039	Judul Buku 39	0
40	1000000000040	Judul Buku 40	0
41	1000000000041	Judul Buku 41	0
42	1000000000042	Judul Buku 42	0
43	1000000000043	Judul Buku 43	0
44	1000000000044	Judul Buku 44	0
45	1000000000045	Judul Buku 45	0
46	1000000000046	Judul Buku 46	0
47	1000000000047	Judul Buku 47	0
48	1000000000048	Judul Buku 48	0
49	1000000000049	Judul Buku 49	0
50	1000000000050	Judul Buku 50	0
51	1000000000051	Judul Buku 51	0
52	1000000000052	Judul Buku 52	0
53	1000000000053	Judul Buku 53	0
54	1000000000054	Judul Buku 54	0
55	1000000000055	Judul Buku 55	0
56	1000000000056	Judul Buku 56	0
57	1000000000057	Judul Buku 57	0
58	1000000000058	Judul Buku 58	0
59	1000000000059	Judul Buku 59	0
60	1000000000060	Judul Buku 60	0
61	1000000000061	Judul Buku 61	0
62	1000000000062	Judul Buku 62	0
63	1000000000063	Judul Buku 63	0
64	1000000000064	Judul Buku 64	0
65	1000000000065	Judul Buku 65	0
66	1000000000066	Judul Buku 66	0
67	1000000000067	Judul Buku 67	0
68	1000000000068	Judul Buku 68	0
69	1000000000069	Judul Buku 69	0
70	1000000000070	Judul Buku 70	0
71	1000000000071	Judul Buku 71	0
72	1000000000072	Judul Buku 72	0
73	1000000000073	Judul Buku 73	0
74	1000000000074	Judul Buku 74	0
75	1000000000075	Judul Buku 75	0
76	1000000000076	Judul Buku 76	0
77	1000000000077	Judul Buku 77	0
78	1000000000078	Judul Buku 78	0
79	1000000000079	Judul Buku 79	0
80	1000000000080	Judul Buku 80	0
81	1000000000081	Judul Buku 81	0
82	1000000000082	Judul Buku 82	0
83	1000000000083	Judul Buku 83	0
84	1000000000084	Judul Buku 84	0
85	1000000000085	Judul Buku 85	0
86	1000000000086	Judul Buku 86	0
87	1000000000087	Judul Buku 87	0
88	1000000000088	Judul Buku 88	0
89	1000000000089	Judul Buku 89	0
90	1000000000090	Judul Buku 90	0
91	1000000000091	Judul Buku 91	0
92	1000000000092	Judul Buku 92	0
93	1000000000093	Judul Buku 93	0
94	1000000000094	Judul Buku 94	0
95	1000000000095	Judul Buku 95	0
96	1000000000096	Judul Buku 96	0
97	1000000000097	Judul Buku 97	0
98	1000000000098	Judul Buku 98	0
99	1000000000099	Judul Buku 99	0
100	1000000000100	Judul Buku 100	0
\.


--
-- TOC entry 5009 (class 0 OID 16729)
-- Dependencies: 231
-- Data for Name: buku_kategori; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.buku_kategori (id_buku, id_kategori) FROM stdin;
1	11
2	14
3	4
4	4
5	9
6	1
7	10
8	19
9	11
10	10
11	6
12	3
13	9
14	6
15	10
16	4
17	20
18	4
19	15
20	20
21	15
22	3
23	17
24	8
25	4
26	16
27	1
28	4
29	15
30	3
31	17
32	19
33	13
34	13
35	17
36	13
37	8
38	4
39	19
40	12
41	10
42	9
43	20
44	4
45	9
46	7
47	5
48	14
49	15
50	17
51	13
52	15
53	12
54	13
55	17
56	7
57	7
58	18
59	8
60	3
61	17
62	6
63	13
64	19
65	17
66	15
67	7
68	6
69	12
70	15
71	4
72	16
73	18
74	1
75	5
76	3
77	11
78	15
79	8
80	15
81	12
82	17
83	11
84	19
85	4
86	17
87	6
88	11
89	6
90	11
91	16
92	19
93	7
94	3
95	1
96	17
97	12
98	14
99	18
100	15
\.


--
-- TOC entry 5012 (class 0 OID 16762)
-- Dependencies: 234
-- Data for Name: detail_pembelian; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.detail_pembelian (id_detail, id_pembelian, id_buku, jumlah, harga_satuan) FROM stdin;
\.


--
-- TOC entry 5014 (class 0 OID 16798)
-- Dependencies: 236
-- Data for Name: detail_peminjaman; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.detail_peminjaman (id_detail, id_peminjaman, id_buku) FROM stdin;
1	126	66
2	127	23
3	128	94
4	129	74
5	130	10
6	131	96
7	132	68
8	133	15
9	134	38
10	135	82
11	126	49
12	127	29
13	128	31
14	129	71
15	130	69
16	131	94
17	132	50
18	133	52
19	134	98
20	135	82
21	126	23
22	127	90
23	128	31
24	129	27
25	130	84
26	131	23
27	132	29
28	133	33
29	134	72
30	135	39
31	126	64
32	127	89
33	128	67
34	129	70
35	130	49
36	131	88
37	132	76
38	133	72
39	134	58
40	135	65
41	126	67
42	127	12
43	128	80
44	129	97
45	130	53
46	131	53
47	132	18
48	133	77
49	134	65
50	135	31
\.


--
-- TOC entry 5007 (class 0 OID 16710)
-- Dependencies: 229
-- Data for Name: kategori; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.kategori (id_kategori, nama_kategori) FROM stdin;
1	Kategori 1
2	Kategori 2
3	Kategori 3
4	Kategori 4
5	Kategori 5
6	Kategori 6
7	Kategori 7
8	Kategori 8
9	Kategori 9
10	Kategori 10
11	Kategori 11
12	Kategori 12
13	Kategori 13
14	Kategori 14
15	Kategori 15
16	Kategori 16
17	Kategori 17
18	Kategori 18
19	Kategori 19
20	Kategori 20
\.


--
-- TOC entry 5006 (class 0 OID 16702)
-- Dependencies: 228
-- Data for Name: pegawai; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.pegawai (id_pegawai, nama_pegawai, alamat_pegawai, posisi) FROM stdin;
1	Pegawai 1	Alamat Pegawai 1	Admin
2	Pegawai 2	Alamat Pegawai 2	Frontdesk
3	Pegawai 3	Alamat Pegawai 3	Admin
4	Pegawai 4	Alamat Pegawai 4	Frontdesk
5	Pegawai 5	Alamat Pegawai 5	Admin
\.


--
-- TOC entry 5011 (class 0 OID 16750)
-- Dependencies: 233
-- Data for Name: pembelian; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.pembelian (id_pembelian, id_supplier, tanggal_pembelian) FROM stdin;
\.


--
-- TOC entry 5013 (class 0 OID 16781)
-- Dependencies: 235
-- Data for Name: peminjaman; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.peminjaman (id_peminjaman, id_anggota, id_pegawai, tanggal_pinjam, tenggat_waktu) FROM stdin;
126	2	2	2025-07-19	2025-10-25
127	16	5	2025-08-21	2025-10-25
128	11	4	2025-07-31	2025-10-21
129	11	5	2025-06-29	2025-10-26
130	9	3	2025-08-06	2025-11-07
131	13	1	2025-08-09	2025-10-29
132	4	4	2025-01-04	2025-11-05
133	10	4	2025-05-31	2025-11-07
134	8	3	2025-05-17	2025-11-03
135	20	4	2024-11-25	2025-11-05
\.


--
-- TOC entry 5015 (class 0 OID 16814)
-- Dependencies: 237
-- Data for Name: pengembalian; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.pengembalian (id_pengembalian, id_peminjaman, tanggal_pengembalian, keterlambatan_hari, denda) FROM stdin;
1	128	2025-08-03	0	0.00
2	129	2025-07-07	0	0.00
3	130	2025-08-22	0	0.00
4	131	2025-09-06	0	0.00
5	132	2025-01-18	0	0.00
6	133	2025-06-08	0	0.00
7	134	2025-05-28	0	0.00
8	135	2024-12-21	0	0.00
\.


--
-- TOC entry 5010 (class 0 OID 16744)
-- Dependencies: 232
-- Data for Name: supplier; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.supplier (id_supplier, nama_supplier) FROM stdin;
1	Supplier 1
2	Supplier 2
3	Supplier 3
4	Supplier 4
5	Supplier 5
6	Supplier 6
7	Supplier 7
8	Supplier 8
9	Supplier 9
10	Supplier 10
\.


--
-- TOC entry 5021 (class 0 OID 0)
-- Dependencies: 217
-- Name: anggota_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.anggota_seq', 20, true);


--
-- TOC entry 5022 (class 0 OID 0)
-- Dependencies: 219
-- Name: buku_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.buku_seq', 100, true);


--
-- TOC entry 5023 (class 0 OID 0)
-- Dependencies: 226
-- Name: detail_pembelian_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.detail_pembelian_seq', 1, false);


--
-- TOC entry 5024 (class 0 OID 0)
-- Dependencies: 223
-- Name: detail_peminjaman_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.detail_peminjaman_seq', 50, true);


--
-- TOC entry 5025 (class 0 OID 0)
-- Dependencies: 220
-- Name: kategori_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.kategori_seq', 20, true);


--
-- TOC entry 5026 (class 0 OID 0)
-- Dependencies: 218
-- Name: pegawai_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.pegawai_seq', 5, true);


--
-- TOC entry 5027 (class 0 OID 0)
-- Dependencies: 225
-- Name: pembelian_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.pembelian_seq', 1, false);


--
-- TOC entry 5028 (class 0 OID 0)
-- Dependencies: 222
-- Name: peminjaman_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.peminjaman_seq', 135, true);


--
-- TOC entry 5029 (class 0 OID 0)
-- Dependencies: 224
-- Name: pengembalian_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.pengembalian_seq', 8, true);


--
-- TOC entry 5030 (class 0 OID 0)
-- Dependencies: 221
-- Name: supplier_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.supplier_seq', 10, true);


--
-- TOC entry 4809 (class 2606 OID 16701)
-- Name: anggota anggota_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.anggota
    ADD CONSTRAINT anggota_pkey PRIMARY KEY (id_anggota);


--
-- TOC entry 4817 (class 2606 OID 16728)
-- Name: buku buku_isbn_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.buku
    ADD CONSTRAINT buku_isbn_key UNIQUE (isbn);


--
-- TOC entry 4822 (class 2606 OID 16733)
-- Name: buku_kategori buku_kategori_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.buku_kategori
    ADD CONSTRAINT buku_kategori_pkey PRIMARY KEY (id_buku, id_kategori);


--
-- TOC entry 4819 (class 2606 OID 16726)
-- Name: buku buku_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.buku
    ADD CONSTRAINT buku_pkey PRIMARY KEY (id_buku);


--
-- TOC entry 4828 (class 2606 OID 16770)
-- Name: detail_pembelian detail_pembelian_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.detail_pembelian
    ADD CONSTRAINT detail_pembelian_pkey PRIMARY KEY (id_detail);


--
-- TOC entry 4833 (class 2606 OID 16803)
-- Name: detail_peminjaman detail_peminjaman_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.detail_peminjaman
    ADD CONSTRAINT detail_peminjaman_pkey PRIMARY KEY (id_detail);


--
-- TOC entry 4813 (class 2606 OID 16717)
-- Name: kategori kategori_nama_kategori_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kategori
    ADD CONSTRAINT kategori_nama_kategori_key UNIQUE (nama_kategori);


--
-- TOC entry 4815 (class 2606 OID 16715)
-- Name: kategori kategori_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kategori
    ADD CONSTRAINT kategori_pkey PRIMARY KEY (id_kategori);


--
-- TOC entry 4811 (class 2606 OID 16709)
-- Name: pegawai pegawai_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pegawai
    ADD CONSTRAINT pegawai_pkey PRIMARY KEY (id_pegawai);


--
-- TOC entry 4826 (class 2606 OID 16756)
-- Name: pembelian pembelian_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pembelian
    ADD CONSTRAINT pembelian_pkey PRIMARY KEY (id_pembelian);


--
-- TOC entry 4831 (class 2606 OID 16787)
-- Name: peminjaman peminjaman_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.peminjaman
    ADD CONSTRAINT peminjaman_pkey PRIMARY KEY (id_peminjaman);


--
-- TOC entry 4837 (class 2606 OID 16822)
-- Name: pengembalian pengembalian_id_peminjaman_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pengembalian
    ADD CONSTRAINT pengembalian_id_peminjaman_key UNIQUE (id_peminjaman);


--
-- TOC entry 4839 (class 2606 OID 16820)
-- Name: pengembalian pengembalian_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pengembalian
    ADD CONSTRAINT pengembalian_pkey PRIMARY KEY (id_pengembalian);


--
-- TOC entry 4824 (class 2606 OID 16749)
-- Name: supplier supplier_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.supplier
    ADD CONSTRAINT supplier_pkey PRIMARY KEY (id_supplier);


--
-- TOC entry 4820 (class 1259 OID 16839)
-- Name: idx_buku_isbn; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_buku_isbn ON public.buku USING btree (isbn);


--
-- TOC entry 4834 (class 1259 OID 16837)
-- Name: idx_detail_peminjaman_buku; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_detail_peminjaman_buku ON public.detail_peminjaman USING btree (id_buku);


--
-- TOC entry 4829 (class 1259 OID 16836)
-- Name: idx_peminjaman_anggota; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_peminjaman_anggota ON public.peminjaman USING btree (id_anggota);


--
-- TOC entry 4835 (class 1259 OID 16838)
-- Name: idx_pengembalian_tanggal; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_pengembalian_tanggal ON public.pengembalian USING btree (tanggal_pengembalian);


--
-- TOC entry 4840 (class 2606 OID 16734)
-- Name: buku_kategori buku_kategori_id_buku_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.buku_kategori
    ADD CONSTRAINT buku_kategori_id_buku_fkey FOREIGN KEY (id_buku) REFERENCES public.buku(id_buku) ON DELETE CASCADE;


--
-- TOC entry 4841 (class 2606 OID 16739)
-- Name: buku_kategori buku_kategori_id_kategori_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.buku_kategori
    ADD CONSTRAINT buku_kategori_id_kategori_fkey FOREIGN KEY (id_kategori) REFERENCES public.kategori(id_kategori) ON DELETE CASCADE;


--
-- TOC entry 4843 (class 2606 OID 16776)
-- Name: detail_pembelian detail_pembelian_id_buku_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.detail_pembelian
    ADD CONSTRAINT detail_pembelian_id_buku_fkey FOREIGN KEY (id_buku) REFERENCES public.buku(id_buku);


--
-- TOC entry 4844 (class 2606 OID 16771)
-- Name: detail_pembelian detail_pembelian_id_pembelian_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.detail_pembelian
    ADD CONSTRAINT detail_pembelian_id_pembelian_fkey FOREIGN KEY (id_pembelian) REFERENCES public.pembelian(id_pembelian) ON DELETE CASCADE;


--
-- TOC entry 4847 (class 2606 OID 16809)
-- Name: detail_peminjaman detail_peminjaman_id_buku_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.detail_peminjaman
    ADD CONSTRAINT detail_peminjaman_id_buku_fkey FOREIGN KEY (id_buku) REFERENCES public.buku(id_buku);


--
-- TOC entry 4848 (class 2606 OID 16804)
-- Name: detail_peminjaman detail_peminjaman_id_peminjaman_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.detail_peminjaman
    ADD CONSTRAINT detail_peminjaman_id_peminjaman_fkey FOREIGN KEY (id_peminjaman) REFERENCES public.peminjaman(id_peminjaman) ON DELETE CASCADE;


--
-- TOC entry 4842 (class 2606 OID 16757)
-- Name: pembelian pembelian_id_supplier_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pembelian
    ADD CONSTRAINT pembelian_id_supplier_fkey FOREIGN KEY (id_supplier) REFERENCES public.supplier(id_supplier);


--
-- TOC entry 4845 (class 2606 OID 16788)
-- Name: peminjaman peminjaman_id_anggota_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.peminjaman
    ADD CONSTRAINT peminjaman_id_anggota_fkey FOREIGN KEY (id_anggota) REFERENCES public.anggota(id_anggota);


--
-- TOC entry 4846 (class 2606 OID 16793)
-- Name: peminjaman peminjaman_id_pegawai_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.peminjaman
    ADD CONSTRAINT peminjaman_id_pegawai_fkey FOREIGN KEY (id_pegawai) REFERENCES public.pegawai(id_pegawai);


--
-- TOC entry 4849 (class 2606 OID 16823)
-- Name: pengembalian pengembalian_id_peminjaman_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pengembalian
    ADD CONSTRAINT pengembalian_id_peminjaman_fkey FOREIGN KEY (id_peminjaman) REFERENCES public.peminjaman(id_peminjaman) ON DELETE CASCADE;


-- Completed on 2025-10-22 12:32:35

--
-- PostgreSQL database dump complete
--

\unrestrict DYWac2pBDffZclNhSVRn4fQlNzXVijofpMKWNOzCXwne75T75SN4ibwP4WcdfUT

