--
-- PostgreSQL database dump
--

\restrict mUTS1ogzuxJk684DVXbuoTR6e9o7b4hvo21qFn1HdFgsuFyhGPrjgjES8VXBC4T

-- Dumped from database version 17.6
-- Dumped by pg_dump version 17.6

-- Started on 2025-10-22 10:22:15

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
-- TOC entry 217 (class 1259 OID 17467)
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
-- TOC entry 227 (class 1259 OID 17477)
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
-- TOC entry 219 (class 1259 OID 17469)
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
-- TOC entry 230 (class 1259 OID 17501)
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
-- TOC entry 231 (class 1259 OID 17512)
-- Name: buku_kategori; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.buku_kategori (
    id_buku integer NOT NULL,
    id_kategori integer NOT NULL
);


ALTER TABLE public.buku_kategori OWNER TO postgres;

--
-- TOC entry 226 (class 1259 OID 17476)
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
-- TOC entry 234 (class 1259 OID 17545)
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
-- TOC entry 223 (class 1259 OID 17473)
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
-- TOC entry 236 (class 1259 OID 17581)
-- Name: detail_peminjaman; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.detail_peminjaman (
    id_detail integer DEFAULT nextval('public.detail_peminjaman_seq'::regclass) NOT NULL,
    id_peminjaman integer NOT NULL,
    id_buku integer NOT NULL
);


ALTER TABLE public.detail_peminjaman OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 17470)
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
-- TOC entry 229 (class 1259 OID 17493)
-- Name: kategori; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.kategori (
    id_kategori integer DEFAULT nextval('public.kategori_seq'::regclass) NOT NULL,
    nama_kategori character varying(100) NOT NULL
);


ALTER TABLE public.kategori OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 17468)
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
-- TOC entry 228 (class 1259 OID 17485)
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
-- TOC entry 225 (class 1259 OID 17475)
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
-- TOC entry 233 (class 1259 OID 17533)
-- Name: pembelian; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pembelian (
    id_pembelian integer DEFAULT nextval('public.pembelian_seq'::regclass) NOT NULL,
    id_supplier integer,
    tanggal_pembelian date DEFAULT CURRENT_DATE NOT NULL
);


ALTER TABLE public.pembelian OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 17472)
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
-- TOC entry 235 (class 1259 OID 17564)
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
-- TOC entry 224 (class 1259 OID 17474)
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
-- TOC entry 237 (class 1259 OID 17597)
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
-- TOC entry 221 (class 1259 OID 17471)
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
-- TOC entry 232 (class 1259 OID 17527)
-- Name: supplier; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.supplier (
    id_supplier integer DEFAULT nextval('public.supplier_seq'::regclass) NOT NULL,
    nama_supplier character varying(200) NOT NULL
);


ALTER TABLE public.supplier OWNER TO postgres;

--
-- TOC entry 5005 (class 0 OID 17477)
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
21	Anggota 21	Alamat 21	1986-10-31	0810000021	anggota21@mail.test
22	Anggota 22	Alamat 22	1985-10-31	0810000022	anggota22@mail.test
23	Anggota 23	Alamat 23	1984-10-31	0810000023	anggota23@mail.test
24	Anggota 24	Alamat 24	1983-11-01	0810000024	anggota24@mail.test
25	Anggota 25	Alamat 25	1982-11-01	0810000025	anggota25@mail.test
26	Anggota 26	Alamat 26	1981-11-01	0810000026	anggota26@mail.test
27	Anggota 27	Alamat 27	1980-11-01	0810000027	anggota27@mail.test
28	Anggota 28	Alamat 28	1979-11-02	0810000028	anggota28@mail.test
29	Anggota 29	Alamat 29	1978-11-02	0810000029	anggota29@mail.test
30	Anggota 30	Alamat 30	1977-11-02	0810000030	anggota30@mail.test
31	Anggota 31	Alamat 31	1976-11-02	0810000031	anggota31@mail.test
32	Anggota 32	Alamat 32	1975-11-03	0810000032	anggota32@mail.test
33	Anggota 33	Alamat 33	1974-11-03	0810000033	anggota33@mail.test
34	Anggota 34	Alamat 34	1973-11-03	0810000034	anggota34@mail.test
35	Anggota 35	Alamat 35	1972-11-03	0810000035	anggota35@mail.test
36	Anggota 36	Alamat 36	1971-11-04	0810000036	anggota36@mail.test
37	Anggota 37	Alamat 37	1970-11-04	0810000037	anggota37@mail.test
38	Anggota 38	Alamat 38	1969-11-04	0810000038	anggota38@mail.test
39	Anggota 39	Alamat 39	1968-11-04	0810000039	anggota39@mail.test
40	Anggota 40	Alamat 40	1967-11-05	0810000040	anggota40@mail.test
41	Anggota 41	Alamat 41	1966-11-05	0810000041	anggota41@mail.test
42	Anggota 42	Alamat 42	1965-11-05	0810000042	anggota42@mail.test
43	Anggota 43	Alamat 43	1964-11-05	0810000043	anggota43@mail.test
44	Anggota 44	Alamat 44	1963-11-06	0810000044	anggota44@mail.test
45	Anggota 45	Alamat 45	1962-11-06	0810000045	anggota45@mail.test
46	Anggota 46	Alamat 46	1961-11-06	0810000046	anggota46@mail.test
47	Anggota 47	Alamat 47	1960-11-06	0810000047	anggota47@mail.test
48	Anggota 48	Alamat 48	1959-11-07	0810000048	anggota48@mail.test
49	Anggota 49	Alamat 49	1958-11-07	0810000049	anggota49@mail.test
50	Anggota 50	Alamat 50	2007-10-26	0810000050	anggota50@mail.test
51	Anggota 51	Alamat 51	2006-10-26	0810000051	anggota51@mail.test
52	Anggota 52	Alamat 52	2005-10-26	0810000052	anggota52@mail.test
53	Anggota 53	Alamat 53	2004-10-26	0810000053	anggota53@mail.test
54	Anggota 54	Alamat 54	2003-10-27	0810000054	anggota54@mail.test
55	Anggota 55	Alamat 55	2002-10-27	0810000055	anggota55@mail.test
56	Anggota 56	Alamat 56	2001-10-27	0810000056	anggota56@mail.test
57	Anggota 57	Alamat 57	2000-10-27	0810000057	anggota57@mail.test
58	Anggota 58	Alamat 58	1999-10-28	0810000058	anggota58@mail.test
59	Anggota 59	Alamat 59	1998-10-28	0810000059	anggota59@mail.test
60	Anggota 60	Alamat 60	1997-10-28	0810000060	anggota60@mail.test
61	Anggota 61	Alamat 61	1996-10-28	0810000061	anggota61@mail.test
62	Anggota 62	Alamat 62	1995-10-29	0810000062	anggota62@mail.test
63	Anggota 63	Alamat 63	1994-10-29	0810000063	anggota63@mail.test
64	Anggota 64	Alamat 64	1993-10-29	0810000064	anggota64@mail.test
65	Anggota 65	Alamat 65	1992-10-29	0810000065	anggota65@mail.test
66	Anggota 66	Alamat 66	1991-10-30	0810000066	anggota66@mail.test
67	Anggota 67	Alamat 67	1990-10-30	0810000067	anggota67@mail.test
68	Anggota 68	Alamat 68	1989-10-30	0810000068	anggota68@mail.test
69	Anggota 69	Alamat 69	1988-10-30	0810000069	anggota69@mail.test
70	Anggota 70	Alamat 70	1987-10-31	0810000070	anggota70@mail.test
71	Anggota 71	Alamat 71	1986-10-31	0810000071	anggota71@mail.test
72	Anggota 72	Alamat 72	1985-10-31	0810000072	anggota72@mail.test
73	Anggota 73	Alamat 73	1984-10-31	0810000073	anggota73@mail.test
74	Anggota 74	Alamat 74	1983-11-01	0810000074	anggota74@mail.test
75	Anggota 75	Alamat 75	1982-11-01	0810000075	anggota75@mail.test
76	Anggota 76	Alamat 76	1981-11-01	0810000076	anggota76@mail.test
77	Anggota 77	Alamat 77	1980-11-01	0810000077	anggota77@mail.test
78	Anggota 78	Alamat 78	1979-11-02	0810000078	anggota78@mail.test
79	Anggota 79	Alamat 79	1978-11-02	0810000079	anggota79@mail.test
80	Anggota 80	Alamat 80	1977-11-02	0810000080	anggota80@mail.test
81	Anggota 81	Alamat 81	1976-11-02	0810000081	anggota81@mail.test
82	Anggota 82	Alamat 82	1975-11-03	0810000082	anggota82@mail.test
83	Anggota 83	Alamat 83	1974-11-03	0810000083	anggota83@mail.test
84	Anggota 84	Alamat 84	1973-11-03	0810000084	anggota84@mail.test
85	Anggota 85	Alamat 85	1972-11-03	0810000085	anggota85@mail.test
86	Anggota 86	Alamat 86	1971-11-04	0810000086	anggota86@mail.test
87	Anggota 87	Alamat 87	1970-11-04	0810000087	anggota87@mail.test
88	Anggota 88	Alamat 88	1969-11-04	0810000088	anggota88@mail.test
89	Anggota 89	Alamat 89	1968-11-04	0810000089	anggota89@mail.test
90	Anggota 90	Alamat 90	1967-11-05	0810000090	anggota90@mail.test
91	Anggota 91	Alamat 91	1966-11-05	0810000091	anggota91@mail.test
92	Anggota 92	Alamat 92	1965-11-05	0810000092	anggota92@mail.test
93	Anggota 93	Alamat 93	1964-11-05	0810000093	anggota93@mail.test
94	Anggota 94	Alamat 94	1963-11-06	0810000094	anggota94@mail.test
95	Anggota 95	Alamat 95	1962-11-06	0810000095	anggota95@mail.test
96	Anggota 96	Alamat 96	1961-11-06	0810000096	anggota96@mail.test
97	Anggota 97	Alamat 97	1960-11-06	0810000097	anggota97@mail.test
98	Anggota 98	Alamat 98	1959-11-07	0810000098	anggota98@mail.test
99	Anggota 99	Alamat 99	1958-11-07	0810000099	anggota99@mail.test
100	Anggota 100	Alamat 100	2007-10-26	0810000100	anggota100@mail.test
101	Anggota 101	Alamat 101	2006-10-26	0810000101	anggota101@mail.test
102	Anggota 102	Alamat 102	2005-10-26	0810000102	anggota102@mail.test
103	Anggota 103	Alamat 103	2004-10-26	0810000103	anggota103@mail.test
104	Anggota 104	Alamat 104	2003-10-27	0810000104	anggota104@mail.test
105	Anggota 105	Alamat 105	2002-10-27	0810000105	anggota105@mail.test
106	Anggota 106	Alamat 106	2001-10-27	0810000106	anggota106@mail.test
107	Anggota 107	Alamat 107	2000-10-27	0810000107	anggota107@mail.test
108	Anggota 108	Alamat 108	1999-10-28	0810000108	anggota108@mail.test
109	Anggota 109	Alamat 109	1998-10-28	0810000109	anggota109@mail.test
110	Anggota 110	Alamat 110	1997-10-28	0810000110	anggota110@mail.test
111	Anggota 111	Alamat 111	1996-10-28	0810000111	anggota111@mail.test
112	Anggota 112	Alamat 112	1995-10-29	0810000112	anggota112@mail.test
113	Anggota 113	Alamat 113	1994-10-29	0810000113	anggota113@mail.test
114	Anggota 114	Alamat 114	1993-10-29	0810000114	anggota114@mail.test
115	Anggota 115	Alamat 115	1992-10-29	0810000115	anggota115@mail.test
116	Anggota 116	Alamat 116	1991-10-30	0810000116	anggota116@mail.test
117	Anggota 117	Alamat 117	1990-10-30	0810000117	anggota117@mail.test
118	Anggota 118	Alamat 118	1989-10-30	0810000118	anggota118@mail.test
119	Anggota 119	Alamat 119	1988-10-30	0810000119	anggota119@mail.test
120	Anggota 120	Alamat 120	1987-10-31	0810000120	anggota120@mail.test
121	Anggota 121	Alamat 121	1986-10-31	0810000121	anggota121@mail.test
122	Anggota 122	Alamat 122	1985-10-31	0810000122	anggota122@mail.test
123	Anggota 123	Alamat 123	1984-10-31	0810000123	anggota123@mail.test
124	Anggota 124	Alamat 124	1983-11-01	0810000124	anggota124@mail.test
125	Anggota 125	Alamat 125	1982-11-01	0810000125	anggota125@mail.test
126	Anggota 126	Alamat 126	1981-11-01	0810000126	anggota126@mail.test
127	Anggota 127	Alamat 127	1980-11-01	0810000127	anggota127@mail.test
128	Anggota 128	Alamat 128	1979-11-02	0810000128	anggota128@mail.test
129	Anggota 129	Alamat 129	1978-11-02	0810000129	anggota129@mail.test
130	Anggota 130	Alamat 130	1977-11-02	0810000130	anggota130@mail.test
131	Anggota 131	Alamat 131	1976-11-02	0810000131	anggota131@mail.test
132	Anggota 132	Alamat 132	1975-11-03	0810000132	anggota132@mail.test
133	Anggota 133	Alamat 133	1974-11-03	0810000133	anggota133@mail.test
134	Anggota 134	Alamat 134	1973-11-03	0810000134	anggota134@mail.test
135	Anggota 135	Alamat 135	1972-11-03	0810000135	anggota135@mail.test
136	Anggota 136	Alamat 136	1971-11-04	0810000136	anggota136@mail.test
137	Anggota 137	Alamat 137	1970-11-04	0810000137	anggota137@mail.test
138	Anggota 138	Alamat 138	1969-11-04	0810000138	anggota138@mail.test
139	Anggota 139	Alamat 139	1968-11-04	0810000139	anggota139@mail.test
140	Anggota 140	Alamat 140	1967-11-05	0810000140	anggota140@mail.test
141	Anggota 141	Alamat 141	1966-11-05	0810000141	anggota141@mail.test
142	Anggota 142	Alamat 142	1965-11-05	0810000142	anggota142@mail.test
143	Anggota 143	Alamat 143	1964-11-05	0810000143	anggota143@mail.test
144	Anggota 144	Alamat 144	1963-11-06	0810000144	anggota144@mail.test
145	Anggota 145	Alamat 145	1962-11-06	0810000145	anggota145@mail.test
146	Anggota 146	Alamat 146	1961-11-06	0810000146	anggota146@mail.test
147	Anggota 147	Alamat 147	1960-11-06	0810000147	anggota147@mail.test
148	Anggota 148	Alamat 148	1959-11-07	0810000148	anggota148@mail.test
149	Anggota 149	Alamat 149	1958-11-07	0810000149	anggota149@mail.test
150	Anggota 150	Alamat 150	2007-10-26	0810000150	anggota150@mail.test
151	Anggota 151	Alamat 151	2006-10-26	0810000151	anggota151@mail.test
152	Anggota 152	Alamat 152	2005-10-26	0810000152	anggota152@mail.test
153	Anggota 153	Alamat 153	2004-10-26	0810000153	anggota153@mail.test
154	Anggota 154	Alamat 154	2003-10-27	0810000154	anggota154@mail.test
155	Anggota 155	Alamat 155	2002-10-27	0810000155	anggota155@mail.test
156	Anggota 156	Alamat 156	2001-10-27	0810000156	anggota156@mail.test
157	Anggota 157	Alamat 157	2000-10-27	0810000157	anggota157@mail.test
158	Anggota 158	Alamat 158	1999-10-28	0810000158	anggota158@mail.test
159	Anggota 159	Alamat 159	1998-10-28	0810000159	anggota159@mail.test
160	Anggota 160	Alamat 160	1997-10-28	0810000160	anggota160@mail.test
161	Anggota 161	Alamat 161	1996-10-28	0810000161	anggota161@mail.test
162	Anggota 162	Alamat 162	1995-10-29	0810000162	anggota162@mail.test
163	Anggota 163	Alamat 163	1994-10-29	0810000163	anggota163@mail.test
164	Anggota 164	Alamat 164	1993-10-29	0810000164	anggota164@mail.test
165	Anggota 165	Alamat 165	1992-10-29	0810000165	anggota165@mail.test
166	Anggota 166	Alamat 166	1991-10-30	0810000166	anggota166@mail.test
167	Anggota 167	Alamat 167	1990-10-30	0810000167	anggota167@mail.test
168	Anggota 168	Alamat 168	1989-10-30	0810000168	anggota168@mail.test
169	Anggota 169	Alamat 169	1988-10-30	0810000169	anggota169@mail.test
170	Anggota 170	Alamat 170	1987-10-31	0810000170	anggota170@mail.test
171	Anggota 171	Alamat 171	1986-10-31	0810000171	anggota171@mail.test
172	Anggota 172	Alamat 172	1985-10-31	0810000172	anggota172@mail.test
173	Anggota 173	Alamat 173	1984-10-31	0810000173	anggota173@mail.test
174	Anggota 174	Alamat 174	1983-11-01	0810000174	anggota174@mail.test
175	Anggota 175	Alamat 175	1982-11-01	0810000175	anggota175@mail.test
176	Anggota 176	Alamat 176	1981-11-01	0810000176	anggota176@mail.test
177	Anggota 177	Alamat 177	1980-11-01	0810000177	anggota177@mail.test
178	Anggota 178	Alamat 178	1979-11-02	0810000178	anggota178@mail.test
179	Anggota 179	Alamat 179	1978-11-02	0810000179	anggota179@mail.test
180	Anggota 180	Alamat 180	1977-11-02	0810000180	anggota180@mail.test
181	Anggota 181	Alamat 181	1976-11-02	0810000181	anggota181@mail.test
182	Anggota 182	Alamat 182	1975-11-03	0810000182	anggota182@mail.test
183	Anggota 183	Alamat 183	1974-11-03	0810000183	anggota183@mail.test
184	Anggota 184	Alamat 184	1973-11-03	0810000184	anggota184@mail.test
185	Anggota 185	Alamat 185	1972-11-03	0810000185	anggota185@mail.test
186	Anggota 186	Alamat 186	1971-11-04	0810000186	anggota186@mail.test
187	Anggota 187	Alamat 187	1970-11-04	0810000187	anggota187@mail.test
188	Anggota 188	Alamat 188	1969-11-04	0810000188	anggota188@mail.test
189	Anggota 189	Alamat 189	1968-11-04	0810000189	anggota189@mail.test
190	Anggota 190	Alamat 190	1967-11-05	0810000190	anggota190@mail.test
191	Anggota 191	Alamat 191	1966-11-05	0810000191	anggota191@mail.test
192	Anggota 192	Alamat 192	1965-11-05	0810000192	anggota192@mail.test
193	Anggota 193	Alamat 193	1964-11-05	0810000193	anggota193@mail.test
194	Anggota 194	Alamat 194	1963-11-06	0810000194	anggota194@mail.test
195	Anggota 195	Alamat 195	1962-11-06	0810000195	anggota195@mail.test
196	Anggota 196	Alamat 196	1961-11-06	0810000196	anggota196@mail.test
197	Anggota 197	Alamat 197	1960-11-06	0810000197	anggota197@mail.test
198	Anggota 198	Alamat 198	1959-11-07	0810000198	anggota198@mail.test
199	Anggota 199	Alamat 199	1958-11-07	0810000199	anggota199@mail.test
200	Anggota 200	Alamat 200	2007-10-26	0810000200	anggota200@mail.test
201	Anggota 201	Alamat 201	2006-10-26	0810000201	anggota201@mail.test
202	Anggota 202	Alamat 202	2005-10-26	0810000202	anggota202@mail.test
203	Anggota 203	Alamat 203	2004-10-26	0810000203	anggota203@mail.test
204	Anggota 204	Alamat 204	2003-10-27	0810000204	anggota204@mail.test
205	Anggota 205	Alamat 205	2002-10-27	0810000205	anggota205@mail.test
206	Anggota 206	Alamat 206	2001-10-27	0810000206	anggota206@mail.test
207	Anggota 207	Alamat 207	2000-10-27	0810000207	anggota207@mail.test
208	Anggota 208	Alamat 208	1999-10-28	0810000208	anggota208@mail.test
209	Anggota 209	Alamat 209	1998-10-28	0810000209	anggota209@mail.test
210	Anggota 210	Alamat 210	1997-10-28	0810000210	anggota210@mail.test
211	Anggota 211	Alamat 211	1996-10-28	0810000211	anggota211@mail.test
212	Anggota 212	Alamat 212	1995-10-29	0810000212	anggota212@mail.test
213	Anggota 213	Alamat 213	1994-10-29	0810000213	anggota213@mail.test
214	Anggota 214	Alamat 214	1993-10-29	0810000214	anggota214@mail.test
215	Anggota 215	Alamat 215	1992-10-29	0810000215	anggota215@mail.test
216	Anggota 216	Alamat 216	1991-10-30	0810000216	anggota216@mail.test
217	Anggota 217	Alamat 217	1990-10-30	0810000217	anggota217@mail.test
218	Anggota 218	Alamat 218	1989-10-30	0810000218	anggota218@mail.test
219	Anggota 219	Alamat 219	1988-10-30	0810000219	anggota219@mail.test
220	Anggota 220	Alamat 220	1987-10-31	0810000220	anggota220@mail.test
221	Anggota 221	Alamat 221	1986-10-31	0810000221	anggota221@mail.test
222	Anggota 222	Alamat 222	1985-10-31	0810000222	anggota222@mail.test
223	Anggota 223	Alamat 223	1984-10-31	0810000223	anggota223@mail.test
224	Anggota 224	Alamat 224	1983-11-01	0810000224	anggota224@mail.test
225	Anggota 225	Alamat 225	1982-11-01	0810000225	anggota225@mail.test
226	Anggota 226	Alamat 226	1981-11-01	0810000226	anggota226@mail.test
227	Anggota 227	Alamat 227	1980-11-01	0810000227	anggota227@mail.test
228	Anggota 228	Alamat 228	1979-11-02	0810000228	anggota228@mail.test
229	Anggota 229	Alamat 229	1978-11-02	0810000229	anggota229@mail.test
230	Anggota 230	Alamat 230	1977-11-02	0810000230	anggota230@mail.test
231	Anggota 231	Alamat 231	1976-11-02	0810000231	anggota231@mail.test
232	Anggota 232	Alamat 232	1975-11-03	0810000232	anggota232@mail.test
233	Anggota 233	Alamat 233	1974-11-03	0810000233	anggota233@mail.test
234	Anggota 234	Alamat 234	1973-11-03	0810000234	anggota234@mail.test
235	Anggota 235	Alamat 235	1972-11-03	0810000235	anggota235@mail.test
236	Anggota 236	Alamat 236	1971-11-04	0810000236	anggota236@mail.test
237	Anggota 237	Alamat 237	1970-11-04	0810000237	anggota237@mail.test
238	Anggota 238	Alamat 238	1969-11-04	0810000238	anggota238@mail.test
239	Anggota 239	Alamat 239	1968-11-04	0810000239	anggota239@mail.test
240	Anggota 240	Alamat 240	1967-11-05	0810000240	anggota240@mail.test
241	Anggota 241	Alamat 241	1966-11-05	0810000241	anggota241@mail.test
242	Anggota 242	Alamat 242	1965-11-05	0810000242	anggota242@mail.test
243	Anggota 243	Alamat 243	1964-11-05	0810000243	anggota243@mail.test
244	Anggota 244	Alamat 244	1963-11-06	0810000244	anggota244@mail.test
245	Anggota 245	Alamat 245	1962-11-06	0810000245	anggota245@mail.test
246	Anggota 246	Alamat 246	1961-11-06	0810000246	anggota246@mail.test
247	Anggota 247	Alamat 247	1960-11-06	0810000247	anggota247@mail.test
248	Anggota 248	Alamat 248	1959-11-07	0810000248	anggota248@mail.test
249	Anggota 249	Alamat 249	1958-11-07	0810000249	anggota249@mail.test
250	Anggota 250	Alamat 250	2007-10-26	0810000250	anggota250@mail.test
251	Anggota 251	Alamat 251	2006-10-26	0810000251	anggota251@mail.test
252	Anggota 252	Alamat 252	2005-10-26	0810000252	anggota252@mail.test
253	Anggota 253	Alamat 253	2004-10-26	0810000253	anggota253@mail.test
254	Anggota 254	Alamat 254	2003-10-27	0810000254	anggota254@mail.test
255	Anggota 255	Alamat 255	2002-10-27	0810000255	anggota255@mail.test
256	Anggota 256	Alamat 256	2001-10-27	0810000256	anggota256@mail.test
257	Anggota 257	Alamat 257	2000-10-27	0810000257	anggota257@mail.test
258	Anggota 258	Alamat 258	1999-10-28	0810000258	anggota258@mail.test
259	Anggota 259	Alamat 259	1998-10-28	0810000259	anggota259@mail.test
260	Anggota 260	Alamat 260	1997-10-28	0810000260	anggota260@mail.test
261	Anggota 261	Alamat 261	1996-10-28	0810000261	anggota261@mail.test
262	Anggota 262	Alamat 262	1995-10-29	0810000262	anggota262@mail.test
263	Anggota 263	Alamat 263	1994-10-29	0810000263	anggota263@mail.test
264	Anggota 264	Alamat 264	1993-10-29	0810000264	anggota264@mail.test
265	Anggota 265	Alamat 265	1992-10-29	0810000265	anggota265@mail.test
266	Anggota 266	Alamat 266	1991-10-30	0810000266	anggota266@mail.test
267	Anggota 267	Alamat 267	1990-10-30	0810000267	anggota267@mail.test
268	Anggota 268	Alamat 268	1989-10-30	0810000268	anggota268@mail.test
269	Anggota 269	Alamat 269	1988-10-30	0810000269	anggota269@mail.test
270	Anggota 270	Alamat 270	1987-10-31	0810000270	anggota270@mail.test
271	Anggota 271	Alamat 271	1986-10-31	0810000271	anggota271@mail.test
272	Anggota 272	Alamat 272	1985-10-31	0810000272	anggota272@mail.test
273	Anggota 273	Alamat 273	1984-10-31	0810000273	anggota273@mail.test
274	Anggota 274	Alamat 274	1983-11-01	0810000274	anggota274@mail.test
275	Anggota 275	Alamat 275	1982-11-01	0810000275	anggota275@mail.test
276	Anggota 276	Alamat 276	1981-11-01	0810000276	anggota276@mail.test
277	Anggota 277	Alamat 277	1980-11-01	0810000277	anggota277@mail.test
278	Anggota 278	Alamat 278	1979-11-02	0810000278	anggota278@mail.test
279	Anggota 279	Alamat 279	1978-11-02	0810000279	anggota279@mail.test
280	Anggota 280	Alamat 280	1977-11-02	0810000280	anggota280@mail.test
281	Anggota 281	Alamat 281	1976-11-02	0810000281	anggota281@mail.test
282	Anggota 282	Alamat 282	1975-11-03	0810000282	anggota282@mail.test
283	Anggota 283	Alamat 283	1974-11-03	0810000283	anggota283@mail.test
284	Anggota 284	Alamat 284	1973-11-03	0810000284	anggota284@mail.test
285	Anggota 285	Alamat 285	1972-11-03	0810000285	anggota285@mail.test
286	Anggota 286	Alamat 286	1971-11-04	0810000286	anggota286@mail.test
287	Anggota 287	Alamat 287	1970-11-04	0810000287	anggota287@mail.test
288	Anggota 288	Alamat 288	1969-11-04	0810000288	anggota288@mail.test
289	Anggota 289	Alamat 289	1968-11-04	0810000289	anggota289@mail.test
290	Anggota 290	Alamat 290	1967-11-05	0810000290	anggota290@mail.test
291	Anggota 291	Alamat 291	1966-11-05	0810000291	anggota291@mail.test
292	Anggota 292	Alamat 292	1965-11-05	0810000292	anggota292@mail.test
293	Anggota 293	Alamat 293	1964-11-05	0810000293	anggota293@mail.test
294	Anggota 294	Alamat 294	1963-11-06	0810000294	anggota294@mail.test
295	Anggota 295	Alamat 295	1962-11-06	0810000295	anggota295@mail.test
296	Anggota 296	Alamat 296	1961-11-06	0810000296	anggota296@mail.test
297	Anggota 297	Alamat 297	1960-11-06	0810000297	anggota297@mail.test
298	Anggota 298	Alamat 298	1959-11-07	0810000298	anggota298@mail.test
299	Anggota 299	Alamat 299	1958-11-07	0810000299	anggota299@mail.test
300	Anggota 300	Alamat 300	2007-10-26	0810000300	anggota300@mail.test
301	Anggota 301	Alamat 301	2006-10-26	0810000301	anggota301@mail.test
302	Anggota 302	Alamat 302	2005-10-26	0810000302	anggota302@mail.test
303	Anggota 303	Alamat 303	2004-10-26	0810000303	anggota303@mail.test
304	Anggota 304	Alamat 304	2003-10-27	0810000304	anggota304@mail.test
305	Anggota 305	Alamat 305	2002-10-27	0810000305	anggota305@mail.test
306	Anggota 306	Alamat 306	2001-10-27	0810000306	anggota306@mail.test
307	Anggota 307	Alamat 307	2000-10-27	0810000307	anggota307@mail.test
308	Anggota 308	Alamat 308	1999-10-28	0810000308	anggota308@mail.test
309	Anggota 309	Alamat 309	1998-10-28	0810000309	anggota309@mail.test
310	Anggota 310	Alamat 310	1997-10-28	0810000310	anggota310@mail.test
311	Anggota 311	Alamat 311	1996-10-28	0810000311	anggota311@mail.test
312	Anggota 312	Alamat 312	1995-10-29	0810000312	anggota312@mail.test
313	Anggota 313	Alamat 313	1994-10-29	0810000313	anggota313@mail.test
314	Anggota 314	Alamat 314	1993-10-29	0810000314	anggota314@mail.test
315	Anggota 315	Alamat 315	1992-10-29	0810000315	anggota315@mail.test
316	Anggota 316	Alamat 316	1991-10-30	0810000316	anggota316@mail.test
317	Anggota 317	Alamat 317	1990-10-30	0810000317	anggota317@mail.test
318	Anggota 318	Alamat 318	1989-10-30	0810000318	anggota318@mail.test
319	Anggota 319	Alamat 319	1988-10-30	0810000319	anggota319@mail.test
320	Anggota 320	Alamat 320	1987-10-31	0810000320	anggota320@mail.test
321	Anggota 321	Alamat 321	1986-10-31	0810000321	anggota321@mail.test
322	Anggota 322	Alamat 322	1985-10-31	0810000322	anggota322@mail.test
323	Anggota 323	Alamat 323	1984-10-31	0810000323	anggota323@mail.test
324	Anggota 324	Alamat 324	1983-11-01	0810000324	anggota324@mail.test
325	Anggota 325	Alamat 325	1982-11-01	0810000325	anggota325@mail.test
326	Anggota 326	Alamat 326	1981-11-01	0810000326	anggota326@mail.test
327	Anggota 327	Alamat 327	1980-11-01	0810000327	anggota327@mail.test
328	Anggota 328	Alamat 328	1979-11-02	0810000328	anggota328@mail.test
329	Anggota 329	Alamat 329	1978-11-02	0810000329	anggota329@mail.test
330	Anggota 330	Alamat 330	1977-11-02	0810000330	anggota330@mail.test
331	Anggota 331	Alamat 331	1976-11-02	0810000331	anggota331@mail.test
332	Anggota 332	Alamat 332	1975-11-03	0810000332	anggota332@mail.test
333	Anggota 333	Alamat 333	1974-11-03	0810000333	anggota333@mail.test
334	Anggota 334	Alamat 334	1973-11-03	0810000334	anggota334@mail.test
335	Anggota 335	Alamat 335	1972-11-03	0810000335	anggota335@mail.test
336	Anggota 336	Alamat 336	1971-11-04	0810000336	anggota336@mail.test
337	Anggota 337	Alamat 337	1970-11-04	0810000337	anggota337@mail.test
338	Anggota 338	Alamat 338	1969-11-04	0810000338	anggota338@mail.test
339	Anggota 339	Alamat 339	1968-11-04	0810000339	anggota339@mail.test
340	Anggota 340	Alamat 340	1967-11-05	0810000340	anggota340@mail.test
341	Anggota 341	Alamat 341	1966-11-05	0810000341	anggota341@mail.test
342	Anggota 342	Alamat 342	1965-11-05	0810000342	anggota342@mail.test
343	Anggota 343	Alamat 343	1964-11-05	0810000343	anggota343@mail.test
344	Anggota 344	Alamat 344	1963-11-06	0810000344	anggota344@mail.test
345	Anggota 345	Alamat 345	1962-11-06	0810000345	anggota345@mail.test
346	Anggota 346	Alamat 346	1961-11-06	0810000346	anggota346@mail.test
347	Anggota 347	Alamat 347	1960-11-06	0810000347	anggota347@mail.test
348	Anggota 348	Alamat 348	1959-11-07	0810000348	anggota348@mail.test
349	Anggota 349	Alamat 349	1958-11-07	0810000349	anggota349@mail.test
350	Anggota 350	Alamat 350	2007-10-26	0810000350	anggota350@mail.test
351	Anggota 351	Alamat 351	2006-10-26	0810000351	anggota351@mail.test
352	Anggota 352	Alamat 352	2005-10-26	0810000352	anggota352@mail.test
353	Anggota 353	Alamat 353	2004-10-26	0810000353	anggota353@mail.test
354	Anggota 354	Alamat 354	2003-10-27	0810000354	anggota354@mail.test
355	Anggota 355	Alamat 355	2002-10-27	0810000355	anggota355@mail.test
356	Anggota 356	Alamat 356	2001-10-27	0810000356	anggota356@mail.test
357	Anggota 357	Alamat 357	2000-10-27	0810000357	anggota357@mail.test
358	Anggota 358	Alamat 358	1999-10-28	0810000358	anggota358@mail.test
359	Anggota 359	Alamat 359	1998-10-28	0810000359	anggota359@mail.test
360	Anggota 360	Alamat 360	1997-10-28	0810000360	anggota360@mail.test
361	Anggota 361	Alamat 361	1996-10-28	0810000361	anggota361@mail.test
362	Anggota 362	Alamat 362	1995-10-29	0810000362	anggota362@mail.test
363	Anggota 363	Alamat 363	1994-10-29	0810000363	anggota363@mail.test
364	Anggota 364	Alamat 364	1993-10-29	0810000364	anggota364@mail.test
365	Anggota 365	Alamat 365	1992-10-29	0810000365	anggota365@mail.test
366	Anggota 366	Alamat 366	1991-10-30	0810000366	anggota366@mail.test
367	Anggota 367	Alamat 367	1990-10-30	0810000367	anggota367@mail.test
368	Anggota 368	Alamat 368	1989-10-30	0810000368	anggota368@mail.test
369	Anggota 369	Alamat 369	1988-10-30	0810000369	anggota369@mail.test
370	Anggota 370	Alamat 370	1987-10-31	0810000370	anggota370@mail.test
371	Anggota 371	Alamat 371	1986-10-31	0810000371	anggota371@mail.test
372	Anggota 372	Alamat 372	1985-10-31	0810000372	anggota372@mail.test
373	Anggota 373	Alamat 373	1984-10-31	0810000373	anggota373@mail.test
374	Anggota 374	Alamat 374	1983-11-01	0810000374	anggota374@mail.test
375	Anggota 375	Alamat 375	1982-11-01	0810000375	anggota375@mail.test
376	Anggota 376	Alamat 376	1981-11-01	0810000376	anggota376@mail.test
377	Anggota 377	Alamat 377	1980-11-01	0810000377	anggota377@mail.test
378	Anggota 378	Alamat 378	1979-11-02	0810000378	anggota378@mail.test
379	Anggota 379	Alamat 379	1978-11-02	0810000379	anggota379@mail.test
380	Anggota 380	Alamat 380	1977-11-02	0810000380	anggota380@mail.test
381	Anggota 381	Alamat 381	1976-11-02	0810000381	anggota381@mail.test
382	Anggota 382	Alamat 382	1975-11-03	0810000382	anggota382@mail.test
383	Anggota 383	Alamat 383	1974-11-03	0810000383	anggota383@mail.test
384	Anggota 384	Alamat 384	1973-11-03	0810000384	anggota384@mail.test
385	Anggota 385	Alamat 385	1972-11-03	0810000385	anggota385@mail.test
386	Anggota 386	Alamat 386	1971-11-04	0810000386	anggota386@mail.test
387	Anggota 387	Alamat 387	1970-11-04	0810000387	anggota387@mail.test
388	Anggota 388	Alamat 388	1969-11-04	0810000388	anggota388@mail.test
389	Anggota 389	Alamat 389	1968-11-04	0810000389	anggota389@mail.test
390	Anggota 390	Alamat 390	1967-11-05	0810000390	anggota390@mail.test
391	Anggota 391	Alamat 391	1966-11-05	0810000391	anggota391@mail.test
392	Anggota 392	Alamat 392	1965-11-05	0810000392	anggota392@mail.test
393	Anggota 393	Alamat 393	1964-11-05	0810000393	anggota393@mail.test
394	Anggota 394	Alamat 394	1963-11-06	0810000394	anggota394@mail.test
395	Anggota 395	Alamat 395	1962-11-06	0810000395	anggota395@mail.test
396	Anggota 396	Alamat 396	1961-11-06	0810000396	anggota396@mail.test
397	Anggota 397	Alamat 397	1960-11-06	0810000397	anggota397@mail.test
398	Anggota 398	Alamat 398	1959-11-07	0810000398	anggota398@mail.test
399	Anggota 399	Alamat 399	1958-11-07	0810000399	anggota399@mail.test
400	Anggota 400	Alamat 400	2007-10-26	0810000400	anggota400@mail.test
401	Anggota 401	Alamat 401	2006-10-26	0810000401	anggota401@mail.test
402	Anggota 402	Alamat 402	2005-10-26	0810000402	anggota402@mail.test
403	Anggota 403	Alamat 403	2004-10-26	0810000403	anggota403@mail.test
404	Anggota 404	Alamat 404	2003-10-27	0810000404	anggota404@mail.test
405	Anggota 405	Alamat 405	2002-10-27	0810000405	anggota405@mail.test
406	Anggota 406	Alamat 406	2001-10-27	0810000406	anggota406@mail.test
407	Anggota 407	Alamat 407	2000-10-27	0810000407	anggota407@mail.test
408	Anggota 408	Alamat 408	1999-10-28	0810000408	anggota408@mail.test
409	Anggota 409	Alamat 409	1998-10-28	0810000409	anggota409@mail.test
410	Anggota 410	Alamat 410	1997-10-28	0810000410	anggota410@mail.test
411	Anggota 411	Alamat 411	1996-10-28	0810000411	anggota411@mail.test
412	Anggota 412	Alamat 412	1995-10-29	0810000412	anggota412@mail.test
413	Anggota 413	Alamat 413	1994-10-29	0810000413	anggota413@mail.test
414	Anggota 414	Alamat 414	1993-10-29	0810000414	anggota414@mail.test
415	Anggota 415	Alamat 415	1992-10-29	0810000415	anggota415@mail.test
416	Anggota 416	Alamat 416	1991-10-30	0810000416	anggota416@mail.test
417	Anggota 417	Alamat 417	1990-10-30	0810000417	anggota417@mail.test
418	Anggota 418	Alamat 418	1989-10-30	0810000418	anggota418@mail.test
419	Anggota 419	Alamat 419	1988-10-30	0810000419	anggota419@mail.test
420	Anggota 420	Alamat 420	1987-10-31	0810000420	anggota420@mail.test
421	Anggota 421	Alamat 421	1986-10-31	0810000421	anggota421@mail.test
422	Anggota 422	Alamat 422	1985-10-31	0810000422	anggota422@mail.test
423	Anggota 423	Alamat 423	1984-10-31	0810000423	anggota423@mail.test
424	Anggota 424	Alamat 424	1983-11-01	0810000424	anggota424@mail.test
425	Anggota 425	Alamat 425	1982-11-01	0810000425	anggota425@mail.test
426	Anggota 426	Alamat 426	1981-11-01	0810000426	anggota426@mail.test
427	Anggota 427	Alamat 427	1980-11-01	0810000427	anggota427@mail.test
428	Anggota 428	Alamat 428	1979-11-02	0810000428	anggota428@mail.test
429	Anggota 429	Alamat 429	1978-11-02	0810000429	anggota429@mail.test
430	Anggota 430	Alamat 430	1977-11-02	0810000430	anggota430@mail.test
431	Anggota 431	Alamat 431	1976-11-02	0810000431	anggota431@mail.test
432	Anggota 432	Alamat 432	1975-11-03	0810000432	anggota432@mail.test
433	Anggota 433	Alamat 433	1974-11-03	0810000433	anggota433@mail.test
434	Anggota 434	Alamat 434	1973-11-03	0810000434	anggota434@mail.test
435	Anggota 435	Alamat 435	1972-11-03	0810000435	anggota435@mail.test
436	Anggota 436	Alamat 436	1971-11-04	0810000436	anggota436@mail.test
437	Anggota 437	Alamat 437	1970-11-04	0810000437	anggota437@mail.test
438	Anggota 438	Alamat 438	1969-11-04	0810000438	anggota438@mail.test
439	Anggota 439	Alamat 439	1968-11-04	0810000439	anggota439@mail.test
440	Anggota 440	Alamat 440	1967-11-05	0810000440	anggota440@mail.test
441	Anggota 441	Alamat 441	1966-11-05	0810000441	anggota441@mail.test
442	Anggota 442	Alamat 442	1965-11-05	0810000442	anggota442@mail.test
443	Anggota 443	Alamat 443	1964-11-05	0810000443	anggota443@mail.test
444	Anggota 444	Alamat 444	1963-11-06	0810000444	anggota444@mail.test
445	Anggota 445	Alamat 445	1962-11-06	0810000445	anggota445@mail.test
446	Anggota 446	Alamat 446	1961-11-06	0810000446	anggota446@mail.test
447	Anggota 447	Alamat 447	1960-11-06	0810000447	anggota447@mail.test
448	Anggota 448	Alamat 448	1959-11-07	0810000448	anggota448@mail.test
449	Anggota 449	Alamat 449	1958-11-07	0810000449	anggota449@mail.test
450	Anggota 450	Alamat 450	2007-10-26	0810000450	anggota450@mail.test
451	Anggota 451	Alamat 451	2006-10-26	0810000451	anggota451@mail.test
452	Anggota 452	Alamat 452	2005-10-26	0810000452	anggota452@mail.test
453	Anggota 453	Alamat 453	2004-10-26	0810000453	anggota453@mail.test
454	Anggota 454	Alamat 454	2003-10-27	0810000454	anggota454@mail.test
455	Anggota 455	Alamat 455	2002-10-27	0810000455	anggota455@mail.test
456	Anggota 456	Alamat 456	2001-10-27	0810000456	anggota456@mail.test
457	Anggota 457	Alamat 457	2000-10-27	0810000457	anggota457@mail.test
458	Anggota 458	Alamat 458	1999-10-28	0810000458	anggota458@mail.test
459	Anggota 459	Alamat 459	1998-10-28	0810000459	anggota459@mail.test
460	Anggota 460	Alamat 460	1997-10-28	0810000460	anggota460@mail.test
461	Anggota 461	Alamat 461	1996-10-28	0810000461	anggota461@mail.test
462	Anggota 462	Alamat 462	1995-10-29	0810000462	anggota462@mail.test
463	Anggota 463	Alamat 463	1994-10-29	0810000463	anggota463@mail.test
464	Anggota 464	Alamat 464	1993-10-29	0810000464	anggota464@mail.test
465	Anggota 465	Alamat 465	1992-10-29	0810000465	anggota465@mail.test
466	Anggota 466	Alamat 466	1991-10-30	0810000466	anggota466@mail.test
467	Anggota 467	Alamat 467	1990-10-30	0810000467	anggota467@mail.test
468	Anggota 468	Alamat 468	1989-10-30	0810000468	anggota468@mail.test
469	Anggota 469	Alamat 469	1988-10-30	0810000469	anggota469@mail.test
470	Anggota 470	Alamat 470	1987-10-31	0810000470	anggota470@mail.test
471	Anggota 471	Alamat 471	1986-10-31	0810000471	anggota471@mail.test
472	Anggota 472	Alamat 472	1985-10-31	0810000472	anggota472@mail.test
473	Anggota 473	Alamat 473	1984-10-31	0810000473	anggota473@mail.test
474	Anggota 474	Alamat 474	1983-11-01	0810000474	anggota474@mail.test
475	Anggota 475	Alamat 475	1982-11-01	0810000475	anggota475@mail.test
476	Anggota 476	Alamat 476	1981-11-01	0810000476	anggota476@mail.test
477	Anggota 477	Alamat 477	1980-11-01	0810000477	anggota477@mail.test
478	Anggota 478	Alamat 478	1979-11-02	0810000478	anggota478@mail.test
479	Anggota 479	Alamat 479	1978-11-02	0810000479	anggota479@mail.test
480	Anggota 480	Alamat 480	1977-11-02	0810000480	anggota480@mail.test
481	Anggota 481	Alamat 481	1976-11-02	0810000481	anggota481@mail.test
482	Anggota 482	Alamat 482	1975-11-03	0810000482	anggota482@mail.test
483	Anggota 483	Alamat 483	1974-11-03	0810000483	anggota483@mail.test
484	Anggota 484	Alamat 484	1973-11-03	0810000484	anggota484@mail.test
485	Anggota 485	Alamat 485	1972-11-03	0810000485	anggota485@mail.test
486	Anggota 486	Alamat 486	1971-11-04	0810000486	anggota486@mail.test
487	Anggota 487	Alamat 487	1970-11-04	0810000487	anggota487@mail.test
488	Anggota 488	Alamat 488	1969-11-04	0810000488	anggota488@mail.test
489	Anggota 489	Alamat 489	1968-11-04	0810000489	anggota489@mail.test
490	Anggota 490	Alamat 490	1967-11-05	0810000490	anggota490@mail.test
491	Anggota 491	Alamat 491	1966-11-05	0810000491	anggota491@mail.test
492	Anggota 492	Alamat 492	1965-11-05	0810000492	anggota492@mail.test
493	Anggota 493	Alamat 493	1964-11-05	0810000493	anggota493@mail.test
494	Anggota 494	Alamat 494	1963-11-06	0810000494	anggota494@mail.test
495	Anggota 495	Alamat 495	1962-11-06	0810000495	anggota495@mail.test
496	Anggota 496	Alamat 496	1961-11-06	0810000496	anggota496@mail.test
497	Anggota 497	Alamat 497	1960-11-06	0810000497	anggota497@mail.test
498	Anggota 498	Alamat 498	1959-11-07	0810000498	anggota498@mail.test
499	Anggota 499	Alamat 499	1958-11-07	0810000499	anggota499@mail.test
500	Anggota 500	Alamat 500	2007-10-26	0810000500	anggota500@mail.test
501	Anggota 501	Alamat 501	2006-10-26	0810000501	anggota501@mail.test
502	Anggota 502	Alamat 502	2005-10-26	0810000502	anggota502@mail.test
503	Anggota 503	Alamat 503	2004-10-26	0810000503	anggota503@mail.test
504	Anggota 504	Alamat 504	2003-10-27	0810000504	anggota504@mail.test
505	Anggota 505	Alamat 505	2002-10-27	0810000505	anggota505@mail.test
506	Anggota 506	Alamat 506	2001-10-27	0810000506	anggota506@mail.test
507	Anggota 507	Alamat 507	2000-10-27	0810000507	anggota507@mail.test
508	Anggota 508	Alamat 508	1999-10-28	0810000508	anggota508@mail.test
509	Anggota 509	Alamat 509	1998-10-28	0810000509	anggota509@mail.test
510	Anggota 510	Alamat 510	1997-10-28	0810000510	anggota510@mail.test
511	Anggota 511	Alamat 511	1996-10-28	0810000511	anggota511@mail.test
512	Anggota 512	Alamat 512	1995-10-29	0810000512	anggota512@mail.test
513	Anggota 513	Alamat 513	1994-10-29	0810000513	anggota513@mail.test
514	Anggota 514	Alamat 514	1993-10-29	0810000514	anggota514@mail.test
515	Anggota 515	Alamat 515	1992-10-29	0810000515	anggota515@mail.test
516	Anggota 516	Alamat 516	1991-10-30	0810000516	anggota516@mail.test
517	Anggota 517	Alamat 517	1990-10-30	0810000517	anggota517@mail.test
518	Anggota 518	Alamat 518	1989-10-30	0810000518	anggota518@mail.test
519	Anggota 519	Alamat 519	1988-10-30	0810000519	anggota519@mail.test
520	Anggota 520	Alamat 520	1987-10-31	0810000520	anggota520@mail.test
521	Anggota 521	Alamat 521	1986-10-31	0810000521	anggota521@mail.test
522	Anggota 522	Alamat 522	1985-10-31	0810000522	anggota522@mail.test
523	Anggota 523	Alamat 523	1984-10-31	0810000523	anggota523@mail.test
524	Anggota 524	Alamat 524	1983-11-01	0810000524	anggota524@mail.test
525	Anggota 525	Alamat 525	1982-11-01	0810000525	anggota525@mail.test
526	Anggota 526	Alamat 526	1981-11-01	0810000526	anggota526@mail.test
527	Anggota 527	Alamat 527	1980-11-01	0810000527	anggota527@mail.test
528	Anggota 528	Alamat 528	1979-11-02	0810000528	anggota528@mail.test
529	Anggota 529	Alamat 529	1978-11-02	0810000529	anggota529@mail.test
530	Anggota 530	Alamat 530	1977-11-02	0810000530	anggota530@mail.test
531	Anggota 531	Alamat 531	1976-11-02	0810000531	anggota531@mail.test
532	Anggota 532	Alamat 532	1975-11-03	0810000532	anggota532@mail.test
533	Anggota 533	Alamat 533	1974-11-03	0810000533	anggota533@mail.test
534	Anggota 534	Alamat 534	1973-11-03	0810000534	anggota534@mail.test
535	Anggota 535	Alamat 535	1972-11-03	0810000535	anggota535@mail.test
536	Anggota 536	Alamat 536	1971-11-04	0810000536	anggota536@mail.test
537	Anggota 537	Alamat 537	1970-11-04	0810000537	anggota537@mail.test
538	Anggota 538	Alamat 538	1969-11-04	0810000538	anggota538@mail.test
539	Anggota 539	Alamat 539	1968-11-04	0810000539	anggota539@mail.test
540	Anggota 540	Alamat 540	1967-11-05	0810000540	anggota540@mail.test
541	Anggota 541	Alamat 541	1966-11-05	0810000541	anggota541@mail.test
542	Anggota 542	Alamat 542	1965-11-05	0810000542	anggota542@mail.test
543	Anggota 543	Alamat 543	1964-11-05	0810000543	anggota543@mail.test
544	Anggota 544	Alamat 544	1963-11-06	0810000544	anggota544@mail.test
545	Anggota 545	Alamat 545	1962-11-06	0810000545	anggota545@mail.test
546	Anggota 546	Alamat 546	1961-11-06	0810000546	anggota546@mail.test
547	Anggota 547	Alamat 547	1960-11-06	0810000547	anggota547@mail.test
548	Anggota 548	Alamat 548	1959-11-07	0810000548	anggota548@mail.test
549	Anggota 549	Alamat 549	1958-11-07	0810000549	anggota549@mail.test
550	Anggota 550	Alamat 550	2007-10-26	0810000550	anggota550@mail.test
551	Anggota 551	Alamat 551	2006-10-26	0810000551	anggota551@mail.test
552	Anggota 552	Alamat 552	2005-10-26	0810000552	anggota552@mail.test
553	Anggota 553	Alamat 553	2004-10-26	0810000553	anggota553@mail.test
554	Anggota 554	Alamat 554	2003-10-27	0810000554	anggota554@mail.test
555	Anggota 555	Alamat 555	2002-10-27	0810000555	anggota555@mail.test
556	Anggota 556	Alamat 556	2001-10-27	0810000556	anggota556@mail.test
557	Anggota 557	Alamat 557	2000-10-27	0810000557	anggota557@mail.test
558	Anggota 558	Alamat 558	1999-10-28	0810000558	anggota558@mail.test
559	Anggota 559	Alamat 559	1998-10-28	0810000559	anggota559@mail.test
560	Anggota 560	Alamat 560	1997-10-28	0810000560	anggota560@mail.test
561	Anggota 561	Alamat 561	1996-10-28	0810000561	anggota561@mail.test
562	Anggota 562	Alamat 562	1995-10-29	0810000562	anggota562@mail.test
563	Anggota 563	Alamat 563	1994-10-29	0810000563	anggota563@mail.test
564	Anggota 564	Alamat 564	1993-10-29	0810000564	anggota564@mail.test
565	Anggota 565	Alamat 565	1992-10-29	0810000565	anggota565@mail.test
566	Anggota 566	Alamat 566	1991-10-30	0810000566	anggota566@mail.test
567	Anggota 567	Alamat 567	1990-10-30	0810000567	anggota567@mail.test
568	Anggota 568	Alamat 568	1989-10-30	0810000568	anggota568@mail.test
569	Anggota 569	Alamat 569	1988-10-30	0810000569	anggota569@mail.test
570	Anggota 570	Alamat 570	1987-10-31	0810000570	anggota570@mail.test
571	Anggota 571	Alamat 571	1986-10-31	0810000571	anggota571@mail.test
572	Anggota 572	Alamat 572	1985-10-31	0810000572	anggota572@mail.test
573	Anggota 573	Alamat 573	1984-10-31	0810000573	anggota573@mail.test
574	Anggota 574	Alamat 574	1983-11-01	0810000574	anggota574@mail.test
575	Anggota 575	Alamat 575	1982-11-01	0810000575	anggota575@mail.test
576	Anggota 576	Alamat 576	1981-11-01	0810000576	anggota576@mail.test
577	Anggota 577	Alamat 577	1980-11-01	0810000577	anggota577@mail.test
578	Anggota 578	Alamat 578	1979-11-02	0810000578	anggota578@mail.test
579	Anggota 579	Alamat 579	1978-11-02	0810000579	anggota579@mail.test
580	Anggota 580	Alamat 580	1977-11-02	0810000580	anggota580@mail.test
581	Anggota 581	Alamat 581	1976-11-02	0810000581	anggota581@mail.test
582	Anggota 582	Alamat 582	1975-11-03	0810000582	anggota582@mail.test
583	Anggota 583	Alamat 583	1974-11-03	0810000583	anggota583@mail.test
584	Anggota 584	Alamat 584	1973-11-03	0810000584	anggota584@mail.test
585	Anggota 585	Alamat 585	1972-11-03	0810000585	anggota585@mail.test
586	Anggota 586	Alamat 586	1971-11-04	0810000586	anggota586@mail.test
587	Anggota 587	Alamat 587	1970-11-04	0810000587	anggota587@mail.test
588	Anggota 588	Alamat 588	1969-11-04	0810000588	anggota588@mail.test
589	Anggota 589	Alamat 589	1968-11-04	0810000589	anggota589@mail.test
590	Anggota 590	Alamat 590	1967-11-05	0810000590	anggota590@mail.test
591	Anggota 591	Alamat 591	1966-11-05	0810000591	anggota591@mail.test
592	Anggota 592	Alamat 592	1965-11-05	0810000592	anggota592@mail.test
593	Anggota 593	Alamat 593	1964-11-05	0810000593	anggota593@mail.test
594	Anggota 594	Alamat 594	1963-11-06	0810000594	anggota594@mail.test
595	Anggota 595	Alamat 595	1962-11-06	0810000595	anggota595@mail.test
596	Anggota 596	Alamat 596	1961-11-06	0810000596	anggota596@mail.test
597	Anggota 597	Alamat 597	1960-11-06	0810000597	anggota597@mail.test
598	Anggota 598	Alamat 598	1959-11-07	0810000598	anggota598@mail.test
599	Anggota 599	Alamat 599	1958-11-07	0810000599	anggota599@mail.test
600	Anggota 600	Alamat 600	2007-10-26	0810000600	anggota600@mail.test
601	Anggota 601	Alamat 601	2006-10-26	0810000601	anggota601@mail.test
602	Anggota 602	Alamat 602	2005-10-26	0810000602	anggota602@mail.test
603	Anggota 603	Alamat 603	2004-10-26	0810000603	anggota603@mail.test
604	Anggota 604	Alamat 604	2003-10-27	0810000604	anggota604@mail.test
605	Anggota 605	Alamat 605	2002-10-27	0810000605	anggota605@mail.test
606	Anggota 606	Alamat 606	2001-10-27	0810000606	anggota606@mail.test
607	Anggota 607	Alamat 607	2000-10-27	0810000607	anggota607@mail.test
608	Anggota 608	Alamat 608	1999-10-28	0810000608	anggota608@mail.test
609	Anggota 609	Alamat 609	1998-10-28	0810000609	anggota609@mail.test
610	Anggota 610	Alamat 610	1997-10-28	0810000610	anggota610@mail.test
611	Anggota 611	Alamat 611	1996-10-28	0810000611	anggota611@mail.test
612	Anggota 612	Alamat 612	1995-10-29	0810000612	anggota612@mail.test
613	Anggota 613	Alamat 613	1994-10-29	0810000613	anggota613@mail.test
614	Anggota 614	Alamat 614	1993-10-29	0810000614	anggota614@mail.test
615	Anggota 615	Alamat 615	1992-10-29	0810000615	anggota615@mail.test
616	Anggota 616	Alamat 616	1991-10-30	0810000616	anggota616@mail.test
617	Anggota 617	Alamat 617	1990-10-30	0810000617	anggota617@mail.test
618	Anggota 618	Alamat 618	1989-10-30	0810000618	anggota618@mail.test
619	Anggota 619	Alamat 619	1988-10-30	0810000619	anggota619@mail.test
620	Anggota 620	Alamat 620	1987-10-31	0810000620	anggota620@mail.test
621	Anggota 621	Alamat 621	1986-10-31	0810000621	anggota621@mail.test
622	Anggota 622	Alamat 622	1985-10-31	0810000622	anggota622@mail.test
623	Anggota 623	Alamat 623	1984-10-31	0810000623	anggota623@mail.test
624	Anggota 624	Alamat 624	1983-11-01	0810000624	anggota624@mail.test
625	Anggota 625	Alamat 625	1982-11-01	0810000625	anggota625@mail.test
626	Anggota 626	Alamat 626	1981-11-01	0810000626	anggota626@mail.test
627	Anggota 627	Alamat 627	1980-11-01	0810000627	anggota627@mail.test
628	Anggota 628	Alamat 628	1979-11-02	0810000628	anggota628@mail.test
629	Anggota 629	Alamat 629	1978-11-02	0810000629	anggota629@mail.test
630	Anggota 630	Alamat 630	1977-11-02	0810000630	anggota630@mail.test
631	Anggota 631	Alamat 631	1976-11-02	0810000631	anggota631@mail.test
632	Anggota 632	Alamat 632	1975-11-03	0810000632	anggota632@mail.test
633	Anggota 633	Alamat 633	1974-11-03	0810000633	anggota633@mail.test
634	Anggota 634	Alamat 634	1973-11-03	0810000634	anggota634@mail.test
635	Anggota 635	Alamat 635	1972-11-03	0810000635	anggota635@mail.test
636	Anggota 636	Alamat 636	1971-11-04	0810000636	anggota636@mail.test
637	Anggota 637	Alamat 637	1970-11-04	0810000637	anggota637@mail.test
638	Anggota 638	Alamat 638	1969-11-04	0810000638	anggota638@mail.test
639	Anggota 639	Alamat 639	1968-11-04	0810000639	anggota639@mail.test
640	Anggota 640	Alamat 640	1967-11-05	0810000640	anggota640@mail.test
641	Anggota 641	Alamat 641	1966-11-05	0810000641	anggota641@mail.test
642	Anggota 642	Alamat 642	1965-11-05	0810000642	anggota642@mail.test
643	Anggota 643	Alamat 643	1964-11-05	0810000643	anggota643@mail.test
644	Anggota 644	Alamat 644	1963-11-06	0810000644	anggota644@mail.test
645	Anggota 645	Alamat 645	1962-11-06	0810000645	anggota645@mail.test
646	Anggota 646	Alamat 646	1961-11-06	0810000646	anggota646@mail.test
647	Anggota 647	Alamat 647	1960-11-06	0810000647	anggota647@mail.test
648	Anggota 648	Alamat 648	1959-11-07	0810000648	anggota648@mail.test
649	Anggota 649	Alamat 649	1958-11-07	0810000649	anggota649@mail.test
650	Anggota 650	Alamat 650	2007-10-26	0810000650	anggota650@mail.test
651	Anggota 651	Alamat 651	2006-10-26	0810000651	anggota651@mail.test
652	Anggota 652	Alamat 652	2005-10-26	0810000652	anggota652@mail.test
653	Anggota 653	Alamat 653	2004-10-26	0810000653	anggota653@mail.test
654	Anggota 654	Alamat 654	2003-10-27	0810000654	anggota654@mail.test
655	Anggota 655	Alamat 655	2002-10-27	0810000655	anggota655@mail.test
656	Anggota 656	Alamat 656	2001-10-27	0810000656	anggota656@mail.test
657	Anggota 657	Alamat 657	2000-10-27	0810000657	anggota657@mail.test
658	Anggota 658	Alamat 658	1999-10-28	0810000658	anggota658@mail.test
659	Anggota 659	Alamat 659	1998-10-28	0810000659	anggota659@mail.test
660	Anggota 660	Alamat 660	1997-10-28	0810000660	anggota660@mail.test
661	Anggota 661	Alamat 661	1996-10-28	0810000661	anggota661@mail.test
662	Anggota 662	Alamat 662	1995-10-29	0810000662	anggota662@mail.test
663	Anggota 663	Alamat 663	1994-10-29	0810000663	anggota663@mail.test
664	Anggota 664	Alamat 664	1993-10-29	0810000664	anggota664@mail.test
665	Anggota 665	Alamat 665	1992-10-29	0810000665	anggota665@mail.test
666	Anggota 666	Alamat 666	1991-10-30	0810000666	anggota666@mail.test
667	Anggota 667	Alamat 667	1990-10-30	0810000667	anggota667@mail.test
668	Anggota 668	Alamat 668	1989-10-30	0810000668	anggota668@mail.test
669	Anggota 669	Alamat 669	1988-10-30	0810000669	anggota669@mail.test
670	Anggota 670	Alamat 670	1987-10-31	0810000670	anggota670@mail.test
671	Anggota 671	Alamat 671	1986-10-31	0810000671	anggota671@mail.test
672	Anggota 672	Alamat 672	1985-10-31	0810000672	anggota672@mail.test
673	Anggota 673	Alamat 673	1984-10-31	0810000673	anggota673@mail.test
674	Anggota 674	Alamat 674	1983-11-01	0810000674	anggota674@mail.test
675	Anggota 675	Alamat 675	1982-11-01	0810000675	anggota675@mail.test
676	Anggota 676	Alamat 676	1981-11-01	0810000676	anggota676@mail.test
677	Anggota 677	Alamat 677	1980-11-01	0810000677	anggota677@mail.test
678	Anggota 678	Alamat 678	1979-11-02	0810000678	anggota678@mail.test
679	Anggota 679	Alamat 679	1978-11-02	0810000679	anggota679@mail.test
680	Anggota 680	Alamat 680	1977-11-02	0810000680	anggota680@mail.test
681	Anggota 681	Alamat 681	1976-11-02	0810000681	anggota681@mail.test
682	Anggota 682	Alamat 682	1975-11-03	0810000682	anggota682@mail.test
683	Anggota 683	Alamat 683	1974-11-03	0810000683	anggota683@mail.test
684	Anggota 684	Alamat 684	1973-11-03	0810000684	anggota684@mail.test
685	Anggota 685	Alamat 685	1972-11-03	0810000685	anggota685@mail.test
686	Anggota 686	Alamat 686	1971-11-04	0810000686	anggota686@mail.test
687	Anggota 687	Alamat 687	1970-11-04	0810000687	anggota687@mail.test
688	Anggota 688	Alamat 688	1969-11-04	0810000688	anggota688@mail.test
689	Anggota 689	Alamat 689	1968-11-04	0810000689	anggota689@mail.test
690	Anggota 690	Alamat 690	1967-11-05	0810000690	anggota690@mail.test
691	Anggota 691	Alamat 691	1966-11-05	0810000691	anggota691@mail.test
692	Anggota 692	Alamat 692	1965-11-05	0810000692	anggota692@mail.test
693	Anggota 693	Alamat 693	1964-11-05	0810000693	anggota693@mail.test
694	Anggota 694	Alamat 694	1963-11-06	0810000694	anggota694@mail.test
695	Anggota 695	Alamat 695	1962-11-06	0810000695	anggota695@mail.test
696	Anggota 696	Alamat 696	1961-11-06	0810000696	anggota696@mail.test
697	Anggota 697	Alamat 697	1960-11-06	0810000697	anggota697@mail.test
698	Anggota 698	Alamat 698	1959-11-07	0810000698	anggota698@mail.test
699	Anggota 699	Alamat 699	1958-11-07	0810000699	anggota699@mail.test
700	Anggota 700	Alamat 700	2007-10-26	0810000700	anggota700@mail.test
701	Anggota 701	Alamat 701	2006-10-26	0810000701	anggota701@mail.test
702	Anggota 702	Alamat 702	2005-10-26	0810000702	anggota702@mail.test
703	Anggota 703	Alamat 703	2004-10-26	0810000703	anggota703@mail.test
704	Anggota 704	Alamat 704	2003-10-27	0810000704	anggota704@mail.test
705	Anggota 705	Alamat 705	2002-10-27	0810000705	anggota705@mail.test
706	Anggota 706	Alamat 706	2001-10-27	0810000706	anggota706@mail.test
707	Anggota 707	Alamat 707	2000-10-27	0810000707	anggota707@mail.test
708	Anggota 708	Alamat 708	1999-10-28	0810000708	anggota708@mail.test
709	Anggota 709	Alamat 709	1998-10-28	0810000709	anggota709@mail.test
710	Anggota 710	Alamat 710	1997-10-28	0810000710	anggota710@mail.test
711	Anggota 711	Alamat 711	1996-10-28	0810000711	anggota711@mail.test
712	Anggota 712	Alamat 712	1995-10-29	0810000712	anggota712@mail.test
713	Anggota 713	Alamat 713	1994-10-29	0810000713	anggota713@mail.test
714	Anggota 714	Alamat 714	1993-10-29	0810000714	anggota714@mail.test
715	Anggota 715	Alamat 715	1992-10-29	0810000715	anggota715@mail.test
716	Anggota 716	Alamat 716	1991-10-30	0810000716	anggota716@mail.test
717	Anggota 717	Alamat 717	1990-10-30	0810000717	anggota717@mail.test
718	Anggota 718	Alamat 718	1989-10-30	0810000718	anggota718@mail.test
719	Anggota 719	Alamat 719	1988-10-30	0810000719	anggota719@mail.test
720	Anggota 720	Alamat 720	1987-10-31	0810000720	anggota720@mail.test
721	Anggota 721	Alamat 721	1986-10-31	0810000721	anggota721@mail.test
722	Anggota 722	Alamat 722	1985-10-31	0810000722	anggota722@mail.test
723	Anggota 723	Alamat 723	1984-10-31	0810000723	anggota723@mail.test
724	Anggota 724	Alamat 724	1983-11-01	0810000724	anggota724@mail.test
725	Anggota 725	Alamat 725	1982-11-01	0810000725	anggota725@mail.test
726	Anggota 726	Alamat 726	1981-11-01	0810000726	anggota726@mail.test
727	Anggota 727	Alamat 727	1980-11-01	0810000727	anggota727@mail.test
728	Anggota 728	Alamat 728	1979-11-02	0810000728	anggota728@mail.test
729	Anggota 729	Alamat 729	1978-11-02	0810000729	anggota729@mail.test
730	Anggota 730	Alamat 730	1977-11-02	0810000730	anggota730@mail.test
731	Anggota 731	Alamat 731	1976-11-02	0810000731	anggota731@mail.test
732	Anggota 732	Alamat 732	1975-11-03	0810000732	anggota732@mail.test
733	Anggota 733	Alamat 733	1974-11-03	0810000733	anggota733@mail.test
734	Anggota 734	Alamat 734	1973-11-03	0810000734	anggota734@mail.test
735	Anggota 735	Alamat 735	1972-11-03	0810000735	anggota735@mail.test
736	Anggota 736	Alamat 736	1971-11-04	0810000736	anggota736@mail.test
737	Anggota 737	Alamat 737	1970-11-04	0810000737	anggota737@mail.test
738	Anggota 738	Alamat 738	1969-11-04	0810000738	anggota738@mail.test
739	Anggota 739	Alamat 739	1968-11-04	0810000739	anggota739@mail.test
740	Anggota 740	Alamat 740	1967-11-05	0810000740	anggota740@mail.test
741	Anggota 741	Alamat 741	1966-11-05	0810000741	anggota741@mail.test
742	Anggota 742	Alamat 742	1965-11-05	0810000742	anggota742@mail.test
743	Anggota 743	Alamat 743	1964-11-05	0810000743	anggota743@mail.test
744	Anggota 744	Alamat 744	1963-11-06	0810000744	anggota744@mail.test
745	Anggota 745	Alamat 745	1962-11-06	0810000745	anggota745@mail.test
746	Anggota 746	Alamat 746	1961-11-06	0810000746	anggota746@mail.test
747	Anggota 747	Alamat 747	1960-11-06	0810000747	anggota747@mail.test
748	Anggota 748	Alamat 748	1959-11-07	0810000748	anggota748@mail.test
749	Anggota 749	Alamat 749	1958-11-07	0810000749	anggota749@mail.test
750	Anggota 750	Alamat 750	2007-10-26	0810000750	anggota750@mail.test
751	Anggota 751	Alamat 751	2006-10-26	0810000751	anggota751@mail.test
752	Anggota 752	Alamat 752	2005-10-26	0810000752	anggota752@mail.test
753	Anggota 753	Alamat 753	2004-10-26	0810000753	anggota753@mail.test
754	Anggota 754	Alamat 754	2003-10-27	0810000754	anggota754@mail.test
755	Anggota 755	Alamat 755	2002-10-27	0810000755	anggota755@mail.test
756	Anggota 756	Alamat 756	2001-10-27	0810000756	anggota756@mail.test
757	Anggota 757	Alamat 757	2000-10-27	0810000757	anggota757@mail.test
758	Anggota 758	Alamat 758	1999-10-28	0810000758	anggota758@mail.test
759	Anggota 759	Alamat 759	1998-10-28	0810000759	anggota759@mail.test
760	Anggota 760	Alamat 760	1997-10-28	0810000760	anggota760@mail.test
761	Anggota 761	Alamat 761	1996-10-28	0810000761	anggota761@mail.test
762	Anggota 762	Alamat 762	1995-10-29	0810000762	anggota762@mail.test
763	Anggota 763	Alamat 763	1994-10-29	0810000763	anggota763@mail.test
764	Anggota 764	Alamat 764	1993-10-29	0810000764	anggota764@mail.test
765	Anggota 765	Alamat 765	1992-10-29	0810000765	anggota765@mail.test
766	Anggota 766	Alamat 766	1991-10-30	0810000766	anggota766@mail.test
767	Anggota 767	Alamat 767	1990-10-30	0810000767	anggota767@mail.test
768	Anggota 768	Alamat 768	1989-10-30	0810000768	anggota768@mail.test
769	Anggota 769	Alamat 769	1988-10-30	0810000769	anggota769@mail.test
770	Anggota 770	Alamat 770	1987-10-31	0810000770	anggota770@mail.test
771	Anggota 771	Alamat 771	1986-10-31	0810000771	anggota771@mail.test
772	Anggota 772	Alamat 772	1985-10-31	0810000772	anggota772@mail.test
773	Anggota 773	Alamat 773	1984-10-31	0810000773	anggota773@mail.test
774	Anggota 774	Alamat 774	1983-11-01	0810000774	anggota774@mail.test
775	Anggota 775	Alamat 775	1982-11-01	0810000775	anggota775@mail.test
776	Anggota 776	Alamat 776	1981-11-01	0810000776	anggota776@mail.test
777	Anggota 777	Alamat 777	1980-11-01	0810000777	anggota777@mail.test
778	Anggota 778	Alamat 778	1979-11-02	0810000778	anggota778@mail.test
779	Anggota 779	Alamat 779	1978-11-02	0810000779	anggota779@mail.test
780	Anggota 780	Alamat 780	1977-11-02	0810000780	anggota780@mail.test
781	Anggota 781	Alamat 781	1976-11-02	0810000781	anggota781@mail.test
782	Anggota 782	Alamat 782	1975-11-03	0810000782	anggota782@mail.test
783	Anggota 783	Alamat 783	1974-11-03	0810000783	anggota783@mail.test
784	Anggota 784	Alamat 784	1973-11-03	0810000784	anggota784@mail.test
785	Anggota 785	Alamat 785	1972-11-03	0810000785	anggota785@mail.test
786	Anggota 786	Alamat 786	1971-11-04	0810000786	anggota786@mail.test
787	Anggota 787	Alamat 787	1970-11-04	0810000787	anggota787@mail.test
788	Anggota 788	Alamat 788	1969-11-04	0810000788	anggota788@mail.test
789	Anggota 789	Alamat 789	1968-11-04	0810000789	anggota789@mail.test
790	Anggota 790	Alamat 790	1967-11-05	0810000790	anggota790@mail.test
791	Anggota 791	Alamat 791	1966-11-05	0810000791	anggota791@mail.test
792	Anggota 792	Alamat 792	1965-11-05	0810000792	anggota792@mail.test
793	Anggota 793	Alamat 793	1964-11-05	0810000793	anggota793@mail.test
794	Anggota 794	Alamat 794	1963-11-06	0810000794	anggota794@mail.test
795	Anggota 795	Alamat 795	1962-11-06	0810000795	anggota795@mail.test
796	Anggota 796	Alamat 796	1961-11-06	0810000796	anggota796@mail.test
797	Anggota 797	Alamat 797	1960-11-06	0810000797	anggota797@mail.test
798	Anggota 798	Alamat 798	1959-11-07	0810000798	anggota798@mail.test
799	Anggota 799	Alamat 799	1958-11-07	0810000799	anggota799@mail.test
800	Anggota 800	Alamat 800	2007-10-26	0810000800	anggota800@mail.test
801	Anggota 801	Alamat 801	2006-10-26	0810000801	anggota801@mail.test
802	Anggota 802	Alamat 802	2005-10-26	0810000802	anggota802@mail.test
803	Anggota 803	Alamat 803	2004-10-26	0810000803	anggota803@mail.test
804	Anggota 804	Alamat 804	2003-10-27	0810000804	anggota804@mail.test
805	Anggota 805	Alamat 805	2002-10-27	0810000805	anggota805@mail.test
806	Anggota 806	Alamat 806	2001-10-27	0810000806	anggota806@mail.test
807	Anggota 807	Alamat 807	2000-10-27	0810000807	anggota807@mail.test
808	Anggota 808	Alamat 808	1999-10-28	0810000808	anggota808@mail.test
809	Anggota 809	Alamat 809	1998-10-28	0810000809	anggota809@mail.test
810	Anggota 810	Alamat 810	1997-10-28	0810000810	anggota810@mail.test
811	Anggota 811	Alamat 811	1996-10-28	0810000811	anggota811@mail.test
812	Anggota 812	Alamat 812	1995-10-29	0810000812	anggota812@mail.test
813	Anggota 813	Alamat 813	1994-10-29	0810000813	anggota813@mail.test
814	Anggota 814	Alamat 814	1993-10-29	0810000814	anggota814@mail.test
815	Anggota 815	Alamat 815	1992-10-29	0810000815	anggota815@mail.test
816	Anggota 816	Alamat 816	1991-10-30	0810000816	anggota816@mail.test
817	Anggota 817	Alamat 817	1990-10-30	0810000817	anggota817@mail.test
818	Anggota 818	Alamat 818	1989-10-30	0810000818	anggota818@mail.test
819	Anggota 819	Alamat 819	1988-10-30	0810000819	anggota819@mail.test
820	Anggota 820	Alamat 820	1987-10-31	0810000820	anggota820@mail.test
821	Anggota 821	Alamat 821	1986-10-31	0810000821	anggota821@mail.test
822	Anggota 822	Alamat 822	1985-10-31	0810000822	anggota822@mail.test
823	Anggota 823	Alamat 823	1984-10-31	0810000823	anggota823@mail.test
824	Anggota 824	Alamat 824	1983-11-01	0810000824	anggota824@mail.test
825	Anggota 825	Alamat 825	1982-11-01	0810000825	anggota825@mail.test
826	Anggota 826	Alamat 826	1981-11-01	0810000826	anggota826@mail.test
827	Anggota 827	Alamat 827	1980-11-01	0810000827	anggota827@mail.test
828	Anggota 828	Alamat 828	1979-11-02	0810000828	anggota828@mail.test
829	Anggota 829	Alamat 829	1978-11-02	0810000829	anggota829@mail.test
830	Anggota 830	Alamat 830	1977-11-02	0810000830	anggota830@mail.test
831	Anggota 831	Alamat 831	1976-11-02	0810000831	anggota831@mail.test
832	Anggota 832	Alamat 832	1975-11-03	0810000832	anggota832@mail.test
833	Anggota 833	Alamat 833	1974-11-03	0810000833	anggota833@mail.test
834	Anggota 834	Alamat 834	1973-11-03	0810000834	anggota834@mail.test
835	Anggota 835	Alamat 835	1972-11-03	0810000835	anggota835@mail.test
836	Anggota 836	Alamat 836	1971-11-04	0810000836	anggota836@mail.test
837	Anggota 837	Alamat 837	1970-11-04	0810000837	anggota837@mail.test
838	Anggota 838	Alamat 838	1969-11-04	0810000838	anggota838@mail.test
839	Anggota 839	Alamat 839	1968-11-04	0810000839	anggota839@mail.test
840	Anggota 840	Alamat 840	1967-11-05	0810000840	anggota840@mail.test
841	Anggota 841	Alamat 841	1966-11-05	0810000841	anggota841@mail.test
842	Anggota 842	Alamat 842	1965-11-05	0810000842	anggota842@mail.test
843	Anggota 843	Alamat 843	1964-11-05	0810000843	anggota843@mail.test
844	Anggota 844	Alamat 844	1963-11-06	0810000844	anggota844@mail.test
845	Anggota 845	Alamat 845	1962-11-06	0810000845	anggota845@mail.test
846	Anggota 846	Alamat 846	1961-11-06	0810000846	anggota846@mail.test
847	Anggota 847	Alamat 847	1960-11-06	0810000847	anggota847@mail.test
848	Anggota 848	Alamat 848	1959-11-07	0810000848	anggota848@mail.test
849	Anggota 849	Alamat 849	1958-11-07	0810000849	anggota849@mail.test
850	Anggota 850	Alamat 850	2007-10-26	0810000850	anggota850@mail.test
851	Anggota 851	Alamat 851	2006-10-26	0810000851	anggota851@mail.test
852	Anggota 852	Alamat 852	2005-10-26	0810000852	anggota852@mail.test
853	Anggota 853	Alamat 853	2004-10-26	0810000853	anggota853@mail.test
854	Anggota 854	Alamat 854	2003-10-27	0810000854	anggota854@mail.test
855	Anggota 855	Alamat 855	2002-10-27	0810000855	anggota855@mail.test
856	Anggota 856	Alamat 856	2001-10-27	0810000856	anggota856@mail.test
857	Anggota 857	Alamat 857	2000-10-27	0810000857	anggota857@mail.test
858	Anggota 858	Alamat 858	1999-10-28	0810000858	anggota858@mail.test
859	Anggota 859	Alamat 859	1998-10-28	0810000859	anggota859@mail.test
860	Anggota 860	Alamat 860	1997-10-28	0810000860	anggota860@mail.test
861	Anggota 861	Alamat 861	1996-10-28	0810000861	anggota861@mail.test
862	Anggota 862	Alamat 862	1995-10-29	0810000862	anggota862@mail.test
863	Anggota 863	Alamat 863	1994-10-29	0810000863	anggota863@mail.test
864	Anggota 864	Alamat 864	1993-10-29	0810000864	anggota864@mail.test
865	Anggota 865	Alamat 865	1992-10-29	0810000865	anggota865@mail.test
866	Anggota 866	Alamat 866	1991-10-30	0810000866	anggota866@mail.test
867	Anggota 867	Alamat 867	1990-10-30	0810000867	anggota867@mail.test
868	Anggota 868	Alamat 868	1989-10-30	0810000868	anggota868@mail.test
869	Anggota 869	Alamat 869	1988-10-30	0810000869	anggota869@mail.test
870	Anggota 870	Alamat 870	1987-10-31	0810000870	anggota870@mail.test
871	Anggota 871	Alamat 871	1986-10-31	0810000871	anggota871@mail.test
872	Anggota 872	Alamat 872	1985-10-31	0810000872	anggota872@mail.test
873	Anggota 873	Alamat 873	1984-10-31	0810000873	anggota873@mail.test
874	Anggota 874	Alamat 874	1983-11-01	0810000874	anggota874@mail.test
875	Anggota 875	Alamat 875	1982-11-01	0810000875	anggota875@mail.test
876	Anggota 876	Alamat 876	1981-11-01	0810000876	anggota876@mail.test
877	Anggota 877	Alamat 877	1980-11-01	0810000877	anggota877@mail.test
878	Anggota 878	Alamat 878	1979-11-02	0810000878	anggota878@mail.test
879	Anggota 879	Alamat 879	1978-11-02	0810000879	anggota879@mail.test
880	Anggota 880	Alamat 880	1977-11-02	0810000880	anggota880@mail.test
881	Anggota 881	Alamat 881	1976-11-02	0810000881	anggota881@mail.test
882	Anggota 882	Alamat 882	1975-11-03	0810000882	anggota882@mail.test
883	Anggota 883	Alamat 883	1974-11-03	0810000883	anggota883@mail.test
884	Anggota 884	Alamat 884	1973-11-03	0810000884	anggota884@mail.test
885	Anggota 885	Alamat 885	1972-11-03	0810000885	anggota885@mail.test
886	Anggota 886	Alamat 886	1971-11-04	0810000886	anggota886@mail.test
887	Anggota 887	Alamat 887	1970-11-04	0810000887	anggota887@mail.test
888	Anggota 888	Alamat 888	1969-11-04	0810000888	anggota888@mail.test
889	Anggota 889	Alamat 889	1968-11-04	0810000889	anggota889@mail.test
890	Anggota 890	Alamat 890	1967-11-05	0810000890	anggota890@mail.test
891	Anggota 891	Alamat 891	1966-11-05	0810000891	anggota891@mail.test
892	Anggota 892	Alamat 892	1965-11-05	0810000892	anggota892@mail.test
893	Anggota 893	Alamat 893	1964-11-05	0810000893	anggota893@mail.test
894	Anggota 894	Alamat 894	1963-11-06	0810000894	anggota894@mail.test
895	Anggota 895	Alamat 895	1962-11-06	0810000895	anggota895@mail.test
896	Anggota 896	Alamat 896	1961-11-06	0810000896	anggota896@mail.test
897	Anggota 897	Alamat 897	1960-11-06	0810000897	anggota897@mail.test
898	Anggota 898	Alamat 898	1959-11-07	0810000898	anggota898@mail.test
899	Anggota 899	Alamat 899	1958-11-07	0810000899	anggota899@mail.test
900	Anggota 900	Alamat 900	2007-10-26	0810000900	anggota900@mail.test
901	Anggota 901	Alamat 901	2006-10-26	0810000901	anggota901@mail.test
902	Anggota 902	Alamat 902	2005-10-26	0810000902	anggota902@mail.test
903	Anggota 903	Alamat 903	2004-10-26	0810000903	anggota903@mail.test
904	Anggota 904	Alamat 904	2003-10-27	0810000904	anggota904@mail.test
905	Anggota 905	Alamat 905	2002-10-27	0810000905	anggota905@mail.test
906	Anggota 906	Alamat 906	2001-10-27	0810000906	anggota906@mail.test
907	Anggota 907	Alamat 907	2000-10-27	0810000907	anggota907@mail.test
908	Anggota 908	Alamat 908	1999-10-28	0810000908	anggota908@mail.test
909	Anggota 909	Alamat 909	1998-10-28	0810000909	anggota909@mail.test
910	Anggota 910	Alamat 910	1997-10-28	0810000910	anggota910@mail.test
911	Anggota 911	Alamat 911	1996-10-28	0810000911	anggota911@mail.test
912	Anggota 912	Alamat 912	1995-10-29	0810000912	anggota912@mail.test
913	Anggota 913	Alamat 913	1994-10-29	0810000913	anggota913@mail.test
914	Anggota 914	Alamat 914	1993-10-29	0810000914	anggota914@mail.test
915	Anggota 915	Alamat 915	1992-10-29	0810000915	anggota915@mail.test
916	Anggota 916	Alamat 916	1991-10-30	0810000916	anggota916@mail.test
917	Anggota 917	Alamat 917	1990-10-30	0810000917	anggota917@mail.test
918	Anggota 918	Alamat 918	1989-10-30	0810000918	anggota918@mail.test
919	Anggota 919	Alamat 919	1988-10-30	0810000919	anggota919@mail.test
920	Anggota 920	Alamat 920	1987-10-31	0810000920	anggota920@mail.test
921	Anggota 921	Alamat 921	1986-10-31	0810000921	anggota921@mail.test
922	Anggota 922	Alamat 922	1985-10-31	0810000922	anggota922@mail.test
923	Anggota 923	Alamat 923	1984-10-31	0810000923	anggota923@mail.test
924	Anggota 924	Alamat 924	1983-11-01	0810000924	anggota924@mail.test
925	Anggota 925	Alamat 925	1982-11-01	0810000925	anggota925@mail.test
926	Anggota 926	Alamat 926	1981-11-01	0810000926	anggota926@mail.test
927	Anggota 927	Alamat 927	1980-11-01	0810000927	anggota927@mail.test
928	Anggota 928	Alamat 928	1979-11-02	0810000928	anggota928@mail.test
929	Anggota 929	Alamat 929	1978-11-02	0810000929	anggota929@mail.test
930	Anggota 930	Alamat 930	1977-11-02	0810000930	anggota930@mail.test
931	Anggota 931	Alamat 931	1976-11-02	0810000931	anggota931@mail.test
932	Anggota 932	Alamat 932	1975-11-03	0810000932	anggota932@mail.test
933	Anggota 933	Alamat 933	1974-11-03	0810000933	anggota933@mail.test
934	Anggota 934	Alamat 934	1973-11-03	0810000934	anggota934@mail.test
935	Anggota 935	Alamat 935	1972-11-03	0810000935	anggota935@mail.test
936	Anggota 936	Alamat 936	1971-11-04	0810000936	anggota936@mail.test
937	Anggota 937	Alamat 937	1970-11-04	0810000937	anggota937@mail.test
938	Anggota 938	Alamat 938	1969-11-04	0810000938	anggota938@mail.test
939	Anggota 939	Alamat 939	1968-11-04	0810000939	anggota939@mail.test
940	Anggota 940	Alamat 940	1967-11-05	0810000940	anggota940@mail.test
941	Anggota 941	Alamat 941	1966-11-05	0810000941	anggota941@mail.test
942	Anggota 942	Alamat 942	1965-11-05	0810000942	anggota942@mail.test
943	Anggota 943	Alamat 943	1964-11-05	0810000943	anggota943@mail.test
944	Anggota 944	Alamat 944	1963-11-06	0810000944	anggota944@mail.test
945	Anggota 945	Alamat 945	1962-11-06	0810000945	anggota945@mail.test
946	Anggota 946	Alamat 946	1961-11-06	0810000946	anggota946@mail.test
947	Anggota 947	Alamat 947	1960-11-06	0810000947	anggota947@mail.test
948	Anggota 948	Alamat 948	1959-11-07	0810000948	anggota948@mail.test
949	Anggota 949	Alamat 949	1958-11-07	0810000949	anggota949@mail.test
950	Anggota 950	Alamat 950	2007-10-26	0810000950	anggota950@mail.test
951	Anggota 951	Alamat 951	2006-10-26	0810000951	anggota951@mail.test
952	Anggota 952	Alamat 952	2005-10-26	0810000952	anggota952@mail.test
953	Anggota 953	Alamat 953	2004-10-26	0810000953	anggota953@mail.test
954	Anggota 954	Alamat 954	2003-10-27	0810000954	anggota954@mail.test
955	Anggota 955	Alamat 955	2002-10-27	0810000955	anggota955@mail.test
956	Anggota 956	Alamat 956	2001-10-27	0810000956	anggota956@mail.test
957	Anggota 957	Alamat 957	2000-10-27	0810000957	anggota957@mail.test
958	Anggota 958	Alamat 958	1999-10-28	0810000958	anggota958@mail.test
959	Anggota 959	Alamat 959	1998-10-28	0810000959	anggota959@mail.test
960	Anggota 960	Alamat 960	1997-10-28	0810000960	anggota960@mail.test
961	Anggota 961	Alamat 961	1996-10-28	0810000961	anggota961@mail.test
962	Anggota 962	Alamat 962	1995-10-29	0810000962	anggota962@mail.test
963	Anggota 963	Alamat 963	1994-10-29	0810000963	anggota963@mail.test
964	Anggota 964	Alamat 964	1993-10-29	0810000964	anggota964@mail.test
965	Anggota 965	Alamat 965	1992-10-29	0810000965	anggota965@mail.test
966	Anggota 966	Alamat 966	1991-10-30	0810000966	anggota966@mail.test
967	Anggota 967	Alamat 967	1990-10-30	0810000967	anggota967@mail.test
968	Anggota 968	Alamat 968	1989-10-30	0810000968	anggota968@mail.test
969	Anggota 969	Alamat 969	1988-10-30	0810000969	anggota969@mail.test
970	Anggota 970	Alamat 970	1987-10-31	0810000970	anggota970@mail.test
971	Anggota 971	Alamat 971	1986-10-31	0810000971	anggota971@mail.test
972	Anggota 972	Alamat 972	1985-10-31	0810000972	anggota972@mail.test
973	Anggota 973	Alamat 973	1984-10-31	0810000973	anggota973@mail.test
974	Anggota 974	Alamat 974	1983-11-01	0810000974	anggota974@mail.test
975	Anggota 975	Alamat 975	1982-11-01	0810000975	anggota975@mail.test
976	Anggota 976	Alamat 976	1981-11-01	0810000976	anggota976@mail.test
977	Anggota 977	Alamat 977	1980-11-01	0810000977	anggota977@mail.test
978	Anggota 978	Alamat 978	1979-11-02	0810000978	anggota978@mail.test
979	Anggota 979	Alamat 979	1978-11-02	0810000979	anggota979@mail.test
980	Anggota 980	Alamat 980	1977-11-02	0810000980	anggota980@mail.test
981	Anggota 981	Alamat 981	1976-11-02	0810000981	anggota981@mail.test
982	Anggota 982	Alamat 982	1975-11-03	0810000982	anggota982@mail.test
983	Anggota 983	Alamat 983	1974-11-03	0810000983	anggota983@mail.test
984	Anggota 984	Alamat 984	1973-11-03	0810000984	anggota984@mail.test
985	Anggota 985	Alamat 985	1972-11-03	0810000985	anggota985@mail.test
986	Anggota 986	Alamat 986	1971-11-04	0810000986	anggota986@mail.test
987	Anggota 987	Alamat 987	1970-11-04	0810000987	anggota987@mail.test
988	Anggota 988	Alamat 988	1969-11-04	0810000988	anggota988@mail.test
989	Anggota 989	Alamat 989	1968-11-04	0810000989	anggota989@mail.test
990	Anggota 990	Alamat 990	1967-11-05	0810000990	anggota990@mail.test
991	Anggota 991	Alamat 991	1966-11-05	0810000991	anggota991@mail.test
992	Anggota 992	Alamat 992	1965-11-05	0810000992	anggota992@mail.test
993	Anggota 993	Alamat 993	1964-11-05	0810000993	anggota993@mail.test
994	Anggota 994	Alamat 994	1963-11-06	0810000994	anggota994@mail.test
995	Anggota 995	Alamat 995	1962-11-06	0810000995	anggota995@mail.test
996	Anggota 996	Alamat 996	1961-11-06	0810000996	anggota996@mail.test
997	Anggota 997	Alamat 997	1960-11-06	0810000997	anggota997@mail.test
998	Anggota 998	Alamat 998	1959-11-07	0810000998	anggota998@mail.test
999	Anggota 999	Alamat 999	1958-11-07	0810000999	anggota999@mail.test
1000	Anggota 1000	Alamat 1000	2007-10-26	0810001000	anggota1000@mail.test
1001	Anggota 1001	Alamat 1001	2006-10-26	0810001001	anggota1001@mail.test
1002	Anggota 1002	Alamat 1002	2005-10-26	0810001002	anggota1002@mail.test
1003	Anggota 1003	Alamat 1003	2004-10-26	0810001003	anggota1003@mail.test
1004	Anggota 1004	Alamat 1004	2003-10-27	0810001004	anggota1004@mail.test
1005	Anggota 1005	Alamat 1005	2002-10-27	0810001005	anggota1005@mail.test
1006	Anggota 1006	Alamat 1006	2001-10-27	0810001006	anggota1006@mail.test
1007	Anggota 1007	Alamat 1007	2000-10-27	0810001007	anggota1007@mail.test
1008	Anggota 1008	Alamat 1008	1999-10-28	0810001008	anggota1008@mail.test
1009	Anggota 1009	Alamat 1009	1998-10-28	0810001009	anggota1009@mail.test
1010	Anggota 1010	Alamat 1010	1997-10-28	0810001010	anggota1010@mail.test
1011	Anggota 1011	Alamat 1011	1996-10-28	0810001011	anggota1011@mail.test
1012	Anggota 1012	Alamat 1012	1995-10-29	0810001012	anggota1012@mail.test
1013	Anggota 1013	Alamat 1013	1994-10-29	0810001013	anggota1013@mail.test
1014	Anggota 1014	Alamat 1014	1993-10-29	0810001014	anggota1014@mail.test
1015	Anggota 1015	Alamat 1015	1992-10-29	0810001015	anggota1015@mail.test
1016	Anggota 1016	Alamat 1016	1991-10-30	0810001016	anggota1016@mail.test
1017	Anggota 1017	Alamat 1017	1990-10-30	0810001017	anggota1017@mail.test
1018	Anggota 1018	Alamat 1018	1989-10-30	0810001018	anggota1018@mail.test
1019	Anggota 1019	Alamat 1019	1988-10-30	0810001019	anggota1019@mail.test
1020	Anggota 1020	Alamat 1020	1987-10-31	0810001020	anggota1020@mail.test
1021	Anggota 1021	Alamat 1021	1986-10-31	0810001021	anggota1021@mail.test
1022	Anggota 1022	Alamat 1022	1985-10-31	0810001022	anggota1022@mail.test
1023	Anggota 1023	Alamat 1023	1984-10-31	0810001023	anggota1023@mail.test
1024	Anggota 1024	Alamat 1024	1983-11-01	0810001024	anggota1024@mail.test
1025	Anggota 1025	Alamat 1025	1982-11-01	0810001025	anggota1025@mail.test
1026	Anggota 1026	Alamat 1026	1981-11-01	0810001026	anggota1026@mail.test
1027	Anggota 1027	Alamat 1027	1980-11-01	0810001027	anggota1027@mail.test
1028	Anggota 1028	Alamat 1028	1979-11-02	0810001028	anggota1028@mail.test
1029	Anggota 1029	Alamat 1029	1978-11-02	0810001029	anggota1029@mail.test
1030	Anggota 1030	Alamat 1030	1977-11-02	0810001030	anggota1030@mail.test
1031	Anggota 1031	Alamat 1031	1976-11-02	0810001031	anggota1031@mail.test
1032	Anggota 1032	Alamat 1032	1975-11-03	0810001032	anggota1032@mail.test
1033	Anggota 1033	Alamat 1033	1974-11-03	0810001033	anggota1033@mail.test
1034	Anggota 1034	Alamat 1034	1973-11-03	0810001034	anggota1034@mail.test
1035	Anggota 1035	Alamat 1035	1972-11-03	0810001035	anggota1035@mail.test
1036	Anggota 1036	Alamat 1036	1971-11-04	0810001036	anggota1036@mail.test
1037	Anggota 1037	Alamat 1037	1970-11-04	0810001037	anggota1037@mail.test
1038	Anggota 1038	Alamat 1038	1969-11-04	0810001038	anggota1038@mail.test
1039	Anggota 1039	Alamat 1039	1968-11-04	0810001039	anggota1039@mail.test
1040	Anggota 1040	Alamat 1040	1967-11-05	0810001040	anggota1040@mail.test
1041	Anggota 1041	Alamat 1041	1966-11-05	0810001041	anggota1041@mail.test
1042	Anggota 1042	Alamat 1042	1965-11-05	0810001042	anggota1042@mail.test
1043	Anggota 1043	Alamat 1043	1964-11-05	0810001043	anggota1043@mail.test
1044	Anggota 1044	Alamat 1044	1963-11-06	0810001044	anggota1044@mail.test
1045	Anggota 1045	Alamat 1045	1962-11-06	0810001045	anggota1045@mail.test
1046	Anggota 1046	Alamat 1046	1961-11-06	0810001046	anggota1046@mail.test
1047	Anggota 1047	Alamat 1047	1960-11-06	0810001047	anggota1047@mail.test
1048	Anggota 1048	Alamat 1048	1959-11-07	0810001048	anggota1048@mail.test
1049	Anggota 1049	Alamat 1049	1958-11-07	0810001049	anggota1049@mail.test
1050	Anggota 1050	Alamat 1050	2007-10-26	0810001050	anggota1050@mail.test
1051	Anggota 1051	Alamat 1051	2006-10-26	0810001051	anggota1051@mail.test
1052	Anggota 1052	Alamat 1052	2005-10-26	0810001052	anggota1052@mail.test
1053	Anggota 1053	Alamat 1053	2004-10-26	0810001053	anggota1053@mail.test
1054	Anggota 1054	Alamat 1054	2003-10-27	0810001054	anggota1054@mail.test
1055	Anggota 1055	Alamat 1055	2002-10-27	0810001055	anggota1055@mail.test
1056	Anggota 1056	Alamat 1056	2001-10-27	0810001056	anggota1056@mail.test
1057	Anggota 1057	Alamat 1057	2000-10-27	0810001057	anggota1057@mail.test
1058	Anggota 1058	Alamat 1058	1999-10-28	0810001058	anggota1058@mail.test
1059	Anggota 1059	Alamat 1059	1998-10-28	0810001059	anggota1059@mail.test
1060	Anggota 1060	Alamat 1060	1997-10-28	0810001060	anggota1060@mail.test
1061	Anggota 1061	Alamat 1061	1996-10-28	0810001061	anggota1061@mail.test
1062	Anggota 1062	Alamat 1062	1995-10-29	0810001062	anggota1062@mail.test
1063	Anggota 1063	Alamat 1063	1994-10-29	0810001063	anggota1063@mail.test
1064	Anggota 1064	Alamat 1064	1993-10-29	0810001064	anggota1064@mail.test
1065	Anggota 1065	Alamat 1065	1992-10-29	0810001065	anggota1065@mail.test
1066	Anggota 1066	Alamat 1066	1991-10-30	0810001066	anggota1066@mail.test
1067	Anggota 1067	Alamat 1067	1990-10-30	0810001067	anggota1067@mail.test
1068	Anggota 1068	Alamat 1068	1989-10-30	0810001068	anggota1068@mail.test
1069	Anggota 1069	Alamat 1069	1988-10-30	0810001069	anggota1069@mail.test
1070	Anggota 1070	Alamat 1070	1987-10-31	0810001070	anggota1070@mail.test
1071	Anggota 1071	Alamat 1071	1986-10-31	0810001071	anggota1071@mail.test
1072	Anggota 1072	Alamat 1072	1985-10-31	0810001072	anggota1072@mail.test
1073	Anggota 1073	Alamat 1073	1984-10-31	0810001073	anggota1073@mail.test
1074	Anggota 1074	Alamat 1074	1983-11-01	0810001074	anggota1074@mail.test
1075	Anggota 1075	Alamat 1075	1982-11-01	0810001075	anggota1075@mail.test
1076	Anggota 1076	Alamat 1076	1981-11-01	0810001076	anggota1076@mail.test
1077	Anggota 1077	Alamat 1077	1980-11-01	0810001077	anggota1077@mail.test
1078	Anggota 1078	Alamat 1078	1979-11-02	0810001078	anggota1078@mail.test
1079	Anggota 1079	Alamat 1079	1978-11-02	0810001079	anggota1079@mail.test
1080	Anggota 1080	Alamat 1080	1977-11-02	0810001080	anggota1080@mail.test
1081	Anggota 1081	Alamat 1081	1976-11-02	0810001081	anggota1081@mail.test
1082	Anggota 1082	Alamat 1082	1975-11-03	0810001082	anggota1082@mail.test
1083	Anggota 1083	Alamat 1083	1974-11-03	0810001083	anggota1083@mail.test
1084	Anggota 1084	Alamat 1084	1973-11-03	0810001084	anggota1084@mail.test
1085	Anggota 1085	Alamat 1085	1972-11-03	0810001085	anggota1085@mail.test
1086	Anggota 1086	Alamat 1086	1971-11-04	0810001086	anggota1086@mail.test
1087	Anggota 1087	Alamat 1087	1970-11-04	0810001087	anggota1087@mail.test
1088	Anggota 1088	Alamat 1088	1969-11-04	0810001088	anggota1088@mail.test
1089	Anggota 1089	Alamat 1089	1968-11-04	0810001089	anggota1089@mail.test
1090	Anggota 1090	Alamat 1090	1967-11-05	0810001090	anggota1090@mail.test
1091	Anggota 1091	Alamat 1091	1966-11-05	0810001091	anggota1091@mail.test
1092	Anggota 1092	Alamat 1092	1965-11-05	0810001092	anggota1092@mail.test
1093	Anggota 1093	Alamat 1093	1964-11-05	0810001093	anggota1093@mail.test
1094	Anggota 1094	Alamat 1094	1963-11-06	0810001094	anggota1094@mail.test
1095	Anggota 1095	Alamat 1095	1962-11-06	0810001095	anggota1095@mail.test
1096	Anggota 1096	Alamat 1096	1961-11-06	0810001096	anggota1096@mail.test
1097	Anggota 1097	Alamat 1097	1960-11-06	0810001097	anggota1097@mail.test
1098	Anggota 1098	Alamat 1098	1959-11-07	0810001098	anggota1098@mail.test
1099	Anggota 1099	Alamat 1099	1958-11-07	0810001099	anggota1099@mail.test
1100	Anggota 1100	Alamat 1100	2007-10-26	0810001100	anggota1100@mail.test
1101	Anggota 1101	Alamat 1101	2006-10-26	0810001101	anggota1101@mail.test
1102	Anggota 1102	Alamat 1102	2005-10-26	0810001102	anggota1102@mail.test
1103	Anggota 1103	Alamat 1103	2004-10-26	0810001103	anggota1103@mail.test
1104	Anggota 1104	Alamat 1104	2003-10-27	0810001104	anggota1104@mail.test
1105	Anggota 1105	Alamat 1105	2002-10-27	0810001105	anggota1105@mail.test
1106	Anggota 1106	Alamat 1106	2001-10-27	0810001106	anggota1106@mail.test
1107	Anggota 1107	Alamat 1107	2000-10-27	0810001107	anggota1107@mail.test
1108	Anggota 1108	Alamat 1108	1999-10-28	0810001108	anggota1108@mail.test
1109	Anggota 1109	Alamat 1109	1998-10-28	0810001109	anggota1109@mail.test
1110	Anggota 1110	Alamat 1110	1997-10-28	0810001110	anggota1110@mail.test
1111	Anggota 1111	Alamat 1111	1996-10-28	0810001111	anggota1111@mail.test
1112	Anggota 1112	Alamat 1112	1995-10-29	0810001112	anggota1112@mail.test
1113	Anggota 1113	Alamat 1113	1994-10-29	0810001113	anggota1113@mail.test
1114	Anggota 1114	Alamat 1114	1993-10-29	0810001114	anggota1114@mail.test
1115	Anggota 1115	Alamat 1115	1992-10-29	0810001115	anggota1115@mail.test
1116	Anggota 1116	Alamat 1116	1991-10-30	0810001116	anggota1116@mail.test
1117	Anggota 1117	Alamat 1117	1990-10-30	0810001117	anggota1117@mail.test
1118	Anggota 1118	Alamat 1118	1989-10-30	0810001118	anggota1118@mail.test
1119	Anggota 1119	Alamat 1119	1988-10-30	0810001119	anggota1119@mail.test
1120	Anggota 1120	Alamat 1120	1987-10-31	0810001120	anggota1120@mail.test
1121	Anggota 1121	Alamat 1121	1986-10-31	0810001121	anggota1121@mail.test
1122	Anggota 1122	Alamat 1122	1985-10-31	0810001122	anggota1122@mail.test
1123	Anggota 1123	Alamat 1123	1984-10-31	0810001123	anggota1123@mail.test
1124	Anggota 1124	Alamat 1124	1983-11-01	0810001124	anggota1124@mail.test
1125	Anggota 1125	Alamat 1125	1982-11-01	0810001125	anggota1125@mail.test
1126	Anggota 1126	Alamat 1126	1981-11-01	0810001126	anggota1126@mail.test
1127	Anggota 1127	Alamat 1127	1980-11-01	0810001127	anggota1127@mail.test
1128	Anggota 1128	Alamat 1128	1979-11-02	0810001128	anggota1128@mail.test
1129	Anggota 1129	Alamat 1129	1978-11-02	0810001129	anggota1129@mail.test
1130	Anggota 1130	Alamat 1130	1977-11-02	0810001130	anggota1130@mail.test
1131	Anggota 1131	Alamat 1131	1976-11-02	0810001131	anggota1131@mail.test
1132	Anggota 1132	Alamat 1132	1975-11-03	0810001132	anggota1132@mail.test
1133	Anggota 1133	Alamat 1133	1974-11-03	0810001133	anggota1133@mail.test
1134	Anggota 1134	Alamat 1134	1973-11-03	0810001134	anggota1134@mail.test
1135	Anggota 1135	Alamat 1135	1972-11-03	0810001135	anggota1135@mail.test
1136	Anggota 1136	Alamat 1136	1971-11-04	0810001136	anggota1136@mail.test
1137	Anggota 1137	Alamat 1137	1970-11-04	0810001137	anggota1137@mail.test
1138	Anggota 1138	Alamat 1138	1969-11-04	0810001138	anggota1138@mail.test
1139	Anggota 1139	Alamat 1139	1968-11-04	0810001139	anggota1139@mail.test
1140	Anggota 1140	Alamat 1140	1967-11-05	0810001140	anggota1140@mail.test
1141	Anggota 1141	Alamat 1141	1966-11-05	0810001141	anggota1141@mail.test
1142	Anggota 1142	Alamat 1142	1965-11-05	0810001142	anggota1142@mail.test
1143	Anggota 1143	Alamat 1143	1964-11-05	0810001143	anggota1143@mail.test
1144	Anggota 1144	Alamat 1144	1963-11-06	0810001144	anggota1144@mail.test
1145	Anggota 1145	Alamat 1145	1962-11-06	0810001145	anggota1145@mail.test
1146	Anggota 1146	Alamat 1146	1961-11-06	0810001146	anggota1146@mail.test
1147	Anggota 1147	Alamat 1147	1960-11-06	0810001147	anggota1147@mail.test
1148	Anggota 1148	Alamat 1148	1959-11-07	0810001148	anggota1148@mail.test
1149	Anggota 1149	Alamat 1149	1958-11-07	0810001149	anggota1149@mail.test
1150	Anggota 1150	Alamat 1150	2007-10-26	0810001150	anggota1150@mail.test
1151	Anggota 1151	Alamat 1151	2006-10-26	0810001151	anggota1151@mail.test
1152	Anggota 1152	Alamat 1152	2005-10-26	0810001152	anggota1152@mail.test
1153	Anggota 1153	Alamat 1153	2004-10-26	0810001153	anggota1153@mail.test
1154	Anggota 1154	Alamat 1154	2003-10-27	0810001154	anggota1154@mail.test
1155	Anggota 1155	Alamat 1155	2002-10-27	0810001155	anggota1155@mail.test
1156	Anggota 1156	Alamat 1156	2001-10-27	0810001156	anggota1156@mail.test
1157	Anggota 1157	Alamat 1157	2000-10-27	0810001157	anggota1157@mail.test
1158	Anggota 1158	Alamat 1158	1999-10-28	0810001158	anggota1158@mail.test
1159	Anggota 1159	Alamat 1159	1998-10-28	0810001159	anggota1159@mail.test
1160	Anggota 1160	Alamat 1160	1997-10-28	0810001160	anggota1160@mail.test
1161	Anggota 1161	Alamat 1161	1996-10-28	0810001161	anggota1161@mail.test
1162	Anggota 1162	Alamat 1162	1995-10-29	0810001162	anggota1162@mail.test
1163	Anggota 1163	Alamat 1163	1994-10-29	0810001163	anggota1163@mail.test
1164	Anggota 1164	Alamat 1164	1993-10-29	0810001164	anggota1164@mail.test
1165	Anggota 1165	Alamat 1165	1992-10-29	0810001165	anggota1165@mail.test
1166	Anggota 1166	Alamat 1166	1991-10-30	0810001166	anggota1166@mail.test
1167	Anggota 1167	Alamat 1167	1990-10-30	0810001167	anggota1167@mail.test
1168	Anggota 1168	Alamat 1168	1989-10-30	0810001168	anggota1168@mail.test
1169	Anggota 1169	Alamat 1169	1988-10-30	0810001169	anggota1169@mail.test
1170	Anggota 1170	Alamat 1170	1987-10-31	0810001170	anggota1170@mail.test
1171	Anggota 1171	Alamat 1171	1986-10-31	0810001171	anggota1171@mail.test
1172	Anggota 1172	Alamat 1172	1985-10-31	0810001172	anggota1172@mail.test
1173	Anggota 1173	Alamat 1173	1984-10-31	0810001173	anggota1173@mail.test
1174	Anggota 1174	Alamat 1174	1983-11-01	0810001174	anggota1174@mail.test
1175	Anggota 1175	Alamat 1175	1982-11-01	0810001175	anggota1175@mail.test
1176	Anggota 1176	Alamat 1176	1981-11-01	0810001176	anggota1176@mail.test
1177	Anggota 1177	Alamat 1177	1980-11-01	0810001177	anggota1177@mail.test
1178	Anggota 1178	Alamat 1178	1979-11-02	0810001178	anggota1178@mail.test
1179	Anggota 1179	Alamat 1179	1978-11-02	0810001179	anggota1179@mail.test
1180	Anggota 1180	Alamat 1180	1977-11-02	0810001180	anggota1180@mail.test
1181	Anggota 1181	Alamat 1181	1976-11-02	0810001181	anggota1181@mail.test
1182	Anggota 1182	Alamat 1182	1975-11-03	0810001182	anggota1182@mail.test
1183	Anggota 1183	Alamat 1183	1974-11-03	0810001183	anggota1183@mail.test
1184	Anggota 1184	Alamat 1184	1973-11-03	0810001184	anggota1184@mail.test
1185	Anggota 1185	Alamat 1185	1972-11-03	0810001185	anggota1185@mail.test
1186	Anggota 1186	Alamat 1186	1971-11-04	0810001186	anggota1186@mail.test
1187	Anggota 1187	Alamat 1187	1970-11-04	0810001187	anggota1187@mail.test
1188	Anggota 1188	Alamat 1188	1969-11-04	0810001188	anggota1188@mail.test
1189	Anggota 1189	Alamat 1189	1968-11-04	0810001189	anggota1189@mail.test
1190	Anggota 1190	Alamat 1190	1967-11-05	0810001190	anggota1190@mail.test
1191	Anggota 1191	Alamat 1191	1966-11-05	0810001191	anggota1191@mail.test
1192	Anggota 1192	Alamat 1192	1965-11-05	0810001192	anggota1192@mail.test
1193	Anggota 1193	Alamat 1193	1964-11-05	0810001193	anggota1193@mail.test
1194	Anggota 1194	Alamat 1194	1963-11-06	0810001194	anggota1194@mail.test
1195	Anggota 1195	Alamat 1195	1962-11-06	0810001195	anggota1195@mail.test
1196	Anggota 1196	Alamat 1196	1961-11-06	0810001196	anggota1196@mail.test
1197	Anggota 1197	Alamat 1197	1960-11-06	0810001197	anggota1197@mail.test
1198	Anggota 1198	Alamat 1198	1959-11-07	0810001198	anggota1198@mail.test
1199	Anggota 1199	Alamat 1199	1958-11-07	0810001199	anggota1199@mail.test
1200	Anggota 1200	Alamat 1200	2007-10-26	0810001200	anggota1200@mail.test
1201	Anggota 1201	Alamat 1201	2006-10-26	0810001201	anggota1201@mail.test
1202	Anggota 1202	Alamat 1202	2005-10-26	0810001202	anggota1202@mail.test
1203	Anggota 1203	Alamat 1203	2004-10-26	0810001203	anggota1203@mail.test
1204	Anggota 1204	Alamat 1204	2003-10-27	0810001204	anggota1204@mail.test
1205	Anggota 1205	Alamat 1205	2002-10-27	0810001205	anggota1205@mail.test
1206	Anggota 1206	Alamat 1206	2001-10-27	0810001206	anggota1206@mail.test
1207	Anggota 1207	Alamat 1207	2000-10-27	0810001207	anggota1207@mail.test
1208	Anggota 1208	Alamat 1208	1999-10-28	0810001208	anggota1208@mail.test
1209	Anggota 1209	Alamat 1209	1998-10-28	0810001209	anggota1209@mail.test
1210	Anggota 1210	Alamat 1210	1997-10-28	0810001210	anggota1210@mail.test
1211	Anggota 1211	Alamat 1211	1996-10-28	0810001211	anggota1211@mail.test
1212	Anggota 1212	Alamat 1212	1995-10-29	0810001212	anggota1212@mail.test
1213	Anggota 1213	Alamat 1213	1994-10-29	0810001213	anggota1213@mail.test
1214	Anggota 1214	Alamat 1214	1993-10-29	0810001214	anggota1214@mail.test
1215	Anggota 1215	Alamat 1215	1992-10-29	0810001215	anggota1215@mail.test
1216	Anggota 1216	Alamat 1216	1991-10-30	0810001216	anggota1216@mail.test
1217	Anggota 1217	Alamat 1217	1990-10-30	0810001217	anggota1217@mail.test
1218	Anggota 1218	Alamat 1218	1989-10-30	0810001218	anggota1218@mail.test
1219	Anggota 1219	Alamat 1219	1988-10-30	0810001219	anggota1219@mail.test
1220	Anggota 1220	Alamat 1220	1987-10-31	0810001220	anggota1220@mail.test
1221	Anggota 1221	Alamat 1221	1986-10-31	0810001221	anggota1221@mail.test
1222	Anggota 1222	Alamat 1222	1985-10-31	0810001222	anggota1222@mail.test
1223	Anggota 1223	Alamat 1223	1984-10-31	0810001223	anggota1223@mail.test
1224	Anggota 1224	Alamat 1224	1983-11-01	0810001224	anggota1224@mail.test
1225	Anggota 1225	Alamat 1225	1982-11-01	0810001225	anggota1225@mail.test
1226	Anggota 1226	Alamat 1226	1981-11-01	0810001226	anggota1226@mail.test
1227	Anggota 1227	Alamat 1227	1980-11-01	0810001227	anggota1227@mail.test
1228	Anggota 1228	Alamat 1228	1979-11-02	0810001228	anggota1228@mail.test
1229	Anggota 1229	Alamat 1229	1978-11-02	0810001229	anggota1229@mail.test
1230	Anggota 1230	Alamat 1230	1977-11-02	0810001230	anggota1230@mail.test
1231	Anggota 1231	Alamat 1231	1976-11-02	0810001231	anggota1231@mail.test
1232	Anggota 1232	Alamat 1232	1975-11-03	0810001232	anggota1232@mail.test
1233	Anggota 1233	Alamat 1233	1974-11-03	0810001233	anggota1233@mail.test
1234	Anggota 1234	Alamat 1234	1973-11-03	0810001234	anggota1234@mail.test
1235	Anggota 1235	Alamat 1235	1972-11-03	0810001235	anggota1235@mail.test
1236	Anggota 1236	Alamat 1236	1971-11-04	0810001236	anggota1236@mail.test
1237	Anggota 1237	Alamat 1237	1970-11-04	0810001237	anggota1237@mail.test
1238	Anggota 1238	Alamat 1238	1969-11-04	0810001238	anggota1238@mail.test
1239	Anggota 1239	Alamat 1239	1968-11-04	0810001239	anggota1239@mail.test
1240	Anggota 1240	Alamat 1240	1967-11-05	0810001240	anggota1240@mail.test
1241	Anggota 1241	Alamat 1241	1966-11-05	0810001241	anggota1241@mail.test
1242	Anggota 1242	Alamat 1242	1965-11-05	0810001242	anggota1242@mail.test
1243	Anggota 1243	Alamat 1243	1964-11-05	0810001243	anggota1243@mail.test
1244	Anggota 1244	Alamat 1244	1963-11-06	0810001244	anggota1244@mail.test
1245	Anggota 1245	Alamat 1245	1962-11-06	0810001245	anggota1245@mail.test
1246	Anggota 1246	Alamat 1246	1961-11-06	0810001246	anggota1246@mail.test
1247	Anggota 1247	Alamat 1247	1960-11-06	0810001247	anggota1247@mail.test
1248	Anggota 1248	Alamat 1248	1959-11-07	0810001248	anggota1248@mail.test
1249	Anggota 1249	Alamat 1249	1958-11-07	0810001249	anggota1249@mail.test
1250	Anggota 1250	Alamat 1250	2007-10-26	0810001250	anggota1250@mail.test
1251	Anggota 1251	Alamat 1251	2006-10-26	0810001251	anggota1251@mail.test
1252	Anggota 1252	Alamat 1252	2005-10-26	0810001252	anggota1252@mail.test
1253	Anggota 1253	Alamat 1253	2004-10-26	0810001253	anggota1253@mail.test
1254	Anggota 1254	Alamat 1254	2003-10-27	0810001254	anggota1254@mail.test
1255	Anggota 1255	Alamat 1255	2002-10-27	0810001255	anggota1255@mail.test
1256	Anggota 1256	Alamat 1256	2001-10-27	0810001256	anggota1256@mail.test
1257	Anggota 1257	Alamat 1257	2000-10-27	0810001257	anggota1257@mail.test
1258	Anggota 1258	Alamat 1258	1999-10-28	0810001258	anggota1258@mail.test
1259	Anggota 1259	Alamat 1259	1998-10-28	0810001259	anggota1259@mail.test
1260	Anggota 1260	Alamat 1260	1997-10-28	0810001260	anggota1260@mail.test
1261	Anggota 1261	Alamat 1261	1996-10-28	0810001261	anggota1261@mail.test
1262	Anggota 1262	Alamat 1262	1995-10-29	0810001262	anggota1262@mail.test
1263	Anggota 1263	Alamat 1263	1994-10-29	0810001263	anggota1263@mail.test
1264	Anggota 1264	Alamat 1264	1993-10-29	0810001264	anggota1264@mail.test
1265	Anggota 1265	Alamat 1265	1992-10-29	0810001265	anggota1265@mail.test
1266	Anggota 1266	Alamat 1266	1991-10-30	0810001266	anggota1266@mail.test
1267	Anggota 1267	Alamat 1267	1990-10-30	0810001267	anggota1267@mail.test
1268	Anggota 1268	Alamat 1268	1989-10-30	0810001268	anggota1268@mail.test
1269	Anggota 1269	Alamat 1269	1988-10-30	0810001269	anggota1269@mail.test
1270	Anggota 1270	Alamat 1270	1987-10-31	0810001270	anggota1270@mail.test
1271	Anggota 1271	Alamat 1271	1986-10-31	0810001271	anggota1271@mail.test
1272	Anggota 1272	Alamat 1272	1985-10-31	0810001272	anggota1272@mail.test
1273	Anggota 1273	Alamat 1273	1984-10-31	0810001273	anggota1273@mail.test
1274	Anggota 1274	Alamat 1274	1983-11-01	0810001274	anggota1274@mail.test
1275	Anggota 1275	Alamat 1275	1982-11-01	0810001275	anggota1275@mail.test
1276	Anggota 1276	Alamat 1276	1981-11-01	0810001276	anggota1276@mail.test
1277	Anggota 1277	Alamat 1277	1980-11-01	0810001277	anggota1277@mail.test
1278	Anggota 1278	Alamat 1278	1979-11-02	0810001278	anggota1278@mail.test
1279	Anggota 1279	Alamat 1279	1978-11-02	0810001279	anggota1279@mail.test
1280	Anggota 1280	Alamat 1280	1977-11-02	0810001280	anggota1280@mail.test
1281	Anggota 1281	Alamat 1281	1976-11-02	0810001281	anggota1281@mail.test
1282	Anggota 1282	Alamat 1282	1975-11-03	0810001282	anggota1282@mail.test
1283	Anggota 1283	Alamat 1283	1974-11-03	0810001283	anggota1283@mail.test
1284	Anggota 1284	Alamat 1284	1973-11-03	0810001284	anggota1284@mail.test
1285	Anggota 1285	Alamat 1285	1972-11-03	0810001285	anggota1285@mail.test
1286	Anggota 1286	Alamat 1286	1971-11-04	0810001286	anggota1286@mail.test
1287	Anggota 1287	Alamat 1287	1970-11-04	0810001287	anggota1287@mail.test
1288	Anggota 1288	Alamat 1288	1969-11-04	0810001288	anggota1288@mail.test
1289	Anggota 1289	Alamat 1289	1968-11-04	0810001289	anggota1289@mail.test
1290	Anggota 1290	Alamat 1290	1967-11-05	0810001290	anggota1290@mail.test
1291	Anggota 1291	Alamat 1291	1966-11-05	0810001291	anggota1291@mail.test
1292	Anggota 1292	Alamat 1292	1965-11-05	0810001292	anggota1292@mail.test
1293	Anggota 1293	Alamat 1293	1964-11-05	0810001293	anggota1293@mail.test
1294	Anggota 1294	Alamat 1294	1963-11-06	0810001294	anggota1294@mail.test
1295	Anggota 1295	Alamat 1295	1962-11-06	0810001295	anggota1295@mail.test
1296	Anggota 1296	Alamat 1296	1961-11-06	0810001296	anggota1296@mail.test
1297	Anggota 1297	Alamat 1297	1960-11-06	0810001297	anggota1297@mail.test
1298	Anggota 1298	Alamat 1298	1959-11-07	0810001298	anggota1298@mail.test
1299	Anggota 1299	Alamat 1299	1958-11-07	0810001299	anggota1299@mail.test
1300	Anggota 1300	Alamat 1300	2007-10-26	0810001300	anggota1300@mail.test
1301	Anggota 1301	Alamat 1301	2006-10-26	0810001301	anggota1301@mail.test
1302	Anggota 1302	Alamat 1302	2005-10-26	0810001302	anggota1302@mail.test
1303	Anggota 1303	Alamat 1303	2004-10-26	0810001303	anggota1303@mail.test
1304	Anggota 1304	Alamat 1304	2003-10-27	0810001304	anggota1304@mail.test
1305	Anggota 1305	Alamat 1305	2002-10-27	0810001305	anggota1305@mail.test
1306	Anggota 1306	Alamat 1306	2001-10-27	0810001306	anggota1306@mail.test
1307	Anggota 1307	Alamat 1307	2000-10-27	0810001307	anggota1307@mail.test
1308	Anggota 1308	Alamat 1308	1999-10-28	0810001308	anggota1308@mail.test
1309	Anggota 1309	Alamat 1309	1998-10-28	0810001309	anggota1309@mail.test
1310	Anggota 1310	Alamat 1310	1997-10-28	0810001310	anggota1310@mail.test
1311	Anggota 1311	Alamat 1311	1996-10-28	0810001311	anggota1311@mail.test
1312	Anggota 1312	Alamat 1312	1995-10-29	0810001312	anggota1312@mail.test
1313	Anggota 1313	Alamat 1313	1994-10-29	0810001313	anggota1313@mail.test
1314	Anggota 1314	Alamat 1314	1993-10-29	0810001314	anggota1314@mail.test
1315	Anggota 1315	Alamat 1315	1992-10-29	0810001315	anggota1315@mail.test
1316	Anggota 1316	Alamat 1316	1991-10-30	0810001316	anggota1316@mail.test
1317	Anggota 1317	Alamat 1317	1990-10-30	0810001317	anggota1317@mail.test
1318	Anggota 1318	Alamat 1318	1989-10-30	0810001318	anggota1318@mail.test
1319	Anggota 1319	Alamat 1319	1988-10-30	0810001319	anggota1319@mail.test
1320	Anggota 1320	Alamat 1320	1987-10-31	0810001320	anggota1320@mail.test
1321	Anggota 1321	Alamat 1321	1986-10-31	0810001321	anggota1321@mail.test
1322	Anggota 1322	Alamat 1322	1985-10-31	0810001322	anggota1322@mail.test
1323	Anggota 1323	Alamat 1323	1984-10-31	0810001323	anggota1323@mail.test
1324	Anggota 1324	Alamat 1324	1983-11-01	0810001324	anggota1324@mail.test
1325	Anggota 1325	Alamat 1325	1982-11-01	0810001325	anggota1325@mail.test
1326	Anggota 1326	Alamat 1326	1981-11-01	0810001326	anggota1326@mail.test
1327	Anggota 1327	Alamat 1327	1980-11-01	0810001327	anggota1327@mail.test
1328	Anggota 1328	Alamat 1328	1979-11-02	0810001328	anggota1328@mail.test
1329	Anggota 1329	Alamat 1329	1978-11-02	0810001329	anggota1329@mail.test
1330	Anggota 1330	Alamat 1330	1977-11-02	0810001330	anggota1330@mail.test
1331	Anggota 1331	Alamat 1331	1976-11-02	0810001331	anggota1331@mail.test
1332	Anggota 1332	Alamat 1332	1975-11-03	0810001332	anggota1332@mail.test
1333	Anggota 1333	Alamat 1333	1974-11-03	0810001333	anggota1333@mail.test
1334	Anggota 1334	Alamat 1334	1973-11-03	0810001334	anggota1334@mail.test
1335	Anggota 1335	Alamat 1335	1972-11-03	0810001335	anggota1335@mail.test
1336	Anggota 1336	Alamat 1336	1971-11-04	0810001336	anggota1336@mail.test
1337	Anggota 1337	Alamat 1337	1970-11-04	0810001337	anggota1337@mail.test
1338	Anggota 1338	Alamat 1338	1969-11-04	0810001338	anggota1338@mail.test
1339	Anggota 1339	Alamat 1339	1968-11-04	0810001339	anggota1339@mail.test
1340	Anggota 1340	Alamat 1340	1967-11-05	0810001340	anggota1340@mail.test
1341	Anggota 1341	Alamat 1341	1966-11-05	0810001341	anggota1341@mail.test
1342	Anggota 1342	Alamat 1342	1965-11-05	0810001342	anggota1342@mail.test
1343	Anggota 1343	Alamat 1343	1964-11-05	0810001343	anggota1343@mail.test
1344	Anggota 1344	Alamat 1344	1963-11-06	0810001344	anggota1344@mail.test
1345	Anggota 1345	Alamat 1345	1962-11-06	0810001345	anggota1345@mail.test
1346	Anggota 1346	Alamat 1346	1961-11-06	0810001346	anggota1346@mail.test
1347	Anggota 1347	Alamat 1347	1960-11-06	0810001347	anggota1347@mail.test
1348	Anggota 1348	Alamat 1348	1959-11-07	0810001348	anggota1348@mail.test
1349	Anggota 1349	Alamat 1349	1958-11-07	0810001349	anggota1349@mail.test
1350	Anggota 1350	Alamat 1350	2007-10-26	0810001350	anggota1350@mail.test
1351	Anggota 1351	Alamat 1351	2006-10-26	0810001351	anggota1351@mail.test
1352	Anggota 1352	Alamat 1352	2005-10-26	0810001352	anggota1352@mail.test
1353	Anggota 1353	Alamat 1353	2004-10-26	0810001353	anggota1353@mail.test
1354	Anggota 1354	Alamat 1354	2003-10-27	0810001354	anggota1354@mail.test
1355	Anggota 1355	Alamat 1355	2002-10-27	0810001355	anggota1355@mail.test
1356	Anggota 1356	Alamat 1356	2001-10-27	0810001356	anggota1356@mail.test
1357	Anggota 1357	Alamat 1357	2000-10-27	0810001357	anggota1357@mail.test
1358	Anggota 1358	Alamat 1358	1999-10-28	0810001358	anggota1358@mail.test
1359	Anggota 1359	Alamat 1359	1998-10-28	0810001359	anggota1359@mail.test
1360	Anggota 1360	Alamat 1360	1997-10-28	0810001360	anggota1360@mail.test
1361	Anggota 1361	Alamat 1361	1996-10-28	0810001361	anggota1361@mail.test
1362	Anggota 1362	Alamat 1362	1995-10-29	0810001362	anggota1362@mail.test
1363	Anggota 1363	Alamat 1363	1994-10-29	0810001363	anggota1363@mail.test
1364	Anggota 1364	Alamat 1364	1993-10-29	0810001364	anggota1364@mail.test
1365	Anggota 1365	Alamat 1365	1992-10-29	0810001365	anggota1365@mail.test
1366	Anggota 1366	Alamat 1366	1991-10-30	0810001366	anggota1366@mail.test
1367	Anggota 1367	Alamat 1367	1990-10-30	0810001367	anggota1367@mail.test
1368	Anggota 1368	Alamat 1368	1989-10-30	0810001368	anggota1368@mail.test
1369	Anggota 1369	Alamat 1369	1988-10-30	0810001369	anggota1369@mail.test
1370	Anggota 1370	Alamat 1370	1987-10-31	0810001370	anggota1370@mail.test
1371	Anggota 1371	Alamat 1371	1986-10-31	0810001371	anggota1371@mail.test
1372	Anggota 1372	Alamat 1372	1985-10-31	0810001372	anggota1372@mail.test
1373	Anggota 1373	Alamat 1373	1984-10-31	0810001373	anggota1373@mail.test
1374	Anggota 1374	Alamat 1374	1983-11-01	0810001374	anggota1374@mail.test
1375	Anggota 1375	Alamat 1375	1982-11-01	0810001375	anggota1375@mail.test
1376	Anggota 1376	Alamat 1376	1981-11-01	0810001376	anggota1376@mail.test
1377	Anggota 1377	Alamat 1377	1980-11-01	0810001377	anggota1377@mail.test
1378	Anggota 1378	Alamat 1378	1979-11-02	0810001378	anggota1378@mail.test
1379	Anggota 1379	Alamat 1379	1978-11-02	0810001379	anggota1379@mail.test
1380	Anggota 1380	Alamat 1380	1977-11-02	0810001380	anggota1380@mail.test
1381	Anggota 1381	Alamat 1381	1976-11-02	0810001381	anggota1381@mail.test
1382	Anggota 1382	Alamat 1382	1975-11-03	0810001382	anggota1382@mail.test
1383	Anggota 1383	Alamat 1383	1974-11-03	0810001383	anggota1383@mail.test
1384	Anggota 1384	Alamat 1384	1973-11-03	0810001384	anggota1384@mail.test
1385	Anggota 1385	Alamat 1385	1972-11-03	0810001385	anggota1385@mail.test
1386	Anggota 1386	Alamat 1386	1971-11-04	0810001386	anggota1386@mail.test
1387	Anggota 1387	Alamat 1387	1970-11-04	0810001387	anggota1387@mail.test
1388	Anggota 1388	Alamat 1388	1969-11-04	0810001388	anggota1388@mail.test
1389	Anggota 1389	Alamat 1389	1968-11-04	0810001389	anggota1389@mail.test
1390	Anggota 1390	Alamat 1390	1967-11-05	0810001390	anggota1390@mail.test
1391	Anggota 1391	Alamat 1391	1966-11-05	0810001391	anggota1391@mail.test
1392	Anggota 1392	Alamat 1392	1965-11-05	0810001392	anggota1392@mail.test
1393	Anggota 1393	Alamat 1393	1964-11-05	0810001393	anggota1393@mail.test
1394	Anggota 1394	Alamat 1394	1963-11-06	0810001394	anggota1394@mail.test
1395	Anggota 1395	Alamat 1395	1962-11-06	0810001395	anggota1395@mail.test
1396	Anggota 1396	Alamat 1396	1961-11-06	0810001396	anggota1396@mail.test
1397	Anggota 1397	Alamat 1397	1960-11-06	0810001397	anggota1397@mail.test
1398	Anggota 1398	Alamat 1398	1959-11-07	0810001398	anggota1398@mail.test
1399	Anggota 1399	Alamat 1399	1958-11-07	0810001399	anggota1399@mail.test
1400	Anggota 1400	Alamat 1400	2007-10-26	0810001400	anggota1400@mail.test
1401	Anggota 1401	Alamat 1401	2006-10-26	0810001401	anggota1401@mail.test
1402	Anggota 1402	Alamat 1402	2005-10-26	0810001402	anggota1402@mail.test
1403	Anggota 1403	Alamat 1403	2004-10-26	0810001403	anggota1403@mail.test
1404	Anggota 1404	Alamat 1404	2003-10-27	0810001404	anggota1404@mail.test
1405	Anggota 1405	Alamat 1405	2002-10-27	0810001405	anggota1405@mail.test
1406	Anggota 1406	Alamat 1406	2001-10-27	0810001406	anggota1406@mail.test
1407	Anggota 1407	Alamat 1407	2000-10-27	0810001407	anggota1407@mail.test
1408	Anggota 1408	Alamat 1408	1999-10-28	0810001408	anggota1408@mail.test
1409	Anggota 1409	Alamat 1409	1998-10-28	0810001409	anggota1409@mail.test
1410	Anggota 1410	Alamat 1410	1997-10-28	0810001410	anggota1410@mail.test
1411	Anggota 1411	Alamat 1411	1996-10-28	0810001411	anggota1411@mail.test
1412	Anggota 1412	Alamat 1412	1995-10-29	0810001412	anggota1412@mail.test
1413	Anggota 1413	Alamat 1413	1994-10-29	0810001413	anggota1413@mail.test
1414	Anggota 1414	Alamat 1414	1993-10-29	0810001414	anggota1414@mail.test
1415	Anggota 1415	Alamat 1415	1992-10-29	0810001415	anggota1415@mail.test
1416	Anggota 1416	Alamat 1416	1991-10-30	0810001416	anggota1416@mail.test
1417	Anggota 1417	Alamat 1417	1990-10-30	0810001417	anggota1417@mail.test
1418	Anggota 1418	Alamat 1418	1989-10-30	0810001418	anggota1418@mail.test
1419	Anggota 1419	Alamat 1419	1988-10-30	0810001419	anggota1419@mail.test
1420	Anggota 1420	Alamat 1420	1987-10-31	0810001420	anggota1420@mail.test
1421	Anggota 1421	Alamat 1421	1986-10-31	0810001421	anggota1421@mail.test
1422	Anggota 1422	Alamat 1422	1985-10-31	0810001422	anggota1422@mail.test
1423	Anggota 1423	Alamat 1423	1984-10-31	0810001423	anggota1423@mail.test
1424	Anggota 1424	Alamat 1424	1983-11-01	0810001424	anggota1424@mail.test
1425	Anggota 1425	Alamat 1425	1982-11-01	0810001425	anggota1425@mail.test
1426	Anggota 1426	Alamat 1426	1981-11-01	0810001426	anggota1426@mail.test
1427	Anggota 1427	Alamat 1427	1980-11-01	0810001427	anggota1427@mail.test
1428	Anggota 1428	Alamat 1428	1979-11-02	0810001428	anggota1428@mail.test
1429	Anggota 1429	Alamat 1429	1978-11-02	0810001429	anggota1429@mail.test
1430	Anggota 1430	Alamat 1430	1977-11-02	0810001430	anggota1430@mail.test
1431	Anggota 1431	Alamat 1431	1976-11-02	0810001431	anggota1431@mail.test
1432	Anggota 1432	Alamat 1432	1975-11-03	0810001432	anggota1432@mail.test
1433	Anggota 1433	Alamat 1433	1974-11-03	0810001433	anggota1433@mail.test
1434	Anggota 1434	Alamat 1434	1973-11-03	0810001434	anggota1434@mail.test
1435	Anggota 1435	Alamat 1435	1972-11-03	0810001435	anggota1435@mail.test
1436	Anggota 1436	Alamat 1436	1971-11-04	0810001436	anggota1436@mail.test
1437	Anggota 1437	Alamat 1437	1970-11-04	0810001437	anggota1437@mail.test
1438	Anggota 1438	Alamat 1438	1969-11-04	0810001438	anggota1438@mail.test
1439	Anggota 1439	Alamat 1439	1968-11-04	0810001439	anggota1439@mail.test
1440	Anggota 1440	Alamat 1440	1967-11-05	0810001440	anggota1440@mail.test
1441	Anggota 1441	Alamat 1441	1966-11-05	0810001441	anggota1441@mail.test
1442	Anggota 1442	Alamat 1442	1965-11-05	0810001442	anggota1442@mail.test
1443	Anggota 1443	Alamat 1443	1964-11-05	0810001443	anggota1443@mail.test
1444	Anggota 1444	Alamat 1444	1963-11-06	0810001444	anggota1444@mail.test
1445	Anggota 1445	Alamat 1445	1962-11-06	0810001445	anggota1445@mail.test
1446	Anggota 1446	Alamat 1446	1961-11-06	0810001446	anggota1446@mail.test
1447	Anggota 1447	Alamat 1447	1960-11-06	0810001447	anggota1447@mail.test
1448	Anggota 1448	Alamat 1448	1959-11-07	0810001448	anggota1448@mail.test
1449	Anggota 1449	Alamat 1449	1958-11-07	0810001449	anggota1449@mail.test
1450	Anggota 1450	Alamat 1450	2007-10-26	0810001450	anggota1450@mail.test
1451	Anggota 1451	Alamat 1451	2006-10-26	0810001451	anggota1451@mail.test
1452	Anggota 1452	Alamat 1452	2005-10-26	0810001452	anggota1452@mail.test
1453	Anggota 1453	Alamat 1453	2004-10-26	0810001453	anggota1453@mail.test
1454	Anggota 1454	Alamat 1454	2003-10-27	0810001454	anggota1454@mail.test
1455	Anggota 1455	Alamat 1455	2002-10-27	0810001455	anggota1455@mail.test
1456	Anggota 1456	Alamat 1456	2001-10-27	0810001456	anggota1456@mail.test
1457	Anggota 1457	Alamat 1457	2000-10-27	0810001457	anggota1457@mail.test
1458	Anggota 1458	Alamat 1458	1999-10-28	0810001458	anggota1458@mail.test
1459	Anggota 1459	Alamat 1459	1998-10-28	0810001459	anggota1459@mail.test
1460	Anggota 1460	Alamat 1460	1997-10-28	0810001460	anggota1460@mail.test
1461	Anggota 1461	Alamat 1461	1996-10-28	0810001461	anggota1461@mail.test
1462	Anggota 1462	Alamat 1462	1995-10-29	0810001462	anggota1462@mail.test
1463	Anggota 1463	Alamat 1463	1994-10-29	0810001463	anggota1463@mail.test
1464	Anggota 1464	Alamat 1464	1993-10-29	0810001464	anggota1464@mail.test
1465	Anggota 1465	Alamat 1465	1992-10-29	0810001465	anggota1465@mail.test
1466	Anggota 1466	Alamat 1466	1991-10-30	0810001466	anggota1466@mail.test
1467	Anggota 1467	Alamat 1467	1990-10-30	0810001467	anggota1467@mail.test
1468	Anggota 1468	Alamat 1468	1989-10-30	0810001468	anggota1468@mail.test
1469	Anggota 1469	Alamat 1469	1988-10-30	0810001469	anggota1469@mail.test
1470	Anggota 1470	Alamat 1470	1987-10-31	0810001470	anggota1470@mail.test
1471	Anggota 1471	Alamat 1471	1986-10-31	0810001471	anggota1471@mail.test
1472	Anggota 1472	Alamat 1472	1985-10-31	0810001472	anggota1472@mail.test
1473	Anggota 1473	Alamat 1473	1984-10-31	0810001473	anggota1473@mail.test
1474	Anggota 1474	Alamat 1474	1983-11-01	0810001474	anggota1474@mail.test
1475	Anggota 1475	Alamat 1475	1982-11-01	0810001475	anggota1475@mail.test
1476	Anggota 1476	Alamat 1476	1981-11-01	0810001476	anggota1476@mail.test
1477	Anggota 1477	Alamat 1477	1980-11-01	0810001477	anggota1477@mail.test
1478	Anggota 1478	Alamat 1478	1979-11-02	0810001478	anggota1478@mail.test
1479	Anggota 1479	Alamat 1479	1978-11-02	0810001479	anggota1479@mail.test
1480	Anggota 1480	Alamat 1480	1977-11-02	0810001480	anggota1480@mail.test
1481	Anggota 1481	Alamat 1481	1976-11-02	0810001481	anggota1481@mail.test
1482	Anggota 1482	Alamat 1482	1975-11-03	0810001482	anggota1482@mail.test
1483	Anggota 1483	Alamat 1483	1974-11-03	0810001483	anggota1483@mail.test
1484	Anggota 1484	Alamat 1484	1973-11-03	0810001484	anggota1484@mail.test
1485	Anggota 1485	Alamat 1485	1972-11-03	0810001485	anggota1485@mail.test
1486	Anggota 1486	Alamat 1486	1971-11-04	0810001486	anggota1486@mail.test
1487	Anggota 1487	Alamat 1487	1970-11-04	0810001487	anggota1487@mail.test
1488	Anggota 1488	Alamat 1488	1969-11-04	0810001488	anggota1488@mail.test
1489	Anggota 1489	Alamat 1489	1968-11-04	0810001489	anggota1489@mail.test
1490	Anggota 1490	Alamat 1490	1967-11-05	0810001490	anggota1490@mail.test
1491	Anggota 1491	Alamat 1491	1966-11-05	0810001491	anggota1491@mail.test
1492	Anggota 1492	Alamat 1492	1965-11-05	0810001492	anggota1492@mail.test
1493	Anggota 1493	Alamat 1493	1964-11-05	0810001493	anggota1493@mail.test
1494	Anggota 1494	Alamat 1494	1963-11-06	0810001494	anggota1494@mail.test
1495	Anggota 1495	Alamat 1495	1962-11-06	0810001495	anggota1495@mail.test
1496	Anggota 1496	Alamat 1496	1961-11-06	0810001496	anggota1496@mail.test
1497	Anggota 1497	Alamat 1497	1960-11-06	0810001497	anggota1497@mail.test
1498	Anggota 1498	Alamat 1498	1959-11-07	0810001498	anggota1498@mail.test
1499	Anggota 1499	Alamat 1499	1958-11-07	0810001499	anggota1499@mail.test
1500	Anggota 1500	Alamat 1500	2007-10-26	0810001500	anggota1500@mail.test
1501	Anggota 1501	Alamat 1501	2006-10-26	0810001501	anggota1501@mail.test
1502	Anggota 1502	Alamat 1502	2005-10-26	0810001502	anggota1502@mail.test
1503	Anggota 1503	Alamat 1503	2004-10-26	0810001503	anggota1503@mail.test
1504	Anggota 1504	Alamat 1504	2003-10-27	0810001504	anggota1504@mail.test
1505	Anggota 1505	Alamat 1505	2002-10-27	0810001505	anggota1505@mail.test
1506	Anggota 1506	Alamat 1506	2001-10-27	0810001506	anggota1506@mail.test
1507	Anggota 1507	Alamat 1507	2000-10-27	0810001507	anggota1507@mail.test
1508	Anggota 1508	Alamat 1508	1999-10-28	0810001508	anggota1508@mail.test
1509	Anggota 1509	Alamat 1509	1998-10-28	0810001509	anggota1509@mail.test
1510	Anggota 1510	Alamat 1510	1997-10-28	0810001510	anggota1510@mail.test
1511	Anggota 1511	Alamat 1511	1996-10-28	0810001511	anggota1511@mail.test
1512	Anggota 1512	Alamat 1512	1995-10-29	0810001512	anggota1512@mail.test
1513	Anggota 1513	Alamat 1513	1994-10-29	0810001513	anggota1513@mail.test
1514	Anggota 1514	Alamat 1514	1993-10-29	0810001514	anggota1514@mail.test
1515	Anggota 1515	Alamat 1515	1992-10-29	0810001515	anggota1515@mail.test
1516	Anggota 1516	Alamat 1516	1991-10-30	0810001516	anggota1516@mail.test
1517	Anggota 1517	Alamat 1517	1990-10-30	0810001517	anggota1517@mail.test
1518	Anggota 1518	Alamat 1518	1989-10-30	0810001518	anggota1518@mail.test
1519	Anggota 1519	Alamat 1519	1988-10-30	0810001519	anggota1519@mail.test
1520	Anggota 1520	Alamat 1520	1987-10-31	0810001520	anggota1520@mail.test
1521	Anggota 1521	Alamat 1521	1986-10-31	0810001521	anggota1521@mail.test
1522	Anggota 1522	Alamat 1522	1985-10-31	0810001522	anggota1522@mail.test
1523	Anggota 1523	Alamat 1523	1984-10-31	0810001523	anggota1523@mail.test
1524	Anggota 1524	Alamat 1524	1983-11-01	0810001524	anggota1524@mail.test
1525	Anggota 1525	Alamat 1525	1982-11-01	0810001525	anggota1525@mail.test
1526	Anggota 1526	Alamat 1526	1981-11-01	0810001526	anggota1526@mail.test
1527	Anggota 1527	Alamat 1527	1980-11-01	0810001527	anggota1527@mail.test
1528	Anggota 1528	Alamat 1528	1979-11-02	0810001528	anggota1528@mail.test
1529	Anggota 1529	Alamat 1529	1978-11-02	0810001529	anggota1529@mail.test
1530	Anggota 1530	Alamat 1530	1977-11-02	0810001530	anggota1530@mail.test
1531	Anggota 1531	Alamat 1531	1976-11-02	0810001531	anggota1531@mail.test
1532	Anggota 1532	Alamat 1532	1975-11-03	0810001532	anggota1532@mail.test
1533	Anggota 1533	Alamat 1533	1974-11-03	0810001533	anggota1533@mail.test
1534	Anggota 1534	Alamat 1534	1973-11-03	0810001534	anggota1534@mail.test
1535	Anggota 1535	Alamat 1535	1972-11-03	0810001535	anggota1535@mail.test
1536	Anggota 1536	Alamat 1536	1971-11-04	0810001536	anggota1536@mail.test
1537	Anggota 1537	Alamat 1537	1970-11-04	0810001537	anggota1537@mail.test
1538	Anggota 1538	Alamat 1538	1969-11-04	0810001538	anggota1538@mail.test
1539	Anggota 1539	Alamat 1539	1968-11-04	0810001539	anggota1539@mail.test
1540	Anggota 1540	Alamat 1540	1967-11-05	0810001540	anggota1540@mail.test
1541	Anggota 1541	Alamat 1541	1966-11-05	0810001541	anggota1541@mail.test
1542	Anggota 1542	Alamat 1542	1965-11-05	0810001542	anggota1542@mail.test
1543	Anggota 1543	Alamat 1543	1964-11-05	0810001543	anggota1543@mail.test
1544	Anggota 1544	Alamat 1544	1963-11-06	0810001544	anggota1544@mail.test
1545	Anggota 1545	Alamat 1545	1962-11-06	0810001545	anggota1545@mail.test
1546	Anggota 1546	Alamat 1546	1961-11-06	0810001546	anggota1546@mail.test
1547	Anggota 1547	Alamat 1547	1960-11-06	0810001547	anggota1547@mail.test
1548	Anggota 1548	Alamat 1548	1959-11-07	0810001548	anggota1548@mail.test
1549	Anggota 1549	Alamat 1549	1958-11-07	0810001549	anggota1549@mail.test
1550	Anggota 1550	Alamat 1550	2007-10-26	0810001550	anggota1550@mail.test
1551	Anggota 1551	Alamat 1551	2006-10-26	0810001551	anggota1551@mail.test
1552	Anggota 1552	Alamat 1552	2005-10-26	0810001552	anggota1552@mail.test
1553	Anggota 1553	Alamat 1553	2004-10-26	0810001553	anggota1553@mail.test
1554	Anggota 1554	Alamat 1554	2003-10-27	0810001554	anggota1554@mail.test
1555	Anggota 1555	Alamat 1555	2002-10-27	0810001555	anggota1555@mail.test
1556	Anggota 1556	Alamat 1556	2001-10-27	0810001556	anggota1556@mail.test
1557	Anggota 1557	Alamat 1557	2000-10-27	0810001557	anggota1557@mail.test
1558	Anggota 1558	Alamat 1558	1999-10-28	0810001558	anggota1558@mail.test
1559	Anggota 1559	Alamat 1559	1998-10-28	0810001559	anggota1559@mail.test
1560	Anggota 1560	Alamat 1560	1997-10-28	0810001560	anggota1560@mail.test
1561	Anggota 1561	Alamat 1561	1996-10-28	0810001561	anggota1561@mail.test
1562	Anggota 1562	Alamat 1562	1995-10-29	0810001562	anggota1562@mail.test
1563	Anggota 1563	Alamat 1563	1994-10-29	0810001563	anggota1563@mail.test
1564	Anggota 1564	Alamat 1564	1993-10-29	0810001564	anggota1564@mail.test
1565	Anggota 1565	Alamat 1565	1992-10-29	0810001565	anggota1565@mail.test
1566	Anggota 1566	Alamat 1566	1991-10-30	0810001566	anggota1566@mail.test
1567	Anggota 1567	Alamat 1567	1990-10-30	0810001567	anggota1567@mail.test
1568	Anggota 1568	Alamat 1568	1989-10-30	0810001568	anggota1568@mail.test
1569	Anggota 1569	Alamat 1569	1988-10-30	0810001569	anggota1569@mail.test
1570	Anggota 1570	Alamat 1570	1987-10-31	0810001570	anggota1570@mail.test
1571	Anggota 1571	Alamat 1571	1986-10-31	0810001571	anggota1571@mail.test
1572	Anggota 1572	Alamat 1572	1985-10-31	0810001572	anggota1572@mail.test
1573	Anggota 1573	Alamat 1573	1984-10-31	0810001573	anggota1573@mail.test
1574	Anggota 1574	Alamat 1574	1983-11-01	0810001574	anggota1574@mail.test
1575	Anggota 1575	Alamat 1575	1982-11-01	0810001575	anggota1575@mail.test
1576	Anggota 1576	Alamat 1576	1981-11-01	0810001576	anggota1576@mail.test
1577	Anggota 1577	Alamat 1577	1980-11-01	0810001577	anggota1577@mail.test
1578	Anggota 1578	Alamat 1578	1979-11-02	0810001578	anggota1578@mail.test
1579	Anggota 1579	Alamat 1579	1978-11-02	0810001579	anggota1579@mail.test
1580	Anggota 1580	Alamat 1580	1977-11-02	0810001580	anggota1580@mail.test
1581	Anggota 1581	Alamat 1581	1976-11-02	0810001581	anggota1581@mail.test
1582	Anggota 1582	Alamat 1582	1975-11-03	0810001582	anggota1582@mail.test
1583	Anggota 1583	Alamat 1583	1974-11-03	0810001583	anggota1583@mail.test
1584	Anggota 1584	Alamat 1584	1973-11-03	0810001584	anggota1584@mail.test
1585	Anggota 1585	Alamat 1585	1972-11-03	0810001585	anggota1585@mail.test
1586	Anggota 1586	Alamat 1586	1971-11-04	0810001586	anggota1586@mail.test
1587	Anggota 1587	Alamat 1587	1970-11-04	0810001587	anggota1587@mail.test
1588	Anggota 1588	Alamat 1588	1969-11-04	0810001588	anggota1588@mail.test
1589	Anggota 1589	Alamat 1589	1968-11-04	0810001589	anggota1589@mail.test
1590	Anggota 1590	Alamat 1590	1967-11-05	0810001590	anggota1590@mail.test
1591	Anggota 1591	Alamat 1591	1966-11-05	0810001591	anggota1591@mail.test
1592	Anggota 1592	Alamat 1592	1965-11-05	0810001592	anggota1592@mail.test
1593	Anggota 1593	Alamat 1593	1964-11-05	0810001593	anggota1593@mail.test
1594	Anggota 1594	Alamat 1594	1963-11-06	0810001594	anggota1594@mail.test
1595	Anggota 1595	Alamat 1595	1962-11-06	0810001595	anggota1595@mail.test
1596	Anggota 1596	Alamat 1596	1961-11-06	0810001596	anggota1596@mail.test
1597	Anggota 1597	Alamat 1597	1960-11-06	0810001597	anggota1597@mail.test
1598	Anggota 1598	Alamat 1598	1959-11-07	0810001598	anggota1598@mail.test
1599	Anggota 1599	Alamat 1599	1958-11-07	0810001599	anggota1599@mail.test
1600	Anggota 1600	Alamat 1600	2007-10-26	0810001600	anggota1600@mail.test
1601	Anggota 1601	Alamat 1601	2006-10-26	0810001601	anggota1601@mail.test
1602	Anggota 1602	Alamat 1602	2005-10-26	0810001602	anggota1602@mail.test
1603	Anggota 1603	Alamat 1603	2004-10-26	0810001603	anggota1603@mail.test
1604	Anggota 1604	Alamat 1604	2003-10-27	0810001604	anggota1604@mail.test
1605	Anggota 1605	Alamat 1605	2002-10-27	0810001605	anggota1605@mail.test
1606	Anggota 1606	Alamat 1606	2001-10-27	0810001606	anggota1606@mail.test
1607	Anggota 1607	Alamat 1607	2000-10-27	0810001607	anggota1607@mail.test
1608	Anggota 1608	Alamat 1608	1999-10-28	0810001608	anggota1608@mail.test
1609	Anggota 1609	Alamat 1609	1998-10-28	0810001609	anggota1609@mail.test
1610	Anggota 1610	Alamat 1610	1997-10-28	0810001610	anggota1610@mail.test
1611	Anggota 1611	Alamat 1611	1996-10-28	0810001611	anggota1611@mail.test
1612	Anggota 1612	Alamat 1612	1995-10-29	0810001612	anggota1612@mail.test
1613	Anggota 1613	Alamat 1613	1994-10-29	0810001613	anggota1613@mail.test
1614	Anggota 1614	Alamat 1614	1993-10-29	0810001614	anggota1614@mail.test
1615	Anggota 1615	Alamat 1615	1992-10-29	0810001615	anggota1615@mail.test
1616	Anggota 1616	Alamat 1616	1991-10-30	0810001616	anggota1616@mail.test
1617	Anggota 1617	Alamat 1617	1990-10-30	0810001617	anggota1617@mail.test
1618	Anggota 1618	Alamat 1618	1989-10-30	0810001618	anggota1618@mail.test
1619	Anggota 1619	Alamat 1619	1988-10-30	0810001619	anggota1619@mail.test
1620	Anggota 1620	Alamat 1620	1987-10-31	0810001620	anggota1620@mail.test
1621	Anggota 1621	Alamat 1621	1986-10-31	0810001621	anggota1621@mail.test
1622	Anggota 1622	Alamat 1622	1985-10-31	0810001622	anggota1622@mail.test
1623	Anggota 1623	Alamat 1623	1984-10-31	0810001623	anggota1623@mail.test
1624	Anggota 1624	Alamat 1624	1983-11-01	0810001624	anggota1624@mail.test
1625	Anggota 1625	Alamat 1625	1982-11-01	0810001625	anggota1625@mail.test
1626	Anggota 1626	Alamat 1626	1981-11-01	0810001626	anggota1626@mail.test
1627	Anggota 1627	Alamat 1627	1980-11-01	0810001627	anggota1627@mail.test
1628	Anggota 1628	Alamat 1628	1979-11-02	0810001628	anggota1628@mail.test
1629	Anggota 1629	Alamat 1629	1978-11-02	0810001629	anggota1629@mail.test
1630	Anggota 1630	Alamat 1630	1977-11-02	0810001630	anggota1630@mail.test
1631	Anggota 1631	Alamat 1631	1976-11-02	0810001631	anggota1631@mail.test
1632	Anggota 1632	Alamat 1632	1975-11-03	0810001632	anggota1632@mail.test
1633	Anggota 1633	Alamat 1633	1974-11-03	0810001633	anggota1633@mail.test
1634	Anggota 1634	Alamat 1634	1973-11-03	0810001634	anggota1634@mail.test
1635	Anggota 1635	Alamat 1635	1972-11-03	0810001635	anggota1635@mail.test
1636	Anggota 1636	Alamat 1636	1971-11-04	0810001636	anggota1636@mail.test
1637	Anggota 1637	Alamat 1637	1970-11-04	0810001637	anggota1637@mail.test
1638	Anggota 1638	Alamat 1638	1969-11-04	0810001638	anggota1638@mail.test
1639	Anggota 1639	Alamat 1639	1968-11-04	0810001639	anggota1639@mail.test
1640	Anggota 1640	Alamat 1640	1967-11-05	0810001640	anggota1640@mail.test
1641	Anggota 1641	Alamat 1641	1966-11-05	0810001641	anggota1641@mail.test
1642	Anggota 1642	Alamat 1642	1965-11-05	0810001642	anggota1642@mail.test
1643	Anggota 1643	Alamat 1643	1964-11-05	0810001643	anggota1643@mail.test
1644	Anggota 1644	Alamat 1644	1963-11-06	0810001644	anggota1644@mail.test
1645	Anggota 1645	Alamat 1645	1962-11-06	0810001645	anggota1645@mail.test
1646	Anggota 1646	Alamat 1646	1961-11-06	0810001646	anggota1646@mail.test
1647	Anggota 1647	Alamat 1647	1960-11-06	0810001647	anggota1647@mail.test
1648	Anggota 1648	Alamat 1648	1959-11-07	0810001648	anggota1648@mail.test
1649	Anggota 1649	Alamat 1649	1958-11-07	0810001649	anggota1649@mail.test
1650	Anggota 1650	Alamat 1650	2007-10-26	0810001650	anggota1650@mail.test
1651	Anggota 1651	Alamat 1651	2006-10-26	0810001651	anggota1651@mail.test
1652	Anggota 1652	Alamat 1652	2005-10-26	0810001652	anggota1652@mail.test
1653	Anggota 1653	Alamat 1653	2004-10-26	0810001653	anggota1653@mail.test
1654	Anggota 1654	Alamat 1654	2003-10-27	0810001654	anggota1654@mail.test
1655	Anggota 1655	Alamat 1655	2002-10-27	0810001655	anggota1655@mail.test
1656	Anggota 1656	Alamat 1656	2001-10-27	0810001656	anggota1656@mail.test
1657	Anggota 1657	Alamat 1657	2000-10-27	0810001657	anggota1657@mail.test
1658	Anggota 1658	Alamat 1658	1999-10-28	0810001658	anggota1658@mail.test
1659	Anggota 1659	Alamat 1659	1998-10-28	0810001659	anggota1659@mail.test
1660	Anggota 1660	Alamat 1660	1997-10-28	0810001660	anggota1660@mail.test
1661	Anggota 1661	Alamat 1661	1996-10-28	0810001661	anggota1661@mail.test
1662	Anggota 1662	Alamat 1662	1995-10-29	0810001662	anggota1662@mail.test
1663	Anggota 1663	Alamat 1663	1994-10-29	0810001663	anggota1663@mail.test
1664	Anggota 1664	Alamat 1664	1993-10-29	0810001664	anggota1664@mail.test
1665	Anggota 1665	Alamat 1665	1992-10-29	0810001665	anggota1665@mail.test
1666	Anggota 1666	Alamat 1666	1991-10-30	0810001666	anggota1666@mail.test
1667	Anggota 1667	Alamat 1667	1990-10-30	0810001667	anggota1667@mail.test
1668	Anggota 1668	Alamat 1668	1989-10-30	0810001668	anggota1668@mail.test
1669	Anggota 1669	Alamat 1669	1988-10-30	0810001669	anggota1669@mail.test
1670	Anggota 1670	Alamat 1670	1987-10-31	0810001670	anggota1670@mail.test
1671	Anggota 1671	Alamat 1671	1986-10-31	0810001671	anggota1671@mail.test
1672	Anggota 1672	Alamat 1672	1985-10-31	0810001672	anggota1672@mail.test
1673	Anggota 1673	Alamat 1673	1984-10-31	0810001673	anggota1673@mail.test
1674	Anggota 1674	Alamat 1674	1983-11-01	0810001674	anggota1674@mail.test
1675	Anggota 1675	Alamat 1675	1982-11-01	0810001675	anggota1675@mail.test
1676	Anggota 1676	Alamat 1676	1981-11-01	0810001676	anggota1676@mail.test
1677	Anggota 1677	Alamat 1677	1980-11-01	0810001677	anggota1677@mail.test
1678	Anggota 1678	Alamat 1678	1979-11-02	0810001678	anggota1678@mail.test
1679	Anggota 1679	Alamat 1679	1978-11-02	0810001679	anggota1679@mail.test
1680	Anggota 1680	Alamat 1680	1977-11-02	0810001680	anggota1680@mail.test
1681	Anggota 1681	Alamat 1681	1976-11-02	0810001681	anggota1681@mail.test
1682	Anggota 1682	Alamat 1682	1975-11-03	0810001682	anggota1682@mail.test
1683	Anggota 1683	Alamat 1683	1974-11-03	0810001683	anggota1683@mail.test
1684	Anggota 1684	Alamat 1684	1973-11-03	0810001684	anggota1684@mail.test
1685	Anggota 1685	Alamat 1685	1972-11-03	0810001685	anggota1685@mail.test
1686	Anggota 1686	Alamat 1686	1971-11-04	0810001686	anggota1686@mail.test
1687	Anggota 1687	Alamat 1687	1970-11-04	0810001687	anggota1687@mail.test
1688	Anggota 1688	Alamat 1688	1969-11-04	0810001688	anggota1688@mail.test
1689	Anggota 1689	Alamat 1689	1968-11-04	0810001689	anggota1689@mail.test
1690	Anggota 1690	Alamat 1690	1967-11-05	0810001690	anggota1690@mail.test
1691	Anggota 1691	Alamat 1691	1966-11-05	0810001691	anggota1691@mail.test
1692	Anggota 1692	Alamat 1692	1965-11-05	0810001692	anggota1692@mail.test
1693	Anggota 1693	Alamat 1693	1964-11-05	0810001693	anggota1693@mail.test
1694	Anggota 1694	Alamat 1694	1963-11-06	0810001694	anggota1694@mail.test
1695	Anggota 1695	Alamat 1695	1962-11-06	0810001695	anggota1695@mail.test
1696	Anggota 1696	Alamat 1696	1961-11-06	0810001696	anggota1696@mail.test
1697	Anggota 1697	Alamat 1697	1960-11-06	0810001697	anggota1697@mail.test
1698	Anggota 1698	Alamat 1698	1959-11-07	0810001698	anggota1698@mail.test
1699	Anggota 1699	Alamat 1699	1958-11-07	0810001699	anggota1699@mail.test
1700	Anggota 1700	Alamat 1700	2007-10-26	0810001700	anggota1700@mail.test
1701	Anggota 1701	Alamat 1701	2006-10-26	0810001701	anggota1701@mail.test
1702	Anggota 1702	Alamat 1702	2005-10-26	0810001702	anggota1702@mail.test
1703	Anggota 1703	Alamat 1703	2004-10-26	0810001703	anggota1703@mail.test
1704	Anggota 1704	Alamat 1704	2003-10-27	0810001704	anggota1704@mail.test
1705	Anggota 1705	Alamat 1705	2002-10-27	0810001705	anggota1705@mail.test
1706	Anggota 1706	Alamat 1706	2001-10-27	0810001706	anggota1706@mail.test
1707	Anggota 1707	Alamat 1707	2000-10-27	0810001707	anggota1707@mail.test
1708	Anggota 1708	Alamat 1708	1999-10-28	0810001708	anggota1708@mail.test
1709	Anggota 1709	Alamat 1709	1998-10-28	0810001709	anggota1709@mail.test
1710	Anggota 1710	Alamat 1710	1997-10-28	0810001710	anggota1710@mail.test
1711	Anggota 1711	Alamat 1711	1996-10-28	0810001711	anggota1711@mail.test
1712	Anggota 1712	Alamat 1712	1995-10-29	0810001712	anggota1712@mail.test
1713	Anggota 1713	Alamat 1713	1994-10-29	0810001713	anggota1713@mail.test
1714	Anggota 1714	Alamat 1714	1993-10-29	0810001714	anggota1714@mail.test
1715	Anggota 1715	Alamat 1715	1992-10-29	0810001715	anggota1715@mail.test
1716	Anggota 1716	Alamat 1716	1991-10-30	0810001716	anggota1716@mail.test
1717	Anggota 1717	Alamat 1717	1990-10-30	0810001717	anggota1717@mail.test
1718	Anggota 1718	Alamat 1718	1989-10-30	0810001718	anggota1718@mail.test
1719	Anggota 1719	Alamat 1719	1988-10-30	0810001719	anggota1719@mail.test
1720	Anggota 1720	Alamat 1720	1987-10-31	0810001720	anggota1720@mail.test
1721	Anggota 1721	Alamat 1721	1986-10-31	0810001721	anggota1721@mail.test
1722	Anggota 1722	Alamat 1722	1985-10-31	0810001722	anggota1722@mail.test
1723	Anggota 1723	Alamat 1723	1984-10-31	0810001723	anggota1723@mail.test
1724	Anggota 1724	Alamat 1724	1983-11-01	0810001724	anggota1724@mail.test
1725	Anggota 1725	Alamat 1725	1982-11-01	0810001725	anggota1725@mail.test
1726	Anggota 1726	Alamat 1726	1981-11-01	0810001726	anggota1726@mail.test
1727	Anggota 1727	Alamat 1727	1980-11-01	0810001727	anggota1727@mail.test
1728	Anggota 1728	Alamat 1728	1979-11-02	0810001728	anggota1728@mail.test
1729	Anggota 1729	Alamat 1729	1978-11-02	0810001729	anggota1729@mail.test
1730	Anggota 1730	Alamat 1730	1977-11-02	0810001730	anggota1730@mail.test
1731	Anggota 1731	Alamat 1731	1976-11-02	0810001731	anggota1731@mail.test
1732	Anggota 1732	Alamat 1732	1975-11-03	0810001732	anggota1732@mail.test
1733	Anggota 1733	Alamat 1733	1974-11-03	0810001733	anggota1733@mail.test
1734	Anggota 1734	Alamat 1734	1973-11-03	0810001734	anggota1734@mail.test
1735	Anggota 1735	Alamat 1735	1972-11-03	0810001735	anggota1735@mail.test
1736	Anggota 1736	Alamat 1736	1971-11-04	0810001736	anggota1736@mail.test
1737	Anggota 1737	Alamat 1737	1970-11-04	0810001737	anggota1737@mail.test
1738	Anggota 1738	Alamat 1738	1969-11-04	0810001738	anggota1738@mail.test
1739	Anggota 1739	Alamat 1739	1968-11-04	0810001739	anggota1739@mail.test
1740	Anggota 1740	Alamat 1740	1967-11-05	0810001740	anggota1740@mail.test
1741	Anggota 1741	Alamat 1741	1966-11-05	0810001741	anggota1741@mail.test
1742	Anggota 1742	Alamat 1742	1965-11-05	0810001742	anggota1742@mail.test
1743	Anggota 1743	Alamat 1743	1964-11-05	0810001743	anggota1743@mail.test
1744	Anggota 1744	Alamat 1744	1963-11-06	0810001744	anggota1744@mail.test
1745	Anggota 1745	Alamat 1745	1962-11-06	0810001745	anggota1745@mail.test
1746	Anggota 1746	Alamat 1746	1961-11-06	0810001746	anggota1746@mail.test
1747	Anggota 1747	Alamat 1747	1960-11-06	0810001747	anggota1747@mail.test
1748	Anggota 1748	Alamat 1748	1959-11-07	0810001748	anggota1748@mail.test
1749	Anggota 1749	Alamat 1749	1958-11-07	0810001749	anggota1749@mail.test
1750	Anggota 1750	Alamat 1750	2007-10-26	0810001750	anggota1750@mail.test
1751	Anggota 1751	Alamat 1751	2006-10-26	0810001751	anggota1751@mail.test
1752	Anggota 1752	Alamat 1752	2005-10-26	0810001752	anggota1752@mail.test
1753	Anggota 1753	Alamat 1753	2004-10-26	0810001753	anggota1753@mail.test
1754	Anggota 1754	Alamat 1754	2003-10-27	0810001754	anggota1754@mail.test
1755	Anggota 1755	Alamat 1755	2002-10-27	0810001755	anggota1755@mail.test
1756	Anggota 1756	Alamat 1756	2001-10-27	0810001756	anggota1756@mail.test
1757	Anggota 1757	Alamat 1757	2000-10-27	0810001757	anggota1757@mail.test
1758	Anggota 1758	Alamat 1758	1999-10-28	0810001758	anggota1758@mail.test
1759	Anggota 1759	Alamat 1759	1998-10-28	0810001759	anggota1759@mail.test
1760	Anggota 1760	Alamat 1760	1997-10-28	0810001760	anggota1760@mail.test
1761	Anggota 1761	Alamat 1761	1996-10-28	0810001761	anggota1761@mail.test
1762	Anggota 1762	Alamat 1762	1995-10-29	0810001762	anggota1762@mail.test
1763	Anggota 1763	Alamat 1763	1994-10-29	0810001763	anggota1763@mail.test
1764	Anggota 1764	Alamat 1764	1993-10-29	0810001764	anggota1764@mail.test
1765	Anggota 1765	Alamat 1765	1992-10-29	0810001765	anggota1765@mail.test
1766	Anggota 1766	Alamat 1766	1991-10-30	0810001766	anggota1766@mail.test
1767	Anggota 1767	Alamat 1767	1990-10-30	0810001767	anggota1767@mail.test
1768	Anggota 1768	Alamat 1768	1989-10-30	0810001768	anggota1768@mail.test
1769	Anggota 1769	Alamat 1769	1988-10-30	0810001769	anggota1769@mail.test
1770	Anggota 1770	Alamat 1770	1987-10-31	0810001770	anggota1770@mail.test
1771	Anggota 1771	Alamat 1771	1986-10-31	0810001771	anggota1771@mail.test
1772	Anggota 1772	Alamat 1772	1985-10-31	0810001772	anggota1772@mail.test
1773	Anggota 1773	Alamat 1773	1984-10-31	0810001773	anggota1773@mail.test
1774	Anggota 1774	Alamat 1774	1983-11-01	0810001774	anggota1774@mail.test
1775	Anggota 1775	Alamat 1775	1982-11-01	0810001775	anggota1775@mail.test
1776	Anggota 1776	Alamat 1776	1981-11-01	0810001776	anggota1776@mail.test
1777	Anggota 1777	Alamat 1777	1980-11-01	0810001777	anggota1777@mail.test
1778	Anggota 1778	Alamat 1778	1979-11-02	0810001778	anggota1778@mail.test
1779	Anggota 1779	Alamat 1779	1978-11-02	0810001779	anggota1779@mail.test
1780	Anggota 1780	Alamat 1780	1977-11-02	0810001780	anggota1780@mail.test
1781	Anggota 1781	Alamat 1781	1976-11-02	0810001781	anggota1781@mail.test
1782	Anggota 1782	Alamat 1782	1975-11-03	0810001782	anggota1782@mail.test
1783	Anggota 1783	Alamat 1783	1974-11-03	0810001783	anggota1783@mail.test
1784	Anggota 1784	Alamat 1784	1973-11-03	0810001784	anggota1784@mail.test
1785	Anggota 1785	Alamat 1785	1972-11-03	0810001785	anggota1785@mail.test
1786	Anggota 1786	Alamat 1786	1971-11-04	0810001786	anggota1786@mail.test
1787	Anggota 1787	Alamat 1787	1970-11-04	0810001787	anggota1787@mail.test
1788	Anggota 1788	Alamat 1788	1969-11-04	0810001788	anggota1788@mail.test
1789	Anggota 1789	Alamat 1789	1968-11-04	0810001789	anggota1789@mail.test
1790	Anggota 1790	Alamat 1790	1967-11-05	0810001790	anggota1790@mail.test
1791	Anggota 1791	Alamat 1791	1966-11-05	0810001791	anggota1791@mail.test
1792	Anggota 1792	Alamat 1792	1965-11-05	0810001792	anggota1792@mail.test
1793	Anggota 1793	Alamat 1793	1964-11-05	0810001793	anggota1793@mail.test
1794	Anggota 1794	Alamat 1794	1963-11-06	0810001794	anggota1794@mail.test
1795	Anggota 1795	Alamat 1795	1962-11-06	0810001795	anggota1795@mail.test
1796	Anggota 1796	Alamat 1796	1961-11-06	0810001796	anggota1796@mail.test
1797	Anggota 1797	Alamat 1797	1960-11-06	0810001797	anggota1797@mail.test
1798	Anggota 1798	Alamat 1798	1959-11-07	0810001798	anggota1798@mail.test
1799	Anggota 1799	Alamat 1799	1958-11-07	0810001799	anggota1799@mail.test
1800	Anggota 1800	Alamat 1800	2007-10-26	0810001800	anggota1800@mail.test
1801	Anggota 1801	Alamat 1801	2006-10-26	0810001801	anggota1801@mail.test
1802	Anggota 1802	Alamat 1802	2005-10-26	0810001802	anggota1802@mail.test
1803	Anggota 1803	Alamat 1803	2004-10-26	0810001803	anggota1803@mail.test
1804	Anggota 1804	Alamat 1804	2003-10-27	0810001804	anggota1804@mail.test
1805	Anggota 1805	Alamat 1805	2002-10-27	0810001805	anggota1805@mail.test
1806	Anggota 1806	Alamat 1806	2001-10-27	0810001806	anggota1806@mail.test
1807	Anggota 1807	Alamat 1807	2000-10-27	0810001807	anggota1807@mail.test
1808	Anggota 1808	Alamat 1808	1999-10-28	0810001808	anggota1808@mail.test
1809	Anggota 1809	Alamat 1809	1998-10-28	0810001809	anggota1809@mail.test
1810	Anggota 1810	Alamat 1810	1997-10-28	0810001810	anggota1810@mail.test
1811	Anggota 1811	Alamat 1811	1996-10-28	0810001811	anggota1811@mail.test
1812	Anggota 1812	Alamat 1812	1995-10-29	0810001812	anggota1812@mail.test
1813	Anggota 1813	Alamat 1813	1994-10-29	0810001813	anggota1813@mail.test
1814	Anggota 1814	Alamat 1814	1993-10-29	0810001814	anggota1814@mail.test
1815	Anggota 1815	Alamat 1815	1992-10-29	0810001815	anggota1815@mail.test
1816	Anggota 1816	Alamat 1816	1991-10-30	0810001816	anggota1816@mail.test
1817	Anggota 1817	Alamat 1817	1990-10-30	0810001817	anggota1817@mail.test
1818	Anggota 1818	Alamat 1818	1989-10-30	0810001818	anggota1818@mail.test
1819	Anggota 1819	Alamat 1819	1988-10-30	0810001819	anggota1819@mail.test
1820	Anggota 1820	Alamat 1820	1987-10-31	0810001820	anggota1820@mail.test
1821	Anggota 1821	Alamat 1821	1986-10-31	0810001821	anggota1821@mail.test
1822	Anggota 1822	Alamat 1822	1985-10-31	0810001822	anggota1822@mail.test
1823	Anggota 1823	Alamat 1823	1984-10-31	0810001823	anggota1823@mail.test
1824	Anggota 1824	Alamat 1824	1983-11-01	0810001824	anggota1824@mail.test
1825	Anggota 1825	Alamat 1825	1982-11-01	0810001825	anggota1825@mail.test
1826	Anggota 1826	Alamat 1826	1981-11-01	0810001826	anggota1826@mail.test
1827	Anggota 1827	Alamat 1827	1980-11-01	0810001827	anggota1827@mail.test
1828	Anggota 1828	Alamat 1828	1979-11-02	0810001828	anggota1828@mail.test
1829	Anggota 1829	Alamat 1829	1978-11-02	0810001829	anggota1829@mail.test
1830	Anggota 1830	Alamat 1830	1977-11-02	0810001830	anggota1830@mail.test
1831	Anggota 1831	Alamat 1831	1976-11-02	0810001831	anggota1831@mail.test
1832	Anggota 1832	Alamat 1832	1975-11-03	0810001832	anggota1832@mail.test
1833	Anggota 1833	Alamat 1833	1974-11-03	0810001833	anggota1833@mail.test
1834	Anggota 1834	Alamat 1834	1973-11-03	0810001834	anggota1834@mail.test
1835	Anggota 1835	Alamat 1835	1972-11-03	0810001835	anggota1835@mail.test
1836	Anggota 1836	Alamat 1836	1971-11-04	0810001836	anggota1836@mail.test
1837	Anggota 1837	Alamat 1837	1970-11-04	0810001837	anggota1837@mail.test
1838	Anggota 1838	Alamat 1838	1969-11-04	0810001838	anggota1838@mail.test
1839	Anggota 1839	Alamat 1839	1968-11-04	0810001839	anggota1839@mail.test
1840	Anggota 1840	Alamat 1840	1967-11-05	0810001840	anggota1840@mail.test
1841	Anggota 1841	Alamat 1841	1966-11-05	0810001841	anggota1841@mail.test
1842	Anggota 1842	Alamat 1842	1965-11-05	0810001842	anggota1842@mail.test
1843	Anggota 1843	Alamat 1843	1964-11-05	0810001843	anggota1843@mail.test
1844	Anggota 1844	Alamat 1844	1963-11-06	0810001844	anggota1844@mail.test
1845	Anggota 1845	Alamat 1845	1962-11-06	0810001845	anggota1845@mail.test
1846	Anggota 1846	Alamat 1846	1961-11-06	0810001846	anggota1846@mail.test
1847	Anggota 1847	Alamat 1847	1960-11-06	0810001847	anggota1847@mail.test
1848	Anggota 1848	Alamat 1848	1959-11-07	0810001848	anggota1848@mail.test
1849	Anggota 1849	Alamat 1849	1958-11-07	0810001849	anggota1849@mail.test
1850	Anggota 1850	Alamat 1850	2007-10-26	0810001850	anggota1850@mail.test
1851	Anggota 1851	Alamat 1851	2006-10-26	0810001851	anggota1851@mail.test
1852	Anggota 1852	Alamat 1852	2005-10-26	0810001852	anggota1852@mail.test
1853	Anggota 1853	Alamat 1853	2004-10-26	0810001853	anggota1853@mail.test
1854	Anggota 1854	Alamat 1854	2003-10-27	0810001854	anggota1854@mail.test
1855	Anggota 1855	Alamat 1855	2002-10-27	0810001855	anggota1855@mail.test
1856	Anggota 1856	Alamat 1856	2001-10-27	0810001856	anggota1856@mail.test
1857	Anggota 1857	Alamat 1857	2000-10-27	0810001857	anggota1857@mail.test
1858	Anggota 1858	Alamat 1858	1999-10-28	0810001858	anggota1858@mail.test
1859	Anggota 1859	Alamat 1859	1998-10-28	0810001859	anggota1859@mail.test
1860	Anggota 1860	Alamat 1860	1997-10-28	0810001860	anggota1860@mail.test
1861	Anggota 1861	Alamat 1861	1996-10-28	0810001861	anggota1861@mail.test
1862	Anggota 1862	Alamat 1862	1995-10-29	0810001862	anggota1862@mail.test
1863	Anggota 1863	Alamat 1863	1994-10-29	0810001863	anggota1863@mail.test
1864	Anggota 1864	Alamat 1864	1993-10-29	0810001864	anggota1864@mail.test
1865	Anggota 1865	Alamat 1865	1992-10-29	0810001865	anggota1865@mail.test
1866	Anggota 1866	Alamat 1866	1991-10-30	0810001866	anggota1866@mail.test
1867	Anggota 1867	Alamat 1867	1990-10-30	0810001867	anggota1867@mail.test
1868	Anggota 1868	Alamat 1868	1989-10-30	0810001868	anggota1868@mail.test
1869	Anggota 1869	Alamat 1869	1988-10-30	0810001869	anggota1869@mail.test
1870	Anggota 1870	Alamat 1870	1987-10-31	0810001870	anggota1870@mail.test
1871	Anggota 1871	Alamat 1871	1986-10-31	0810001871	anggota1871@mail.test
1872	Anggota 1872	Alamat 1872	1985-10-31	0810001872	anggota1872@mail.test
1873	Anggota 1873	Alamat 1873	1984-10-31	0810001873	anggota1873@mail.test
1874	Anggota 1874	Alamat 1874	1983-11-01	0810001874	anggota1874@mail.test
1875	Anggota 1875	Alamat 1875	1982-11-01	0810001875	anggota1875@mail.test
1876	Anggota 1876	Alamat 1876	1981-11-01	0810001876	anggota1876@mail.test
1877	Anggota 1877	Alamat 1877	1980-11-01	0810001877	anggota1877@mail.test
1878	Anggota 1878	Alamat 1878	1979-11-02	0810001878	anggota1878@mail.test
1879	Anggota 1879	Alamat 1879	1978-11-02	0810001879	anggota1879@mail.test
1880	Anggota 1880	Alamat 1880	1977-11-02	0810001880	anggota1880@mail.test
1881	Anggota 1881	Alamat 1881	1976-11-02	0810001881	anggota1881@mail.test
1882	Anggota 1882	Alamat 1882	1975-11-03	0810001882	anggota1882@mail.test
1883	Anggota 1883	Alamat 1883	1974-11-03	0810001883	anggota1883@mail.test
1884	Anggota 1884	Alamat 1884	1973-11-03	0810001884	anggota1884@mail.test
1885	Anggota 1885	Alamat 1885	1972-11-03	0810001885	anggota1885@mail.test
1886	Anggota 1886	Alamat 1886	1971-11-04	0810001886	anggota1886@mail.test
1887	Anggota 1887	Alamat 1887	1970-11-04	0810001887	anggota1887@mail.test
1888	Anggota 1888	Alamat 1888	1969-11-04	0810001888	anggota1888@mail.test
1889	Anggota 1889	Alamat 1889	1968-11-04	0810001889	anggota1889@mail.test
1890	Anggota 1890	Alamat 1890	1967-11-05	0810001890	anggota1890@mail.test
1891	Anggota 1891	Alamat 1891	1966-11-05	0810001891	anggota1891@mail.test
1892	Anggota 1892	Alamat 1892	1965-11-05	0810001892	anggota1892@mail.test
1893	Anggota 1893	Alamat 1893	1964-11-05	0810001893	anggota1893@mail.test
1894	Anggota 1894	Alamat 1894	1963-11-06	0810001894	anggota1894@mail.test
1895	Anggota 1895	Alamat 1895	1962-11-06	0810001895	anggota1895@mail.test
1896	Anggota 1896	Alamat 1896	1961-11-06	0810001896	anggota1896@mail.test
1897	Anggota 1897	Alamat 1897	1960-11-06	0810001897	anggota1897@mail.test
1898	Anggota 1898	Alamat 1898	1959-11-07	0810001898	anggota1898@mail.test
1899	Anggota 1899	Alamat 1899	1958-11-07	0810001899	anggota1899@mail.test
1900	Anggota 1900	Alamat 1900	2007-10-26	0810001900	anggota1900@mail.test
1901	Anggota 1901	Alamat 1901	2006-10-26	0810001901	anggota1901@mail.test
1902	Anggota 1902	Alamat 1902	2005-10-26	0810001902	anggota1902@mail.test
1903	Anggota 1903	Alamat 1903	2004-10-26	0810001903	anggota1903@mail.test
1904	Anggota 1904	Alamat 1904	2003-10-27	0810001904	anggota1904@mail.test
1905	Anggota 1905	Alamat 1905	2002-10-27	0810001905	anggota1905@mail.test
1906	Anggota 1906	Alamat 1906	2001-10-27	0810001906	anggota1906@mail.test
1907	Anggota 1907	Alamat 1907	2000-10-27	0810001907	anggota1907@mail.test
1908	Anggota 1908	Alamat 1908	1999-10-28	0810001908	anggota1908@mail.test
1909	Anggota 1909	Alamat 1909	1998-10-28	0810001909	anggota1909@mail.test
1910	Anggota 1910	Alamat 1910	1997-10-28	0810001910	anggota1910@mail.test
1911	Anggota 1911	Alamat 1911	1996-10-28	0810001911	anggota1911@mail.test
1912	Anggota 1912	Alamat 1912	1995-10-29	0810001912	anggota1912@mail.test
1913	Anggota 1913	Alamat 1913	1994-10-29	0810001913	anggota1913@mail.test
1914	Anggota 1914	Alamat 1914	1993-10-29	0810001914	anggota1914@mail.test
1915	Anggota 1915	Alamat 1915	1992-10-29	0810001915	anggota1915@mail.test
1916	Anggota 1916	Alamat 1916	1991-10-30	0810001916	anggota1916@mail.test
1917	Anggota 1917	Alamat 1917	1990-10-30	0810001917	anggota1917@mail.test
1918	Anggota 1918	Alamat 1918	1989-10-30	0810001918	anggota1918@mail.test
1919	Anggota 1919	Alamat 1919	1988-10-30	0810001919	anggota1919@mail.test
1920	Anggota 1920	Alamat 1920	1987-10-31	0810001920	anggota1920@mail.test
1921	Anggota 1921	Alamat 1921	1986-10-31	0810001921	anggota1921@mail.test
1922	Anggota 1922	Alamat 1922	1985-10-31	0810001922	anggota1922@mail.test
1923	Anggota 1923	Alamat 1923	1984-10-31	0810001923	anggota1923@mail.test
1924	Anggota 1924	Alamat 1924	1983-11-01	0810001924	anggota1924@mail.test
1925	Anggota 1925	Alamat 1925	1982-11-01	0810001925	anggota1925@mail.test
1926	Anggota 1926	Alamat 1926	1981-11-01	0810001926	anggota1926@mail.test
1927	Anggota 1927	Alamat 1927	1980-11-01	0810001927	anggota1927@mail.test
1928	Anggota 1928	Alamat 1928	1979-11-02	0810001928	anggota1928@mail.test
1929	Anggota 1929	Alamat 1929	1978-11-02	0810001929	anggota1929@mail.test
1930	Anggota 1930	Alamat 1930	1977-11-02	0810001930	anggota1930@mail.test
1931	Anggota 1931	Alamat 1931	1976-11-02	0810001931	anggota1931@mail.test
1932	Anggota 1932	Alamat 1932	1975-11-03	0810001932	anggota1932@mail.test
1933	Anggota 1933	Alamat 1933	1974-11-03	0810001933	anggota1933@mail.test
1934	Anggota 1934	Alamat 1934	1973-11-03	0810001934	anggota1934@mail.test
1935	Anggota 1935	Alamat 1935	1972-11-03	0810001935	anggota1935@mail.test
1936	Anggota 1936	Alamat 1936	1971-11-04	0810001936	anggota1936@mail.test
1937	Anggota 1937	Alamat 1937	1970-11-04	0810001937	anggota1937@mail.test
1938	Anggota 1938	Alamat 1938	1969-11-04	0810001938	anggota1938@mail.test
1939	Anggota 1939	Alamat 1939	1968-11-04	0810001939	anggota1939@mail.test
1940	Anggota 1940	Alamat 1940	1967-11-05	0810001940	anggota1940@mail.test
1941	Anggota 1941	Alamat 1941	1966-11-05	0810001941	anggota1941@mail.test
1942	Anggota 1942	Alamat 1942	1965-11-05	0810001942	anggota1942@mail.test
1943	Anggota 1943	Alamat 1943	1964-11-05	0810001943	anggota1943@mail.test
1944	Anggota 1944	Alamat 1944	1963-11-06	0810001944	anggota1944@mail.test
1945	Anggota 1945	Alamat 1945	1962-11-06	0810001945	anggota1945@mail.test
1946	Anggota 1946	Alamat 1946	1961-11-06	0810001946	anggota1946@mail.test
1947	Anggota 1947	Alamat 1947	1960-11-06	0810001947	anggota1947@mail.test
1948	Anggota 1948	Alamat 1948	1959-11-07	0810001948	anggota1948@mail.test
1949	Anggota 1949	Alamat 1949	1958-11-07	0810001949	anggota1949@mail.test
1950	Anggota 1950	Alamat 1950	2007-10-26	0810001950	anggota1950@mail.test
1951	Anggota 1951	Alamat 1951	2006-10-26	0810001951	anggota1951@mail.test
1952	Anggota 1952	Alamat 1952	2005-10-26	0810001952	anggota1952@mail.test
1953	Anggota 1953	Alamat 1953	2004-10-26	0810001953	anggota1953@mail.test
1954	Anggota 1954	Alamat 1954	2003-10-27	0810001954	anggota1954@mail.test
1955	Anggota 1955	Alamat 1955	2002-10-27	0810001955	anggota1955@mail.test
1956	Anggota 1956	Alamat 1956	2001-10-27	0810001956	anggota1956@mail.test
1957	Anggota 1957	Alamat 1957	2000-10-27	0810001957	anggota1957@mail.test
1958	Anggota 1958	Alamat 1958	1999-10-28	0810001958	anggota1958@mail.test
1959	Anggota 1959	Alamat 1959	1998-10-28	0810001959	anggota1959@mail.test
1960	Anggota 1960	Alamat 1960	1997-10-28	0810001960	anggota1960@mail.test
1961	Anggota 1961	Alamat 1961	1996-10-28	0810001961	anggota1961@mail.test
1962	Anggota 1962	Alamat 1962	1995-10-29	0810001962	anggota1962@mail.test
1963	Anggota 1963	Alamat 1963	1994-10-29	0810001963	anggota1963@mail.test
1964	Anggota 1964	Alamat 1964	1993-10-29	0810001964	anggota1964@mail.test
1965	Anggota 1965	Alamat 1965	1992-10-29	0810001965	anggota1965@mail.test
1966	Anggota 1966	Alamat 1966	1991-10-30	0810001966	anggota1966@mail.test
1967	Anggota 1967	Alamat 1967	1990-10-30	0810001967	anggota1967@mail.test
1968	Anggota 1968	Alamat 1968	1989-10-30	0810001968	anggota1968@mail.test
1969	Anggota 1969	Alamat 1969	1988-10-30	0810001969	anggota1969@mail.test
1970	Anggota 1970	Alamat 1970	1987-10-31	0810001970	anggota1970@mail.test
1971	Anggota 1971	Alamat 1971	1986-10-31	0810001971	anggota1971@mail.test
1972	Anggota 1972	Alamat 1972	1985-10-31	0810001972	anggota1972@mail.test
1973	Anggota 1973	Alamat 1973	1984-10-31	0810001973	anggota1973@mail.test
1974	Anggota 1974	Alamat 1974	1983-11-01	0810001974	anggota1974@mail.test
1975	Anggota 1975	Alamat 1975	1982-11-01	0810001975	anggota1975@mail.test
1976	Anggota 1976	Alamat 1976	1981-11-01	0810001976	anggota1976@mail.test
1977	Anggota 1977	Alamat 1977	1980-11-01	0810001977	anggota1977@mail.test
1978	Anggota 1978	Alamat 1978	1979-11-02	0810001978	anggota1978@mail.test
1979	Anggota 1979	Alamat 1979	1978-11-02	0810001979	anggota1979@mail.test
1980	Anggota 1980	Alamat 1980	1977-11-02	0810001980	anggota1980@mail.test
1981	Anggota 1981	Alamat 1981	1976-11-02	0810001981	anggota1981@mail.test
1982	Anggota 1982	Alamat 1982	1975-11-03	0810001982	anggota1982@mail.test
1983	Anggota 1983	Alamat 1983	1974-11-03	0810001983	anggota1983@mail.test
1984	Anggota 1984	Alamat 1984	1973-11-03	0810001984	anggota1984@mail.test
1985	Anggota 1985	Alamat 1985	1972-11-03	0810001985	anggota1985@mail.test
1986	Anggota 1986	Alamat 1986	1971-11-04	0810001986	anggota1986@mail.test
1987	Anggota 1987	Alamat 1987	1970-11-04	0810001987	anggota1987@mail.test
1988	Anggota 1988	Alamat 1988	1969-11-04	0810001988	anggota1988@mail.test
1989	Anggota 1989	Alamat 1989	1968-11-04	0810001989	anggota1989@mail.test
1990	Anggota 1990	Alamat 1990	1967-11-05	0810001990	anggota1990@mail.test
1991	Anggota 1991	Alamat 1991	1966-11-05	0810001991	anggota1991@mail.test
1992	Anggota 1992	Alamat 1992	1965-11-05	0810001992	anggota1992@mail.test
1993	Anggota 1993	Alamat 1993	1964-11-05	0810001993	anggota1993@mail.test
1994	Anggota 1994	Alamat 1994	1963-11-06	0810001994	anggota1994@mail.test
1995	Anggota 1995	Alamat 1995	1962-11-06	0810001995	anggota1995@mail.test
1996	Anggota 1996	Alamat 1996	1961-11-06	0810001996	anggota1996@mail.test
1997	Anggota 1997	Alamat 1997	1960-11-06	0810001997	anggota1997@mail.test
1998	Anggota 1998	Alamat 1998	1959-11-07	0810001998	anggota1998@mail.test
1999	Anggota 1999	Alamat 1999	1958-11-07	0810001999	anggota1999@mail.test
2000	Anggota 2000	Alamat 2000	2007-10-26	0810002000	anggota2000@mail.test
\.


--
-- TOC entry 5008 (class 0 OID 17501)
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
101	1000000000101	Judul Buku 101	0
102	1000000000102	Judul Buku 102	0
103	1000000000103	Judul Buku 103	0
104	1000000000104	Judul Buku 104	0
105	1000000000105	Judul Buku 105	0
106	1000000000106	Judul Buku 106	0
107	1000000000107	Judul Buku 107	0
108	1000000000108	Judul Buku 108	0
109	1000000000109	Judul Buku 109	0
110	1000000000110	Judul Buku 110	0
111	1000000000111	Judul Buku 111	0
112	1000000000112	Judul Buku 112	0
113	1000000000113	Judul Buku 113	0
114	1000000000114	Judul Buku 114	0
115	1000000000115	Judul Buku 115	0
116	1000000000116	Judul Buku 116	0
117	1000000000117	Judul Buku 117	0
118	1000000000118	Judul Buku 118	0
119	1000000000119	Judul Buku 119	0
120	1000000000120	Judul Buku 120	0
121	1000000000121	Judul Buku 121	0
122	1000000000122	Judul Buku 122	0
123	1000000000123	Judul Buku 123	0
124	1000000000124	Judul Buku 124	0
125	1000000000125	Judul Buku 125	0
126	1000000000126	Judul Buku 126	0
127	1000000000127	Judul Buku 127	0
128	1000000000128	Judul Buku 128	0
129	1000000000129	Judul Buku 129	0
130	1000000000130	Judul Buku 130	0
131	1000000000131	Judul Buku 131	0
132	1000000000132	Judul Buku 132	0
133	1000000000133	Judul Buku 133	0
134	1000000000134	Judul Buku 134	0
135	1000000000135	Judul Buku 135	0
136	1000000000136	Judul Buku 136	0
137	1000000000137	Judul Buku 137	0
138	1000000000138	Judul Buku 138	0
139	1000000000139	Judul Buku 139	0
140	1000000000140	Judul Buku 140	0
141	1000000000141	Judul Buku 141	0
142	1000000000142	Judul Buku 142	0
143	1000000000143	Judul Buku 143	0
144	1000000000144	Judul Buku 144	0
145	1000000000145	Judul Buku 145	0
146	1000000000146	Judul Buku 146	0
147	1000000000147	Judul Buku 147	0
148	1000000000148	Judul Buku 148	0
149	1000000000149	Judul Buku 149	0
150	1000000000150	Judul Buku 150	0
151	1000000000151	Judul Buku 151	0
152	1000000000152	Judul Buku 152	0
153	1000000000153	Judul Buku 153	0
154	1000000000154	Judul Buku 154	0
155	1000000000155	Judul Buku 155	0
156	1000000000156	Judul Buku 156	0
157	1000000000157	Judul Buku 157	0
158	1000000000158	Judul Buku 158	0
159	1000000000159	Judul Buku 159	0
160	1000000000160	Judul Buku 160	0
161	1000000000161	Judul Buku 161	0
162	1000000000162	Judul Buku 162	0
163	1000000000163	Judul Buku 163	0
164	1000000000164	Judul Buku 164	0
165	1000000000165	Judul Buku 165	0
166	1000000000166	Judul Buku 166	0
167	1000000000167	Judul Buku 167	0
168	1000000000168	Judul Buku 168	0
169	1000000000169	Judul Buku 169	0
170	1000000000170	Judul Buku 170	0
171	1000000000171	Judul Buku 171	0
172	1000000000172	Judul Buku 172	0
173	1000000000173	Judul Buku 173	0
174	1000000000174	Judul Buku 174	0
175	1000000000175	Judul Buku 175	0
176	1000000000176	Judul Buku 176	0
177	1000000000177	Judul Buku 177	0
178	1000000000178	Judul Buku 178	0
179	1000000000179	Judul Buku 179	0
180	1000000000180	Judul Buku 180	0
181	1000000000181	Judul Buku 181	0
182	1000000000182	Judul Buku 182	0
183	1000000000183	Judul Buku 183	0
184	1000000000184	Judul Buku 184	0
185	1000000000185	Judul Buku 185	0
186	1000000000186	Judul Buku 186	0
187	1000000000187	Judul Buku 187	0
188	1000000000188	Judul Buku 188	0
189	1000000000189	Judul Buku 189	0
190	1000000000190	Judul Buku 190	0
191	1000000000191	Judul Buku 191	0
192	1000000000192	Judul Buku 192	0
193	1000000000193	Judul Buku 193	0
194	1000000000194	Judul Buku 194	0
195	1000000000195	Judul Buku 195	0
196	1000000000196	Judul Buku 196	0
197	1000000000197	Judul Buku 197	0
198	1000000000198	Judul Buku 198	0
199	1000000000199	Judul Buku 199	0
200	1000000000200	Judul Buku 200	0
201	1000000000201	Judul Buku 201	0
202	1000000000202	Judul Buku 202	0
203	1000000000203	Judul Buku 203	0
204	1000000000204	Judul Buku 204	0
205	1000000000205	Judul Buku 205	0
206	1000000000206	Judul Buku 206	0
207	1000000000207	Judul Buku 207	0
208	1000000000208	Judul Buku 208	0
209	1000000000209	Judul Buku 209	0
210	1000000000210	Judul Buku 210	0
211	1000000000211	Judul Buku 211	0
212	1000000000212	Judul Buku 212	0
213	1000000000213	Judul Buku 213	0
214	1000000000214	Judul Buku 214	0
215	1000000000215	Judul Buku 215	0
216	1000000000216	Judul Buku 216	0
217	1000000000217	Judul Buku 217	0
218	1000000000218	Judul Buku 218	0
219	1000000000219	Judul Buku 219	0
220	1000000000220	Judul Buku 220	0
221	1000000000221	Judul Buku 221	0
222	1000000000222	Judul Buku 222	0
223	1000000000223	Judul Buku 223	0
224	1000000000224	Judul Buku 224	0
225	1000000000225	Judul Buku 225	0
226	1000000000226	Judul Buku 226	0
227	1000000000227	Judul Buku 227	0
228	1000000000228	Judul Buku 228	0
229	1000000000229	Judul Buku 229	0
230	1000000000230	Judul Buku 230	0
231	1000000000231	Judul Buku 231	0
232	1000000000232	Judul Buku 232	0
233	1000000000233	Judul Buku 233	0
234	1000000000234	Judul Buku 234	0
235	1000000000235	Judul Buku 235	0
236	1000000000236	Judul Buku 236	0
237	1000000000237	Judul Buku 237	0
238	1000000000238	Judul Buku 238	0
239	1000000000239	Judul Buku 239	0
240	1000000000240	Judul Buku 240	0
241	1000000000241	Judul Buku 241	0
242	1000000000242	Judul Buku 242	0
243	1000000000243	Judul Buku 243	0
244	1000000000244	Judul Buku 244	0
245	1000000000245	Judul Buku 245	0
246	1000000000246	Judul Buku 246	0
247	1000000000247	Judul Buku 247	0
248	1000000000248	Judul Buku 248	0
249	1000000000249	Judul Buku 249	0
250	1000000000250	Judul Buku 250	0
251	1000000000251	Judul Buku 251	0
252	1000000000252	Judul Buku 252	0
253	1000000000253	Judul Buku 253	0
254	1000000000254	Judul Buku 254	0
255	1000000000255	Judul Buku 255	0
256	1000000000256	Judul Buku 256	0
257	1000000000257	Judul Buku 257	0
258	1000000000258	Judul Buku 258	0
259	1000000000259	Judul Buku 259	0
260	1000000000260	Judul Buku 260	0
261	1000000000261	Judul Buku 261	0
262	1000000000262	Judul Buku 262	0
263	1000000000263	Judul Buku 263	0
264	1000000000264	Judul Buku 264	0
265	1000000000265	Judul Buku 265	0
266	1000000000266	Judul Buku 266	0
267	1000000000267	Judul Buku 267	0
268	1000000000268	Judul Buku 268	0
269	1000000000269	Judul Buku 269	0
270	1000000000270	Judul Buku 270	0
271	1000000000271	Judul Buku 271	0
272	1000000000272	Judul Buku 272	0
273	1000000000273	Judul Buku 273	0
274	1000000000274	Judul Buku 274	0
275	1000000000275	Judul Buku 275	0
276	1000000000276	Judul Buku 276	0
277	1000000000277	Judul Buku 277	0
278	1000000000278	Judul Buku 278	0
279	1000000000279	Judul Buku 279	0
280	1000000000280	Judul Buku 280	0
281	1000000000281	Judul Buku 281	0
282	1000000000282	Judul Buku 282	0
283	1000000000283	Judul Buku 283	0
284	1000000000284	Judul Buku 284	0
285	1000000000285	Judul Buku 285	0
286	1000000000286	Judul Buku 286	0
287	1000000000287	Judul Buku 287	0
288	1000000000288	Judul Buku 288	0
289	1000000000289	Judul Buku 289	0
290	1000000000290	Judul Buku 290	0
291	1000000000291	Judul Buku 291	0
292	1000000000292	Judul Buku 292	0
293	1000000000293	Judul Buku 293	0
294	1000000000294	Judul Buku 294	0
295	1000000000295	Judul Buku 295	0
296	1000000000296	Judul Buku 296	0
297	1000000000297	Judul Buku 297	0
298	1000000000298	Judul Buku 298	0
299	1000000000299	Judul Buku 299	0
300	1000000000300	Judul Buku 300	0
301	1000000000301	Judul Buku 301	0
302	1000000000302	Judul Buku 302	0
303	1000000000303	Judul Buku 303	0
304	1000000000304	Judul Buku 304	0
305	1000000000305	Judul Buku 305	0
306	1000000000306	Judul Buku 306	0
307	1000000000307	Judul Buku 307	0
308	1000000000308	Judul Buku 308	0
309	1000000000309	Judul Buku 309	0
310	1000000000310	Judul Buku 310	0
311	1000000000311	Judul Buku 311	0
312	1000000000312	Judul Buku 312	0
313	1000000000313	Judul Buku 313	0
314	1000000000314	Judul Buku 314	0
315	1000000000315	Judul Buku 315	0
316	1000000000316	Judul Buku 316	0
317	1000000000317	Judul Buku 317	0
318	1000000000318	Judul Buku 318	0
319	1000000000319	Judul Buku 319	0
320	1000000000320	Judul Buku 320	0
321	1000000000321	Judul Buku 321	0
322	1000000000322	Judul Buku 322	0
323	1000000000323	Judul Buku 323	0
324	1000000000324	Judul Buku 324	0
325	1000000000325	Judul Buku 325	0
326	1000000000326	Judul Buku 326	0
327	1000000000327	Judul Buku 327	0
328	1000000000328	Judul Buku 328	0
329	1000000000329	Judul Buku 329	0
330	1000000000330	Judul Buku 330	0
331	1000000000331	Judul Buku 331	0
332	1000000000332	Judul Buku 332	0
333	1000000000333	Judul Buku 333	0
334	1000000000334	Judul Buku 334	0
335	1000000000335	Judul Buku 335	0
336	1000000000336	Judul Buku 336	0
337	1000000000337	Judul Buku 337	0
338	1000000000338	Judul Buku 338	0
339	1000000000339	Judul Buku 339	0
340	1000000000340	Judul Buku 340	0
341	1000000000341	Judul Buku 341	0
342	1000000000342	Judul Buku 342	0
343	1000000000343	Judul Buku 343	0
344	1000000000344	Judul Buku 344	0
345	1000000000345	Judul Buku 345	0
346	1000000000346	Judul Buku 346	0
347	1000000000347	Judul Buku 347	0
348	1000000000348	Judul Buku 348	0
349	1000000000349	Judul Buku 349	0
350	1000000000350	Judul Buku 350	0
351	1000000000351	Judul Buku 351	0
352	1000000000352	Judul Buku 352	0
353	1000000000353	Judul Buku 353	0
354	1000000000354	Judul Buku 354	0
355	1000000000355	Judul Buku 355	0
356	1000000000356	Judul Buku 356	0
357	1000000000357	Judul Buku 357	0
358	1000000000358	Judul Buku 358	0
359	1000000000359	Judul Buku 359	0
360	1000000000360	Judul Buku 360	0
361	1000000000361	Judul Buku 361	0
362	1000000000362	Judul Buku 362	0
363	1000000000363	Judul Buku 363	0
364	1000000000364	Judul Buku 364	0
365	1000000000365	Judul Buku 365	0
366	1000000000366	Judul Buku 366	0
367	1000000000367	Judul Buku 367	0
368	1000000000368	Judul Buku 368	0
369	1000000000369	Judul Buku 369	0
370	1000000000370	Judul Buku 370	0
371	1000000000371	Judul Buku 371	0
372	1000000000372	Judul Buku 372	0
373	1000000000373	Judul Buku 373	0
374	1000000000374	Judul Buku 374	0
375	1000000000375	Judul Buku 375	0
376	1000000000376	Judul Buku 376	0
377	1000000000377	Judul Buku 377	0
378	1000000000378	Judul Buku 378	0
379	1000000000379	Judul Buku 379	0
380	1000000000380	Judul Buku 380	0
381	1000000000381	Judul Buku 381	0
382	1000000000382	Judul Buku 382	0
383	1000000000383	Judul Buku 383	0
384	1000000000384	Judul Buku 384	0
385	1000000000385	Judul Buku 385	0
386	1000000000386	Judul Buku 386	0
387	1000000000387	Judul Buku 387	0
388	1000000000388	Judul Buku 388	0
389	1000000000389	Judul Buku 389	0
390	1000000000390	Judul Buku 390	0
391	1000000000391	Judul Buku 391	0
392	1000000000392	Judul Buku 392	0
393	1000000000393	Judul Buku 393	0
394	1000000000394	Judul Buku 394	0
395	1000000000395	Judul Buku 395	0
396	1000000000396	Judul Buku 396	0
397	1000000000397	Judul Buku 397	0
398	1000000000398	Judul Buku 398	0
399	1000000000399	Judul Buku 399	0
400	1000000000400	Judul Buku 400	0
401	1000000000401	Judul Buku 401	0
402	1000000000402	Judul Buku 402	0
403	1000000000403	Judul Buku 403	0
404	1000000000404	Judul Buku 404	0
405	1000000000405	Judul Buku 405	0
406	1000000000406	Judul Buku 406	0
407	1000000000407	Judul Buku 407	0
408	1000000000408	Judul Buku 408	0
409	1000000000409	Judul Buku 409	0
410	1000000000410	Judul Buku 410	0
411	1000000000411	Judul Buku 411	0
412	1000000000412	Judul Buku 412	0
413	1000000000413	Judul Buku 413	0
414	1000000000414	Judul Buku 414	0
415	1000000000415	Judul Buku 415	0
416	1000000000416	Judul Buku 416	0
417	1000000000417	Judul Buku 417	0
418	1000000000418	Judul Buku 418	0
419	1000000000419	Judul Buku 419	0
420	1000000000420	Judul Buku 420	0
421	1000000000421	Judul Buku 421	0
422	1000000000422	Judul Buku 422	0
423	1000000000423	Judul Buku 423	0
424	1000000000424	Judul Buku 424	0
425	1000000000425	Judul Buku 425	0
426	1000000000426	Judul Buku 426	0
427	1000000000427	Judul Buku 427	0
428	1000000000428	Judul Buku 428	0
429	1000000000429	Judul Buku 429	0
430	1000000000430	Judul Buku 430	0
431	1000000000431	Judul Buku 431	0
432	1000000000432	Judul Buku 432	0
433	1000000000433	Judul Buku 433	0
434	1000000000434	Judul Buku 434	0
435	1000000000435	Judul Buku 435	0
436	1000000000436	Judul Buku 436	0
437	1000000000437	Judul Buku 437	0
438	1000000000438	Judul Buku 438	0
439	1000000000439	Judul Buku 439	0
440	1000000000440	Judul Buku 440	0
441	1000000000441	Judul Buku 441	0
442	1000000000442	Judul Buku 442	0
443	1000000000443	Judul Buku 443	0
444	1000000000444	Judul Buku 444	0
445	1000000000445	Judul Buku 445	0
446	1000000000446	Judul Buku 446	0
447	1000000000447	Judul Buku 447	0
448	1000000000448	Judul Buku 448	0
449	1000000000449	Judul Buku 449	0
450	1000000000450	Judul Buku 450	0
451	1000000000451	Judul Buku 451	0
452	1000000000452	Judul Buku 452	0
453	1000000000453	Judul Buku 453	0
454	1000000000454	Judul Buku 454	0
455	1000000000455	Judul Buku 455	0
456	1000000000456	Judul Buku 456	0
457	1000000000457	Judul Buku 457	0
458	1000000000458	Judul Buku 458	0
459	1000000000459	Judul Buku 459	0
460	1000000000460	Judul Buku 460	0
461	1000000000461	Judul Buku 461	0
462	1000000000462	Judul Buku 462	0
463	1000000000463	Judul Buku 463	0
464	1000000000464	Judul Buku 464	0
465	1000000000465	Judul Buku 465	0
466	1000000000466	Judul Buku 466	0
467	1000000000467	Judul Buku 467	0
468	1000000000468	Judul Buku 468	0
469	1000000000469	Judul Buku 469	0
470	1000000000470	Judul Buku 470	0
471	1000000000471	Judul Buku 471	0
472	1000000000472	Judul Buku 472	0
473	1000000000473	Judul Buku 473	0
474	1000000000474	Judul Buku 474	0
475	1000000000475	Judul Buku 475	0
476	1000000000476	Judul Buku 476	0
477	1000000000477	Judul Buku 477	0
478	1000000000478	Judul Buku 478	0
479	1000000000479	Judul Buku 479	0
480	1000000000480	Judul Buku 480	0
481	1000000000481	Judul Buku 481	0
482	1000000000482	Judul Buku 482	0
483	1000000000483	Judul Buku 483	0
484	1000000000484	Judul Buku 484	0
485	1000000000485	Judul Buku 485	0
486	1000000000486	Judul Buku 486	0
487	1000000000487	Judul Buku 487	0
488	1000000000488	Judul Buku 488	0
489	1000000000489	Judul Buku 489	0
490	1000000000490	Judul Buku 490	0
491	1000000000491	Judul Buku 491	0
492	1000000000492	Judul Buku 492	0
493	1000000000493	Judul Buku 493	0
494	1000000000494	Judul Buku 494	0
495	1000000000495	Judul Buku 495	0
496	1000000000496	Judul Buku 496	0
497	1000000000497	Judul Buku 497	0
498	1000000000498	Judul Buku 498	0
499	1000000000499	Judul Buku 499	0
500	1000000000500	Judul Buku 500	0
501	1000000000501	Judul Buku 501	0
502	1000000000502	Judul Buku 502	0
503	1000000000503	Judul Buku 503	0
504	1000000000504	Judul Buku 504	0
505	1000000000505	Judul Buku 505	0
506	1000000000506	Judul Buku 506	0
507	1000000000507	Judul Buku 507	0
508	1000000000508	Judul Buku 508	0
509	1000000000509	Judul Buku 509	0
510	1000000000510	Judul Buku 510	0
511	1000000000511	Judul Buku 511	0
512	1000000000512	Judul Buku 512	0
513	1000000000513	Judul Buku 513	0
514	1000000000514	Judul Buku 514	0
515	1000000000515	Judul Buku 515	0
516	1000000000516	Judul Buku 516	0
517	1000000000517	Judul Buku 517	0
518	1000000000518	Judul Buku 518	0
519	1000000000519	Judul Buku 519	0
520	1000000000520	Judul Buku 520	0
521	1000000000521	Judul Buku 521	0
522	1000000000522	Judul Buku 522	0
523	1000000000523	Judul Buku 523	0
524	1000000000524	Judul Buku 524	0
525	1000000000525	Judul Buku 525	0
526	1000000000526	Judul Buku 526	0
527	1000000000527	Judul Buku 527	0
528	1000000000528	Judul Buku 528	0
529	1000000000529	Judul Buku 529	0
530	1000000000530	Judul Buku 530	0
531	1000000000531	Judul Buku 531	0
532	1000000000532	Judul Buku 532	0
533	1000000000533	Judul Buku 533	0
534	1000000000534	Judul Buku 534	0
535	1000000000535	Judul Buku 535	0
536	1000000000536	Judul Buku 536	0
537	1000000000537	Judul Buku 537	0
538	1000000000538	Judul Buku 538	0
539	1000000000539	Judul Buku 539	0
540	1000000000540	Judul Buku 540	0
541	1000000000541	Judul Buku 541	0
542	1000000000542	Judul Buku 542	0
543	1000000000543	Judul Buku 543	0
544	1000000000544	Judul Buku 544	0
545	1000000000545	Judul Buku 545	0
546	1000000000546	Judul Buku 546	0
547	1000000000547	Judul Buku 547	0
548	1000000000548	Judul Buku 548	0
549	1000000000549	Judul Buku 549	0
550	1000000000550	Judul Buku 550	0
551	1000000000551	Judul Buku 551	0
552	1000000000552	Judul Buku 552	0
553	1000000000553	Judul Buku 553	0
554	1000000000554	Judul Buku 554	0
555	1000000000555	Judul Buku 555	0
556	1000000000556	Judul Buku 556	0
557	1000000000557	Judul Buku 557	0
558	1000000000558	Judul Buku 558	0
559	1000000000559	Judul Buku 559	0
560	1000000000560	Judul Buku 560	0
561	1000000000561	Judul Buku 561	0
562	1000000000562	Judul Buku 562	0
563	1000000000563	Judul Buku 563	0
564	1000000000564	Judul Buku 564	0
565	1000000000565	Judul Buku 565	0
566	1000000000566	Judul Buku 566	0
567	1000000000567	Judul Buku 567	0
568	1000000000568	Judul Buku 568	0
569	1000000000569	Judul Buku 569	0
570	1000000000570	Judul Buku 570	0
571	1000000000571	Judul Buku 571	0
572	1000000000572	Judul Buku 572	0
573	1000000000573	Judul Buku 573	0
574	1000000000574	Judul Buku 574	0
575	1000000000575	Judul Buku 575	0
576	1000000000576	Judul Buku 576	0
577	1000000000577	Judul Buku 577	0
578	1000000000578	Judul Buku 578	0
579	1000000000579	Judul Buku 579	0
580	1000000000580	Judul Buku 580	0
581	1000000000581	Judul Buku 581	0
582	1000000000582	Judul Buku 582	0
583	1000000000583	Judul Buku 583	0
584	1000000000584	Judul Buku 584	0
585	1000000000585	Judul Buku 585	0
586	1000000000586	Judul Buku 586	0
587	1000000000587	Judul Buku 587	0
588	1000000000588	Judul Buku 588	0
589	1000000000589	Judul Buku 589	0
590	1000000000590	Judul Buku 590	0
591	1000000000591	Judul Buku 591	0
592	1000000000592	Judul Buku 592	0
593	1000000000593	Judul Buku 593	0
594	1000000000594	Judul Buku 594	0
595	1000000000595	Judul Buku 595	0
596	1000000000596	Judul Buku 596	0
597	1000000000597	Judul Buku 597	0
598	1000000000598	Judul Buku 598	0
599	1000000000599	Judul Buku 599	0
600	1000000000600	Judul Buku 600	0
601	1000000000601	Judul Buku 601	0
602	1000000000602	Judul Buku 602	0
603	1000000000603	Judul Buku 603	0
604	1000000000604	Judul Buku 604	0
605	1000000000605	Judul Buku 605	0
606	1000000000606	Judul Buku 606	0
607	1000000000607	Judul Buku 607	0
608	1000000000608	Judul Buku 608	0
609	1000000000609	Judul Buku 609	0
610	1000000000610	Judul Buku 610	0
611	1000000000611	Judul Buku 611	0
612	1000000000612	Judul Buku 612	0
613	1000000000613	Judul Buku 613	0
614	1000000000614	Judul Buku 614	0
615	1000000000615	Judul Buku 615	0
616	1000000000616	Judul Buku 616	0
617	1000000000617	Judul Buku 617	0
618	1000000000618	Judul Buku 618	0
619	1000000000619	Judul Buku 619	0
620	1000000000620	Judul Buku 620	0
621	1000000000621	Judul Buku 621	0
622	1000000000622	Judul Buku 622	0
623	1000000000623	Judul Buku 623	0
624	1000000000624	Judul Buku 624	0
625	1000000000625	Judul Buku 625	0
626	1000000000626	Judul Buku 626	0
627	1000000000627	Judul Buku 627	0
628	1000000000628	Judul Buku 628	0
629	1000000000629	Judul Buku 629	0
630	1000000000630	Judul Buku 630	0
631	1000000000631	Judul Buku 631	0
632	1000000000632	Judul Buku 632	0
633	1000000000633	Judul Buku 633	0
634	1000000000634	Judul Buku 634	0
635	1000000000635	Judul Buku 635	0
636	1000000000636	Judul Buku 636	0
637	1000000000637	Judul Buku 637	0
638	1000000000638	Judul Buku 638	0
639	1000000000639	Judul Buku 639	0
640	1000000000640	Judul Buku 640	0
641	1000000000641	Judul Buku 641	0
642	1000000000642	Judul Buku 642	0
643	1000000000643	Judul Buku 643	0
644	1000000000644	Judul Buku 644	0
645	1000000000645	Judul Buku 645	0
646	1000000000646	Judul Buku 646	0
647	1000000000647	Judul Buku 647	0
648	1000000000648	Judul Buku 648	0
649	1000000000649	Judul Buku 649	0
650	1000000000650	Judul Buku 650	0
651	1000000000651	Judul Buku 651	0
652	1000000000652	Judul Buku 652	0
653	1000000000653	Judul Buku 653	0
654	1000000000654	Judul Buku 654	0
655	1000000000655	Judul Buku 655	0
656	1000000000656	Judul Buku 656	0
657	1000000000657	Judul Buku 657	0
658	1000000000658	Judul Buku 658	0
659	1000000000659	Judul Buku 659	0
660	1000000000660	Judul Buku 660	0
661	1000000000661	Judul Buku 661	0
662	1000000000662	Judul Buku 662	0
663	1000000000663	Judul Buku 663	0
664	1000000000664	Judul Buku 664	0
665	1000000000665	Judul Buku 665	0
666	1000000000666	Judul Buku 666	0
667	1000000000667	Judul Buku 667	0
668	1000000000668	Judul Buku 668	0
669	1000000000669	Judul Buku 669	0
670	1000000000670	Judul Buku 670	0
671	1000000000671	Judul Buku 671	0
672	1000000000672	Judul Buku 672	0
673	1000000000673	Judul Buku 673	0
674	1000000000674	Judul Buku 674	0
675	1000000000675	Judul Buku 675	0
676	1000000000676	Judul Buku 676	0
677	1000000000677	Judul Buku 677	0
678	1000000000678	Judul Buku 678	0
679	1000000000679	Judul Buku 679	0
680	1000000000680	Judul Buku 680	0
681	1000000000681	Judul Buku 681	0
682	1000000000682	Judul Buku 682	0
683	1000000000683	Judul Buku 683	0
684	1000000000684	Judul Buku 684	0
685	1000000000685	Judul Buku 685	0
686	1000000000686	Judul Buku 686	0
687	1000000000687	Judul Buku 687	0
688	1000000000688	Judul Buku 688	0
689	1000000000689	Judul Buku 689	0
690	1000000000690	Judul Buku 690	0
691	1000000000691	Judul Buku 691	0
692	1000000000692	Judul Buku 692	0
693	1000000000693	Judul Buku 693	0
694	1000000000694	Judul Buku 694	0
695	1000000000695	Judul Buku 695	0
696	1000000000696	Judul Buku 696	0
697	1000000000697	Judul Buku 697	0
698	1000000000698	Judul Buku 698	0
699	1000000000699	Judul Buku 699	0
700	1000000000700	Judul Buku 700	0
701	1000000000701	Judul Buku 701	0
702	1000000000702	Judul Buku 702	0
703	1000000000703	Judul Buku 703	0
704	1000000000704	Judul Buku 704	0
705	1000000000705	Judul Buku 705	0
706	1000000000706	Judul Buku 706	0
707	1000000000707	Judul Buku 707	0
708	1000000000708	Judul Buku 708	0
709	1000000000709	Judul Buku 709	0
710	1000000000710	Judul Buku 710	0
711	1000000000711	Judul Buku 711	0
712	1000000000712	Judul Buku 712	0
713	1000000000713	Judul Buku 713	0
714	1000000000714	Judul Buku 714	0
715	1000000000715	Judul Buku 715	0
716	1000000000716	Judul Buku 716	0
717	1000000000717	Judul Buku 717	0
718	1000000000718	Judul Buku 718	0
719	1000000000719	Judul Buku 719	0
720	1000000000720	Judul Buku 720	0
721	1000000000721	Judul Buku 721	0
722	1000000000722	Judul Buku 722	0
723	1000000000723	Judul Buku 723	0
724	1000000000724	Judul Buku 724	0
725	1000000000725	Judul Buku 725	0
726	1000000000726	Judul Buku 726	0
727	1000000000727	Judul Buku 727	0
728	1000000000728	Judul Buku 728	0
729	1000000000729	Judul Buku 729	0
730	1000000000730	Judul Buku 730	0
731	1000000000731	Judul Buku 731	0
732	1000000000732	Judul Buku 732	0
733	1000000000733	Judul Buku 733	0
734	1000000000734	Judul Buku 734	0
735	1000000000735	Judul Buku 735	0
736	1000000000736	Judul Buku 736	0
737	1000000000737	Judul Buku 737	0
738	1000000000738	Judul Buku 738	0
739	1000000000739	Judul Buku 739	0
740	1000000000740	Judul Buku 740	0
741	1000000000741	Judul Buku 741	0
742	1000000000742	Judul Buku 742	0
743	1000000000743	Judul Buku 743	0
744	1000000000744	Judul Buku 744	0
745	1000000000745	Judul Buku 745	0
746	1000000000746	Judul Buku 746	0
747	1000000000747	Judul Buku 747	0
748	1000000000748	Judul Buku 748	0
749	1000000000749	Judul Buku 749	0
750	1000000000750	Judul Buku 750	0
751	1000000000751	Judul Buku 751	0
752	1000000000752	Judul Buku 752	0
753	1000000000753	Judul Buku 753	0
754	1000000000754	Judul Buku 754	0
755	1000000000755	Judul Buku 755	0
756	1000000000756	Judul Buku 756	0
757	1000000000757	Judul Buku 757	0
758	1000000000758	Judul Buku 758	0
759	1000000000759	Judul Buku 759	0
760	1000000000760	Judul Buku 760	0
761	1000000000761	Judul Buku 761	0
762	1000000000762	Judul Buku 762	0
763	1000000000763	Judul Buku 763	0
764	1000000000764	Judul Buku 764	0
765	1000000000765	Judul Buku 765	0
766	1000000000766	Judul Buku 766	0
767	1000000000767	Judul Buku 767	0
768	1000000000768	Judul Buku 768	0
769	1000000000769	Judul Buku 769	0
770	1000000000770	Judul Buku 770	0
771	1000000000771	Judul Buku 771	0
772	1000000000772	Judul Buku 772	0
773	1000000000773	Judul Buku 773	0
774	1000000000774	Judul Buku 774	0
775	1000000000775	Judul Buku 775	0
776	1000000000776	Judul Buku 776	0
777	1000000000777	Judul Buku 777	0
778	1000000000778	Judul Buku 778	0
779	1000000000779	Judul Buku 779	0
780	1000000000780	Judul Buku 780	0
781	1000000000781	Judul Buku 781	0
782	1000000000782	Judul Buku 782	0
783	1000000000783	Judul Buku 783	0
784	1000000000784	Judul Buku 784	0
785	1000000000785	Judul Buku 785	0
786	1000000000786	Judul Buku 786	0
787	1000000000787	Judul Buku 787	0
788	1000000000788	Judul Buku 788	0
789	1000000000789	Judul Buku 789	0
790	1000000000790	Judul Buku 790	0
791	1000000000791	Judul Buku 791	0
792	1000000000792	Judul Buku 792	0
793	1000000000793	Judul Buku 793	0
794	1000000000794	Judul Buku 794	0
795	1000000000795	Judul Buku 795	0
796	1000000000796	Judul Buku 796	0
797	1000000000797	Judul Buku 797	0
798	1000000000798	Judul Buku 798	0
799	1000000000799	Judul Buku 799	0
800	1000000000800	Judul Buku 800	0
801	1000000000801	Judul Buku 801	0
802	1000000000802	Judul Buku 802	0
803	1000000000803	Judul Buku 803	0
804	1000000000804	Judul Buku 804	0
805	1000000000805	Judul Buku 805	0
806	1000000000806	Judul Buku 806	0
807	1000000000807	Judul Buku 807	0
808	1000000000808	Judul Buku 808	0
809	1000000000809	Judul Buku 809	0
810	1000000000810	Judul Buku 810	0
811	1000000000811	Judul Buku 811	0
812	1000000000812	Judul Buku 812	0
813	1000000000813	Judul Buku 813	0
814	1000000000814	Judul Buku 814	0
815	1000000000815	Judul Buku 815	0
816	1000000000816	Judul Buku 816	0
817	1000000000817	Judul Buku 817	0
818	1000000000818	Judul Buku 818	0
819	1000000000819	Judul Buku 819	0
820	1000000000820	Judul Buku 820	0
821	1000000000821	Judul Buku 821	0
822	1000000000822	Judul Buku 822	0
823	1000000000823	Judul Buku 823	0
824	1000000000824	Judul Buku 824	0
825	1000000000825	Judul Buku 825	0
826	1000000000826	Judul Buku 826	0
827	1000000000827	Judul Buku 827	0
828	1000000000828	Judul Buku 828	0
829	1000000000829	Judul Buku 829	0
830	1000000000830	Judul Buku 830	0
831	1000000000831	Judul Buku 831	0
832	1000000000832	Judul Buku 832	0
833	1000000000833	Judul Buku 833	0
834	1000000000834	Judul Buku 834	0
835	1000000000835	Judul Buku 835	0
836	1000000000836	Judul Buku 836	0
837	1000000000837	Judul Buku 837	0
838	1000000000838	Judul Buku 838	0
839	1000000000839	Judul Buku 839	0
840	1000000000840	Judul Buku 840	0
841	1000000000841	Judul Buku 841	0
842	1000000000842	Judul Buku 842	0
843	1000000000843	Judul Buku 843	0
844	1000000000844	Judul Buku 844	0
845	1000000000845	Judul Buku 845	0
846	1000000000846	Judul Buku 846	0
847	1000000000847	Judul Buku 847	0
848	1000000000848	Judul Buku 848	0
849	1000000000849	Judul Buku 849	0
850	1000000000850	Judul Buku 850	0
851	1000000000851	Judul Buku 851	0
852	1000000000852	Judul Buku 852	0
853	1000000000853	Judul Buku 853	0
854	1000000000854	Judul Buku 854	0
855	1000000000855	Judul Buku 855	0
856	1000000000856	Judul Buku 856	0
857	1000000000857	Judul Buku 857	0
858	1000000000858	Judul Buku 858	0
859	1000000000859	Judul Buku 859	0
860	1000000000860	Judul Buku 860	0
861	1000000000861	Judul Buku 861	0
862	1000000000862	Judul Buku 862	0
863	1000000000863	Judul Buku 863	0
864	1000000000864	Judul Buku 864	0
865	1000000000865	Judul Buku 865	0
866	1000000000866	Judul Buku 866	0
867	1000000000867	Judul Buku 867	0
868	1000000000868	Judul Buku 868	0
869	1000000000869	Judul Buku 869	0
870	1000000000870	Judul Buku 870	0
871	1000000000871	Judul Buku 871	0
872	1000000000872	Judul Buku 872	0
873	1000000000873	Judul Buku 873	0
874	1000000000874	Judul Buku 874	0
875	1000000000875	Judul Buku 875	0
876	1000000000876	Judul Buku 876	0
877	1000000000877	Judul Buku 877	0
878	1000000000878	Judul Buku 878	0
879	1000000000879	Judul Buku 879	0
880	1000000000880	Judul Buku 880	0
881	1000000000881	Judul Buku 881	0
882	1000000000882	Judul Buku 882	0
883	1000000000883	Judul Buku 883	0
884	1000000000884	Judul Buku 884	0
885	1000000000885	Judul Buku 885	0
886	1000000000886	Judul Buku 886	0
887	1000000000887	Judul Buku 887	0
888	1000000000888	Judul Buku 888	0
889	1000000000889	Judul Buku 889	0
890	1000000000890	Judul Buku 890	0
891	1000000000891	Judul Buku 891	0
892	1000000000892	Judul Buku 892	0
893	1000000000893	Judul Buku 893	0
894	1000000000894	Judul Buku 894	0
895	1000000000895	Judul Buku 895	0
896	1000000000896	Judul Buku 896	0
897	1000000000897	Judul Buku 897	0
898	1000000000898	Judul Buku 898	0
899	1000000000899	Judul Buku 899	0
900	1000000000900	Judul Buku 900	0
901	1000000000901	Judul Buku 901	0
902	1000000000902	Judul Buku 902	0
903	1000000000903	Judul Buku 903	0
904	1000000000904	Judul Buku 904	0
905	1000000000905	Judul Buku 905	0
906	1000000000906	Judul Buku 906	0
907	1000000000907	Judul Buku 907	0
908	1000000000908	Judul Buku 908	0
909	1000000000909	Judul Buku 909	0
910	1000000000910	Judul Buku 910	0
911	1000000000911	Judul Buku 911	0
912	1000000000912	Judul Buku 912	0
913	1000000000913	Judul Buku 913	0
914	1000000000914	Judul Buku 914	0
915	1000000000915	Judul Buku 915	0
916	1000000000916	Judul Buku 916	0
917	1000000000917	Judul Buku 917	0
918	1000000000918	Judul Buku 918	0
919	1000000000919	Judul Buku 919	0
920	1000000000920	Judul Buku 920	0
921	1000000000921	Judul Buku 921	0
922	1000000000922	Judul Buku 922	0
923	1000000000923	Judul Buku 923	0
924	1000000000924	Judul Buku 924	0
925	1000000000925	Judul Buku 925	0
926	1000000000926	Judul Buku 926	0
927	1000000000927	Judul Buku 927	0
928	1000000000928	Judul Buku 928	0
929	1000000000929	Judul Buku 929	0
930	1000000000930	Judul Buku 930	0
931	1000000000931	Judul Buku 931	0
932	1000000000932	Judul Buku 932	0
933	1000000000933	Judul Buku 933	0
934	1000000000934	Judul Buku 934	0
935	1000000000935	Judul Buku 935	0
936	1000000000936	Judul Buku 936	0
937	1000000000937	Judul Buku 937	0
938	1000000000938	Judul Buku 938	0
939	1000000000939	Judul Buku 939	0
940	1000000000940	Judul Buku 940	0
941	1000000000941	Judul Buku 941	0
942	1000000000942	Judul Buku 942	0
943	1000000000943	Judul Buku 943	0
944	1000000000944	Judul Buku 944	0
945	1000000000945	Judul Buku 945	0
946	1000000000946	Judul Buku 946	0
947	1000000000947	Judul Buku 947	0
948	1000000000948	Judul Buku 948	0
949	1000000000949	Judul Buku 949	0
950	1000000000950	Judul Buku 950	0
951	1000000000951	Judul Buku 951	0
952	1000000000952	Judul Buku 952	0
953	1000000000953	Judul Buku 953	0
954	1000000000954	Judul Buku 954	0
955	1000000000955	Judul Buku 955	0
956	1000000000956	Judul Buku 956	0
957	1000000000957	Judul Buku 957	0
958	1000000000958	Judul Buku 958	0
959	1000000000959	Judul Buku 959	0
960	1000000000960	Judul Buku 960	0
961	1000000000961	Judul Buku 961	0
962	1000000000962	Judul Buku 962	0
963	1000000000963	Judul Buku 963	0
964	1000000000964	Judul Buku 964	0
965	1000000000965	Judul Buku 965	0
966	1000000000966	Judul Buku 966	0
967	1000000000967	Judul Buku 967	0
968	1000000000968	Judul Buku 968	0
969	1000000000969	Judul Buku 969	0
970	1000000000970	Judul Buku 970	0
971	1000000000971	Judul Buku 971	0
972	1000000000972	Judul Buku 972	0
973	1000000000973	Judul Buku 973	0
974	1000000000974	Judul Buku 974	0
975	1000000000975	Judul Buku 975	0
976	1000000000976	Judul Buku 976	0
977	1000000000977	Judul Buku 977	0
978	1000000000978	Judul Buku 978	0
979	1000000000979	Judul Buku 979	0
980	1000000000980	Judul Buku 980	0
981	1000000000981	Judul Buku 981	0
982	1000000000982	Judul Buku 982	0
983	1000000000983	Judul Buku 983	0
984	1000000000984	Judul Buku 984	0
985	1000000000985	Judul Buku 985	0
986	1000000000986	Judul Buku 986	0
987	1000000000987	Judul Buku 987	0
988	1000000000988	Judul Buku 988	0
989	1000000000989	Judul Buku 989	0
990	1000000000990	Judul Buku 990	0
991	1000000000991	Judul Buku 991	0
992	1000000000992	Judul Buku 992	0
993	1000000000993	Judul Buku 993	0
994	1000000000994	Judul Buku 994	0
995	1000000000995	Judul Buku 995	0
996	1000000000996	Judul Buku 996	0
997	1000000000997	Judul Buku 997	0
998	1000000000998	Judul Buku 998	0
999	1000000000999	Judul Buku 999	0
1000	1000000001000	Judul Buku 1000	0
1001	1000000001001	Judul Buku 1001	0
1002	1000000001002	Judul Buku 1002	0
1003	1000000001003	Judul Buku 1003	0
1004	1000000001004	Judul Buku 1004	0
1005	1000000001005	Judul Buku 1005	0
1006	1000000001006	Judul Buku 1006	0
1007	1000000001007	Judul Buku 1007	0
1008	1000000001008	Judul Buku 1008	0
1009	1000000001009	Judul Buku 1009	0
1010	1000000001010	Judul Buku 1010	0
1011	1000000001011	Judul Buku 1011	0
1012	1000000001012	Judul Buku 1012	0
1013	1000000001013	Judul Buku 1013	0
1014	1000000001014	Judul Buku 1014	0
1015	1000000001015	Judul Buku 1015	0
1016	1000000001016	Judul Buku 1016	0
1017	1000000001017	Judul Buku 1017	0
1018	1000000001018	Judul Buku 1018	0
1019	1000000001019	Judul Buku 1019	0
1020	1000000001020	Judul Buku 1020	0
1021	1000000001021	Judul Buku 1021	0
1022	1000000001022	Judul Buku 1022	0
1023	1000000001023	Judul Buku 1023	0
1024	1000000001024	Judul Buku 1024	0
1025	1000000001025	Judul Buku 1025	0
1026	1000000001026	Judul Buku 1026	0
1027	1000000001027	Judul Buku 1027	0
1028	1000000001028	Judul Buku 1028	0
1029	1000000001029	Judul Buku 1029	0
1030	1000000001030	Judul Buku 1030	0
1031	1000000001031	Judul Buku 1031	0
1032	1000000001032	Judul Buku 1032	0
1033	1000000001033	Judul Buku 1033	0
1034	1000000001034	Judul Buku 1034	0
1035	1000000001035	Judul Buku 1035	0
1036	1000000001036	Judul Buku 1036	0
1037	1000000001037	Judul Buku 1037	0
1038	1000000001038	Judul Buku 1038	0
1039	1000000001039	Judul Buku 1039	0
1040	1000000001040	Judul Buku 1040	0
1041	1000000001041	Judul Buku 1041	0
1042	1000000001042	Judul Buku 1042	0
1043	1000000001043	Judul Buku 1043	0
1044	1000000001044	Judul Buku 1044	0
1045	1000000001045	Judul Buku 1045	0
1046	1000000001046	Judul Buku 1046	0
1047	1000000001047	Judul Buku 1047	0
1048	1000000001048	Judul Buku 1048	0
1049	1000000001049	Judul Buku 1049	0
1050	1000000001050	Judul Buku 1050	0
1051	1000000001051	Judul Buku 1051	0
1052	1000000001052	Judul Buku 1052	0
1053	1000000001053	Judul Buku 1053	0
1054	1000000001054	Judul Buku 1054	0
1055	1000000001055	Judul Buku 1055	0
1056	1000000001056	Judul Buku 1056	0
1057	1000000001057	Judul Buku 1057	0
1058	1000000001058	Judul Buku 1058	0
1059	1000000001059	Judul Buku 1059	0
1060	1000000001060	Judul Buku 1060	0
1061	1000000001061	Judul Buku 1061	0
1062	1000000001062	Judul Buku 1062	0
1063	1000000001063	Judul Buku 1063	0
1064	1000000001064	Judul Buku 1064	0
1065	1000000001065	Judul Buku 1065	0
1066	1000000001066	Judul Buku 1066	0
1067	1000000001067	Judul Buku 1067	0
1068	1000000001068	Judul Buku 1068	0
1069	1000000001069	Judul Buku 1069	0
1070	1000000001070	Judul Buku 1070	0
1071	1000000001071	Judul Buku 1071	0
1072	1000000001072	Judul Buku 1072	0
1073	1000000001073	Judul Buku 1073	0
1074	1000000001074	Judul Buku 1074	0
1075	1000000001075	Judul Buku 1075	0
1076	1000000001076	Judul Buku 1076	0
1077	1000000001077	Judul Buku 1077	0
1078	1000000001078	Judul Buku 1078	0
1079	1000000001079	Judul Buku 1079	0
1080	1000000001080	Judul Buku 1080	0
1081	1000000001081	Judul Buku 1081	0
1082	1000000001082	Judul Buku 1082	0
1083	1000000001083	Judul Buku 1083	0
1084	1000000001084	Judul Buku 1084	0
1085	1000000001085	Judul Buku 1085	0
1086	1000000001086	Judul Buku 1086	0
1087	1000000001087	Judul Buku 1087	0
1088	1000000001088	Judul Buku 1088	0
1089	1000000001089	Judul Buku 1089	0
1090	1000000001090	Judul Buku 1090	0
1091	1000000001091	Judul Buku 1091	0
1092	1000000001092	Judul Buku 1092	0
1093	1000000001093	Judul Buku 1093	0
1094	1000000001094	Judul Buku 1094	0
1095	1000000001095	Judul Buku 1095	0
1096	1000000001096	Judul Buku 1096	0
1097	1000000001097	Judul Buku 1097	0
1098	1000000001098	Judul Buku 1098	0
1099	1000000001099	Judul Buku 1099	0
1100	1000000001100	Judul Buku 1100	0
1101	1000000001101	Judul Buku 1101	0
1102	1000000001102	Judul Buku 1102	0
1103	1000000001103	Judul Buku 1103	0
1104	1000000001104	Judul Buku 1104	0
1105	1000000001105	Judul Buku 1105	0
1106	1000000001106	Judul Buku 1106	0
1107	1000000001107	Judul Buku 1107	0
1108	1000000001108	Judul Buku 1108	0
1109	1000000001109	Judul Buku 1109	0
1110	1000000001110	Judul Buku 1110	0
1111	1000000001111	Judul Buku 1111	0
1112	1000000001112	Judul Buku 1112	0
1113	1000000001113	Judul Buku 1113	0
1114	1000000001114	Judul Buku 1114	0
1115	1000000001115	Judul Buku 1115	0
1116	1000000001116	Judul Buku 1116	0
1117	1000000001117	Judul Buku 1117	0
1118	1000000001118	Judul Buku 1118	0
1119	1000000001119	Judul Buku 1119	0
1120	1000000001120	Judul Buku 1120	0
1121	1000000001121	Judul Buku 1121	0
1122	1000000001122	Judul Buku 1122	0
1123	1000000001123	Judul Buku 1123	0
1124	1000000001124	Judul Buku 1124	0
1125	1000000001125	Judul Buku 1125	0
1126	1000000001126	Judul Buku 1126	0
1127	1000000001127	Judul Buku 1127	0
1128	1000000001128	Judul Buku 1128	0
1129	1000000001129	Judul Buku 1129	0
1130	1000000001130	Judul Buku 1130	0
1131	1000000001131	Judul Buku 1131	0
1132	1000000001132	Judul Buku 1132	0
1133	1000000001133	Judul Buku 1133	0
1134	1000000001134	Judul Buku 1134	0
1135	1000000001135	Judul Buku 1135	0
1136	1000000001136	Judul Buku 1136	0
1137	1000000001137	Judul Buku 1137	0
1138	1000000001138	Judul Buku 1138	0
1139	1000000001139	Judul Buku 1139	0
1140	1000000001140	Judul Buku 1140	0
1141	1000000001141	Judul Buku 1141	0
1142	1000000001142	Judul Buku 1142	0
1143	1000000001143	Judul Buku 1143	0
1144	1000000001144	Judul Buku 1144	0
1145	1000000001145	Judul Buku 1145	0
1146	1000000001146	Judul Buku 1146	0
1147	1000000001147	Judul Buku 1147	0
1148	1000000001148	Judul Buku 1148	0
1149	1000000001149	Judul Buku 1149	0
1150	1000000001150	Judul Buku 1150	0
1151	1000000001151	Judul Buku 1151	0
1152	1000000001152	Judul Buku 1152	0
1153	1000000001153	Judul Buku 1153	0
1154	1000000001154	Judul Buku 1154	0
1155	1000000001155	Judul Buku 1155	0
1156	1000000001156	Judul Buku 1156	0
1157	1000000001157	Judul Buku 1157	0
1158	1000000001158	Judul Buku 1158	0
1159	1000000001159	Judul Buku 1159	0
1160	1000000001160	Judul Buku 1160	0
1161	1000000001161	Judul Buku 1161	0
1162	1000000001162	Judul Buku 1162	0
1163	1000000001163	Judul Buku 1163	0
1164	1000000001164	Judul Buku 1164	0
1165	1000000001165	Judul Buku 1165	0
1166	1000000001166	Judul Buku 1166	0
1167	1000000001167	Judul Buku 1167	0
1168	1000000001168	Judul Buku 1168	0
1169	1000000001169	Judul Buku 1169	0
1170	1000000001170	Judul Buku 1170	0
1171	1000000001171	Judul Buku 1171	0
1172	1000000001172	Judul Buku 1172	0
1173	1000000001173	Judul Buku 1173	0
1174	1000000001174	Judul Buku 1174	0
1175	1000000001175	Judul Buku 1175	0
1176	1000000001176	Judul Buku 1176	0
1177	1000000001177	Judul Buku 1177	0
1178	1000000001178	Judul Buku 1178	0
1179	1000000001179	Judul Buku 1179	0
1180	1000000001180	Judul Buku 1180	0
1181	1000000001181	Judul Buku 1181	0
1182	1000000001182	Judul Buku 1182	0
1183	1000000001183	Judul Buku 1183	0
1184	1000000001184	Judul Buku 1184	0
1185	1000000001185	Judul Buku 1185	0
1186	1000000001186	Judul Buku 1186	0
1187	1000000001187	Judul Buku 1187	0
1188	1000000001188	Judul Buku 1188	0
1189	1000000001189	Judul Buku 1189	0
1190	1000000001190	Judul Buku 1190	0
1191	1000000001191	Judul Buku 1191	0
1192	1000000001192	Judul Buku 1192	0
1193	1000000001193	Judul Buku 1193	0
1194	1000000001194	Judul Buku 1194	0
1195	1000000001195	Judul Buku 1195	0
1196	1000000001196	Judul Buku 1196	0
1197	1000000001197	Judul Buku 1197	0
1198	1000000001198	Judul Buku 1198	0
1199	1000000001199	Judul Buku 1199	0
1200	1000000001200	Judul Buku 1200	0
1201	1000000001201	Judul Buku 1201	0
1202	1000000001202	Judul Buku 1202	0
1203	1000000001203	Judul Buku 1203	0
1204	1000000001204	Judul Buku 1204	0
1205	1000000001205	Judul Buku 1205	0
1206	1000000001206	Judul Buku 1206	0
1207	1000000001207	Judul Buku 1207	0
1208	1000000001208	Judul Buku 1208	0
1209	1000000001209	Judul Buku 1209	0
1210	1000000001210	Judul Buku 1210	0
1211	1000000001211	Judul Buku 1211	0
1212	1000000001212	Judul Buku 1212	0
1213	1000000001213	Judul Buku 1213	0
1214	1000000001214	Judul Buku 1214	0
1215	1000000001215	Judul Buku 1215	0
1216	1000000001216	Judul Buku 1216	0
1217	1000000001217	Judul Buku 1217	0
1218	1000000001218	Judul Buku 1218	0
1219	1000000001219	Judul Buku 1219	0
1220	1000000001220	Judul Buku 1220	0
1221	1000000001221	Judul Buku 1221	0
1222	1000000001222	Judul Buku 1222	0
1223	1000000001223	Judul Buku 1223	0
1224	1000000001224	Judul Buku 1224	0
1225	1000000001225	Judul Buku 1225	0
1226	1000000001226	Judul Buku 1226	0
1227	1000000001227	Judul Buku 1227	0
1228	1000000001228	Judul Buku 1228	0
1229	1000000001229	Judul Buku 1229	0
1230	1000000001230	Judul Buku 1230	0
1231	1000000001231	Judul Buku 1231	0
1232	1000000001232	Judul Buku 1232	0
1233	1000000001233	Judul Buku 1233	0
1234	1000000001234	Judul Buku 1234	0
1235	1000000001235	Judul Buku 1235	0
1236	1000000001236	Judul Buku 1236	0
1237	1000000001237	Judul Buku 1237	0
1238	1000000001238	Judul Buku 1238	0
1239	1000000001239	Judul Buku 1239	0
1240	1000000001240	Judul Buku 1240	0
1241	1000000001241	Judul Buku 1241	0
1242	1000000001242	Judul Buku 1242	0
1243	1000000001243	Judul Buku 1243	0
1244	1000000001244	Judul Buku 1244	0
1245	1000000001245	Judul Buku 1245	0
1246	1000000001246	Judul Buku 1246	0
1247	1000000001247	Judul Buku 1247	0
1248	1000000001248	Judul Buku 1248	0
1249	1000000001249	Judul Buku 1249	0
1250	1000000001250	Judul Buku 1250	0
1251	1000000001251	Judul Buku 1251	0
1252	1000000001252	Judul Buku 1252	0
1253	1000000001253	Judul Buku 1253	0
1254	1000000001254	Judul Buku 1254	0
1255	1000000001255	Judul Buku 1255	0
1256	1000000001256	Judul Buku 1256	0
1257	1000000001257	Judul Buku 1257	0
1258	1000000001258	Judul Buku 1258	0
1259	1000000001259	Judul Buku 1259	0
1260	1000000001260	Judul Buku 1260	0
1261	1000000001261	Judul Buku 1261	0
1262	1000000001262	Judul Buku 1262	0
1263	1000000001263	Judul Buku 1263	0
1264	1000000001264	Judul Buku 1264	0
1265	1000000001265	Judul Buku 1265	0
1266	1000000001266	Judul Buku 1266	0
1267	1000000001267	Judul Buku 1267	0
1268	1000000001268	Judul Buku 1268	0
1269	1000000001269	Judul Buku 1269	0
1270	1000000001270	Judul Buku 1270	0
1271	1000000001271	Judul Buku 1271	0
1272	1000000001272	Judul Buku 1272	0
1273	1000000001273	Judul Buku 1273	0
1274	1000000001274	Judul Buku 1274	0
1275	1000000001275	Judul Buku 1275	0
1276	1000000001276	Judul Buku 1276	0
1277	1000000001277	Judul Buku 1277	0
1278	1000000001278	Judul Buku 1278	0
1279	1000000001279	Judul Buku 1279	0
1280	1000000001280	Judul Buku 1280	0
1281	1000000001281	Judul Buku 1281	0
1282	1000000001282	Judul Buku 1282	0
1283	1000000001283	Judul Buku 1283	0
1284	1000000001284	Judul Buku 1284	0
1285	1000000001285	Judul Buku 1285	0
1286	1000000001286	Judul Buku 1286	0
1287	1000000001287	Judul Buku 1287	0
1288	1000000001288	Judul Buku 1288	0
1289	1000000001289	Judul Buku 1289	0
1290	1000000001290	Judul Buku 1290	0
1291	1000000001291	Judul Buku 1291	0
1292	1000000001292	Judul Buku 1292	0
1293	1000000001293	Judul Buku 1293	0
1294	1000000001294	Judul Buku 1294	0
1295	1000000001295	Judul Buku 1295	0
1296	1000000001296	Judul Buku 1296	0
1297	1000000001297	Judul Buku 1297	0
1298	1000000001298	Judul Buku 1298	0
1299	1000000001299	Judul Buku 1299	0
1300	1000000001300	Judul Buku 1300	0
1301	1000000001301	Judul Buku 1301	0
1302	1000000001302	Judul Buku 1302	0
1303	1000000001303	Judul Buku 1303	0
1304	1000000001304	Judul Buku 1304	0
1305	1000000001305	Judul Buku 1305	0
1306	1000000001306	Judul Buku 1306	0
1307	1000000001307	Judul Buku 1307	0
1308	1000000001308	Judul Buku 1308	0
1309	1000000001309	Judul Buku 1309	0
1310	1000000001310	Judul Buku 1310	0
1311	1000000001311	Judul Buku 1311	0
1312	1000000001312	Judul Buku 1312	0
1313	1000000001313	Judul Buku 1313	0
1314	1000000001314	Judul Buku 1314	0
1315	1000000001315	Judul Buku 1315	0
1316	1000000001316	Judul Buku 1316	0
1317	1000000001317	Judul Buku 1317	0
1318	1000000001318	Judul Buku 1318	0
1319	1000000001319	Judul Buku 1319	0
1320	1000000001320	Judul Buku 1320	0
1321	1000000001321	Judul Buku 1321	0
1322	1000000001322	Judul Buku 1322	0
1323	1000000001323	Judul Buku 1323	0
1324	1000000001324	Judul Buku 1324	0
1325	1000000001325	Judul Buku 1325	0
1326	1000000001326	Judul Buku 1326	0
1327	1000000001327	Judul Buku 1327	0
1328	1000000001328	Judul Buku 1328	0
1329	1000000001329	Judul Buku 1329	0
1330	1000000001330	Judul Buku 1330	0
1331	1000000001331	Judul Buku 1331	0
1332	1000000001332	Judul Buku 1332	0
1333	1000000001333	Judul Buku 1333	0
1334	1000000001334	Judul Buku 1334	0
1335	1000000001335	Judul Buku 1335	0
1336	1000000001336	Judul Buku 1336	0
1337	1000000001337	Judul Buku 1337	0
1338	1000000001338	Judul Buku 1338	0
1339	1000000001339	Judul Buku 1339	0
1340	1000000001340	Judul Buku 1340	0
1341	1000000001341	Judul Buku 1341	0
1342	1000000001342	Judul Buku 1342	0
1343	1000000001343	Judul Buku 1343	0
1344	1000000001344	Judul Buku 1344	0
1345	1000000001345	Judul Buku 1345	0
1346	1000000001346	Judul Buku 1346	0
1347	1000000001347	Judul Buku 1347	0
1348	1000000001348	Judul Buku 1348	0
1349	1000000001349	Judul Buku 1349	0
1350	1000000001350	Judul Buku 1350	0
1351	1000000001351	Judul Buku 1351	0
1352	1000000001352	Judul Buku 1352	0
1353	1000000001353	Judul Buku 1353	0
1354	1000000001354	Judul Buku 1354	0
1355	1000000001355	Judul Buku 1355	0
1356	1000000001356	Judul Buku 1356	0
1357	1000000001357	Judul Buku 1357	0
1358	1000000001358	Judul Buku 1358	0
1359	1000000001359	Judul Buku 1359	0
1360	1000000001360	Judul Buku 1360	0
1361	1000000001361	Judul Buku 1361	0
1362	1000000001362	Judul Buku 1362	0
1363	1000000001363	Judul Buku 1363	0
1364	1000000001364	Judul Buku 1364	0
1365	1000000001365	Judul Buku 1365	0
1366	1000000001366	Judul Buku 1366	0
1367	1000000001367	Judul Buku 1367	0
1368	1000000001368	Judul Buku 1368	0
1369	1000000001369	Judul Buku 1369	0
1370	1000000001370	Judul Buku 1370	0
1371	1000000001371	Judul Buku 1371	0
1372	1000000001372	Judul Buku 1372	0
1373	1000000001373	Judul Buku 1373	0
1374	1000000001374	Judul Buku 1374	0
1375	1000000001375	Judul Buku 1375	0
1376	1000000001376	Judul Buku 1376	0
1377	1000000001377	Judul Buku 1377	0
1378	1000000001378	Judul Buku 1378	0
1379	1000000001379	Judul Buku 1379	0
1380	1000000001380	Judul Buku 1380	0
1381	1000000001381	Judul Buku 1381	0
1382	1000000001382	Judul Buku 1382	0
1383	1000000001383	Judul Buku 1383	0
1384	1000000001384	Judul Buku 1384	0
1385	1000000001385	Judul Buku 1385	0
1386	1000000001386	Judul Buku 1386	0
1387	1000000001387	Judul Buku 1387	0
1388	1000000001388	Judul Buku 1388	0
1389	1000000001389	Judul Buku 1389	0
1390	1000000001390	Judul Buku 1390	0
1391	1000000001391	Judul Buku 1391	0
1392	1000000001392	Judul Buku 1392	0
1393	1000000001393	Judul Buku 1393	0
1394	1000000001394	Judul Buku 1394	0
1395	1000000001395	Judul Buku 1395	0
1396	1000000001396	Judul Buku 1396	0
1397	1000000001397	Judul Buku 1397	0
1398	1000000001398	Judul Buku 1398	0
1399	1000000001399	Judul Buku 1399	0
1400	1000000001400	Judul Buku 1400	0
1401	1000000001401	Judul Buku 1401	0
1402	1000000001402	Judul Buku 1402	0
1403	1000000001403	Judul Buku 1403	0
1404	1000000001404	Judul Buku 1404	0
1405	1000000001405	Judul Buku 1405	0
1406	1000000001406	Judul Buku 1406	0
1407	1000000001407	Judul Buku 1407	0
1408	1000000001408	Judul Buku 1408	0
1409	1000000001409	Judul Buku 1409	0
1410	1000000001410	Judul Buku 1410	0
1411	1000000001411	Judul Buku 1411	0
1412	1000000001412	Judul Buku 1412	0
1413	1000000001413	Judul Buku 1413	0
1414	1000000001414	Judul Buku 1414	0
1415	1000000001415	Judul Buku 1415	0
1416	1000000001416	Judul Buku 1416	0
1417	1000000001417	Judul Buku 1417	0
1418	1000000001418	Judul Buku 1418	0
1419	1000000001419	Judul Buku 1419	0
1420	1000000001420	Judul Buku 1420	0
1421	1000000001421	Judul Buku 1421	0
1422	1000000001422	Judul Buku 1422	0
1423	1000000001423	Judul Buku 1423	0
1424	1000000001424	Judul Buku 1424	0
1425	1000000001425	Judul Buku 1425	0
1426	1000000001426	Judul Buku 1426	0
1427	1000000001427	Judul Buku 1427	0
1428	1000000001428	Judul Buku 1428	0
1429	1000000001429	Judul Buku 1429	0
1430	1000000001430	Judul Buku 1430	0
1431	1000000001431	Judul Buku 1431	0
1432	1000000001432	Judul Buku 1432	0
1433	1000000001433	Judul Buku 1433	0
1434	1000000001434	Judul Buku 1434	0
1435	1000000001435	Judul Buku 1435	0
1436	1000000001436	Judul Buku 1436	0
1437	1000000001437	Judul Buku 1437	0
1438	1000000001438	Judul Buku 1438	0
1439	1000000001439	Judul Buku 1439	0
1440	1000000001440	Judul Buku 1440	0
1441	1000000001441	Judul Buku 1441	0
1442	1000000001442	Judul Buku 1442	0
1443	1000000001443	Judul Buku 1443	0
1444	1000000001444	Judul Buku 1444	0
1445	1000000001445	Judul Buku 1445	0
1446	1000000001446	Judul Buku 1446	0
1447	1000000001447	Judul Buku 1447	0
1448	1000000001448	Judul Buku 1448	0
1449	1000000001449	Judul Buku 1449	0
1450	1000000001450	Judul Buku 1450	0
1451	1000000001451	Judul Buku 1451	0
1452	1000000001452	Judul Buku 1452	0
1453	1000000001453	Judul Buku 1453	0
1454	1000000001454	Judul Buku 1454	0
1455	1000000001455	Judul Buku 1455	0
1456	1000000001456	Judul Buku 1456	0
1457	1000000001457	Judul Buku 1457	0
1458	1000000001458	Judul Buku 1458	0
1459	1000000001459	Judul Buku 1459	0
1460	1000000001460	Judul Buku 1460	0
1461	1000000001461	Judul Buku 1461	0
1462	1000000001462	Judul Buku 1462	0
1463	1000000001463	Judul Buku 1463	0
1464	1000000001464	Judul Buku 1464	0
1465	1000000001465	Judul Buku 1465	0
1466	1000000001466	Judul Buku 1466	0
1467	1000000001467	Judul Buku 1467	0
1468	1000000001468	Judul Buku 1468	0
1469	1000000001469	Judul Buku 1469	0
1470	1000000001470	Judul Buku 1470	0
1471	1000000001471	Judul Buku 1471	0
1472	1000000001472	Judul Buku 1472	0
1473	1000000001473	Judul Buku 1473	0
1474	1000000001474	Judul Buku 1474	0
1475	1000000001475	Judul Buku 1475	0
1476	1000000001476	Judul Buku 1476	0
1477	1000000001477	Judul Buku 1477	0
1478	1000000001478	Judul Buku 1478	0
1479	1000000001479	Judul Buku 1479	0
1480	1000000001480	Judul Buku 1480	0
1481	1000000001481	Judul Buku 1481	0
1482	1000000001482	Judul Buku 1482	0
1483	1000000001483	Judul Buku 1483	0
1484	1000000001484	Judul Buku 1484	0
1485	1000000001485	Judul Buku 1485	0
1486	1000000001486	Judul Buku 1486	0
1487	1000000001487	Judul Buku 1487	0
1488	1000000001488	Judul Buku 1488	0
1489	1000000001489	Judul Buku 1489	0
1490	1000000001490	Judul Buku 1490	0
1491	1000000001491	Judul Buku 1491	0
1492	1000000001492	Judul Buku 1492	0
1493	1000000001493	Judul Buku 1493	0
1494	1000000001494	Judul Buku 1494	0
1495	1000000001495	Judul Buku 1495	0
1496	1000000001496	Judul Buku 1496	0
1497	1000000001497	Judul Buku 1497	0
1498	1000000001498	Judul Buku 1498	0
1499	1000000001499	Judul Buku 1499	0
1500	1000000001500	Judul Buku 1500	0
1501	1000000001501	Judul Buku 1501	0
1502	1000000001502	Judul Buku 1502	0
1503	1000000001503	Judul Buku 1503	0
1504	1000000001504	Judul Buku 1504	0
1505	1000000001505	Judul Buku 1505	0
1506	1000000001506	Judul Buku 1506	0
1507	1000000001507	Judul Buku 1507	0
1508	1000000001508	Judul Buku 1508	0
1509	1000000001509	Judul Buku 1509	0
1510	1000000001510	Judul Buku 1510	0
1511	1000000001511	Judul Buku 1511	0
1512	1000000001512	Judul Buku 1512	0
1513	1000000001513	Judul Buku 1513	0
1514	1000000001514	Judul Buku 1514	0
1515	1000000001515	Judul Buku 1515	0
1516	1000000001516	Judul Buku 1516	0
1517	1000000001517	Judul Buku 1517	0
1518	1000000001518	Judul Buku 1518	0
1519	1000000001519	Judul Buku 1519	0
1520	1000000001520	Judul Buku 1520	0
1521	1000000001521	Judul Buku 1521	0
1522	1000000001522	Judul Buku 1522	0
1523	1000000001523	Judul Buku 1523	0
1524	1000000001524	Judul Buku 1524	0
1525	1000000001525	Judul Buku 1525	0
1526	1000000001526	Judul Buku 1526	0
1527	1000000001527	Judul Buku 1527	0
1528	1000000001528	Judul Buku 1528	0
1529	1000000001529	Judul Buku 1529	0
1530	1000000001530	Judul Buku 1530	0
1531	1000000001531	Judul Buku 1531	0
1532	1000000001532	Judul Buku 1532	0
1533	1000000001533	Judul Buku 1533	0
1534	1000000001534	Judul Buku 1534	0
1535	1000000001535	Judul Buku 1535	0
1536	1000000001536	Judul Buku 1536	0
1537	1000000001537	Judul Buku 1537	0
1538	1000000001538	Judul Buku 1538	0
1539	1000000001539	Judul Buku 1539	0
1540	1000000001540	Judul Buku 1540	0
1541	1000000001541	Judul Buku 1541	0
1542	1000000001542	Judul Buku 1542	0
1543	1000000001543	Judul Buku 1543	0
1544	1000000001544	Judul Buku 1544	0
1545	1000000001545	Judul Buku 1545	0
1546	1000000001546	Judul Buku 1546	0
1547	1000000001547	Judul Buku 1547	0
1548	1000000001548	Judul Buku 1548	0
1549	1000000001549	Judul Buku 1549	0
1550	1000000001550	Judul Buku 1550	0
1551	1000000001551	Judul Buku 1551	0
1552	1000000001552	Judul Buku 1552	0
1553	1000000001553	Judul Buku 1553	0
1554	1000000001554	Judul Buku 1554	0
1555	1000000001555	Judul Buku 1555	0
1556	1000000001556	Judul Buku 1556	0
1557	1000000001557	Judul Buku 1557	0
1558	1000000001558	Judul Buku 1558	0
1559	1000000001559	Judul Buku 1559	0
1560	1000000001560	Judul Buku 1560	0
1561	1000000001561	Judul Buku 1561	0
1562	1000000001562	Judul Buku 1562	0
1563	1000000001563	Judul Buku 1563	0
1564	1000000001564	Judul Buku 1564	0
1565	1000000001565	Judul Buku 1565	0
1566	1000000001566	Judul Buku 1566	0
1567	1000000001567	Judul Buku 1567	0
1568	1000000001568	Judul Buku 1568	0
1569	1000000001569	Judul Buku 1569	0
1570	1000000001570	Judul Buku 1570	0
1571	1000000001571	Judul Buku 1571	0
1572	1000000001572	Judul Buku 1572	0
1573	1000000001573	Judul Buku 1573	0
1574	1000000001574	Judul Buku 1574	0
1575	1000000001575	Judul Buku 1575	0
1576	1000000001576	Judul Buku 1576	0
1577	1000000001577	Judul Buku 1577	0
1578	1000000001578	Judul Buku 1578	0
1579	1000000001579	Judul Buku 1579	0
1580	1000000001580	Judul Buku 1580	0
1581	1000000001581	Judul Buku 1581	0
1582	1000000001582	Judul Buku 1582	0
1583	1000000001583	Judul Buku 1583	0
1584	1000000001584	Judul Buku 1584	0
1585	1000000001585	Judul Buku 1585	0
1586	1000000001586	Judul Buku 1586	0
1587	1000000001587	Judul Buku 1587	0
1588	1000000001588	Judul Buku 1588	0
1589	1000000001589	Judul Buku 1589	0
1590	1000000001590	Judul Buku 1590	0
1591	1000000001591	Judul Buku 1591	0
1592	1000000001592	Judul Buku 1592	0
1593	1000000001593	Judul Buku 1593	0
1594	1000000001594	Judul Buku 1594	0
1595	1000000001595	Judul Buku 1595	0
1596	1000000001596	Judul Buku 1596	0
1597	1000000001597	Judul Buku 1597	0
1598	1000000001598	Judul Buku 1598	0
1599	1000000001599	Judul Buku 1599	0
1600	1000000001600	Judul Buku 1600	0
1601	1000000001601	Judul Buku 1601	0
1602	1000000001602	Judul Buku 1602	0
1603	1000000001603	Judul Buku 1603	0
1604	1000000001604	Judul Buku 1604	0
1605	1000000001605	Judul Buku 1605	0
1606	1000000001606	Judul Buku 1606	0
1607	1000000001607	Judul Buku 1607	0
1608	1000000001608	Judul Buku 1608	0
1609	1000000001609	Judul Buku 1609	0
1610	1000000001610	Judul Buku 1610	0
1611	1000000001611	Judul Buku 1611	0
1612	1000000001612	Judul Buku 1612	0
1613	1000000001613	Judul Buku 1613	0
1614	1000000001614	Judul Buku 1614	0
1615	1000000001615	Judul Buku 1615	0
1616	1000000001616	Judul Buku 1616	0
1617	1000000001617	Judul Buku 1617	0
1618	1000000001618	Judul Buku 1618	0
1619	1000000001619	Judul Buku 1619	0
1620	1000000001620	Judul Buku 1620	0
1621	1000000001621	Judul Buku 1621	0
1622	1000000001622	Judul Buku 1622	0
1623	1000000001623	Judul Buku 1623	0
1624	1000000001624	Judul Buku 1624	0
1625	1000000001625	Judul Buku 1625	0
1626	1000000001626	Judul Buku 1626	0
1627	1000000001627	Judul Buku 1627	0
1628	1000000001628	Judul Buku 1628	0
1629	1000000001629	Judul Buku 1629	0
1630	1000000001630	Judul Buku 1630	0
1631	1000000001631	Judul Buku 1631	0
1632	1000000001632	Judul Buku 1632	0
1633	1000000001633	Judul Buku 1633	0
1634	1000000001634	Judul Buku 1634	0
1635	1000000001635	Judul Buku 1635	0
1636	1000000001636	Judul Buku 1636	0
1637	1000000001637	Judul Buku 1637	0
1638	1000000001638	Judul Buku 1638	0
1639	1000000001639	Judul Buku 1639	0
1640	1000000001640	Judul Buku 1640	0
1641	1000000001641	Judul Buku 1641	0
1642	1000000001642	Judul Buku 1642	0
1643	1000000001643	Judul Buku 1643	0
1644	1000000001644	Judul Buku 1644	0
1645	1000000001645	Judul Buku 1645	0
1646	1000000001646	Judul Buku 1646	0
1647	1000000001647	Judul Buku 1647	0
1648	1000000001648	Judul Buku 1648	0
1649	1000000001649	Judul Buku 1649	0
1650	1000000001650	Judul Buku 1650	0
1651	1000000001651	Judul Buku 1651	0
1652	1000000001652	Judul Buku 1652	0
1653	1000000001653	Judul Buku 1653	0
1654	1000000001654	Judul Buku 1654	0
1655	1000000001655	Judul Buku 1655	0
1656	1000000001656	Judul Buku 1656	0
1657	1000000001657	Judul Buku 1657	0
1658	1000000001658	Judul Buku 1658	0
1659	1000000001659	Judul Buku 1659	0
1660	1000000001660	Judul Buku 1660	0
1661	1000000001661	Judul Buku 1661	0
1662	1000000001662	Judul Buku 1662	0
1663	1000000001663	Judul Buku 1663	0
1664	1000000001664	Judul Buku 1664	0
1665	1000000001665	Judul Buku 1665	0
1666	1000000001666	Judul Buku 1666	0
1667	1000000001667	Judul Buku 1667	0
1668	1000000001668	Judul Buku 1668	0
1669	1000000001669	Judul Buku 1669	0
1670	1000000001670	Judul Buku 1670	0
1671	1000000001671	Judul Buku 1671	0
1672	1000000001672	Judul Buku 1672	0
1673	1000000001673	Judul Buku 1673	0
1674	1000000001674	Judul Buku 1674	0
1675	1000000001675	Judul Buku 1675	0
1676	1000000001676	Judul Buku 1676	0
1677	1000000001677	Judul Buku 1677	0
1678	1000000001678	Judul Buku 1678	0
1679	1000000001679	Judul Buku 1679	0
1680	1000000001680	Judul Buku 1680	0
1681	1000000001681	Judul Buku 1681	0
1682	1000000001682	Judul Buku 1682	0
1683	1000000001683	Judul Buku 1683	0
1684	1000000001684	Judul Buku 1684	0
1685	1000000001685	Judul Buku 1685	0
1686	1000000001686	Judul Buku 1686	0
1687	1000000001687	Judul Buku 1687	0
1688	1000000001688	Judul Buku 1688	0
1689	1000000001689	Judul Buku 1689	0
1690	1000000001690	Judul Buku 1690	0
1691	1000000001691	Judul Buku 1691	0
1692	1000000001692	Judul Buku 1692	0
1693	1000000001693	Judul Buku 1693	0
1694	1000000001694	Judul Buku 1694	0
1695	1000000001695	Judul Buku 1695	0
1696	1000000001696	Judul Buku 1696	0
1697	1000000001697	Judul Buku 1697	0
1698	1000000001698	Judul Buku 1698	0
1699	1000000001699	Judul Buku 1699	0
1700	1000000001700	Judul Buku 1700	0
1701	1000000001701	Judul Buku 1701	0
1702	1000000001702	Judul Buku 1702	0
1703	1000000001703	Judul Buku 1703	0
1704	1000000001704	Judul Buku 1704	0
1705	1000000001705	Judul Buku 1705	0
1706	1000000001706	Judul Buku 1706	0
1707	1000000001707	Judul Buku 1707	0
1708	1000000001708	Judul Buku 1708	0
1709	1000000001709	Judul Buku 1709	0
1710	1000000001710	Judul Buku 1710	0
1711	1000000001711	Judul Buku 1711	0
1712	1000000001712	Judul Buku 1712	0
1713	1000000001713	Judul Buku 1713	0
1714	1000000001714	Judul Buku 1714	0
1715	1000000001715	Judul Buku 1715	0
1716	1000000001716	Judul Buku 1716	0
1717	1000000001717	Judul Buku 1717	0
1718	1000000001718	Judul Buku 1718	0
1719	1000000001719	Judul Buku 1719	0
1720	1000000001720	Judul Buku 1720	0
1721	1000000001721	Judul Buku 1721	0
1722	1000000001722	Judul Buku 1722	0
1723	1000000001723	Judul Buku 1723	0
1724	1000000001724	Judul Buku 1724	0
1725	1000000001725	Judul Buku 1725	0
1726	1000000001726	Judul Buku 1726	0
1727	1000000001727	Judul Buku 1727	0
1728	1000000001728	Judul Buku 1728	0
1729	1000000001729	Judul Buku 1729	0
1730	1000000001730	Judul Buku 1730	0
1731	1000000001731	Judul Buku 1731	0
1732	1000000001732	Judul Buku 1732	0
1733	1000000001733	Judul Buku 1733	0
1734	1000000001734	Judul Buku 1734	0
1735	1000000001735	Judul Buku 1735	0
1736	1000000001736	Judul Buku 1736	0
1737	1000000001737	Judul Buku 1737	0
1738	1000000001738	Judul Buku 1738	0
1739	1000000001739	Judul Buku 1739	0
1740	1000000001740	Judul Buku 1740	0
1741	1000000001741	Judul Buku 1741	0
1742	1000000001742	Judul Buku 1742	0
1743	1000000001743	Judul Buku 1743	0
1744	1000000001744	Judul Buku 1744	0
1745	1000000001745	Judul Buku 1745	0
1746	1000000001746	Judul Buku 1746	0
1747	1000000001747	Judul Buku 1747	0
1748	1000000001748	Judul Buku 1748	0
1749	1000000001749	Judul Buku 1749	0
1750	1000000001750	Judul Buku 1750	0
1751	1000000001751	Judul Buku 1751	0
1752	1000000001752	Judul Buku 1752	0
1753	1000000001753	Judul Buku 1753	0
1754	1000000001754	Judul Buku 1754	0
1755	1000000001755	Judul Buku 1755	0
1756	1000000001756	Judul Buku 1756	0
1757	1000000001757	Judul Buku 1757	0
1758	1000000001758	Judul Buku 1758	0
1759	1000000001759	Judul Buku 1759	0
1760	1000000001760	Judul Buku 1760	0
1761	1000000001761	Judul Buku 1761	0
1762	1000000001762	Judul Buku 1762	0
1763	1000000001763	Judul Buku 1763	0
1764	1000000001764	Judul Buku 1764	0
1765	1000000001765	Judul Buku 1765	0
1766	1000000001766	Judul Buku 1766	0
1767	1000000001767	Judul Buku 1767	0
1768	1000000001768	Judul Buku 1768	0
1769	1000000001769	Judul Buku 1769	0
1770	1000000001770	Judul Buku 1770	0
1771	1000000001771	Judul Buku 1771	0
1772	1000000001772	Judul Buku 1772	0
1773	1000000001773	Judul Buku 1773	0
1774	1000000001774	Judul Buku 1774	0
1775	1000000001775	Judul Buku 1775	0
1776	1000000001776	Judul Buku 1776	0
1777	1000000001777	Judul Buku 1777	0
1778	1000000001778	Judul Buku 1778	0
1779	1000000001779	Judul Buku 1779	0
1780	1000000001780	Judul Buku 1780	0
1781	1000000001781	Judul Buku 1781	0
1782	1000000001782	Judul Buku 1782	0
1783	1000000001783	Judul Buku 1783	0
1784	1000000001784	Judul Buku 1784	0
1785	1000000001785	Judul Buku 1785	0
1786	1000000001786	Judul Buku 1786	0
1787	1000000001787	Judul Buku 1787	0
1788	1000000001788	Judul Buku 1788	0
1789	1000000001789	Judul Buku 1789	0
1790	1000000001790	Judul Buku 1790	0
1791	1000000001791	Judul Buku 1791	0
1792	1000000001792	Judul Buku 1792	0
1793	1000000001793	Judul Buku 1793	0
1794	1000000001794	Judul Buku 1794	0
1795	1000000001795	Judul Buku 1795	0
1796	1000000001796	Judul Buku 1796	0
1797	1000000001797	Judul Buku 1797	0
1798	1000000001798	Judul Buku 1798	0
1799	1000000001799	Judul Buku 1799	0
1800	1000000001800	Judul Buku 1800	0
1801	1000000001801	Judul Buku 1801	0
1802	1000000001802	Judul Buku 1802	0
1803	1000000001803	Judul Buku 1803	0
1804	1000000001804	Judul Buku 1804	0
1805	1000000001805	Judul Buku 1805	0
1806	1000000001806	Judul Buku 1806	0
1807	1000000001807	Judul Buku 1807	0
1808	1000000001808	Judul Buku 1808	0
1809	1000000001809	Judul Buku 1809	0
1810	1000000001810	Judul Buku 1810	0
1811	1000000001811	Judul Buku 1811	0
1812	1000000001812	Judul Buku 1812	0
1813	1000000001813	Judul Buku 1813	0
1814	1000000001814	Judul Buku 1814	0
1815	1000000001815	Judul Buku 1815	0
1816	1000000001816	Judul Buku 1816	0
1817	1000000001817	Judul Buku 1817	0
1818	1000000001818	Judul Buku 1818	0
1819	1000000001819	Judul Buku 1819	0
1820	1000000001820	Judul Buku 1820	0
1821	1000000001821	Judul Buku 1821	0
1822	1000000001822	Judul Buku 1822	0
1823	1000000001823	Judul Buku 1823	0
1824	1000000001824	Judul Buku 1824	0
1825	1000000001825	Judul Buku 1825	0
1826	1000000001826	Judul Buku 1826	0
1827	1000000001827	Judul Buku 1827	0
1828	1000000001828	Judul Buku 1828	0
1829	1000000001829	Judul Buku 1829	0
1830	1000000001830	Judul Buku 1830	0
1831	1000000001831	Judul Buku 1831	0
1832	1000000001832	Judul Buku 1832	0
1833	1000000001833	Judul Buku 1833	0
1834	1000000001834	Judul Buku 1834	0
1835	1000000001835	Judul Buku 1835	0
1836	1000000001836	Judul Buku 1836	0
1837	1000000001837	Judul Buku 1837	0
1838	1000000001838	Judul Buku 1838	0
1839	1000000001839	Judul Buku 1839	0
1840	1000000001840	Judul Buku 1840	0
1841	1000000001841	Judul Buku 1841	0
1842	1000000001842	Judul Buku 1842	0
1843	1000000001843	Judul Buku 1843	0
1844	1000000001844	Judul Buku 1844	0
1845	1000000001845	Judul Buku 1845	0
1846	1000000001846	Judul Buku 1846	0
1847	1000000001847	Judul Buku 1847	0
1848	1000000001848	Judul Buku 1848	0
1849	1000000001849	Judul Buku 1849	0
1850	1000000001850	Judul Buku 1850	0
1851	1000000001851	Judul Buku 1851	0
1852	1000000001852	Judul Buku 1852	0
1853	1000000001853	Judul Buku 1853	0
1854	1000000001854	Judul Buku 1854	0
1855	1000000001855	Judul Buku 1855	0
1856	1000000001856	Judul Buku 1856	0
1857	1000000001857	Judul Buku 1857	0
1858	1000000001858	Judul Buku 1858	0
1859	1000000001859	Judul Buku 1859	0
1860	1000000001860	Judul Buku 1860	0
1861	1000000001861	Judul Buku 1861	0
1862	1000000001862	Judul Buku 1862	0
1863	1000000001863	Judul Buku 1863	0
1864	1000000001864	Judul Buku 1864	0
1865	1000000001865	Judul Buku 1865	0
1866	1000000001866	Judul Buku 1866	0
1867	1000000001867	Judul Buku 1867	0
1868	1000000001868	Judul Buku 1868	0
1869	1000000001869	Judul Buku 1869	0
1870	1000000001870	Judul Buku 1870	0
1871	1000000001871	Judul Buku 1871	0
1872	1000000001872	Judul Buku 1872	0
1873	1000000001873	Judul Buku 1873	0
1874	1000000001874	Judul Buku 1874	0
1875	1000000001875	Judul Buku 1875	0
1876	1000000001876	Judul Buku 1876	0
1877	1000000001877	Judul Buku 1877	0
1878	1000000001878	Judul Buku 1878	0
1879	1000000001879	Judul Buku 1879	0
1880	1000000001880	Judul Buku 1880	0
1881	1000000001881	Judul Buku 1881	0
1882	1000000001882	Judul Buku 1882	0
1883	1000000001883	Judul Buku 1883	0
1884	1000000001884	Judul Buku 1884	0
1885	1000000001885	Judul Buku 1885	0
1886	1000000001886	Judul Buku 1886	0
1887	1000000001887	Judul Buku 1887	0
1888	1000000001888	Judul Buku 1888	0
1889	1000000001889	Judul Buku 1889	0
1890	1000000001890	Judul Buku 1890	0
1891	1000000001891	Judul Buku 1891	0
1892	1000000001892	Judul Buku 1892	0
1893	1000000001893	Judul Buku 1893	0
1894	1000000001894	Judul Buku 1894	0
1895	1000000001895	Judul Buku 1895	0
1896	1000000001896	Judul Buku 1896	0
1897	1000000001897	Judul Buku 1897	0
1898	1000000001898	Judul Buku 1898	0
1899	1000000001899	Judul Buku 1899	0
1900	1000000001900	Judul Buku 1900	0
1901	1000000001901	Judul Buku 1901	0
1902	1000000001902	Judul Buku 1902	0
1903	1000000001903	Judul Buku 1903	0
1904	1000000001904	Judul Buku 1904	0
1905	1000000001905	Judul Buku 1905	0
1906	1000000001906	Judul Buku 1906	0
1907	1000000001907	Judul Buku 1907	0
1908	1000000001908	Judul Buku 1908	0
1909	1000000001909	Judul Buku 1909	0
1910	1000000001910	Judul Buku 1910	0
1911	1000000001911	Judul Buku 1911	0
1912	1000000001912	Judul Buku 1912	0
1913	1000000001913	Judul Buku 1913	0
1914	1000000001914	Judul Buku 1914	0
1915	1000000001915	Judul Buku 1915	0
1916	1000000001916	Judul Buku 1916	0
1917	1000000001917	Judul Buku 1917	0
1918	1000000001918	Judul Buku 1918	0
1919	1000000001919	Judul Buku 1919	0
1920	1000000001920	Judul Buku 1920	0
1921	1000000001921	Judul Buku 1921	0
1922	1000000001922	Judul Buku 1922	0
1923	1000000001923	Judul Buku 1923	0
1924	1000000001924	Judul Buku 1924	0
1925	1000000001925	Judul Buku 1925	0
1926	1000000001926	Judul Buku 1926	0
1927	1000000001927	Judul Buku 1927	0
1928	1000000001928	Judul Buku 1928	0
1929	1000000001929	Judul Buku 1929	0
1930	1000000001930	Judul Buku 1930	0
1931	1000000001931	Judul Buku 1931	0
1932	1000000001932	Judul Buku 1932	0
1933	1000000001933	Judul Buku 1933	0
1934	1000000001934	Judul Buku 1934	0
1935	1000000001935	Judul Buku 1935	0
1936	1000000001936	Judul Buku 1936	0
1937	1000000001937	Judul Buku 1937	0
1938	1000000001938	Judul Buku 1938	0
1939	1000000001939	Judul Buku 1939	0
1940	1000000001940	Judul Buku 1940	0
1941	1000000001941	Judul Buku 1941	0
1942	1000000001942	Judul Buku 1942	0
1943	1000000001943	Judul Buku 1943	0
1944	1000000001944	Judul Buku 1944	0
1945	1000000001945	Judul Buku 1945	0
1946	1000000001946	Judul Buku 1946	0
1947	1000000001947	Judul Buku 1947	0
1948	1000000001948	Judul Buku 1948	0
1949	1000000001949	Judul Buku 1949	0
1950	1000000001950	Judul Buku 1950	0
1951	1000000001951	Judul Buku 1951	0
1952	1000000001952	Judul Buku 1952	0
1953	1000000001953	Judul Buku 1953	0
1954	1000000001954	Judul Buku 1954	0
1955	1000000001955	Judul Buku 1955	0
1956	1000000001956	Judul Buku 1956	0
1957	1000000001957	Judul Buku 1957	0
1958	1000000001958	Judul Buku 1958	0
1959	1000000001959	Judul Buku 1959	0
1960	1000000001960	Judul Buku 1960	0
1961	1000000001961	Judul Buku 1961	0
1962	1000000001962	Judul Buku 1962	0
1963	1000000001963	Judul Buku 1963	0
1964	1000000001964	Judul Buku 1964	0
1965	1000000001965	Judul Buku 1965	0
1966	1000000001966	Judul Buku 1966	0
1967	1000000001967	Judul Buku 1967	0
1968	1000000001968	Judul Buku 1968	0
1969	1000000001969	Judul Buku 1969	0
1970	1000000001970	Judul Buku 1970	0
1971	1000000001971	Judul Buku 1971	0
1972	1000000001972	Judul Buku 1972	0
1973	1000000001973	Judul Buku 1973	0
1974	1000000001974	Judul Buku 1974	0
1975	1000000001975	Judul Buku 1975	0
1976	1000000001976	Judul Buku 1976	0
1977	1000000001977	Judul Buku 1977	0
1978	1000000001978	Judul Buku 1978	0
1979	1000000001979	Judul Buku 1979	0
1980	1000000001980	Judul Buku 1980	0
1981	1000000001981	Judul Buku 1981	0
1982	1000000001982	Judul Buku 1982	0
1983	1000000001983	Judul Buku 1983	0
1984	1000000001984	Judul Buku 1984	0
1985	1000000001985	Judul Buku 1985	0
1986	1000000001986	Judul Buku 1986	0
1987	1000000001987	Judul Buku 1987	0
1988	1000000001988	Judul Buku 1988	0
1989	1000000001989	Judul Buku 1989	0
1990	1000000001990	Judul Buku 1990	0
1991	1000000001991	Judul Buku 1991	0
1992	1000000001992	Judul Buku 1992	0
1993	1000000001993	Judul Buku 1993	0
1994	1000000001994	Judul Buku 1994	0
1995	1000000001995	Judul Buku 1995	0
1996	1000000001996	Judul Buku 1996	0
1997	1000000001997	Judul Buku 1997	0
1998	1000000001998	Judul Buku 1998	0
1999	1000000001999	Judul Buku 1999	0
2000	1000000002000	Judul Buku 2000	0
2001	1000000002001	Judul Buku 2001	0
2002	1000000002002	Judul Buku 2002	0
2003	1000000002003	Judul Buku 2003	0
2004	1000000002004	Judul Buku 2004	0
2005	1000000002005	Judul Buku 2005	0
2006	1000000002006	Judul Buku 2006	0
2007	1000000002007	Judul Buku 2007	0
2008	1000000002008	Judul Buku 2008	0
2009	1000000002009	Judul Buku 2009	0
2010	1000000002010	Judul Buku 2010	0
2011	1000000002011	Judul Buku 2011	0
2012	1000000002012	Judul Buku 2012	0
2013	1000000002013	Judul Buku 2013	0
2014	1000000002014	Judul Buku 2014	0
2015	1000000002015	Judul Buku 2015	0
2016	1000000002016	Judul Buku 2016	0
2017	1000000002017	Judul Buku 2017	0
2018	1000000002018	Judul Buku 2018	0
2019	1000000002019	Judul Buku 2019	0
2020	1000000002020	Judul Buku 2020	0
2021	1000000002021	Judul Buku 2021	0
2022	1000000002022	Judul Buku 2022	0
2023	1000000002023	Judul Buku 2023	0
2024	1000000002024	Judul Buku 2024	0
2025	1000000002025	Judul Buku 2025	0
2026	1000000002026	Judul Buku 2026	0
2027	1000000002027	Judul Buku 2027	0
2028	1000000002028	Judul Buku 2028	0
2029	1000000002029	Judul Buku 2029	0
2030	1000000002030	Judul Buku 2030	0
2031	1000000002031	Judul Buku 2031	0
2032	1000000002032	Judul Buku 2032	0
2033	1000000002033	Judul Buku 2033	0
2034	1000000002034	Judul Buku 2034	0
2035	1000000002035	Judul Buku 2035	0
2036	1000000002036	Judul Buku 2036	0
2037	1000000002037	Judul Buku 2037	0
2038	1000000002038	Judul Buku 2038	0
2039	1000000002039	Judul Buku 2039	0
2040	1000000002040	Judul Buku 2040	0
2041	1000000002041	Judul Buku 2041	0
2042	1000000002042	Judul Buku 2042	0
2043	1000000002043	Judul Buku 2043	0
2044	1000000002044	Judul Buku 2044	0
2045	1000000002045	Judul Buku 2045	0
2046	1000000002046	Judul Buku 2046	0
2047	1000000002047	Judul Buku 2047	0
2048	1000000002048	Judul Buku 2048	0
2049	1000000002049	Judul Buku 2049	0
2050	1000000002050	Judul Buku 2050	0
2051	1000000002051	Judul Buku 2051	0
2052	1000000002052	Judul Buku 2052	0
2053	1000000002053	Judul Buku 2053	0
2054	1000000002054	Judul Buku 2054	0
2055	1000000002055	Judul Buku 2055	0
2056	1000000002056	Judul Buku 2056	0
2057	1000000002057	Judul Buku 2057	0
2058	1000000002058	Judul Buku 2058	0
2059	1000000002059	Judul Buku 2059	0
2060	1000000002060	Judul Buku 2060	0
2061	1000000002061	Judul Buku 2061	0
2062	1000000002062	Judul Buku 2062	0
2063	1000000002063	Judul Buku 2063	0
2064	1000000002064	Judul Buku 2064	0
2065	1000000002065	Judul Buku 2065	0
2066	1000000002066	Judul Buku 2066	0
2067	1000000002067	Judul Buku 2067	0
2068	1000000002068	Judul Buku 2068	0
2069	1000000002069	Judul Buku 2069	0
2070	1000000002070	Judul Buku 2070	0
2071	1000000002071	Judul Buku 2071	0
2072	1000000002072	Judul Buku 2072	0
2073	1000000002073	Judul Buku 2073	0
2074	1000000002074	Judul Buku 2074	0
2075	1000000002075	Judul Buku 2075	0
2076	1000000002076	Judul Buku 2076	0
2077	1000000002077	Judul Buku 2077	0
2078	1000000002078	Judul Buku 2078	0
2079	1000000002079	Judul Buku 2079	0
2080	1000000002080	Judul Buku 2080	0
2081	1000000002081	Judul Buku 2081	0
2082	1000000002082	Judul Buku 2082	0
2083	1000000002083	Judul Buku 2083	0
2084	1000000002084	Judul Buku 2084	0
2085	1000000002085	Judul Buku 2085	0
2086	1000000002086	Judul Buku 2086	0
2087	1000000002087	Judul Buku 2087	0
2088	1000000002088	Judul Buku 2088	0
2089	1000000002089	Judul Buku 2089	0
2090	1000000002090	Judul Buku 2090	0
2091	1000000002091	Judul Buku 2091	0
2092	1000000002092	Judul Buku 2092	0
2093	1000000002093	Judul Buku 2093	0
2094	1000000002094	Judul Buku 2094	0
2095	1000000002095	Judul Buku 2095	0
2096	1000000002096	Judul Buku 2096	0
2097	1000000002097	Judul Buku 2097	0
2098	1000000002098	Judul Buku 2098	0
2099	1000000002099	Judul Buku 2099	0
2100	1000000002100	Judul Buku 2100	0
2101	1000000002101	Judul Buku 2101	0
2102	1000000002102	Judul Buku 2102	0
2103	1000000002103	Judul Buku 2103	0
2104	1000000002104	Judul Buku 2104	0
2105	1000000002105	Judul Buku 2105	0
2106	1000000002106	Judul Buku 2106	0
2107	1000000002107	Judul Buku 2107	0
2108	1000000002108	Judul Buku 2108	0
2109	1000000002109	Judul Buku 2109	0
2110	1000000002110	Judul Buku 2110	0
2111	1000000002111	Judul Buku 2111	0
2112	1000000002112	Judul Buku 2112	0
2113	1000000002113	Judul Buku 2113	0
2114	1000000002114	Judul Buku 2114	0
2115	1000000002115	Judul Buku 2115	0
2116	1000000002116	Judul Buku 2116	0
2117	1000000002117	Judul Buku 2117	0
2118	1000000002118	Judul Buku 2118	0
2119	1000000002119	Judul Buku 2119	0
2120	1000000002120	Judul Buku 2120	0
2121	1000000002121	Judul Buku 2121	0
2122	1000000002122	Judul Buku 2122	0
2123	1000000002123	Judul Buku 2123	0
2124	1000000002124	Judul Buku 2124	0
2125	1000000002125	Judul Buku 2125	0
2126	1000000002126	Judul Buku 2126	0
2127	1000000002127	Judul Buku 2127	0
2128	1000000002128	Judul Buku 2128	0
2129	1000000002129	Judul Buku 2129	0
2130	1000000002130	Judul Buku 2130	0
2131	1000000002131	Judul Buku 2131	0
2132	1000000002132	Judul Buku 2132	0
2133	1000000002133	Judul Buku 2133	0
2134	1000000002134	Judul Buku 2134	0
2135	1000000002135	Judul Buku 2135	0
2136	1000000002136	Judul Buku 2136	0
2137	1000000002137	Judul Buku 2137	0
2138	1000000002138	Judul Buku 2138	0
2139	1000000002139	Judul Buku 2139	0
2140	1000000002140	Judul Buku 2140	0
2141	1000000002141	Judul Buku 2141	0
2142	1000000002142	Judul Buku 2142	0
2143	1000000002143	Judul Buku 2143	0
2144	1000000002144	Judul Buku 2144	0
2145	1000000002145	Judul Buku 2145	0
2146	1000000002146	Judul Buku 2146	0
2147	1000000002147	Judul Buku 2147	0
2148	1000000002148	Judul Buku 2148	0
2149	1000000002149	Judul Buku 2149	0
2150	1000000002150	Judul Buku 2150	0
2151	1000000002151	Judul Buku 2151	0
2152	1000000002152	Judul Buku 2152	0
2153	1000000002153	Judul Buku 2153	0
2154	1000000002154	Judul Buku 2154	0
2155	1000000002155	Judul Buku 2155	0
2156	1000000002156	Judul Buku 2156	0
2157	1000000002157	Judul Buku 2157	0
2158	1000000002158	Judul Buku 2158	0
2159	1000000002159	Judul Buku 2159	0
2160	1000000002160	Judul Buku 2160	0
2161	1000000002161	Judul Buku 2161	0
2162	1000000002162	Judul Buku 2162	0
2163	1000000002163	Judul Buku 2163	0
2164	1000000002164	Judul Buku 2164	0
2165	1000000002165	Judul Buku 2165	0
2166	1000000002166	Judul Buku 2166	0
2167	1000000002167	Judul Buku 2167	0
2168	1000000002168	Judul Buku 2168	0
2169	1000000002169	Judul Buku 2169	0
2170	1000000002170	Judul Buku 2170	0
2171	1000000002171	Judul Buku 2171	0
2172	1000000002172	Judul Buku 2172	0
2173	1000000002173	Judul Buku 2173	0
2174	1000000002174	Judul Buku 2174	0
2175	1000000002175	Judul Buku 2175	0
2176	1000000002176	Judul Buku 2176	0
2177	1000000002177	Judul Buku 2177	0
2178	1000000002178	Judul Buku 2178	0
2179	1000000002179	Judul Buku 2179	0
2180	1000000002180	Judul Buku 2180	0
2181	1000000002181	Judul Buku 2181	0
2182	1000000002182	Judul Buku 2182	0
2183	1000000002183	Judul Buku 2183	0
2184	1000000002184	Judul Buku 2184	0
2185	1000000002185	Judul Buku 2185	0
2186	1000000002186	Judul Buku 2186	0
2187	1000000002187	Judul Buku 2187	0
2188	1000000002188	Judul Buku 2188	0
2189	1000000002189	Judul Buku 2189	0
2190	1000000002190	Judul Buku 2190	0
2191	1000000002191	Judul Buku 2191	0
2192	1000000002192	Judul Buku 2192	0
2193	1000000002193	Judul Buku 2193	0
2194	1000000002194	Judul Buku 2194	0
2195	1000000002195	Judul Buku 2195	0
2196	1000000002196	Judul Buku 2196	0
2197	1000000002197	Judul Buku 2197	0
2198	1000000002198	Judul Buku 2198	0
2199	1000000002199	Judul Buku 2199	0
2200	1000000002200	Judul Buku 2200	0
2201	1000000002201	Judul Buku 2201	0
2202	1000000002202	Judul Buku 2202	0
2203	1000000002203	Judul Buku 2203	0
2204	1000000002204	Judul Buku 2204	0
2205	1000000002205	Judul Buku 2205	0
2206	1000000002206	Judul Buku 2206	0
2207	1000000002207	Judul Buku 2207	0
2208	1000000002208	Judul Buku 2208	0
2209	1000000002209	Judul Buku 2209	0
2210	1000000002210	Judul Buku 2210	0
2211	1000000002211	Judul Buku 2211	0
2212	1000000002212	Judul Buku 2212	0
2213	1000000002213	Judul Buku 2213	0
2214	1000000002214	Judul Buku 2214	0
2215	1000000002215	Judul Buku 2215	0
2216	1000000002216	Judul Buku 2216	0
2217	1000000002217	Judul Buku 2217	0
2218	1000000002218	Judul Buku 2218	0
2219	1000000002219	Judul Buku 2219	0
2220	1000000002220	Judul Buku 2220	0
2221	1000000002221	Judul Buku 2221	0
2222	1000000002222	Judul Buku 2222	0
2223	1000000002223	Judul Buku 2223	0
2224	1000000002224	Judul Buku 2224	0
2225	1000000002225	Judul Buku 2225	0
2226	1000000002226	Judul Buku 2226	0
2227	1000000002227	Judul Buku 2227	0
2228	1000000002228	Judul Buku 2228	0
2229	1000000002229	Judul Buku 2229	0
2230	1000000002230	Judul Buku 2230	0
2231	1000000002231	Judul Buku 2231	0
2232	1000000002232	Judul Buku 2232	0
2233	1000000002233	Judul Buku 2233	0
2234	1000000002234	Judul Buku 2234	0
2235	1000000002235	Judul Buku 2235	0
2236	1000000002236	Judul Buku 2236	0
2237	1000000002237	Judul Buku 2237	0
2238	1000000002238	Judul Buku 2238	0
2239	1000000002239	Judul Buku 2239	0
2240	1000000002240	Judul Buku 2240	0
2241	1000000002241	Judul Buku 2241	0
2242	1000000002242	Judul Buku 2242	0
2243	1000000002243	Judul Buku 2243	0
2244	1000000002244	Judul Buku 2244	0
2245	1000000002245	Judul Buku 2245	0
2246	1000000002246	Judul Buku 2246	0
2247	1000000002247	Judul Buku 2247	0
2248	1000000002248	Judul Buku 2248	0
2249	1000000002249	Judul Buku 2249	0
2250	1000000002250	Judul Buku 2250	0
2251	1000000002251	Judul Buku 2251	0
2252	1000000002252	Judul Buku 2252	0
2253	1000000002253	Judul Buku 2253	0
2254	1000000002254	Judul Buku 2254	0
2255	1000000002255	Judul Buku 2255	0
2256	1000000002256	Judul Buku 2256	0
2257	1000000002257	Judul Buku 2257	0
2258	1000000002258	Judul Buku 2258	0
2259	1000000002259	Judul Buku 2259	0
2260	1000000002260	Judul Buku 2260	0
2261	1000000002261	Judul Buku 2261	0
2262	1000000002262	Judul Buku 2262	0
2263	1000000002263	Judul Buku 2263	0
2264	1000000002264	Judul Buku 2264	0
2265	1000000002265	Judul Buku 2265	0
2266	1000000002266	Judul Buku 2266	0
2267	1000000002267	Judul Buku 2267	0
2268	1000000002268	Judul Buku 2268	0
2269	1000000002269	Judul Buku 2269	0
2270	1000000002270	Judul Buku 2270	0
2271	1000000002271	Judul Buku 2271	0
2272	1000000002272	Judul Buku 2272	0
2273	1000000002273	Judul Buku 2273	0
2274	1000000002274	Judul Buku 2274	0
2275	1000000002275	Judul Buku 2275	0
2276	1000000002276	Judul Buku 2276	0
2277	1000000002277	Judul Buku 2277	0
2278	1000000002278	Judul Buku 2278	0
2279	1000000002279	Judul Buku 2279	0
2280	1000000002280	Judul Buku 2280	0
2281	1000000002281	Judul Buku 2281	0
2282	1000000002282	Judul Buku 2282	0
2283	1000000002283	Judul Buku 2283	0
2284	1000000002284	Judul Buku 2284	0
2285	1000000002285	Judul Buku 2285	0
2286	1000000002286	Judul Buku 2286	0
2287	1000000002287	Judul Buku 2287	0
2288	1000000002288	Judul Buku 2288	0
2289	1000000002289	Judul Buku 2289	0
2290	1000000002290	Judul Buku 2290	0
2291	1000000002291	Judul Buku 2291	0
2292	1000000002292	Judul Buku 2292	0
2293	1000000002293	Judul Buku 2293	0
2294	1000000002294	Judul Buku 2294	0
2295	1000000002295	Judul Buku 2295	0
2296	1000000002296	Judul Buku 2296	0
2297	1000000002297	Judul Buku 2297	0
2298	1000000002298	Judul Buku 2298	0
2299	1000000002299	Judul Buku 2299	0
2300	1000000002300	Judul Buku 2300	0
2301	1000000002301	Judul Buku 2301	0
2302	1000000002302	Judul Buku 2302	0
2303	1000000002303	Judul Buku 2303	0
2304	1000000002304	Judul Buku 2304	0
2305	1000000002305	Judul Buku 2305	0
2306	1000000002306	Judul Buku 2306	0
2307	1000000002307	Judul Buku 2307	0
2308	1000000002308	Judul Buku 2308	0
2309	1000000002309	Judul Buku 2309	0
2310	1000000002310	Judul Buku 2310	0
2311	1000000002311	Judul Buku 2311	0
2312	1000000002312	Judul Buku 2312	0
2313	1000000002313	Judul Buku 2313	0
2314	1000000002314	Judul Buku 2314	0
2315	1000000002315	Judul Buku 2315	0
2316	1000000002316	Judul Buku 2316	0
2317	1000000002317	Judul Buku 2317	0
2318	1000000002318	Judul Buku 2318	0
2319	1000000002319	Judul Buku 2319	0
2320	1000000002320	Judul Buku 2320	0
2321	1000000002321	Judul Buku 2321	0
2322	1000000002322	Judul Buku 2322	0
2323	1000000002323	Judul Buku 2323	0
2324	1000000002324	Judul Buku 2324	0
2325	1000000002325	Judul Buku 2325	0
2326	1000000002326	Judul Buku 2326	0
2327	1000000002327	Judul Buku 2327	0
2328	1000000002328	Judul Buku 2328	0
2329	1000000002329	Judul Buku 2329	0
2330	1000000002330	Judul Buku 2330	0
2331	1000000002331	Judul Buku 2331	0
2332	1000000002332	Judul Buku 2332	0
2333	1000000002333	Judul Buku 2333	0
2334	1000000002334	Judul Buku 2334	0
2335	1000000002335	Judul Buku 2335	0
2336	1000000002336	Judul Buku 2336	0
2337	1000000002337	Judul Buku 2337	0
2338	1000000002338	Judul Buku 2338	0
2339	1000000002339	Judul Buku 2339	0
2340	1000000002340	Judul Buku 2340	0
2341	1000000002341	Judul Buku 2341	0
2342	1000000002342	Judul Buku 2342	0
2343	1000000002343	Judul Buku 2343	0
2344	1000000002344	Judul Buku 2344	0
2345	1000000002345	Judul Buku 2345	0
2346	1000000002346	Judul Buku 2346	0
2347	1000000002347	Judul Buku 2347	0
2348	1000000002348	Judul Buku 2348	0
2349	1000000002349	Judul Buku 2349	0
2350	1000000002350	Judul Buku 2350	0
2351	1000000002351	Judul Buku 2351	0
2352	1000000002352	Judul Buku 2352	0
2353	1000000002353	Judul Buku 2353	0
2354	1000000002354	Judul Buku 2354	0
2355	1000000002355	Judul Buku 2355	0
2356	1000000002356	Judul Buku 2356	0
2357	1000000002357	Judul Buku 2357	0
2358	1000000002358	Judul Buku 2358	0
2359	1000000002359	Judul Buku 2359	0
2360	1000000002360	Judul Buku 2360	0
2361	1000000002361	Judul Buku 2361	0
2362	1000000002362	Judul Buku 2362	0
2363	1000000002363	Judul Buku 2363	0
2364	1000000002364	Judul Buku 2364	0
2365	1000000002365	Judul Buku 2365	0
2366	1000000002366	Judul Buku 2366	0
2367	1000000002367	Judul Buku 2367	0
2368	1000000002368	Judul Buku 2368	0
2369	1000000002369	Judul Buku 2369	0
2370	1000000002370	Judul Buku 2370	0
2371	1000000002371	Judul Buku 2371	0
2372	1000000002372	Judul Buku 2372	0
2373	1000000002373	Judul Buku 2373	0
2374	1000000002374	Judul Buku 2374	0
2375	1000000002375	Judul Buku 2375	0
2376	1000000002376	Judul Buku 2376	0
2377	1000000002377	Judul Buku 2377	0
2378	1000000002378	Judul Buku 2378	0
2379	1000000002379	Judul Buku 2379	0
2380	1000000002380	Judul Buku 2380	0
2381	1000000002381	Judul Buku 2381	0
2382	1000000002382	Judul Buku 2382	0
2383	1000000002383	Judul Buku 2383	0
2384	1000000002384	Judul Buku 2384	0
2385	1000000002385	Judul Buku 2385	0
2386	1000000002386	Judul Buku 2386	0
2387	1000000002387	Judul Buku 2387	0
2388	1000000002388	Judul Buku 2388	0
2389	1000000002389	Judul Buku 2389	0
2390	1000000002390	Judul Buku 2390	0
2391	1000000002391	Judul Buku 2391	0
2392	1000000002392	Judul Buku 2392	0
2393	1000000002393	Judul Buku 2393	0
2394	1000000002394	Judul Buku 2394	0
2395	1000000002395	Judul Buku 2395	0
2396	1000000002396	Judul Buku 2396	0
2397	1000000002397	Judul Buku 2397	0
2398	1000000002398	Judul Buku 2398	0
2399	1000000002399	Judul Buku 2399	0
2400	1000000002400	Judul Buku 2400	0
2401	1000000002401	Judul Buku 2401	0
2402	1000000002402	Judul Buku 2402	0
2403	1000000002403	Judul Buku 2403	0
2404	1000000002404	Judul Buku 2404	0
2405	1000000002405	Judul Buku 2405	0
2406	1000000002406	Judul Buku 2406	0
2407	1000000002407	Judul Buku 2407	0
2408	1000000002408	Judul Buku 2408	0
2409	1000000002409	Judul Buku 2409	0
2410	1000000002410	Judul Buku 2410	0
2411	1000000002411	Judul Buku 2411	0
2412	1000000002412	Judul Buku 2412	0
2413	1000000002413	Judul Buku 2413	0
2414	1000000002414	Judul Buku 2414	0
2415	1000000002415	Judul Buku 2415	0
2416	1000000002416	Judul Buku 2416	0
2417	1000000002417	Judul Buku 2417	0
2418	1000000002418	Judul Buku 2418	0
2419	1000000002419	Judul Buku 2419	0
2420	1000000002420	Judul Buku 2420	0
2421	1000000002421	Judul Buku 2421	0
2422	1000000002422	Judul Buku 2422	0
2423	1000000002423	Judul Buku 2423	0
2424	1000000002424	Judul Buku 2424	0
2425	1000000002425	Judul Buku 2425	0
2426	1000000002426	Judul Buku 2426	0
2427	1000000002427	Judul Buku 2427	0
2428	1000000002428	Judul Buku 2428	0
2429	1000000002429	Judul Buku 2429	0
2430	1000000002430	Judul Buku 2430	0
2431	1000000002431	Judul Buku 2431	0
2432	1000000002432	Judul Buku 2432	0
2433	1000000002433	Judul Buku 2433	0
2434	1000000002434	Judul Buku 2434	0
2435	1000000002435	Judul Buku 2435	0
2436	1000000002436	Judul Buku 2436	0
2437	1000000002437	Judul Buku 2437	0
2438	1000000002438	Judul Buku 2438	0
2439	1000000002439	Judul Buku 2439	0
2440	1000000002440	Judul Buku 2440	0
2441	1000000002441	Judul Buku 2441	0
2442	1000000002442	Judul Buku 2442	0
2443	1000000002443	Judul Buku 2443	0
2444	1000000002444	Judul Buku 2444	0
2445	1000000002445	Judul Buku 2445	0
2446	1000000002446	Judul Buku 2446	0
2447	1000000002447	Judul Buku 2447	0
2448	1000000002448	Judul Buku 2448	0
2449	1000000002449	Judul Buku 2449	0
2450	1000000002450	Judul Buku 2450	0
2451	1000000002451	Judul Buku 2451	0
2452	1000000002452	Judul Buku 2452	0
2453	1000000002453	Judul Buku 2453	0
2454	1000000002454	Judul Buku 2454	0
2455	1000000002455	Judul Buku 2455	0
2456	1000000002456	Judul Buku 2456	0
2457	1000000002457	Judul Buku 2457	0
2458	1000000002458	Judul Buku 2458	0
2459	1000000002459	Judul Buku 2459	0
2460	1000000002460	Judul Buku 2460	0
2461	1000000002461	Judul Buku 2461	0
2462	1000000002462	Judul Buku 2462	0
2463	1000000002463	Judul Buku 2463	0
2464	1000000002464	Judul Buku 2464	0
2465	1000000002465	Judul Buku 2465	0
2466	1000000002466	Judul Buku 2466	0
2467	1000000002467	Judul Buku 2467	0
2468	1000000002468	Judul Buku 2468	0
2469	1000000002469	Judul Buku 2469	0
2470	1000000002470	Judul Buku 2470	0
2471	1000000002471	Judul Buku 2471	0
2472	1000000002472	Judul Buku 2472	0
2473	1000000002473	Judul Buku 2473	0
2474	1000000002474	Judul Buku 2474	0
2475	1000000002475	Judul Buku 2475	0
2476	1000000002476	Judul Buku 2476	0
2477	1000000002477	Judul Buku 2477	0
2478	1000000002478	Judul Buku 2478	0
2479	1000000002479	Judul Buku 2479	0
2480	1000000002480	Judul Buku 2480	0
2481	1000000002481	Judul Buku 2481	0
2482	1000000002482	Judul Buku 2482	0
2483	1000000002483	Judul Buku 2483	0
2484	1000000002484	Judul Buku 2484	0
2485	1000000002485	Judul Buku 2485	0
2486	1000000002486	Judul Buku 2486	0
2487	1000000002487	Judul Buku 2487	0
2488	1000000002488	Judul Buku 2488	0
2489	1000000002489	Judul Buku 2489	0
2490	1000000002490	Judul Buku 2490	0
2491	1000000002491	Judul Buku 2491	0
2492	1000000002492	Judul Buku 2492	0
2493	1000000002493	Judul Buku 2493	0
2494	1000000002494	Judul Buku 2494	0
2495	1000000002495	Judul Buku 2495	0
2496	1000000002496	Judul Buku 2496	0
2497	1000000002497	Judul Buku 2497	0
2498	1000000002498	Judul Buku 2498	0
2499	1000000002499	Judul Buku 2499	0
2500	1000000002500	Judul Buku 2500	0
2501	1000000002501	Judul Buku 2501	0
2502	1000000002502	Judul Buku 2502	0
2503	1000000002503	Judul Buku 2503	0
2504	1000000002504	Judul Buku 2504	0
2505	1000000002505	Judul Buku 2505	0
2506	1000000002506	Judul Buku 2506	0
2507	1000000002507	Judul Buku 2507	0
2508	1000000002508	Judul Buku 2508	0
2509	1000000002509	Judul Buku 2509	0
2510	1000000002510	Judul Buku 2510	0
2511	1000000002511	Judul Buku 2511	0
2512	1000000002512	Judul Buku 2512	0
2513	1000000002513	Judul Buku 2513	0
2514	1000000002514	Judul Buku 2514	0
2515	1000000002515	Judul Buku 2515	0
2516	1000000002516	Judul Buku 2516	0
2517	1000000002517	Judul Buku 2517	0
2518	1000000002518	Judul Buku 2518	0
2519	1000000002519	Judul Buku 2519	0
2520	1000000002520	Judul Buku 2520	0
2521	1000000002521	Judul Buku 2521	0
2522	1000000002522	Judul Buku 2522	0
2523	1000000002523	Judul Buku 2523	0
2524	1000000002524	Judul Buku 2524	0
2525	1000000002525	Judul Buku 2525	0
2526	1000000002526	Judul Buku 2526	0
2527	1000000002527	Judul Buku 2527	0
2528	1000000002528	Judul Buku 2528	0
2529	1000000002529	Judul Buku 2529	0
2530	1000000002530	Judul Buku 2530	0
2531	1000000002531	Judul Buku 2531	0
2532	1000000002532	Judul Buku 2532	0
2533	1000000002533	Judul Buku 2533	0
2534	1000000002534	Judul Buku 2534	0
2535	1000000002535	Judul Buku 2535	0
2536	1000000002536	Judul Buku 2536	0
2537	1000000002537	Judul Buku 2537	0
2538	1000000002538	Judul Buku 2538	0
2539	1000000002539	Judul Buku 2539	0
2540	1000000002540	Judul Buku 2540	0
2541	1000000002541	Judul Buku 2541	0
2542	1000000002542	Judul Buku 2542	0
2543	1000000002543	Judul Buku 2543	0
2544	1000000002544	Judul Buku 2544	0
2545	1000000002545	Judul Buku 2545	0
2546	1000000002546	Judul Buku 2546	0
2547	1000000002547	Judul Buku 2547	0
2548	1000000002548	Judul Buku 2548	0
2549	1000000002549	Judul Buku 2549	0
2550	1000000002550	Judul Buku 2550	0
2551	1000000002551	Judul Buku 2551	0
2552	1000000002552	Judul Buku 2552	0
2553	1000000002553	Judul Buku 2553	0
2554	1000000002554	Judul Buku 2554	0
2555	1000000002555	Judul Buku 2555	0
2556	1000000002556	Judul Buku 2556	0
2557	1000000002557	Judul Buku 2557	0
2558	1000000002558	Judul Buku 2558	0
2559	1000000002559	Judul Buku 2559	0
2560	1000000002560	Judul Buku 2560	0
2561	1000000002561	Judul Buku 2561	0
2562	1000000002562	Judul Buku 2562	0
2563	1000000002563	Judul Buku 2563	0
2564	1000000002564	Judul Buku 2564	0
2565	1000000002565	Judul Buku 2565	0
2566	1000000002566	Judul Buku 2566	0
2567	1000000002567	Judul Buku 2567	0
2568	1000000002568	Judul Buku 2568	0
2569	1000000002569	Judul Buku 2569	0
2570	1000000002570	Judul Buku 2570	0
2571	1000000002571	Judul Buku 2571	0
2572	1000000002572	Judul Buku 2572	0
2573	1000000002573	Judul Buku 2573	0
2574	1000000002574	Judul Buku 2574	0
2575	1000000002575	Judul Buku 2575	0
2576	1000000002576	Judul Buku 2576	0
2577	1000000002577	Judul Buku 2577	0
2578	1000000002578	Judul Buku 2578	0
2579	1000000002579	Judul Buku 2579	0
2580	1000000002580	Judul Buku 2580	0
2581	1000000002581	Judul Buku 2581	0
2582	1000000002582	Judul Buku 2582	0
2583	1000000002583	Judul Buku 2583	0
2584	1000000002584	Judul Buku 2584	0
2585	1000000002585	Judul Buku 2585	0
2586	1000000002586	Judul Buku 2586	0
2587	1000000002587	Judul Buku 2587	0
2588	1000000002588	Judul Buku 2588	0
2589	1000000002589	Judul Buku 2589	0
2590	1000000002590	Judul Buku 2590	0
2591	1000000002591	Judul Buku 2591	0
2592	1000000002592	Judul Buku 2592	0
2593	1000000002593	Judul Buku 2593	0
2594	1000000002594	Judul Buku 2594	0
2595	1000000002595	Judul Buku 2595	0
2596	1000000002596	Judul Buku 2596	0
2597	1000000002597	Judul Buku 2597	0
2598	1000000002598	Judul Buku 2598	0
2599	1000000002599	Judul Buku 2599	0
2600	1000000002600	Judul Buku 2600	0
2601	1000000002601	Judul Buku 2601	0
2602	1000000002602	Judul Buku 2602	0
2603	1000000002603	Judul Buku 2603	0
2604	1000000002604	Judul Buku 2604	0
2605	1000000002605	Judul Buku 2605	0
2606	1000000002606	Judul Buku 2606	0
2607	1000000002607	Judul Buku 2607	0
2608	1000000002608	Judul Buku 2608	0
2609	1000000002609	Judul Buku 2609	0
2610	1000000002610	Judul Buku 2610	0
2611	1000000002611	Judul Buku 2611	0
2612	1000000002612	Judul Buku 2612	0
2613	1000000002613	Judul Buku 2613	0
2614	1000000002614	Judul Buku 2614	0
2615	1000000002615	Judul Buku 2615	0
2616	1000000002616	Judul Buku 2616	0
2617	1000000002617	Judul Buku 2617	0
2618	1000000002618	Judul Buku 2618	0
2619	1000000002619	Judul Buku 2619	0
2620	1000000002620	Judul Buku 2620	0
2621	1000000002621	Judul Buku 2621	0
2622	1000000002622	Judul Buku 2622	0
2623	1000000002623	Judul Buku 2623	0
2624	1000000002624	Judul Buku 2624	0
2625	1000000002625	Judul Buku 2625	0
2626	1000000002626	Judul Buku 2626	0
2627	1000000002627	Judul Buku 2627	0
2628	1000000002628	Judul Buku 2628	0
2629	1000000002629	Judul Buku 2629	0
2630	1000000002630	Judul Buku 2630	0
2631	1000000002631	Judul Buku 2631	0
2632	1000000002632	Judul Buku 2632	0
2633	1000000002633	Judul Buku 2633	0
2634	1000000002634	Judul Buku 2634	0
2635	1000000002635	Judul Buku 2635	0
2636	1000000002636	Judul Buku 2636	0
2637	1000000002637	Judul Buku 2637	0
2638	1000000002638	Judul Buku 2638	0
2639	1000000002639	Judul Buku 2639	0
2640	1000000002640	Judul Buku 2640	0
2641	1000000002641	Judul Buku 2641	0
2642	1000000002642	Judul Buku 2642	0
2643	1000000002643	Judul Buku 2643	0
2644	1000000002644	Judul Buku 2644	0
2645	1000000002645	Judul Buku 2645	0
2646	1000000002646	Judul Buku 2646	0
2647	1000000002647	Judul Buku 2647	0
2648	1000000002648	Judul Buku 2648	0
2649	1000000002649	Judul Buku 2649	0
2650	1000000002650	Judul Buku 2650	0
2651	1000000002651	Judul Buku 2651	0
2652	1000000002652	Judul Buku 2652	0
2653	1000000002653	Judul Buku 2653	0
2654	1000000002654	Judul Buku 2654	0
2655	1000000002655	Judul Buku 2655	0
2656	1000000002656	Judul Buku 2656	0
2657	1000000002657	Judul Buku 2657	0
2658	1000000002658	Judul Buku 2658	0
2659	1000000002659	Judul Buku 2659	0
2660	1000000002660	Judul Buku 2660	0
2661	1000000002661	Judul Buku 2661	0
2662	1000000002662	Judul Buku 2662	0
2663	1000000002663	Judul Buku 2663	0
2664	1000000002664	Judul Buku 2664	0
2665	1000000002665	Judul Buku 2665	0
2666	1000000002666	Judul Buku 2666	0
2667	1000000002667	Judul Buku 2667	0
2668	1000000002668	Judul Buku 2668	0
2669	1000000002669	Judul Buku 2669	0
2670	1000000002670	Judul Buku 2670	0
2671	1000000002671	Judul Buku 2671	0
2672	1000000002672	Judul Buku 2672	0
2673	1000000002673	Judul Buku 2673	0
2674	1000000002674	Judul Buku 2674	0
2675	1000000002675	Judul Buku 2675	0
2676	1000000002676	Judul Buku 2676	0
2677	1000000002677	Judul Buku 2677	0
2678	1000000002678	Judul Buku 2678	0
2679	1000000002679	Judul Buku 2679	0
2680	1000000002680	Judul Buku 2680	0
2681	1000000002681	Judul Buku 2681	0
2682	1000000002682	Judul Buku 2682	0
2683	1000000002683	Judul Buku 2683	0
2684	1000000002684	Judul Buku 2684	0
2685	1000000002685	Judul Buku 2685	0
2686	1000000002686	Judul Buku 2686	0
2687	1000000002687	Judul Buku 2687	0
2688	1000000002688	Judul Buku 2688	0
2689	1000000002689	Judul Buku 2689	0
2690	1000000002690	Judul Buku 2690	0
2691	1000000002691	Judul Buku 2691	0
2692	1000000002692	Judul Buku 2692	0
2693	1000000002693	Judul Buku 2693	0
2694	1000000002694	Judul Buku 2694	0
2695	1000000002695	Judul Buku 2695	0
2696	1000000002696	Judul Buku 2696	0
2697	1000000002697	Judul Buku 2697	0
2698	1000000002698	Judul Buku 2698	0
2699	1000000002699	Judul Buku 2699	0
2700	1000000002700	Judul Buku 2700	0
2701	1000000002701	Judul Buku 2701	0
2702	1000000002702	Judul Buku 2702	0
2703	1000000002703	Judul Buku 2703	0
2704	1000000002704	Judul Buku 2704	0
2705	1000000002705	Judul Buku 2705	0
2706	1000000002706	Judul Buku 2706	0
2707	1000000002707	Judul Buku 2707	0
2708	1000000002708	Judul Buku 2708	0
2709	1000000002709	Judul Buku 2709	0
2710	1000000002710	Judul Buku 2710	0
2711	1000000002711	Judul Buku 2711	0
2712	1000000002712	Judul Buku 2712	0
2713	1000000002713	Judul Buku 2713	0
2714	1000000002714	Judul Buku 2714	0
2715	1000000002715	Judul Buku 2715	0
2716	1000000002716	Judul Buku 2716	0
2717	1000000002717	Judul Buku 2717	0
2718	1000000002718	Judul Buku 2718	0
2719	1000000002719	Judul Buku 2719	0
2720	1000000002720	Judul Buku 2720	0
2721	1000000002721	Judul Buku 2721	0
2722	1000000002722	Judul Buku 2722	0
2723	1000000002723	Judul Buku 2723	0
2724	1000000002724	Judul Buku 2724	0
2725	1000000002725	Judul Buku 2725	0
2726	1000000002726	Judul Buku 2726	0
2727	1000000002727	Judul Buku 2727	0
2728	1000000002728	Judul Buku 2728	0
2729	1000000002729	Judul Buku 2729	0
2730	1000000002730	Judul Buku 2730	0
2731	1000000002731	Judul Buku 2731	0
2732	1000000002732	Judul Buku 2732	0
2733	1000000002733	Judul Buku 2733	0
2734	1000000002734	Judul Buku 2734	0
2735	1000000002735	Judul Buku 2735	0
2736	1000000002736	Judul Buku 2736	0
2737	1000000002737	Judul Buku 2737	0
2738	1000000002738	Judul Buku 2738	0
2739	1000000002739	Judul Buku 2739	0
2740	1000000002740	Judul Buku 2740	0
2741	1000000002741	Judul Buku 2741	0
2742	1000000002742	Judul Buku 2742	0
2743	1000000002743	Judul Buku 2743	0
2744	1000000002744	Judul Buku 2744	0
2745	1000000002745	Judul Buku 2745	0
2746	1000000002746	Judul Buku 2746	0
2747	1000000002747	Judul Buku 2747	0
2748	1000000002748	Judul Buku 2748	0
2749	1000000002749	Judul Buku 2749	0
2750	1000000002750	Judul Buku 2750	0
2751	1000000002751	Judul Buku 2751	0
2752	1000000002752	Judul Buku 2752	0
2753	1000000002753	Judul Buku 2753	0
2754	1000000002754	Judul Buku 2754	0
2755	1000000002755	Judul Buku 2755	0
2756	1000000002756	Judul Buku 2756	0
2757	1000000002757	Judul Buku 2757	0
2758	1000000002758	Judul Buku 2758	0
2759	1000000002759	Judul Buku 2759	0
2760	1000000002760	Judul Buku 2760	0
2761	1000000002761	Judul Buku 2761	0
2762	1000000002762	Judul Buku 2762	0
2763	1000000002763	Judul Buku 2763	0
2764	1000000002764	Judul Buku 2764	0
2765	1000000002765	Judul Buku 2765	0
2766	1000000002766	Judul Buku 2766	0
2767	1000000002767	Judul Buku 2767	0
2768	1000000002768	Judul Buku 2768	0
2769	1000000002769	Judul Buku 2769	0
2770	1000000002770	Judul Buku 2770	0
2771	1000000002771	Judul Buku 2771	0
2772	1000000002772	Judul Buku 2772	0
2773	1000000002773	Judul Buku 2773	0
2774	1000000002774	Judul Buku 2774	0
2775	1000000002775	Judul Buku 2775	0
2776	1000000002776	Judul Buku 2776	0
2777	1000000002777	Judul Buku 2777	0
2778	1000000002778	Judul Buku 2778	0
2779	1000000002779	Judul Buku 2779	0
2780	1000000002780	Judul Buku 2780	0
2781	1000000002781	Judul Buku 2781	0
2782	1000000002782	Judul Buku 2782	0
2783	1000000002783	Judul Buku 2783	0
2784	1000000002784	Judul Buku 2784	0
2785	1000000002785	Judul Buku 2785	0
2786	1000000002786	Judul Buku 2786	0
2787	1000000002787	Judul Buku 2787	0
2788	1000000002788	Judul Buku 2788	0
2789	1000000002789	Judul Buku 2789	0
2790	1000000002790	Judul Buku 2790	0
2791	1000000002791	Judul Buku 2791	0
2792	1000000002792	Judul Buku 2792	0
2793	1000000002793	Judul Buku 2793	0
2794	1000000002794	Judul Buku 2794	0
2795	1000000002795	Judul Buku 2795	0
2796	1000000002796	Judul Buku 2796	0
2797	1000000002797	Judul Buku 2797	0
2798	1000000002798	Judul Buku 2798	0
2799	1000000002799	Judul Buku 2799	0
2800	1000000002800	Judul Buku 2800	0
2801	1000000002801	Judul Buku 2801	0
2802	1000000002802	Judul Buku 2802	0
2803	1000000002803	Judul Buku 2803	0
2804	1000000002804	Judul Buku 2804	0
2805	1000000002805	Judul Buku 2805	0
2806	1000000002806	Judul Buku 2806	0
2807	1000000002807	Judul Buku 2807	0
2808	1000000002808	Judul Buku 2808	0
2809	1000000002809	Judul Buku 2809	0
2810	1000000002810	Judul Buku 2810	0
2811	1000000002811	Judul Buku 2811	0
2812	1000000002812	Judul Buku 2812	0
2813	1000000002813	Judul Buku 2813	0
2814	1000000002814	Judul Buku 2814	0
2815	1000000002815	Judul Buku 2815	0
2816	1000000002816	Judul Buku 2816	0
2817	1000000002817	Judul Buku 2817	0
2818	1000000002818	Judul Buku 2818	0
2819	1000000002819	Judul Buku 2819	0
2820	1000000002820	Judul Buku 2820	0
2821	1000000002821	Judul Buku 2821	0
2822	1000000002822	Judul Buku 2822	0
2823	1000000002823	Judul Buku 2823	0
2824	1000000002824	Judul Buku 2824	0
2825	1000000002825	Judul Buku 2825	0
2826	1000000002826	Judul Buku 2826	0
2827	1000000002827	Judul Buku 2827	0
2828	1000000002828	Judul Buku 2828	0
2829	1000000002829	Judul Buku 2829	0
2830	1000000002830	Judul Buku 2830	0
2831	1000000002831	Judul Buku 2831	0
2832	1000000002832	Judul Buku 2832	0
2833	1000000002833	Judul Buku 2833	0
2834	1000000002834	Judul Buku 2834	0
2835	1000000002835	Judul Buku 2835	0
2836	1000000002836	Judul Buku 2836	0
2837	1000000002837	Judul Buku 2837	0
2838	1000000002838	Judul Buku 2838	0
2839	1000000002839	Judul Buku 2839	0
2840	1000000002840	Judul Buku 2840	0
2841	1000000002841	Judul Buku 2841	0
2842	1000000002842	Judul Buku 2842	0
2843	1000000002843	Judul Buku 2843	0
2844	1000000002844	Judul Buku 2844	0
2845	1000000002845	Judul Buku 2845	0
2846	1000000002846	Judul Buku 2846	0
2847	1000000002847	Judul Buku 2847	0
2848	1000000002848	Judul Buku 2848	0
2849	1000000002849	Judul Buku 2849	0
2850	1000000002850	Judul Buku 2850	0
2851	1000000002851	Judul Buku 2851	0
2852	1000000002852	Judul Buku 2852	0
2853	1000000002853	Judul Buku 2853	0
2854	1000000002854	Judul Buku 2854	0
2855	1000000002855	Judul Buku 2855	0
2856	1000000002856	Judul Buku 2856	0
2857	1000000002857	Judul Buku 2857	0
2858	1000000002858	Judul Buku 2858	0
2859	1000000002859	Judul Buku 2859	0
2860	1000000002860	Judul Buku 2860	0
2861	1000000002861	Judul Buku 2861	0
2862	1000000002862	Judul Buku 2862	0
2863	1000000002863	Judul Buku 2863	0
2864	1000000002864	Judul Buku 2864	0
2865	1000000002865	Judul Buku 2865	0
2866	1000000002866	Judul Buku 2866	0
2867	1000000002867	Judul Buku 2867	0
2868	1000000002868	Judul Buku 2868	0
2869	1000000002869	Judul Buku 2869	0
2870	1000000002870	Judul Buku 2870	0
2871	1000000002871	Judul Buku 2871	0
2872	1000000002872	Judul Buku 2872	0
2873	1000000002873	Judul Buku 2873	0
2874	1000000002874	Judul Buku 2874	0
2875	1000000002875	Judul Buku 2875	0
2876	1000000002876	Judul Buku 2876	0
2877	1000000002877	Judul Buku 2877	0
2878	1000000002878	Judul Buku 2878	0
2879	1000000002879	Judul Buku 2879	0
2880	1000000002880	Judul Buku 2880	0
2881	1000000002881	Judul Buku 2881	0
2882	1000000002882	Judul Buku 2882	0
2883	1000000002883	Judul Buku 2883	0
2884	1000000002884	Judul Buku 2884	0
2885	1000000002885	Judul Buku 2885	0
2886	1000000002886	Judul Buku 2886	0
2887	1000000002887	Judul Buku 2887	0
2888	1000000002888	Judul Buku 2888	0
2889	1000000002889	Judul Buku 2889	0
2890	1000000002890	Judul Buku 2890	0
2891	1000000002891	Judul Buku 2891	0
2892	1000000002892	Judul Buku 2892	0
2893	1000000002893	Judul Buku 2893	0
2894	1000000002894	Judul Buku 2894	0
2895	1000000002895	Judul Buku 2895	0
2896	1000000002896	Judul Buku 2896	0
2897	1000000002897	Judul Buku 2897	0
2898	1000000002898	Judul Buku 2898	0
2899	1000000002899	Judul Buku 2899	0
2900	1000000002900	Judul Buku 2900	0
2901	1000000002901	Judul Buku 2901	0
2902	1000000002902	Judul Buku 2902	0
2903	1000000002903	Judul Buku 2903	0
2904	1000000002904	Judul Buku 2904	0
2905	1000000002905	Judul Buku 2905	0
2906	1000000002906	Judul Buku 2906	0
2907	1000000002907	Judul Buku 2907	0
2908	1000000002908	Judul Buku 2908	0
2909	1000000002909	Judul Buku 2909	0
2910	1000000002910	Judul Buku 2910	0
2911	1000000002911	Judul Buku 2911	0
2912	1000000002912	Judul Buku 2912	0
2913	1000000002913	Judul Buku 2913	0
2914	1000000002914	Judul Buku 2914	0
2915	1000000002915	Judul Buku 2915	0
2916	1000000002916	Judul Buku 2916	0
2917	1000000002917	Judul Buku 2917	0
2918	1000000002918	Judul Buku 2918	0
2919	1000000002919	Judul Buku 2919	0
2920	1000000002920	Judul Buku 2920	0
2921	1000000002921	Judul Buku 2921	0
2922	1000000002922	Judul Buku 2922	0
2923	1000000002923	Judul Buku 2923	0
2924	1000000002924	Judul Buku 2924	0
2925	1000000002925	Judul Buku 2925	0
2926	1000000002926	Judul Buku 2926	0
2927	1000000002927	Judul Buku 2927	0
2928	1000000002928	Judul Buku 2928	0
2929	1000000002929	Judul Buku 2929	0
2930	1000000002930	Judul Buku 2930	0
2931	1000000002931	Judul Buku 2931	0
2932	1000000002932	Judul Buku 2932	0
2933	1000000002933	Judul Buku 2933	0
2934	1000000002934	Judul Buku 2934	0
2935	1000000002935	Judul Buku 2935	0
2936	1000000002936	Judul Buku 2936	0
2937	1000000002937	Judul Buku 2937	0
2938	1000000002938	Judul Buku 2938	0
2939	1000000002939	Judul Buku 2939	0
2940	1000000002940	Judul Buku 2940	0
2941	1000000002941	Judul Buku 2941	0
2942	1000000002942	Judul Buku 2942	0
2943	1000000002943	Judul Buku 2943	0
2944	1000000002944	Judul Buku 2944	0
2945	1000000002945	Judul Buku 2945	0
2946	1000000002946	Judul Buku 2946	0
2947	1000000002947	Judul Buku 2947	0
2948	1000000002948	Judul Buku 2948	0
2949	1000000002949	Judul Buku 2949	0
2950	1000000002950	Judul Buku 2950	0
2951	1000000002951	Judul Buku 2951	0
2952	1000000002952	Judul Buku 2952	0
2953	1000000002953	Judul Buku 2953	0
2954	1000000002954	Judul Buku 2954	0
2955	1000000002955	Judul Buku 2955	0
2956	1000000002956	Judul Buku 2956	0
2957	1000000002957	Judul Buku 2957	0
2958	1000000002958	Judul Buku 2958	0
2959	1000000002959	Judul Buku 2959	0
2960	1000000002960	Judul Buku 2960	0
2961	1000000002961	Judul Buku 2961	0
2962	1000000002962	Judul Buku 2962	0
2963	1000000002963	Judul Buku 2963	0
2964	1000000002964	Judul Buku 2964	0
2965	1000000002965	Judul Buku 2965	0
2966	1000000002966	Judul Buku 2966	0
2967	1000000002967	Judul Buku 2967	0
2968	1000000002968	Judul Buku 2968	0
2969	1000000002969	Judul Buku 2969	0
2970	1000000002970	Judul Buku 2970	0
2971	1000000002971	Judul Buku 2971	0
2972	1000000002972	Judul Buku 2972	0
2973	1000000002973	Judul Buku 2973	0
2974	1000000002974	Judul Buku 2974	0
2975	1000000002975	Judul Buku 2975	0
2976	1000000002976	Judul Buku 2976	0
2977	1000000002977	Judul Buku 2977	0
2978	1000000002978	Judul Buku 2978	0
2979	1000000002979	Judul Buku 2979	0
2980	1000000002980	Judul Buku 2980	0
2981	1000000002981	Judul Buku 2981	0
2982	1000000002982	Judul Buku 2982	0
2983	1000000002983	Judul Buku 2983	0
2984	1000000002984	Judul Buku 2984	0
2985	1000000002985	Judul Buku 2985	0
2986	1000000002986	Judul Buku 2986	0
2987	1000000002987	Judul Buku 2987	0
2988	1000000002988	Judul Buku 2988	0
2989	1000000002989	Judul Buku 2989	0
2990	1000000002990	Judul Buku 2990	0
2991	1000000002991	Judul Buku 2991	0
2992	1000000002992	Judul Buku 2992	0
2993	1000000002993	Judul Buku 2993	0
2994	1000000002994	Judul Buku 2994	0
2995	1000000002995	Judul Buku 2995	0
2996	1000000002996	Judul Buku 2996	0
2997	1000000002997	Judul Buku 2997	0
2998	1000000002998	Judul Buku 2998	0
2999	1000000002999	Judul Buku 2999	0
3000	1000000003000	Judul Buku 3000	0
3001	1000000003001	Judul Buku 3001	0
3002	1000000003002	Judul Buku 3002	0
3003	1000000003003	Judul Buku 3003	0
3004	1000000003004	Judul Buku 3004	0
3005	1000000003005	Judul Buku 3005	0
3006	1000000003006	Judul Buku 3006	0
3007	1000000003007	Judul Buku 3007	0
3008	1000000003008	Judul Buku 3008	0
3009	1000000003009	Judul Buku 3009	0
3010	1000000003010	Judul Buku 3010	0
3011	1000000003011	Judul Buku 3011	0
3012	1000000003012	Judul Buku 3012	0
3013	1000000003013	Judul Buku 3013	0
3014	1000000003014	Judul Buku 3014	0
3015	1000000003015	Judul Buku 3015	0
3016	1000000003016	Judul Buku 3016	0
3017	1000000003017	Judul Buku 3017	0
3018	1000000003018	Judul Buku 3018	0
3019	1000000003019	Judul Buku 3019	0
3020	1000000003020	Judul Buku 3020	0
3021	1000000003021	Judul Buku 3021	0
3022	1000000003022	Judul Buku 3022	0
3023	1000000003023	Judul Buku 3023	0
3024	1000000003024	Judul Buku 3024	0
3025	1000000003025	Judul Buku 3025	0
3026	1000000003026	Judul Buku 3026	0
3027	1000000003027	Judul Buku 3027	0
3028	1000000003028	Judul Buku 3028	0
3029	1000000003029	Judul Buku 3029	0
3030	1000000003030	Judul Buku 3030	0
3031	1000000003031	Judul Buku 3031	0
3032	1000000003032	Judul Buku 3032	0
3033	1000000003033	Judul Buku 3033	0
3034	1000000003034	Judul Buku 3034	0
3035	1000000003035	Judul Buku 3035	0
3036	1000000003036	Judul Buku 3036	0
3037	1000000003037	Judul Buku 3037	0
3038	1000000003038	Judul Buku 3038	0
3039	1000000003039	Judul Buku 3039	0
3040	1000000003040	Judul Buku 3040	0
3041	1000000003041	Judul Buku 3041	0
3042	1000000003042	Judul Buku 3042	0
3043	1000000003043	Judul Buku 3043	0
3044	1000000003044	Judul Buku 3044	0
3045	1000000003045	Judul Buku 3045	0
3046	1000000003046	Judul Buku 3046	0
3047	1000000003047	Judul Buku 3047	0
3048	1000000003048	Judul Buku 3048	0
3049	1000000003049	Judul Buku 3049	0
3050	1000000003050	Judul Buku 3050	0
3051	1000000003051	Judul Buku 3051	0
3052	1000000003052	Judul Buku 3052	0
3053	1000000003053	Judul Buku 3053	0
3054	1000000003054	Judul Buku 3054	0
3055	1000000003055	Judul Buku 3055	0
3056	1000000003056	Judul Buku 3056	0
3057	1000000003057	Judul Buku 3057	0
3058	1000000003058	Judul Buku 3058	0
3059	1000000003059	Judul Buku 3059	0
3060	1000000003060	Judul Buku 3060	0
3061	1000000003061	Judul Buku 3061	0
3062	1000000003062	Judul Buku 3062	0
3063	1000000003063	Judul Buku 3063	0
3064	1000000003064	Judul Buku 3064	0
3065	1000000003065	Judul Buku 3065	0
3066	1000000003066	Judul Buku 3066	0
3067	1000000003067	Judul Buku 3067	0
3068	1000000003068	Judul Buku 3068	0
3069	1000000003069	Judul Buku 3069	0
3070	1000000003070	Judul Buku 3070	0
3071	1000000003071	Judul Buku 3071	0
3072	1000000003072	Judul Buku 3072	0
3073	1000000003073	Judul Buku 3073	0
3074	1000000003074	Judul Buku 3074	0
3075	1000000003075	Judul Buku 3075	0
3076	1000000003076	Judul Buku 3076	0
3077	1000000003077	Judul Buku 3077	0
3078	1000000003078	Judul Buku 3078	0
3079	1000000003079	Judul Buku 3079	0
3080	1000000003080	Judul Buku 3080	0
3081	1000000003081	Judul Buku 3081	0
3082	1000000003082	Judul Buku 3082	0
3083	1000000003083	Judul Buku 3083	0
3084	1000000003084	Judul Buku 3084	0
3085	1000000003085	Judul Buku 3085	0
3086	1000000003086	Judul Buku 3086	0
3087	1000000003087	Judul Buku 3087	0
3088	1000000003088	Judul Buku 3088	0
3089	1000000003089	Judul Buku 3089	0
3090	1000000003090	Judul Buku 3090	0
3091	1000000003091	Judul Buku 3091	0
3092	1000000003092	Judul Buku 3092	0
3093	1000000003093	Judul Buku 3093	0
3094	1000000003094	Judul Buku 3094	0
3095	1000000003095	Judul Buku 3095	0
3096	1000000003096	Judul Buku 3096	0
3097	1000000003097	Judul Buku 3097	0
3098	1000000003098	Judul Buku 3098	0
3099	1000000003099	Judul Buku 3099	0
3100	1000000003100	Judul Buku 3100	0
3101	1000000003101	Judul Buku 3101	0
3102	1000000003102	Judul Buku 3102	0
3103	1000000003103	Judul Buku 3103	0
3104	1000000003104	Judul Buku 3104	0
3105	1000000003105	Judul Buku 3105	0
3106	1000000003106	Judul Buku 3106	0
3107	1000000003107	Judul Buku 3107	0
3108	1000000003108	Judul Buku 3108	0
3109	1000000003109	Judul Buku 3109	0
3110	1000000003110	Judul Buku 3110	0
3111	1000000003111	Judul Buku 3111	0
3112	1000000003112	Judul Buku 3112	0
3113	1000000003113	Judul Buku 3113	0
3114	1000000003114	Judul Buku 3114	0
3115	1000000003115	Judul Buku 3115	0
3116	1000000003116	Judul Buku 3116	0
3117	1000000003117	Judul Buku 3117	0
3118	1000000003118	Judul Buku 3118	0
3119	1000000003119	Judul Buku 3119	0
3120	1000000003120	Judul Buku 3120	0
3121	1000000003121	Judul Buku 3121	0
3122	1000000003122	Judul Buku 3122	0
3123	1000000003123	Judul Buku 3123	0
3124	1000000003124	Judul Buku 3124	0
3125	1000000003125	Judul Buku 3125	0
3126	1000000003126	Judul Buku 3126	0
3127	1000000003127	Judul Buku 3127	0
3128	1000000003128	Judul Buku 3128	0
3129	1000000003129	Judul Buku 3129	0
3130	1000000003130	Judul Buku 3130	0
3131	1000000003131	Judul Buku 3131	0
3132	1000000003132	Judul Buku 3132	0
3133	1000000003133	Judul Buku 3133	0
3134	1000000003134	Judul Buku 3134	0
3135	1000000003135	Judul Buku 3135	0
3136	1000000003136	Judul Buku 3136	0
3137	1000000003137	Judul Buku 3137	0
3138	1000000003138	Judul Buku 3138	0
3139	1000000003139	Judul Buku 3139	0
3140	1000000003140	Judul Buku 3140	0
3141	1000000003141	Judul Buku 3141	0
3142	1000000003142	Judul Buku 3142	0
3143	1000000003143	Judul Buku 3143	0
3144	1000000003144	Judul Buku 3144	0
3145	1000000003145	Judul Buku 3145	0
3146	1000000003146	Judul Buku 3146	0
3147	1000000003147	Judul Buku 3147	0
3148	1000000003148	Judul Buku 3148	0
3149	1000000003149	Judul Buku 3149	0
3150	1000000003150	Judul Buku 3150	0
3151	1000000003151	Judul Buku 3151	0
3152	1000000003152	Judul Buku 3152	0
3153	1000000003153	Judul Buku 3153	0
3154	1000000003154	Judul Buku 3154	0
3155	1000000003155	Judul Buku 3155	0
3156	1000000003156	Judul Buku 3156	0
3157	1000000003157	Judul Buku 3157	0
3158	1000000003158	Judul Buku 3158	0
3159	1000000003159	Judul Buku 3159	0
3160	1000000003160	Judul Buku 3160	0
3161	1000000003161	Judul Buku 3161	0
3162	1000000003162	Judul Buku 3162	0
3163	1000000003163	Judul Buku 3163	0
3164	1000000003164	Judul Buku 3164	0
3165	1000000003165	Judul Buku 3165	0
3166	1000000003166	Judul Buku 3166	0
3167	1000000003167	Judul Buku 3167	0
3168	1000000003168	Judul Buku 3168	0
3169	1000000003169	Judul Buku 3169	0
3170	1000000003170	Judul Buku 3170	0
3171	1000000003171	Judul Buku 3171	0
3172	1000000003172	Judul Buku 3172	0
3173	1000000003173	Judul Buku 3173	0
3174	1000000003174	Judul Buku 3174	0
3175	1000000003175	Judul Buku 3175	0
3176	1000000003176	Judul Buku 3176	0
3177	1000000003177	Judul Buku 3177	0
3178	1000000003178	Judul Buku 3178	0
3179	1000000003179	Judul Buku 3179	0
3180	1000000003180	Judul Buku 3180	0
3181	1000000003181	Judul Buku 3181	0
3182	1000000003182	Judul Buku 3182	0
3183	1000000003183	Judul Buku 3183	0
3184	1000000003184	Judul Buku 3184	0
3185	1000000003185	Judul Buku 3185	0
3186	1000000003186	Judul Buku 3186	0
3187	1000000003187	Judul Buku 3187	0
3188	1000000003188	Judul Buku 3188	0
3189	1000000003189	Judul Buku 3189	0
3190	1000000003190	Judul Buku 3190	0
3191	1000000003191	Judul Buku 3191	0
3192	1000000003192	Judul Buku 3192	0
3193	1000000003193	Judul Buku 3193	0
3194	1000000003194	Judul Buku 3194	0
3195	1000000003195	Judul Buku 3195	0
3196	1000000003196	Judul Buku 3196	0
3197	1000000003197	Judul Buku 3197	0
3198	1000000003198	Judul Buku 3198	0
3199	1000000003199	Judul Buku 3199	0
3200	1000000003200	Judul Buku 3200	0
3201	1000000003201	Judul Buku 3201	0
3202	1000000003202	Judul Buku 3202	0
3203	1000000003203	Judul Buku 3203	0
3204	1000000003204	Judul Buku 3204	0
3205	1000000003205	Judul Buku 3205	0
3206	1000000003206	Judul Buku 3206	0
3207	1000000003207	Judul Buku 3207	0
3208	1000000003208	Judul Buku 3208	0
3209	1000000003209	Judul Buku 3209	0
3210	1000000003210	Judul Buku 3210	0
3211	1000000003211	Judul Buku 3211	0
3212	1000000003212	Judul Buku 3212	0
3213	1000000003213	Judul Buku 3213	0
3214	1000000003214	Judul Buku 3214	0
3215	1000000003215	Judul Buku 3215	0
3216	1000000003216	Judul Buku 3216	0
3217	1000000003217	Judul Buku 3217	0
3218	1000000003218	Judul Buku 3218	0
3219	1000000003219	Judul Buku 3219	0
3220	1000000003220	Judul Buku 3220	0
3221	1000000003221	Judul Buku 3221	0
3222	1000000003222	Judul Buku 3222	0
3223	1000000003223	Judul Buku 3223	0
3224	1000000003224	Judul Buku 3224	0
3225	1000000003225	Judul Buku 3225	0
3226	1000000003226	Judul Buku 3226	0
3227	1000000003227	Judul Buku 3227	0
3228	1000000003228	Judul Buku 3228	0
3229	1000000003229	Judul Buku 3229	0
3230	1000000003230	Judul Buku 3230	0
3231	1000000003231	Judul Buku 3231	0
3232	1000000003232	Judul Buku 3232	0
3233	1000000003233	Judul Buku 3233	0
3234	1000000003234	Judul Buku 3234	0
3235	1000000003235	Judul Buku 3235	0
3236	1000000003236	Judul Buku 3236	0
3237	1000000003237	Judul Buku 3237	0
3238	1000000003238	Judul Buku 3238	0
3239	1000000003239	Judul Buku 3239	0
3240	1000000003240	Judul Buku 3240	0
3241	1000000003241	Judul Buku 3241	0
3242	1000000003242	Judul Buku 3242	0
3243	1000000003243	Judul Buku 3243	0
3244	1000000003244	Judul Buku 3244	0
3245	1000000003245	Judul Buku 3245	0
3246	1000000003246	Judul Buku 3246	0
3247	1000000003247	Judul Buku 3247	0
3248	1000000003248	Judul Buku 3248	0
3249	1000000003249	Judul Buku 3249	0
3250	1000000003250	Judul Buku 3250	0
3251	1000000003251	Judul Buku 3251	0
3252	1000000003252	Judul Buku 3252	0
3253	1000000003253	Judul Buku 3253	0
3254	1000000003254	Judul Buku 3254	0
3255	1000000003255	Judul Buku 3255	0
3256	1000000003256	Judul Buku 3256	0
3257	1000000003257	Judul Buku 3257	0
3258	1000000003258	Judul Buku 3258	0
3259	1000000003259	Judul Buku 3259	0
3260	1000000003260	Judul Buku 3260	0
3261	1000000003261	Judul Buku 3261	0
3262	1000000003262	Judul Buku 3262	0
3263	1000000003263	Judul Buku 3263	0
3264	1000000003264	Judul Buku 3264	0
3265	1000000003265	Judul Buku 3265	0
3266	1000000003266	Judul Buku 3266	0
3267	1000000003267	Judul Buku 3267	0
3268	1000000003268	Judul Buku 3268	0
3269	1000000003269	Judul Buku 3269	0
3270	1000000003270	Judul Buku 3270	0
3271	1000000003271	Judul Buku 3271	0
3272	1000000003272	Judul Buku 3272	0
3273	1000000003273	Judul Buku 3273	0
3274	1000000003274	Judul Buku 3274	0
3275	1000000003275	Judul Buku 3275	0
3276	1000000003276	Judul Buku 3276	0
3277	1000000003277	Judul Buku 3277	0
3278	1000000003278	Judul Buku 3278	0
3279	1000000003279	Judul Buku 3279	0
3280	1000000003280	Judul Buku 3280	0
3281	1000000003281	Judul Buku 3281	0
3282	1000000003282	Judul Buku 3282	0
3283	1000000003283	Judul Buku 3283	0
3284	1000000003284	Judul Buku 3284	0
3285	1000000003285	Judul Buku 3285	0
3286	1000000003286	Judul Buku 3286	0
3287	1000000003287	Judul Buku 3287	0
3288	1000000003288	Judul Buku 3288	0
3289	1000000003289	Judul Buku 3289	0
3290	1000000003290	Judul Buku 3290	0
3291	1000000003291	Judul Buku 3291	0
3292	1000000003292	Judul Buku 3292	0
3293	1000000003293	Judul Buku 3293	0
3294	1000000003294	Judul Buku 3294	0
3295	1000000003295	Judul Buku 3295	0
3296	1000000003296	Judul Buku 3296	0
3297	1000000003297	Judul Buku 3297	0
3298	1000000003298	Judul Buku 3298	0
3299	1000000003299	Judul Buku 3299	0
3300	1000000003300	Judul Buku 3300	0
3301	1000000003301	Judul Buku 3301	0
3302	1000000003302	Judul Buku 3302	0
3303	1000000003303	Judul Buku 3303	0
3304	1000000003304	Judul Buku 3304	0
3305	1000000003305	Judul Buku 3305	0
3306	1000000003306	Judul Buku 3306	0
3307	1000000003307	Judul Buku 3307	0
3308	1000000003308	Judul Buku 3308	0
3309	1000000003309	Judul Buku 3309	0
3310	1000000003310	Judul Buku 3310	0
3311	1000000003311	Judul Buku 3311	0
3312	1000000003312	Judul Buku 3312	0
3313	1000000003313	Judul Buku 3313	0
3314	1000000003314	Judul Buku 3314	0
3315	1000000003315	Judul Buku 3315	0
3316	1000000003316	Judul Buku 3316	0
3317	1000000003317	Judul Buku 3317	0
3318	1000000003318	Judul Buku 3318	0
3319	1000000003319	Judul Buku 3319	0
3320	1000000003320	Judul Buku 3320	0
3321	1000000003321	Judul Buku 3321	0
3322	1000000003322	Judul Buku 3322	0
3323	1000000003323	Judul Buku 3323	0
3324	1000000003324	Judul Buku 3324	0
3325	1000000003325	Judul Buku 3325	0
3326	1000000003326	Judul Buku 3326	0
3327	1000000003327	Judul Buku 3327	0
3328	1000000003328	Judul Buku 3328	0
3329	1000000003329	Judul Buku 3329	0
3330	1000000003330	Judul Buku 3330	0
3331	1000000003331	Judul Buku 3331	0
3332	1000000003332	Judul Buku 3332	0
3333	1000000003333	Judul Buku 3333	0
3334	1000000003334	Judul Buku 3334	0
3335	1000000003335	Judul Buku 3335	0
3336	1000000003336	Judul Buku 3336	0
3337	1000000003337	Judul Buku 3337	0
3338	1000000003338	Judul Buku 3338	0
3339	1000000003339	Judul Buku 3339	0
3340	1000000003340	Judul Buku 3340	0
3341	1000000003341	Judul Buku 3341	0
3342	1000000003342	Judul Buku 3342	0
3343	1000000003343	Judul Buku 3343	0
3344	1000000003344	Judul Buku 3344	0
3345	1000000003345	Judul Buku 3345	0
3346	1000000003346	Judul Buku 3346	0
3347	1000000003347	Judul Buku 3347	0
3348	1000000003348	Judul Buku 3348	0
3349	1000000003349	Judul Buku 3349	0
3350	1000000003350	Judul Buku 3350	0
3351	1000000003351	Judul Buku 3351	0
3352	1000000003352	Judul Buku 3352	0
3353	1000000003353	Judul Buku 3353	0
3354	1000000003354	Judul Buku 3354	0
3355	1000000003355	Judul Buku 3355	0
3356	1000000003356	Judul Buku 3356	0
3357	1000000003357	Judul Buku 3357	0
3358	1000000003358	Judul Buku 3358	0
3359	1000000003359	Judul Buku 3359	0
3360	1000000003360	Judul Buku 3360	0
3361	1000000003361	Judul Buku 3361	0
3362	1000000003362	Judul Buku 3362	0
3363	1000000003363	Judul Buku 3363	0
3364	1000000003364	Judul Buku 3364	0
3365	1000000003365	Judul Buku 3365	0
3366	1000000003366	Judul Buku 3366	0
3367	1000000003367	Judul Buku 3367	0
3368	1000000003368	Judul Buku 3368	0
3369	1000000003369	Judul Buku 3369	0
3370	1000000003370	Judul Buku 3370	0
3371	1000000003371	Judul Buku 3371	0
3372	1000000003372	Judul Buku 3372	0
3373	1000000003373	Judul Buku 3373	0
3374	1000000003374	Judul Buku 3374	0
3375	1000000003375	Judul Buku 3375	0
3376	1000000003376	Judul Buku 3376	0
3377	1000000003377	Judul Buku 3377	0
3378	1000000003378	Judul Buku 3378	0
3379	1000000003379	Judul Buku 3379	0
3380	1000000003380	Judul Buku 3380	0
3381	1000000003381	Judul Buku 3381	0
3382	1000000003382	Judul Buku 3382	0
3383	1000000003383	Judul Buku 3383	0
3384	1000000003384	Judul Buku 3384	0
3385	1000000003385	Judul Buku 3385	0
3386	1000000003386	Judul Buku 3386	0
3387	1000000003387	Judul Buku 3387	0
3388	1000000003388	Judul Buku 3388	0
3389	1000000003389	Judul Buku 3389	0
3390	1000000003390	Judul Buku 3390	0
3391	1000000003391	Judul Buku 3391	0
3392	1000000003392	Judul Buku 3392	0
3393	1000000003393	Judul Buku 3393	0
3394	1000000003394	Judul Buku 3394	0
3395	1000000003395	Judul Buku 3395	0
3396	1000000003396	Judul Buku 3396	0
3397	1000000003397	Judul Buku 3397	0
3398	1000000003398	Judul Buku 3398	0
3399	1000000003399	Judul Buku 3399	0
3400	1000000003400	Judul Buku 3400	0
3401	1000000003401	Judul Buku 3401	0
3402	1000000003402	Judul Buku 3402	0
3403	1000000003403	Judul Buku 3403	0
3404	1000000003404	Judul Buku 3404	0
3405	1000000003405	Judul Buku 3405	0
3406	1000000003406	Judul Buku 3406	0
3407	1000000003407	Judul Buku 3407	0
3408	1000000003408	Judul Buku 3408	0
3409	1000000003409	Judul Buku 3409	0
3410	1000000003410	Judul Buku 3410	0
3411	1000000003411	Judul Buku 3411	0
3412	1000000003412	Judul Buku 3412	0
3413	1000000003413	Judul Buku 3413	0
3414	1000000003414	Judul Buku 3414	0
3415	1000000003415	Judul Buku 3415	0
3416	1000000003416	Judul Buku 3416	0
3417	1000000003417	Judul Buku 3417	0
3418	1000000003418	Judul Buku 3418	0
3419	1000000003419	Judul Buku 3419	0
3420	1000000003420	Judul Buku 3420	0
3421	1000000003421	Judul Buku 3421	0
3422	1000000003422	Judul Buku 3422	0
3423	1000000003423	Judul Buku 3423	0
3424	1000000003424	Judul Buku 3424	0
3425	1000000003425	Judul Buku 3425	0
3426	1000000003426	Judul Buku 3426	0
3427	1000000003427	Judul Buku 3427	0
3428	1000000003428	Judul Buku 3428	0
3429	1000000003429	Judul Buku 3429	0
3430	1000000003430	Judul Buku 3430	0
3431	1000000003431	Judul Buku 3431	0
3432	1000000003432	Judul Buku 3432	0
3433	1000000003433	Judul Buku 3433	0
3434	1000000003434	Judul Buku 3434	0
3435	1000000003435	Judul Buku 3435	0
3436	1000000003436	Judul Buku 3436	0
3437	1000000003437	Judul Buku 3437	0
3438	1000000003438	Judul Buku 3438	0
3439	1000000003439	Judul Buku 3439	0
3440	1000000003440	Judul Buku 3440	0
3441	1000000003441	Judul Buku 3441	0
3442	1000000003442	Judul Buku 3442	0
3443	1000000003443	Judul Buku 3443	0
3444	1000000003444	Judul Buku 3444	0
3445	1000000003445	Judul Buku 3445	0
3446	1000000003446	Judul Buku 3446	0
3447	1000000003447	Judul Buku 3447	0
3448	1000000003448	Judul Buku 3448	0
3449	1000000003449	Judul Buku 3449	0
3450	1000000003450	Judul Buku 3450	0
3451	1000000003451	Judul Buku 3451	0
3452	1000000003452	Judul Buku 3452	0
3453	1000000003453	Judul Buku 3453	0
3454	1000000003454	Judul Buku 3454	0
3455	1000000003455	Judul Buku 3455	0
3456	1000000003456	Judul Buku 3456	0
3457	1000000003457	Judul Buku 3457	0
3458	1000000003458	Judul Buku 3458	0
3459	1000000003459	Judul Buku 3459	0
3460	1000000003460	Judul Buku 3460	0
3461	1000000003461	Judul Buku 3461	0
3462	1000000003462	Judul Buku 3462	0
3463	1000000003463	Judul Buku 3463	0
3464	1000000003464	Judul Buku 3464	0
3465	1000000003465	Judul Buku 3465	0
3466	1000000003466	Judul Buku 3466	0
3467	1000000003467	Judul Buku 3467	0
3468	1000000003468	Judul Buku 3468	0
3469	1000000003469	Judul Buku 3469	0
3470	1000000003470	Judul Buku 3470	0
3471	1000000003471	Judul Buku 3471	0
3472	1000000003472	Judul Buku 3472	0
3473	1000000003473	Judul Buku 3473	0
3474	1000000003474	Judul Buku 3474	0
3475	1000000003475	Judul Buku 3475	0
3476	1000000003476	Judul Buku 3476	0
3477	1000000003477	Judul Buku 3477	0
3478	1000000003478	Judul Buku 3478	0
3479	1000000003479	Judul Buku 3479	0
3480	1000000003480	Judul Buku 3480	0
3481	1000000003481	Judul Buku 3481	0
3482	1000000003482	Judul Buku 3482	0
3483	1000000003483	Judul Buku 3483	0
3484	1000000003484	Judul Buku 3484	0
3485	1000000003485	Judul Buku 3485	0
3486	1000000003486	Judul Buku 3486	0
3487	1000000003487	Judul Buku 3487	0
3488	1000000003488	Judul Buku 3488	0
3489	1000000003489	Judul Buku 3489	0
3490	1000000003490	Judul Buku 3490	0
3491	1000000003491	Judul Buku 3491	0
3492	1000000003492	Judul Buku 3492	0
3493	1000000003493	Judul Buku 3493	0
3494	1000000003494	Judul Buku 3494	0
3495	1000000003495	Judul Buku 3495	0
3496	1000000003496	Judul Buku 3496	0
3497	1000000003497	Judul Buku 3497	0
3498	1000000003498	Judul Buku 3498	0
3499	1000000003499	Judul Buku 3499	0
3500	1000000003500	Judul Buku 3500	0
3501	1000000003501	Judul Buku 3501	0
3502	1000000003502	Judul Buku 3502	0
3503	1000000003503	Judul Buku 3503	0
3504	1000000003504	Judul Buku 3504	0
3505	1000000003505	Judul Buku 3505	0
3506	1000000003506	Judul Buku 3506	0
3507	1000000003507	Judul Buku 3507	0
3508	1000000003508	Judul Buku 3508	0
3509	1000000003509	Judul Buku 3509	0
3510	1000000003510	Judul Buku 3510	0
3511	1000000003511	Judul Buku 3511	0
3512	1000000003512	Judul Buku 3512	0
3513	1000000003513	Judul Buku 3513	0
3514	1000000003514	Judul Buku 3514	0
3515	1000000003515	Judul Buku 3515	0
3516	1000000003516	Judul Buku 3516	0
3517	1000000003517	Judul Buku 3517	0
3518	1000000003518	Judul Buku 3518	0
3519	1000000003519	Judul Buku 3519	0
3520	1000000003520	Judul Buku 3520	0
3521	1000000003521	Judul Buku 3521	0
3522	1000000003522	Judul Buku 3522	0
3523	1000000003523	Judul Buku 3523	0
3524	1000000003524	Judul Buku 3524	0
3525	1000000003525	Judul Buku 3525	0
3526	1000000003526	Judul Buku 3526	0
3527	1000000003527	Judul Buku 3527	0
3528	1000000003528	Judul Buku 3528	0
3529	1000000003529	Judul Buku 3529	0
3530	1000000003530	Judul Buku 3530	0
3531	1000000003531	Judul Buku 3531	0
3532	1000000003532	Judul Buku 3532	0
3533	1000000003533	Judul Buku 3533	0
3534	1000000003534	Judul Buku 3534	0
3535	1000000003535	Judul Buku 3535	0
3536	1000000003536	Judul Buku 3536	0
3537	1000000003537	Judul Buku 3537	0
3538	1000000003538	Judul Buku 3538	0
3539	1000000003539	Judul Buku 3539	0
3540	1000000003540	Judul Buku 3540	0
3541	1000000003541	Judul Buku 3541	0
3542	1000000003542	Judul Buku 3542	0
3543	1000000003543	Judul Buku 3543	0
3544	1000000003544	Judul Buku 3544	0
3545	1000000003545	Judul Buku 3545	0
3546	1000000003546	Judul Buku 3546	0
3547	1000000003547	Judul Buku 3547	0
3548	1000000003548	Judul Buku 3548	0
3549	1000000003549	Judul Buku 3549	0
3550	1000000003550	Judul Buku 3550	0
3551	1000000003551	Judul Buku 3551	0
3552	1000000003552	Judul Buku 3552	0
3553	1000000003553	Judul Buku 3553	0
3554	1000000003554	Judul Buku 3554	0
3555	1000000003555	Judul Buku 3555	0
3556	1000000003556	Judul Buku 3556	0
3557	1000000003557	Judul Buku 3557	0
3558	1000000003558	Judul Buku 3558	0
3559	1000000003559	Judul Buku 3559	0
3560	1000000003560	Judul Buku 3560	0
3561	1000000003561	Judul Buku 3561	0
3562	1000000003562	Judul Buku 3562	0
3563	1000000003563	Judul Buku 3563	0
3564	1000000003564	Judul Buku 3564	0
3565	1000000003565	Judul Buku 3565	0
3566	1000000003566	Judul Buku 3566	0
3567	1000000003567	Judul Buku 3567	0
3568	1000000003568	Judul Buku 3568	0
3569	1000000003569	Judul Buku 3569	0
3570	1000000003570	Judul Buku 3570	0
3571	1000000003571	Judul Buku 3571	0
3572	1000000003572	Judul Buku 3572	0
3573	1000000003573	Judul Buku 3573	0
3574	1000000003574	Judul Buku 3574	0
3575	1000000003575	Judul Buku 3575	0
3576	1000000003576	Judul Buku 3576	0
3577	1000000003577	Judul Buku 3577	0
3578	1000000003578	Judul Buku 3578	0
3579	1000000003579	Judul Buku 3579	0
3580	1000000003580	Judul Buku 3580	0
3581	1000000003581	Judul Buku 3581	0
3582	1000000003582	Judul Buku 3582	0
3583	1000000003583	Judul Buku 3583	0
3584	1000000003584	Judul Buku 3584	0
3585	1000000003585	Judul Buku 3585	0
3586	1000000003586	Judul Buku 3586	0
3587	1000000003587	Judul Buku 3587	0
3588	1000000003588	Judul Buku 3588	0
3589	1000000003589	Judul Buku 3589	0
3590	1000000003590	Judul Buku 3590	0
3591	1000000003591	Judul Buku 3591	0
3592	1000000003592	Judul Buku 3592	0
3593	1000000003593	Judul Buku 3593	0
3594	1000000003594	Judul Buku 3594	0
3595	1000000003595	Judul Buku 3595	0
3596	1000000003596	Judul Buku 3596	0
3597	1000000003597	Judul Buku 3597	0
3598	1000000003598	Judul Buku 3598	0
3599	1000000003599	Judul Buku 3599	0
3600	1000000003600	Judul Buku 3600	0
3601	1000000003601	Judul Buku 3601	0
3602	1000000003602	Judul Buku 3602	0
3603	1000000003603	Judul Buku 3603	0
3604	1000000003604	Judul Buku 3604	0
3605	1000000003605	Judul Buku 3605	0
3606	1000000003606	Judul Buku 3606	0
3607	1000000003607	Judul Buku 3607	0
3608	1000000003608	Judul Buku 3608	0
3609	1000000003609	Judul Buku 3609	0
3610	1000000003610	Judul Buku 3610	0
3611	1000000003611	Judul Buku 3611	0
3612	1000000003612	Judul Buku 3612	0
3613	1000000003613	Judul Buku 3613	0
3614	1000000003614	Judul Buku 3614	0
3615	1000000003615	Judul Buku 3615	0
3616	1000000003616	Judul Buku 3616	0
3617	1000000003617	Judul Buku 3617	0
3618	1000000003618	Judul Buku 3618	0
3619	1000000003619	Judul Buku 3619	0
3620	1000000003620	Judul Buku 3620	0
3621	1000000003621	Judul Buku 3621	0
3622	1000000003622	Judul Buku 3622	0
3623	1000000003623	Judul Buku 3623	0
3624	1000000003624	Judul Buku 3624	0
3625	1000000003625	Judul Buku 3625	0
3626	1000000003626	Judul Buku 3626	0
3627	1000000003627	Judul Buku 3627	0
3628	1000000003628	Judul Buku 3628	0
3629	1000000003629	Judul Buku 3629	0
3630	1000000003630	Judul Buku 3630	0
3631	1000000003631	Judul Buku 3631	0
3632	1000000003632	Judul Buku 3632	0
3633	1000000003633	Judul Buku 3633	0
3634	1000000003634	Judul Buku 3634	0
3635	1000000003635	Judul Buku 3635	0
3636	1000000003636	Judul Buku 3636	0
3637	1000000003637	Judul Buku 3637	0
3638	1000000003638	Judul Buku 3638	0
3639	1000000003639	Judul Buku 3639	0
3640	1000000003640	Judul Buku 3640	0
3641	1000000003641	Judul Buku 3641	0
3642	1000000003642	Judul Buku 3642	0
3643	1000000003643	Judul Buku 3643	0
3644	1000000003644	Judul Buku 3644	0
3645	1000000003645	Judul Buku 3645	0
3646	1000000003646	Judul Buku 3646	0
3647	1000000003647	Judul Buku 3647	0
3648	1000000003648	Judul Buku 3648	0
3649	1000000003649	Judul Buku 3649	0
3650	1000000003650	Judul Buku 3650	0
3651	1000000003651	Judul Buku 3651	0
3652	1000000003652	Judul Buku 3652	0
3653	1000000003653	Judul Buku 3653	0
3654	1000000003654	Judul Buku 3654	0
3655	1000000003655	Judul Buku 3655	0
3656	1000000003656	Judul Buku 3656	0
3657	1000000003657	Judul Buku 3657	0
3658	1000000003658	Judul Buku 3658	0
3659	1000000003659	Judul Buku 3659	0
3660	1000000003660	Judul Buku 3660	0
3661	1000000003661	Judul Buku 3661	0
3662	1000000003662	Judul Buku 3662	0
3663	1000000003663	Judul Buku 3663	0
3664	1000000003664	Judul Buku 3664	0
3665	1000000003665	Judul Buku 3665	0
3666	1000000003666	Judul Buku 3666	0
3667	1000000003667	Judul Buku 3667	0
3668	1000000003668	Judul Buku 3668	0
3669	1000000003669	Judul Buku 3669	0
3670	1000000003670	Judul Buku 3670	0
3671	1000000003671	Judul Buku 3671	0
3672	1000000003672	Judul Buku 3672	0
3673	1000000003673	Judul Buku 3673	0
3674	1000000003674	Judul Buku 3674	0
3675	1000000003675	Judul Buku 3675	0
3676	1000000003676	Judul Buku 3676	0
3677	1000000003677	Judul Buku 3677	0
3678	1000000003678	Judul Buku 3678	0
3679	1000000003679	Judul Buku 3679	0
3680	1000000003680	Judul Buku 3680	0
3681	1000000003681	Judul Buku 3681	0
3682	1000000003682	Judul Buku 3682	0
3683	1000000003683	Judul Buku 3683	0
3684	1000000003684	Judul Buku 3684	0
3685	1000000003685	Judul Buku 3685	0
3686	1000000003686	Judul Buku 3686	0
3687	1000000003687	Judul Buku 3687	0
3688	1000000003688	Judul Buku 3688	0
3689	1000000003689	Judul Buku 3689	0
3690	1000000003690	Judul Buku 3690	0
3691	1000000003691	Judul Buku 3691	0
3692	1000000003692	Judul Buku 3692	0
3693	1000000003693	Judul Buku 3693	0
3694	1000000003694	Judul Buku 3694	0
3695	1000000003695	Judul Buku 3695	0
3696	1000000003696	Judul Buku 3696	0
3697	1000000003697	Judul Buku 3697	0
3698	1000000003698	Judul Buku 3698	0
3699	1000000003699	Judul Buku 3699	0
3700	1000000003700	Judul Buku 3700	0
3701	1000000003701	Judul Buku 3701	0
3702	1000000003702	Judul Buku 3702	0
3703	1000000003703	Judul Buku 3703	0
3704	1000000003704	Judul Buku 3704	0
3705	1000000003705	Judul Buku 3705	0
3706	1000000003706	Judul Buku 3706	0
3707	1000000003707	Judul Buku 3707	0
3708	1000000003708	Judul Buku 3708	0
3709	1000000003709	Judul Buku 3709	0
3710	1000000003710	Judul Buku 3710	0
3711	1000000003711	Judul Buku 3711	0
3712	1000000003712	Judul Buku 3712	0
3713	1000000003713	Judul Buku 3713	0
3714	1000000003714	Judul Buku 3714	0
3715	1000000003715	Judul Buku 3715	0
3716	1000000003716	Judul Buku 3716	0
3717	1000000003717	Judul Buku 3717	0
3718	1000000003718	Judul Buku 3718	0
3719	1000000003719	Judul Buku 3719	0
3720	1000000003720	Judul Buku 3720	0
3721	1000000003721	Judul Buku 3721	0
3722	1000000003722	Judul Buku 3722	0
3723	1000000003723	Judul Buku 3723	0
3724	1000000003724	Judul Buku 3724	0
3725	1000000003725	Judul Buku 3725	0
3726	1000000003726	Judul Buku 3726	0
3727	1000000003727	Judul Buku 3727	0
3728	1000000003728	Judul Buku 3728	0
3729	1000000003729	Judul Buku 3729	0
3730	1000000003730	Judul Buku 3730	0
3731	1000000003731	Judul Buku 3731	0
3732	1000000003732	Judul Buku 3732	0
3733	1000000003733	Judul Buku 3733	0
3734	1000000003734	Judul Buku 3734	0
3735	1000000003735	Judul Buku 3735	0
3736	1000000003736	Judul Buku 3736	0
3737	1000000003737	Judul Buku 3737	0
3738	1000000003738	Judul Buku 3738	0
3739	1000000003739	Judul Buku 3739	0
3740	1000000003740	Judul Buku 3740	0
3741	1000000003741	Judul Buku 3741	0
3742	1000000003742	Judul Buku 3742	0
3743	1000000003743	Judul Buku 3743	0
3744	1000000003744	Judul Buku 3744	0
3745	1000000003745	Judul Buku 3745	0
3746	1000000003746	Judul Buku 3746	0
3747	1000000003747	Judul Buku 3747	0
3748	1000000003748	Judul Buku 3748	0
3749	1000000003749	Judul Buku 3749	0
3750	1000000003750	Judul Buku 3750	0
3751	1000000003751	Judul Buku 3751	0
3752	1000000003752	Judul Buku 3752	0
3753	1000000003753	Judul Buku 3753	0
3754	1000000003754	Judul Buku 3754	0
3755	1000000003755	Judul Buku 3755	0
3756	1000000003756	Judul Buku 3756	0
3757	1000000003757	Judul Buku 3757	0
3758	1000000003758	Judul Buku 3758	0
3759	1000000003759	Judul Buku 3759	0
3760	1000000003760	Judul Buku 3760	0
3761	1000000003761	Judul Buku 3761	0
3762	1000000003762	Judul Buku 3762	0
3763	1000000003763	Judul Buku 3763	0
3764	1000000003764	Judul Buku 3764	0
3765	1000000003765	Judul Buku 3765	0
3766	1000000003766	Judul Buku 3766	0
3767	1000000003767	Judul Buku 3767	0
3768	1000000003768	Judul Buku 3768	0
3769	1000000003769	Judul Buku 3769	0
3770	1000000003770	Judul Buku 3770	0
3771	1000000003771	Judul Buku 3771	0
3772	1000000003772	Judul Buku 3772	0
3773	1000000003773	Judul Buku 3773	0
3774	1000000003774	Judul Buku 3774	0
3775	1000000003775	Judul Buku 3775	0
3776	1000000003776	Judul Buku 3776	0
3777	1000000003777	Judul Buku 3777	0
3778	1000000003778	Judul Buku 3778	0
3779	1000000003779	Judul Buku 3779	0
3780	1000000003780	Judul Buku 3780	0
3781	1000000003781	Judul Buku 3781	0
3782	1000000003782	Judul Buku 3782	0
3783	1000000003783	Judul Buku 3783	0
3784	1000000003784	Judul Buku 3784	0
3785	1000000003785	Judul Buku 3785	0
3786	1000000003786	Judul Buku 3786	0
3787	1000000003787	Judul Buku 3787	0
3788	1000000003788	Judul Buku 3788	0
3789	1000000003789	Judul Buku 3789	0
3790	1000000003790	Judul Buku 3790	0
3791	1000000003791	Judul Buku 3791	0
3792	1000000003792	Judul Buku 3792	0
3793	1000000003793	Judul Buku 3793	0
3794	1000000003794	Judul Buku 3794	0
3795	1000000003795	Judul Buku 3795	0
3796	1000000003796	Judul Buku 3796	0
3797	1000000003797	Judul Buku 3797	0
3798	1000000003798	Judul Buku 3798	0
3799	1000000003799	Judul Buku 3799	0
3800	1000000003800	Judul Buku 3800	0
3801	1000000003801	Judul Buku 3801	0
3802	1000000003802	Judul Buku 3802	0
3803	1000000003803	Judul Buku 3803	0
3804	1000000003804	Judul Buku 3804	0
3805	1000000003805	Judul Buku 3805	0
3806	1000000003806	Judul Buku 3806	0
3807	1000000003807	Judul Buku 3807	0
3808	1000000003808	Judul Buku 3808	0
3809	1000000003809	Judul Buku 3809	0
3810	1000000003810	Judul Buku 3810	0
3811	1000000003811	Judul Buku 3811	0
3812	1000000003812	Judul Buku 3812	0
3813	1000000003813	Judul Buku 3813	0
3814	1000000003814	Judul Buku 3814	0
3815	1000000003815	Judul Buku 3815	0
3816	1000000003816	Judul Buku 3816	0
3817	1000000003817	Judul Buku 3817	0
3818	1000000003818	Judul Buku 3818	0
3819	1000000003819	Judul Buku 3819	0
3820	1000000003820	Judul Buku 3820	0
3821	1000000003821	Judul Buku 3821	0
3822	1000000003822	Judul Buku 3822	0
3823	1000000003823	Judul Buku 3823	0
3824	1000000003824	Judul Buku 3824	0
3825	1000000003825	Judul Buku 3825	0
3826	1000000003826	Judul Buku 3826	0
3827	1000000003827	Judul Buku 3827	0
3828	1000000003828	Judul Buku 3828	0
3829	1000000003829	Judul Buku 3829	0
3830	1000000003830	Judul Buku 3830	0
3831	1000000003831	Judul Buku 3831	0
3832	1000000003832	Judul Buku 3832	0
3833	1000000003833	Judul Buku 3833	0
3834	1000000003834	Judul Buku 3834	0
3835	1000000003835	Judul Buku 3835	0
3836	1000000003836	Judul Buku 3836	0
3837	1000000003837	Judul Buku 3837	0
3838	1000000003838	Judul Buku 3838	0
3839	1000000003839	Judul Buku 3839	0
3840	1000000003840	Judul Buku 3840	0
3841	1000000003841	Judul Buku 3841	0
3842	1000000003842	Judul Buku 3842	0
3843	1000000003843	Judul Buku 3843	0
3844	1000000003844	Judul Buku 3844	0
3845	1000000003845	Judul Buku 3845	0
3846	1000000003846	Judul Buku 3846	0
3847	1000000003847	Judul Buku 3847	0
3848	1000000003848	Judul Buku 3848	0
3849	1000000003849	Judul Buku 3849	0
3850	1000000003850	Judul Buku 3850	0
3851	1000000003851	Judul Buku 3851	0
3852	1000000003852	Judul Buku 3852	0
3853	1000000003853	Judul Buku 3853	0
3854	1000000003854	Judul Buku 3854	0
3855	1000000003855	Judul Buku 3855	0
3856	1000000003856	Judul Buku 3856	0
3857	1000000003857	Judul Buku 3857	0
3858	1000000003858	Judul Buku 3858	0
3859	1000000003859	Judul Buku 3859	0
3860	1000000003860	Judul Buku 3860	0
3861	1000000003861	Judul Buku 3861	0
3862	1000000003862	Judul Buku 3862	0
3863	1000000003863	Judul Buku 3863	0
3864	1000000003864	Judul Buku 3864	0
3865	1000000003865	Judul Buku 3865	0
3866	1000000003866	Judul Buku 3866	0
3867	1000000003867	Judul Buku 3867	0
3868	1000000003868	Judul Buku 3868	0
3869	1000000003869	Judul Buku 3869	0
3870	1000000003870	Judul Buku 3870	0
3871	1000000003871	Judul Buku 3871	0
3872	1000000003872	Judul Buku 3872	0
3873	1000000003873	Judul Buku 3873	0
3874	1000000003874	Judul Buku 3874	0
3875	1000000003875	Judul Buku 3875	0
3876	1000000003876	Judul Buku 3876	0
3877	1000000003877	Judul Buku 3877	0
3878	1000000003878	Judul Buku 3878	0
3879	1000000003879	Judul Buku 3879	0
3880	1000000003880	Judul Buku 3880	0
3881	1000000003881	Judul Buku 3881	0
3882	1000000003882	Judul Buku 3882	0
3883	1000000003883	Judul Buku 3883	0
3884	1000000003884	Judul Buku 3884	0
3885	1000000003885	Judul Buku 3885	0
3886	1000000003886	Judul Buku 3886	0
3887	1000000003887	Judul Buku 3887	0
3888	1000000003888	Judul Buku 3888	0
3889	1000000003889	Judul Buku 3889	0
3890	1000000003890	Judul Buku 3890	0
3891	1000000003891	Judul Buku 3891	0
3892	1000000003892	Judul Buku 3892	0
3893	1000000003893	Judul Buku 3893	0
3894	1000000003894	Judul Buku 3894	0
3895	1000000003895	Judul Buku 3895	0
3896	1000000003896	Judul Buku 3896	0
3897	1000000003897	Judul Buku 3897	0
3898	1000000003898	Judul Buku 3898	0
3899	1000000003899	Judul Buku 3899	0
3900	1000000003900	Judul Buku 3900	0
3901	1000000003901	Judul Buku 3901	0
3902	1000000003902	Judul Buku 3902	0
3903	1000000003903	Judul Buku 3903	0
3904	1000000003904	Judul Buku 3904	0
3905	1000000003905	Judul Buku 3905	0
3906	1000000003906	Judul Buku 3906	0
3907	1000000003907	Judul Buku 3907	0
3908	1000000003908	Judul Buku 3908	0
3909	1000000003909	Judul Buku 3909	0
3910	1000000003910	Judul Buku 3910	0
3911	1000000003911	Judul Buku 3911	0
3912	1000000003912	Judul Buku 3912	0
3913	1000000003913	Judul Buku 3913	0
3914	1000000003914	Judul Buku 3914	0
3915	1000000003915	Judul Buku 3915	0
3916	1000000003916	Judul Buku 3916	0
3917	1000000003917	Judul Buku 3917	0
3918	1000000003918	Judul Buku 3918	0
3919	1000000003919	Judul Buku 3919	0
3920	1000000003920	Judul Buku 3920	0
3921	1000000003921	Judul Buku 3921	0
3922	1000000003922	Judul Buku 3922	0
3923	1000000003923	Judul Buku 3923	0
3924	1000000003924	Judul Buku 3924	0
3925	1000000003925	Judul Buku 3925	0
3926	1000000003926	Judul Buku 3926	0
3927	1000000003927	Judul Buku 3927	0
3928	1000000003928	Judul Buku 3928	0
3929	1000000003929	Judul Buku 3929	0
3930	1000000003930	Judul Buku 3930	0
3931	1000000003931	Judul Buku 3931	0
3932	1000000003932	Judul Buku 3932	0
3933	1000000003933	Judul Buku 3933	0
3934	1000000003934	Judul Buku 3934	0
3935	1000000003935	Judul Buku 3935	0
3936	1000000003936	Judul Buku 3936	0
3937	1000000003937	Judul Buku 3937	0
3938	1000000003938	Judul Buku 3938	0
3939	1000000003939	Judul Buku 3939	0
3940	1000000003940	Judul Buku 3940	0
3941	1000000003941	Judul Buku 3941	0
3942	1000000003942	Judul Buku 3942	0
3943	1000000003943	Judul Buku 3943	0
3944	1000000003944	Judul Buku 3944	0
3945	1000000003945	Judul Buku 3945	0
3946	1000000003946	Judul Buku 3946	0
3947	1000000003947	Judul Buku 3947	0
3948	1000000003948	Judul Buku 3948	0
3949	1000000003949	Judul Buku 3949	0
3950	1000000003950	Judul Buku 3950	0
3951	1000000003951	Judul Buku 3951	0
3952	1000000003952	Judul Buku 3952	0
3953	1000000003953	Judul Buku 3953	0
3954	1000000003954	Judul Buku 3954	0
3955	1000000003955	Judul Buku 3955	0
3956	1000000003956	Judul Buku 3956	0
3957	1000000003957	Judul Buku 3957	0
3958	1000000003958	Judul Buku 3958	0
3959	1000000003959	Judul Buku 3959	0
3960	1000000003960	Judul Buku 3960	0
3961	1000000003961	Judul Buku 3961	0
3962	1000000003962	Judul Buku 3962	0
3963	1000000003963	Judul Buku 3963	0
3964	1000000003964	Judul Buku 3964	0
3965	1000000003965	Judul Buku 3965	0
3966	1000000003966	Judul Buku 3966	0
3967	1000000003967	Judul Buku 3967	0
3968	1000000003968	Judul Buku 3968	0
3969	1000000003969	Judul Buku 3969	0
3970	1000000003970	Judul Buku 3970	0
3971	1000000003971	Judul Buku 3971	0
3972	1000000003972	Judul Buku 3972	0
3973	1000000003973	Judul Buku 3973	0
3974	1000000003974	Judul Buku 3974	0
3975	1000000003975	Judul Buku 3975	0
3976	1000000003976	Judul Buku 3976	0
3977	1000000003977	Judul Buku 3977	0
3978	1000000003978	Judul Buku 3978	0
3979	1000000003979	Judul Buku 3979	0
3980	1000000003980	Judul Buku 3980	0
3981	1000000003981	Judul Buku 3981	0
3982	1000000003982	Judul Buku 3982	0
3983	1000000003983	Judul Buku 3983	0
3984	1000000003984	Judul Buku 3984	0
3985	1000000003985	Judul Buku 3985	0
3986	1000000003986	Judul Buku 3986	0
3987	1000000003987	Judul Buku 3987	0
3988	1000000003988	Judul Buku 3988	0
3989	1000000003989	Judul Buku 3989	0
3990	1000000003990	Judul Buku 3990	0
3991	1000000003991	Judul Buku 3991	0
3992	1000000003992	Judul Buku 3992	0
3993	1000000003993	Judul Buku 3993	0
3994	1000000003994	Judul Buku 3994	0
3995	1000000003995	Judul Buku 3995	0
3996	1000000003996	Judul Buku 3996	0
3997	1000000003997	Judul Buku 3997	0
3998	1000000003998	Judul Buku 3998	0
3999	1000000003999	Judul Buku 3999	0
4000	1000000004000	Judul Buku 4000	0
4001	1000000004001	Judul Buku 4001	0
4002	1000000004002	Judul Buku 4002	0
4003	1000000004003	Judul Buku 4003	0
4004	1000000004004	Judul Buku 4004	0
4005	1000000004005	Judul Buku 4005	0
4006	1000000004006	Judul Buku 4006	0
4007	1000000004007	Judul Buku 4007	0
4008	1000000004008	Judul Buku 4008	0
4009	1000000004009	Judul Buku 4009	0
4010	1000000004010	Judul Buku 4010	0
4011	1000000004011	Judul Buku 4011	0
4012	1000000004012	Judul Buku 4012	0
4013	1000000004013	Judul Buku 4013	0
4014	1000000004014	Judul Buku 4014	0
4015	1000000004015	Judul Buku 4015	0
4016	1000000004016	Judul Buku 4016	0
4017	1000000004017	Judul Buku 4017	0
4018	1000000004018	Judul Buku 4018	0
4019	1000000004019	Judul Buku 4019	0
4020	1000000004020	Judul Buku 4020	0
4021	1000000004021	Judul Buku 4021	0
4022	1000000004022	Judul Buku 4022	0
4023	1000000004023	Judul Buku 4023	0
4024	1000000004024	Judul Buku 4024	0
4025	1000000004025	Judul Buku 4025	0
4026	1000000004026	Judul Buku 4026	0
4027	1000000004027	Judul Buku 4027	0
4028	1000000004028	Judul Buku 4028	0
4029	1000000004029	Judul Buku 4029	0
4030	1000000004030	Judul Buku 4030	0
4031	1000000004031	Judul Buku 4031	0
4032	1000000004032	Judul Buku 4032	0
4033	1000000004033	Judul Buku 4033	0
4034	1000000004034	Judul Buku 4034	0
4035	1000000004035	Judul Buku 4035	0
4036	1000000004036	Judul Buku 4036	0
4037	1000000004037	Judul Buku 4037	0
4038	1000000004038	Judul Buku 4038	0
4039	1000000004039	Judul Buku 4039	0
4040	1000000004040	Judul Buku 4040	0
4041	1000000004041	Judul Buku 4041	0
4042	1000000004042	Judul Buku 4042	0
4043	1000000004043	Judul Buku 4043	0
4044	1000000004044	Judul Buku 4044	0
4045	1000000004045	Judul Buku 4045	0
4046	1000000004046	Judul Buku 4046	0
4047	1000000004047	Judul Buku 4047	0
4048	1000000004048	Judul Buku 4048	0
4049	1000000004049	Judul Buku 4049	0
4050	1000000004050	Judul Buku 4050	0
4051	1000000004051	Judul Buku 4051	0
4052	1000000004052	Judul Buku 4052	0
4053	1000000004053	Judul Buku 4053	0
4054	1000000004054	Judul Buku 4054	0
4055	1000000004055	Judul Buku 4055	0
4056	1000000004056	Judul Buku 4056	0
4057	1000000004057	Judul Buku 4057	0
4058	1000000004058	Judul Buku 4058	0
4059	1000000004059	Judul Buku 4059	0
4060	1000000004060	Judul Buku 4060	0
4061	1000000004061	Judul Buku 4061	0
4062	1000000004062	Judul Buku 4062	0
4063	1000000004063	Judul Buku 4063	0
4064	1000000004064	Judul Buku 4064	0
4065	1000000004065	Judul Buku 4065	0
4066	1000000004066	Judul Buku 4066	0
4067	1000000004067	Judul Buku 4067	0
4068	1000000004068	Judul Buku 4068	0
4069	1000000004069	Judul Buku 4069	0
4070	1000000004070	Judul Buku 4070	0
4071	1000000004071	Judul Buku 4071	0
4072	1000000004072	Judul Buku 4072	0
4073	1000000004073	Judul Buku 4073	0
4074	1000000004074	Judul Buku 4074	0
4075	1000000004075	Judul Buku 4075	0
4076	1000000004076	Judul Buku 4076	0
4077	1000000004077	Judul Buku 4077	0
4078	1000000004078	Judul Buku 4078	0
4079	1000000004079	Judul Buku 4079	0
4080	1000000004080	Judul Buku 4080	0
4081	1000000004081	Judul Buku 4081	0
4082	1000000004082	Judul Buku 4082	0
4083	1000000004083	Judul Buku 4083	0
4084	1000000004084	Judul Buku 4084	0
4085	1000000004085	Judul Buku 4085	0
4086	1000000004086	Judul Buku 4086	0
4087	1000000004087	Judul Buku 4087	0
4088	1000000004088	Judul Buku 4088	0
4089	1000000004089	Judul Buku 4089	0
4090	1000000004090	Judul Buku 4090	0
4091	1000000004091	Judul Buku 4091	0
4092	1000000004092	Judul Buku 4092	0
4093	1000000004093	Judul Buku 4093	0
4094	1000000004094	Judul Buku 4094	0
4095	1000000004095	Judul Buku 4095	0
4096	1000000004096	Judul Buku 4096	0
4097	1000000004097	Judul Buku 4097	0
4098	1000000004098	Judul Buku 4098	0
4099	1000000004099	Judul Buku 4099	0
4100	1000000004100	Judul Buku 4100	0
4101	1000000004101	Judul Buku 4101	0
4102	1000000004102	Judul Buku 4102	0
4103	1000000004103	Judul Buku 4103	0
4104	1000000004104	Judul Buku 4104	0
4105	1000000004105	Judul Buku 4105	0
4106	1000000004106	Judul Buku 4106	0
4107	1000000004107	Judul Buku 4107	0
4108	1000000004108	Judul Buku 4108	0
4109	1000000004109	Judul Buku 4109	0
4110	1000000004110	Judul Buku 4110	0
4111	1000000004111	Judul Buku 4111	0
4112	1000000004112	Judul Buku 4112	0
4113	1000000004113	Judul Buku 4113	0
4114	1000000004114	Judul Buku 4114	0
4115	1000000004115	Judul Buku 4115	0
4116	1000000004116	Judul Buku 4116	0
4117	1000000004117	Judul Buku 4117	0
4118	1000000004118	Judul Buku 4118	0
4119	1000000004119	Judul Buku 4119	0
4120	1000000004120	Judul Buku 4120	0
4121	1000000004121	Judul Buku 4121	0
4122	1000000004122	Judul Buku 4122	0
4123	1000000004123	Judul Buku 4123	0
4124	1000000004124	Judul Buku 4124	0
4125	1000000004125	Judul Buku 4125	0
4126	1000000004126	Judul Buku 4126	0
4127	1000000004127	Judul Buku 4127	0
4128	1000000004128	Judul Buku 4128	0
4129	1000000004129	Judul Buku 4129	0
4130	1000000004130	Judul Buku 4130	0
4131	1000000004131	Judul Buku 4131	0
4132	1000000004132	Judul Buku 4132	0
4133	1000000004133	Judul Buku 4133	0
4134	1000000004134	Judul Buku 4134	0
4135	1000000004135	Judul Buku 4135	0
4136	1000000004136	Judul Buku 4136	0
4137	1000000004137	Judul Buku 4137	0
4138	1000000004138	Judul Buku 4138	0
4139	1000000004139	Judul Buku 4139	0
4140	1000000004140	Judul Buku 4140	0
4141	1000000004141	Judul Buku 4141	0
4142	1000000004142	Judul Buku 4142	0
4143	1000000004143	Judul Buku 4143	0
4144	1000000004144	Judul Buku 4144	0
4145	1000000004145	Judul Buku 4145	0
4146	1000000004146	Judul Buku 4146	0
4147	1000000004147	Judul Buku 4147	0
4148	1000000004148	Judul Buku 4148	0
4149	1000000004149	Judul Buku 4149	0
4150	1000000004150	Judul Buku 4150	0
4151	1000000004151	Judul Buku 4151	0
4152	1000000004152	Judul Buku 4152	0
4153	1000000004153	Judul Buku 4153	0
4154	1000000004154	Judul Buku 4154	0
4155	1000000004155	Judul Buku 4155	0
4156	1000000004156	Judul Buku 4156	0
4157	1000000004157	Judul Buku 4157	0
4158	1000000004158	Judul Buku 4158	0
4159	1000000004159	Judul Buku 4159	0
4160	1000000004160	Judul Buku 4160	0
4161	1000000004161	Judul Buku 4161	0
4162	1000000004162	Judul Buku 4162	0
4163	1000000004163	Judul Buku 4163	0
4164	1000000004164	Judul Buku 4164	0
4165	1000000004165	Judul Buku 4165	0
4166	1000000004166	Judul Buku 4166	0
4167	1000000004167	Judul Buku 4167	0
4168	1000000004168	Judul Buku 4168	0
4169	1000000004169	Judul Buku 4169	0
4170	1000000004170	Judul Buku 4170	0
4171	1000000004171	Judul Buku 4171	0
4172	1000000004172	Judul Buku 4172	0
4173	1000000004173	Judul Buku 4173	0
4174	1000000004174	Judul Buku 4174	0
4175	1000000004175	Judul Buku 4175	0
4176	1000000004176	Judul Buku 4176	0
4177	1000000004177	Judul Buku 4177	0
4178	1000000004178	Judul Buku 4178	0
4179	1000000004179	Judul Buku 4179	0
4180	1000000004180	Judul Buku 4180	0
4181	1000000004181	Judul Buku 4181	0
4182	1000000004182	Judul Buku 4182	0
4183	1000000004183	Judul Buku 4183	0
4184	1000000004184	Judul Buku 4184	0
4185	1000000004185	Judul Buku 4185	0
4186	1000000004186	Judul Buku 4186	0
4187	1000000004187	Judul Buku 4187	0
4188	1000000004188	Judul Buku 4188	0
4189	1000000004189	Judul Buku 4189	0
4190	1000000004190	Judul Buku 4190	0
4191	1000000004191	Judul Buku 4191	0
4192	1000000004192	Judul Buku 4192	0
4193	1000000004193	Judul Buku 4193	0
4194	1000000004194	Judul Buku 4194	0
4195	1000000004195	Judul Buku 4195	0
4196	1000000004196	Judul Buku 4196	0
4197	1000000004197	Judul Buku 4197	0
4198	1000000004198	Judul Buku 4198	0
4199	1000000004199	Judul Buku 4199	0
4200	1000000004200	Judul Buku 4200	0
4201	1000000004201	Judul Buku 4201	0
4202	1000000004202	Judul Buku 4202	0
4203	1000000004203	Judul Buku 4203	0
4204	1000000004204	Judul Buku 4204	0
4205	1000000004205	Judul Buku 4205	0
4206	1000000004206	Judul Buku 4206	0
4207	1000000004207	Judul Buku 4207	0
4208	1000000004208	Judul Buku 4208	0
4209	1000000004209	Judul Buku 4209	0
4210	1000000004210	Judul Buku 4210	0
4211	1000000004211	Judul Buku 4211	0
4212	1000000004212	Judul Buku 4212	0
4213	1000000004213	Judul Buku 4213	0
4214	1000000004214	Judul Buku 4214	0
4215	1000000004215	Judul Buku 4215	0
4216	1000000004216	Judul Buku 4216	0
4217	1000000004217	Judul Buku 4217	0
4218	1000000004218	Judul Buku 4218	0
4219	1000000004219	Judul Buku 4219	0
4220	1000000004220	Judul Buku 4220	0
4221	1000000004221	Judul Buku 4221	0
4222	1000000004222	Judul Buku 4222	0
4223	1000000004223	Judul Buku 4223	0
4224	1000000004224	Judul Buku 4224	0
4225	1000000004225	Judul Buku 4225	0
4226	1000000004226	Judul Buku 4226	0
4227	1000000004227	Judul Buku 4227	0
4228	1000000004228	Judul Buku 4228	0
4229	1000000004229	Judul Buku 4229	0
4230	1000000004230	Judul Buku 4230	0
4231	1000000004231	Judul Buku 4231	0
4232	1000000004232	Judul Buku 4232	0
4233	1000000004233	Judul Buku 4233	0
4234	1000000004234	Judul Buku 4234	0
4235	1000000004235	Judul Buku 4235	0
4236	1000000004236	Judul Buku 4236	0
4237	1000000004237	Judul Buku 4237	0
4238	1000000004238	Judul Buku 4238	0
4239	1000000004239	Judul Buku 4239	0
4240	1000000004240	Judul Buku 4240	0
4241	1000000004241	Judul Buku 4241	0
4242	1000000004242	Judul Buku 4242	0
4243	1000000004243	Judul Buku 4243	0
4244	1000000004244	Judul Buku 4244	0
4245	1000000004245	Judul Buku 4245	0
4246	1000000004246	Judul Buku 4246	0
4247	1000000004247	Judul Buku 4247	0
4248	1000000004248	Judul Buku 4248	0
4249	1000000004249	Judul Buku 4249	0
4250	1000000004250	Judul Buku 4250	0
4251	1000000004251	Judul Buku 4251	0
4252	1000000004252	Judul Buku 4252	0
4253	1000000004253	Judul Buku 4253	0
4254	1000000004254	Judul Buku 4254	0
4255	1000000004255	Judul Buku 4255	0
4256	1000000004256	Judul Buku 4256	0
4257	1000000004257	Judul Buku 4257	0
4258	1000000004258	Judul Buku 4258	0
4259	1000000004259	Judul Buku 4259	0
4260	1000000004260	Judul Buku 4260	0
4261	1000000004261	Judul Buku 4261	0
4262	1000000004262	Judul Buku 4262	0
4263	1000000004263	Judul Buku 4263	0
4264	1000000004264	Judul Buku 4264	0
4265	1000000004265	Judul Buku 4265	0
4266	1000000004266	Judul Buku 4266	0
4267	1000000004267	Judul Buku 4267	0
4268	1000000004268	Judul Buku 4268	0
4269	1000000004269	Judul Buku 4269	0
4270	1000000004270	Judul Buku 4270	0
4271	1000000004271	Judul Buku 4271	0
4272	1000000004272	Judul Buku 4272	0
4273	1000000004273	Judul Buku 4273	0
4274	1000000004274	Judul Buku 4274	0
4275	1000000004275	Judul Buku 4275	0
4276	1000000004276	Judul Buku 4276	0
4277	1000000004277	Judul Buku 4277	0
4278	1000000004278	Judul Buku 4278	0
4279	1000000004279	Judul Buku 4279	0
4280	1000000004280	Judul Buku 4280	0
4281	1000000004281	Judul Buku 4281	0
4282	1000000004282	Judul Buku 4282	0
4283	1000000004283	Judul Buku 4283	0
4284	1000000004284	Judul Buku 4284	0
4285	1000000004285	Judul Buku 4285	0
4286	1000000004286	Judul Buku 4286	0
4287	1000000004287	Judul Buku 4287	0
4288	1000000004288	Judul Buku 4288	0
4289	1000000004289	Judul Buku 4289	0
4290	1000000004290	Judul Buku 4290	0
4291	1000000004291	Judul Buku 4291	0
4292	1000000004292	Judul Buku 4292	0
4293	1000000004293	Judul Buku 4293	0
4294	1000000004294	Judul Buku 4294	0
4295	1000000004295	Judul Buku 4295	0
4296	1000000004296	Judul Buku 4296	0
4297	1000000004297	Judul Buku 4297	0
4298	1000000004298	Judul Buku 4298	0
4299	1000000004299	Judul Buku 4299	0
4300	1000000004300	Judul Buku 4300	0
4301	1000000004301	Judul Buku 4301	0
4302	1000000004302	Judul Buku 4302	0
4303	1000000004303	Judul Buku 4303	0
4304	1000000004304	Judul Buku 4304	0
4305	1000000004305	Judul Buku 4305	0
4306	1000000004306	Judul Buku 4306	0
4307	1000000004307	Judul Buku 4307	0
4308	1000000004308	Judul Buku 4308	0
4309	1000000004309	Judul Buku 4309	0
4310	1000000004310	Judul Buku 4310	0
4311	1000000004311	Judul Buku 4311	0
4312	1000000004312	Judul Buku 4312	0
4313	1000000004313	Judul Buku 4313	0
4314	1000000004314	Judul Buku 4314	0
4315	1000000004315	Judul Buku 4315	0
4316	1000000004316	Judul Buku 4316	0
4317	1000000004317	Judul Buku 4317	0
4318	1000000004318	Judul Buku 4318	0
4319	1000000004319	Judul Buku 4319	0
4320	1000000004320	Judul Buku 4320	0
4321	1000000004321	Judul Buku 4321	0
4322	1000000004322	Judul Buku 4322	0
4323	1000000004323	Judul Buku 4323	0
4324	1000000004324	Judul Buku 4324	0
4325	1000000004325	Judul Buku 4325	0
4326	1000000004326	Judul Buku 4326	0
4327	1000000004327	Judul Buku 4327	0
4328	1000000004328	Judul Buku 4328	0
4329	1000000004329	Judul Buku 4329	0
4330	1000000004330	Judul Buku 4330	0
4331	1000000004331	Judul Buku 4331	0
4332	1000000004332	Judul Buku 4332	0
4333	1000000004333	Judul Buku 4333	0
4334	1000000004334	Judul Buku 4334	0
4335	1000000004335	Judul Buku 4335	0
4336	1000000004336	Judul Buku 4336	0
4337	1000000004337	Judul Buku 4337	0
4338	1000000004338	Judul Buku 4338	0
4339	1000000004339	Judul Buku 4339	0
4340	1000000004340	Judul Buku 4340	0
4341	1000000004341	Judul Buku 4341	0
4342	1000000004342	Judul Buku 4342	0
4343	1000000004343	Judul Buku 4343	0
4344	1000000004344	Judul Buku 4344	0
4345	1000000004345	Judul Buku 4345	0
4346	1000000004346	Judul Buku 4346	0
4347	1000000004347	Judul Buku 4347	0
4348	1000000004348	Judul Buku 4348	0
4349	1000000004349	Judul Buku 4349	0
4350	1000000004350	Judul Buku 4350	0
4351	1000000004351	Judul Buku 4351	0
4352	1000000004352	Judul Buku 4352	0
4353	1000000004353	Judul Buku 4353	0
4354	1000000004354	Judul Buku 4354	0
4355	1000000004355	Judul Buku 4355	0
4356	1000000004356	Judul Buku 4356	0
4357	1000000004357	Judul Buku 4357	0
4358	1000000004358	Judul Buku 4358	0
4359	1000000004359	Judul Buku 4359	0
4360	1000000004360	Judul Buku 4360	0
4361	1000000004361	Judul Buku 4361	0
4362	1000000004362	Judul Buku 4362	0
4363	1000000004363	Judul Buku 4363	0
4364	1000000004364	Judul Buku 4364	0
4365	1000000004365	Judul Buku 4365	0
4366	1000000004366	Judul Buku 4366	0
4367	1000000004367	Judul Buku 4367	0
4368	1000000004368	Judul Buku 4368	0
4369	1000000004369	Judul Buku 4369	0
4370	1000000004370	Judul Buku 4370	0
4371	1000000004371	Judul Buku 4371	0
4372	1000000004372	Judul Buku 4372	0
4373	1000000004373	Judul Buku 4373	0
4374	1000000004374	Judul Buku 4374	0
4375	1000000004375	Judul Buku 4375	0
4376	1000000004376	Judul Buku 4376	0
4377	1000000004377	Judul Buku 4377	0
4378	1000000004378	Judul Buku 4378	0
4379	1000000004379	Judul Buku 4379	0
4380	1000000004380	Judul Buku 4380	0
4381	1000000004381	Judul Buku 4381	0
4382	1000000004382	Judul Buku 4382	0
4383	1000000004383	Judul Buku 4383	0
4384	1000000004384	Judul Buku 4384	0
4385	1000000004385	Judul Buku 4385	0
4386	1000000004386	Judul Buku 4386	0
4387	1000000004387	Judul Buku 4387	0
4388	1000000004388	Judul Buku 4388	0
4389	1000000004389	Judul Buku 4389	0
4390	1000000004390	Judul Buku 4390	0
4391	1000000004391	Judul Buku 4391	0
4392	1000000004392	Judul Buku 4392	0
4393	1000000004393	Judul Buku 4393	0
4394	1000000004394	Judul Buku 4394	0
4395	1000000004395	Judul Buku 4395	0
4396	1000000004396	Judul Buku 4396	0
4397	1000000004397	Judul Buku 4397	0
4398	1000000004398	Judul Buku 4398	0
4399	1000000004399	Judul Buku 4399	0
4400	1000000004400	Judul Buku 4400	0
4401	1000000004401	Judul Buku 4401	0
4402	1000000004402	Judul Buku 4402	0
4403	1000000004403	Judul Buku 4403	0
4404	1000000004404	Judul Buku 4404	0
4405	1000000004405	Judul Buku 4405	0
4406	1000000004406	Judul Buku 4406	0
4407	1000000004407	Judul Buku 4407	0
4408	1000000004408	Judul Buku 4408	0
4409	1000000004409	Judul Buku 4409	0
4410	1000000004410	Judul Buku 4410	0
4411	1000000004411	Judul Buku 4411	0
4412	1000000004412	Judul Buku 4412	0
4413	1000000004413	Judul Buku 4413	0
4414	1000000004414	Judul Buku 4414	0
4415	1000000004415	Judul Buku 4415	0
4416	1000000004416	Judul Buku 4416	0
4417	1000000004417	Judul Buku 4417	0
4418	1000000004418	Judul Buku 4418	0
4419	1000000004419	Judul Buku 4419	0
4420	1000000004420	Judul Buku 4420	0
4421	1000000004421	Judul Buku 4421	0
4422	1000000004422	Judul Buku 4422	0
4423	1000000004423	Judul Buku 4423	0
4424	1000000004424	Judul Buku 4424	0
4425	1000000004425	Judul Buku 4425	0
4426	1000000004426	Judul Buku 4426	0
4427	1000000004427	Judul Buku 4427	0
4428	1000000004428	Judul Buku 4428	0
4429	1000000004429	Judul Buku 4429	0
4430	1000000004430	Judul Buku 4430	0
4431	1000000004431	Judul Buku 4431	0
4432	1000000004432	Judul Buku 4432	0
4433	1000000004433	Judul Buku 4433	0
4434	1000000004434	Judul Buku 4434	0
4435	1000000004435	Judul Buku 4435	0
4436	1000000004436	Judul Buku 4436	0
4437	1000000004437	Judul Buku 4437	0
4438	1000000004438	Judul Buku 4438	0
4439	1000000004439	Judul Buku 4439	0
4440	1000000004440	Judul Buku 4440	0
4441	1000000004441	Judul Buku 4441	0
4442	1000000004442	Judul Buku 4442	0
4443	1000000004443	Judul Buku 4443	0
4444	1000000004444	Judul Buku 4444	0
4445	1000000004445	Judul Buku 4445	0
4446	1000000004446	Judul Buku 4446	0
4447	1000000004447	Judul Buku 4447	0
4448	1000000004448	Judul Buku 4448	0
4449	1000000004449	Judul Buku 4449	0
4450	1000000004450	Judul Buku 4450	0
4451	1000000004451	Judul Buku 4451	0
4452	1000000004452	Judul Buku 4452	0
4453	1000000004453	Judul Buku 4453	0
4454	1000000004454	Judul Buku 4454	0
4455	1000000004455	Judul Buku 4455	0
4456	1000000004456	Judul Buku 4456	0
4457	1000000004457	Judul Buku 4457	0
4458	1000000004458	Judul Buku 4458	0
4459	1000000004459	Judul Buku 4459	0
4460	1000000004460	Judul Buku 4460	0
4461	1000000004461	Judul Buku 4461	0
4462	1000000004462	Judul Buku 4462	0
4463	1000000004463	Judul Buku 4463	0
4464	1000000004464	Judul Buku 4464	0
4465	1000000004465	Judul Buku 4465	0
4466	1000000004466	Judul Buku 4466	0
4467	1000000004467	Judul Buku 4467	0
4468	1000000004468	Judul Buku 4468	0
4469	1000000004469	Judul Buku 4469	0
4470	1000000004470	Judul Buku 4470	0
4471	1000000004471	Judul Buku 4471	0
4472	1000000004472	Judul Buku 4472	0
4473	1000000004473	Judul Buku 4473	0
4474	1000000004474	Judul Buku 4474	0
4475	1000000004475	Judul Buku 4475	0
4476	1000000004476	Judul Buku 4476	0
4477	1000000004477	Judul Buku 4477	0
4478	1000000004478	Judul Buku 4478	0
4479	1000000004479	Judul Buku 4479	0
4480	1000000004480	Judul Buku 4480	0
4481	1000000004481	Judul Buku 4481	0
4482	1000000004482	Judul Buku 4482	0
4483	1000000004483	Judul Buku 4483	0
4484	1000000004484	Judul Buku 4484	0
4485	1000000004485	Judul Buku 4485	0
4486	1000000004486	Judul Buku 4486	0
4487	1000000004487	Judul Buku 4487	0
4488	1000000004488	Judul Buku 4488	0
4489	1000000004489	Judul Buku 4489	0
4490	1000000004490	Judul Buku 4490	0
4491	1000000004491	Judul Buku 4491	0
4492	1000000004492	Judul Buku 4492	0
4493	1000000004493	Judul Buku 4493	0
4494	1000000004494	Judul Buku 4494	0
4495	1000000004495	Judul Buku 4495	0
4496	1000000004496	Judul Buku 4496	0
4497	1000000004497	Judul Buku 4497	0
4498	1000000004498	Judul Buku 4498	0
4499	1000000004499	Judul Buku 4499	0
4500	1000000004500	Judul Buku 4500	0
4501	1000000004501	Judul Buku 4501	0
4502	1000000004502	Judul Buku 4502	0
4503	1000000004503	Judul Buku 4503	0
4504	1000000004504	Judul Buku 4504	0
4505	1000000004505	Judul Buku 4505	0
4506	1000000004506	Judul Buku 4506	0
4507	1000000004507	Judul Buku 4507	0
4508	1000000004508	Judul Buku 4508	0
4509	1000000004509	Judul Buku 4509	0
4510	1000000004510	Judul Buku 4510	0
4511	1000000004511	Judul Buku 4511	0
4512	1000000004512	Judul Buku 4512	0
4513	1000000004513	Judul Buku 4513	0
4514	1000000004514	Judul Buku 4514	0
4515	1000000004515	Judul Buku 4515	0
4516	1000000004516	Judul Buku 4516	0
4517	1000000004517	Judul Buku 4517	0
4518	1000000004518	Judul Buku 4518	0
4519	1000000004519	Judul Buku 4519	0
4520	1000000004520	Judul Buku 4520	0
4521	1000000004521	Judul Buku 4521	0
4522	1000000004522	Judul Buku 4522	0
4523	1000000004523	Judul Buku 4523	0
4524	1000000004524	Judul Buku 4524	0
4525	1000000004525	Judul Buku 4525	0
4526	1000000004526	Judul Buku 4526	0
4527	1000000004527	Judul Buku 4527	0
4528	1000000004528	Judul Buku 4528	0
4529	1000000004529	Judul Buku 4529	0
4530	1000000004530	Judul Buku 4530	0
4531	1000000004531	Judul Buku 4531	0
4532	1000000004532	Judul Buku 4532	0
4533	1000000004533	Judul Buku 4533	0
4534	1000000004534	Judul Buku 4534	0
4535	1000000004535	Judul Buku 4535	0
4536	1000000004536	Judul Buku 4536	0
4537	1000000004537	Judul Buku 4537	0
4538	1000000004538	Judul Buku 4538	0
4539	1000000004539	Judul Buku 4539	0
4540	1000000004540	Judul Buku 4540	0
4541	1000000004541	Judul Buku 4541	0
4542	1000000004542	Judul Buku 4542	0
4543	1000000004543	Judul Buku 4543	0
4544	1000000004544	Judul Buku 4544	0
4545	1000000004545	Judul Buku 4545	0
4546	1000000004546	Judul Buku 4546	0
4547	1000000004547	Judul Buku 4547	0
4548	1000000004548	Judul Buku 4548	0
4549	1000000004549	Judul Buku 4549	0
4550	1000000004550	Judul Buku 4550	0
4551	1000000004551	Judul Buku 4551	0
4552	1000000004552	Judul Buku 4552	0
4553	1000000004553	Judul Buku 4553	0
4554	1000000004554	Judul Buku 4554	0
4555	1000000004555	Judul Buku 4555	0
4556	1000000004556	Judul Buku 4556	0
4557	1000000004557	Judul Buku 4557	0
4558	1000000004558	Judul Buku 4558	0
4559	1000000004559	Judul Buku 4559	0
4560	1000000004560	Judul Buku 4560	0
4561	1000000004561	Judul Buku 4561	0
4562	1000000004562	Judul Buku 4562	0
4563	1000000004563	Judul Buku 4563	0
4564	1000000004564	Judul Buku 4564	0
4565	1000000004565	Judul Buku 4565	0
4566	1000000004566	Judul Buku 4566	0
4567	1000000004567	Judul Buku 4567	0
4568	1000000004568	Judul Buku 4568	0
4569	1000000004569	Judul Buku 4569	0
4570	1000000004570	Judul Buku 4570	0
4571	1000000004571	Judul Buku 4571	0
4572	1000000004572	Judul Buku 4572	0
4573	1000000004573	Judul Buku 4573	0
4574	1000000004574	Judul Buku 4574	0
4575	1000000004575	Judul Buku 4575	0
4576	1000000004576	Judul Buku 4576	0
4577	1000000004577	Judul Buku 4577	0
4578	1000000004578	Judul Buku 4578	0
4579	1000000004579	Judul Buku 4579	0
4580	1000000004580	Judul Buku 4580	0
4581	1000000004581	Judul Buku 4581	0
4582	1000000004582	Judul Buku 4582	0
4583	1000000004583	Judul Buku 4583	0
4584	1000000004584	Judul Buku 4584	0
4585	1000000004585	Judul Buku 4585	0
4586	1000000004586	Judul Buku 4586	0
4587	1000000004587	Judul Buku 4587	0
4588	1000000004588	Judul Buku 4588	0
4589	1000000004589	Judul Buku 4589	0
4590	1000000004590	Judul Buku 4590	0
4591	1000000004591	Judul Buku 4591	0
4592	1000000004592	Judul Buku 4592	0
4593	1000000004593	Judul Buku 4593	0
4594	1000000004594	Judul Buku 4594	0
4595	1000000004595	Judul Buku 4595	0
4596	1000000004596	Judul Buku 4596	0
4597	1000000004597	Judul Buku 4597	0
4598	1000000004598	Judul Buku 4598	0
4599	1000000004599	Judul Buku 4599	0
4600	1000000004600	Judul Buku 4600	0
4601	1000000004601	Judul Buku 4601	0
4602	1000000004602	Judul Buku 4602	0
4603	1000000004603	Judul Buku 4603	0
4604	1000000004604	Judul Buku 4604	0
4605	1000000004605	Judul Buku 4605	0
4606	1000000004606	Judul Buku 4606	0
4607	1000000004607	Judul Buku 4607	0
4608	1000000004608	Judul Buku 4608	0
4609	1000000004609	Judul Buku 4609	0
4610	1000000004610	Judul Buku 4610	0
4611	1000000004611	Judul Buku 4611	0
4612	1000000004612	Judul Buku 4612	0
4613	1000000004613	Judul Buku 4613	0
4614	1000000004614	Judul Buku 4614	0
4615	1000000004615	Judul Buku 4615	0
4616	1000000004616	Judul Buku 4616	0
4617	1000000004617	Judul Buku 4617	0
4618	1000000004618	Judul Buku 4618	0
4619	1000000004619	Judul Buku 4619	0
4620	1000000004620	Judul Buku 4620	0
4621	1000000004621	Judul Buku 4621	0
4622	1000000004622	Judul Buku 4622	0
4623	1000000004623	Judul Buku 4623	0
4624	1000000004624	Judul Buku 4624	0
4625	1000000004625	Judul Buku 4625	0
4626	1000000004626	Judul Buku 4626	0
4627	1000000004627	Judul Buku 4627	0
4628	1000000004628	Judul Buku 4628	0
4629	1000000004629	Judul Buku 4629	0
4630	1000000004630	Judul Buku 4630	0
4631	1000000004631	Judul Buku 4631	0
4632	1000000004632	Judul Buku 4632	0
4633	1000000004633	Judul Buku 4633	0
4634	1000000004634	Judul Buku 4634	0
4635	1000000004635	Judul Buku 4635	0
4636	1000000004636	Judul Buku 4636	0
4637	1000000004637	Judul Buku 4637	0
4638	1000000004638	Judul Buku 4638	0
4639	1000000004639	Judul Buku 4639	0
4640	1000000004640	Judul Buku 4640	0
4641	1000000004641	Judul Buku 4641	0
4642	1000000004642	Judul Buku 4642	0
4643	1000000004643	Judul Buku 4643	0
4644	1000000004644	Judul Buku 4644	0
4645	1000000004645	Judul Buku 4645	0
4646	1000000004646	Judul Buku 4646	0
4647	1000000004647	Judul Buku 4647	0
4648	1000000004648	Judul Buku 4648	0
4649	1000000004649	Judul Buku 4649	0
4650	1000000004650	Judul Buku 4650	0
4651	1000000004651	Judul Buku 4651	0
4652	1000000004652	Judul Buku 4652	0
4653	1000000004653	Judul Buku 4653	0
4654	1000000004654	Judul Buku 4654	0
4655	1000000004655	Judul Buku 4655	0
4656	1000000004656	Judul Buku 4656	0
4657	1000000004657	Judul Buku 4657	0
4658	1000000004658	Judul Buku 4658	0
4659	1000000004659	Judul Buku 4659	0
4660	1000000004660	Judul Buku 4660	0
4661	1000000004661	Judul Buku 4661	0
4662	1000000004662	Judul Buku 4662	0
4663	1000000004663	Judul Buku 4663	0
4664	1000000004664	Judul Buku 4664	0
4665	1000000004665	Judul Buku 4665	0
4666	1000000004666	Judul Buku 4666	0
4667	1000000004667	Judul Buku 4667	0
4668	1000000004668	Judul Buku 4668	0
4669	1000000004669	Judul Buku 4669	0
4670	1000000004670	Judul Buku 4670	0
4671	1000000004671	Judul Buku 4671	0
4672	1000000004672	Judul Buku 4672	0
4673	1000000004673	Judul Buku 4673	0
4674	1000000004674	Judul Buku 4674	0
4675	1000000004675	Judul Buku 4675	0
4676	1000000004676	Judul Buku 4676	0
4677	1000000004677	Judul Buku 4677	0
4678	1000000004678	Judul Buku 4678	0
4679	1000000004679	Judul Buku 4679	0
4680	1000000004680	Judul Buku 4680	0
4681	1000000004681	Judul Buku 4681	0
4682	1000000004682	Judul Buku 4682	0
4683	1000000004683	Judul Buku 4683	0
4684	1000000004684	Judul Buku 4684	0
4685	1000000004685	Judul Buku 4685	0
4686	1000000004686	Judul Buku 4686	0
4687	1000000004687	Judul Buku 4687	0
4688	1000000004688	Judul Buku 4688	0
4689	1000000004689	Judul Buku 4689	0
4690	1000000004690	Judul Buku 4690	0
4691	1000000004691	Judul Buku 4691	0
4692	1000000004692	Judul Buku 4692	0
4693	1000000004693	Judul Buku 4693	0
4694	1000000004694	Judul Buku 4694	0
4695	1000000004695	Judul Buku 4695	0
4696	1000000004696	Judul Buku 4696	0
4697	1000000004697	Judul Buku 4697	0
4698	1000000004698	Judul Buku 4698	0
4699	1000000004699	Judul Buku 4699	0
4700	1000000004700	Judul Buku 4700	0
4701	1000000004701	Judul Buku 4701	0
4702	1000000004702	Judul Buku 4702	0
4703	1000000004703	Judul Buku 4703	0
4704	1000000004704	Judul Buku 4704	0
4705	1000000004705	Judul Buku 4705	0
4706	1000000004706	Judul Buku 4706	0
4707	1000000004707	Judul Buku 4707	0
4708	1000000004708	Judul Buku 4708	0
4709	1000000004709	Judul Buku 4709	0
4710	1000000004710	Judul Buku 4710	0
4711	1000000004711	Judul Buku 4711	0
4712	1000000004712	Judul Buku 4712	0
4713	1000000004713	Judul Buku 4713	0
4714	1000000004714	Judul Buku 4714	0
4715	1000000004715	Judul Buku 4715	0
4716	1000000004716	Judul Buku 4716	0
4717	1000000004717	Judul Buku 4717	0
4718	1000000004718	Judul Buku 4718	0
4719	1000000004719	Judul Buku 4719	0
4720	1000000004720	Judul Buku 4720	0
4721	1000000004721	Judul Buku 4721	0
4722	1000000004722	Judul Buku 4722	0
4723	1000000004723	Judul Buku 4723	0
4724	1000000004724	Judul Buku 4724	0
4725	1000000004725	Judul Buku 4725	0
4726	1000000004726	Judul Buku 4726	0
4727	1000000004727	Judul Buku 4727	0
4728	1000000004728	Judul Buku 4728	0
4729	1000000004729	Judul Buku 4729	0
4730	1000000004730	Judul Buku 4730	0
4731	1000000004731	Judul Buku 4731	0
4732	1000000004732	Judul Buku 4732	0
4733	1000000004733	Judul Buku 4733	0
4734	1000000004734	Judul Buku 4734	0
4735	1000000004735	Judul Buku 4735	0
4736	1000000004736	Judul Buku 4736	0
4737	1000000004737	Judul Buku 4737	0
4738	1000000004738	Judul Buku 4738	0
4739	1000000004739	Judul Buku 4739	0
4740	1000000004740	Judul Buku 4740	0
4741	1000000004741	Judul Buku 4741	0
4742	1000000004742	Judul Buku 4742	0
4743	1000000004743	Judul Buku 4743	0
4744	1000000004744	Judul Buku 4744	0
4745	1000000004745	Judul Buku 4745	0
4746	1000000004746	Judul Buku 4746	0
4747	1000000004747	Judul Buku 4747	0
4748	1000000004748	Judul Buku 4748	0
4749	1000000004749	Judul Buku 4749	0
4750	1000000004750	Judul Buku 4750	0
4751	1000000004751	Judul Buku 4751	0
4752	1000000004752	Judul Buku 4752	0
4753	1000000004753	Judul Buku 4753	0
4754	1000000004754	Judul Buku 4754	0
4755	1000000004755	Judul Buku 4755	0
4756	1000000004756	Judul Buku 4756	0
4757	1000000004757	Judul Buku 4757	0
4758	1000000004758	Judul Buku 4758	0
4759	1000000004759	Judul Buku 4759	0
4760	1000000004760	Judul Buku 4760	0
4761	1000000004761	Judul Buku 4761	0
4762	1000000004762	Judul Buku 4762	0
4763	1000000004763	Judul Buku 4763	0
4764	1000000004764	Judul Buku 4764	0
4765	1000000004765	Judul Buku 4765	0
4766	1000000004766	Judul Buku 4766	0
4767	1000000004767	Judul Buku 4767	0
4768	1000000004768	Judul Buku 4768	0
4769	1000000004769	Judul Buku 4769	0
4770	1000000004770	Judul Buku 4770	0
4771	1000000004771	Judul Buku 4771	0
4772	1000000004772	Judul Buku 4772	0
4773	1000000004773	Judul Buku 4773	0
4774	1000000004774	Judul Buku 4774	0
4775	1000000004775	Judul Buku 4775	0
4776	1000000004776	Judul Buku 4776	0
4777	1000000004777	Judul Buku 4777	0
4778	1000000004778	Judul Buku 4778	0
4779	1000000004779	Judul Buku 4779	0
4780	1000000004780	Judul Buku 4780	0
4781	1000000004781	Judul Buku 4781	0
4782	1000000004782	Judul Buku 4782	0
4783	1000000004783	Judul Buku 4783	0
4784	1000000004784	Judul Buku 4784	0
4785	1000000004785	Judul Buku 4785	0
4786	1000000004786	Judul Buku 4786	0
4787	1000000004787	Judul Buku 4787	0
4788	1000000004788	Judul Buku 4788	0
4789	1000000004789	Judul Buku 4789	0
4790	1000000004790	Judul Buku 4790	0
4791	1000000004791	Judul Buku 4791	0
4792	1000000004792	Judul Buku 4792	0
4793	1000000004793	Judul Buku 4793	0
4794	1000000004794	Judul Buku 4794	0
4795	1000000004795	Judul Buku 4795	0
4796	1000000004796	Judul Buku 4796	0
4797	1000000004797	Judul Buku 4797	0
4798	1000000004798	Judul Buku 4798	0
4799	1000000004799	Judul Buku 4799	0
4800	1000000004800	Judul Buku 4800	0
4801	1000000004801	Judul Buku 4801	0
4802	1000000004802	Judul Buku 4802	0
4803	1000000004803	Judul Buku 4803	0
4804	1000000004804	Judul Buku 4804	0
4805	1000000004805	Judul Buku 4805	0
4806	1000000004806	Judul Buku 4806	0
4807	1000000004807	Judul Buku 4807	0
4808	1000000004808	Judul Buku 4808	0
4809	1000000004809	Judul Buku 4809	0
4810	1000000004810	Judul Buku 4810	0
4811	1000000004811	Judul Buku 4811	0
4812	1000000004812	Judul Buku 4812	0
4813	1000000004813	Judul Buku 4813	0
4814	1000000004814	Judul Buku 4814	0
4815	1000000004815	Judul Buku 4815	0
4816	1000000004816	Judul Buku 4816	0
4817	1000000004817	Judul Buku 4817	0
4818	1000000004818	Judul Buku 4818	0
4819	1000000004819	Judul Buku 4819	0
4820	1000000004820	Judul Buku 4820	0
4821	1000000004821	Judul Buku 4821	0
4822	1000000004822	Judul Buku 4822	0
4823	1000000004823	Judul Buku 4823	0
4824	1000000004824	Judul Buku 4824	0
4825	1000000004825	Judul Buku 4825	0
4826	1000000004826	Judul Buku 4826	0
4827	1000000004827	Judul Buku 4827	0
4828	1000000004828	Judul Buku 4828	0
4829	1000000004829	Judul Buku 4829	0
4830	1000000004830	Judul Buku 4830	0
4831	1000000004831	Judul Buku 4831	0
4832	1000000004832	Judul Buku 4832	0
4833	1000000004833	Judul Buku 4833	0
4834	1000000004834	Judul Buku 4834	0
4835	1000000004835	Judul Buku 4835	0
4836	1000000004836	Judul Buku 4836	0
4837	1000000004837	Judul Buku 4837	0
4838	1000000004838	Judul Buku 4838	0
4839	1000000004839	Judul Buku 4839	0
4840	1000000004840	Judul Buku 4840	0
4841	1000000004841	Judul Buku 4841	0
4842	1000000004842	Judul Buku 4842	0
4843	1000000004843	Judul Buku 4843	0
4844	1000000004844	Judul Buku 4844	0
4845	1000000004845	Judul Buku 4845	0
4846	1000000004846	Judul Buku 4846	0
4847	1000000004847	Judul Buku 4847	0
4848	1000000004848	Judul Buku 4848	0
4849	1000000004849	Judul Buku 4849	0
4850	1000000004850	Judul Buku 4850	0
4851	1000000004851	Judul Buku 4851	0
4852	1000000004852	Judul Buku 4852	0
4853	1000000004853	Judul Buku 4853	0
4854	1000000004854	Judul Buku 4854	0
4855	1000000004855	Judul Buku 4855	0
4856	1000000004856	Judul Buku 4856	0
4857	1000000004857	Judul Buku 4857	0
4858	1000000004858	Judul Buku 4858	0
4859	1000000004859	Judul Buku 4859	0
4860	1000000004860	Judul Buku 4860	0
4861	1000000004861	Judul Buku 4861	0
4862	1000000004862	Judul Buku 4862	0
4863	1000000004863	Judul Buku 4863	0
4864	1000000004864	Judul Buku 4864	0
4865	1000000004865	Judul Buku 4865	0
4866	1000000004866	Judul Buku 4866	0
4867	1000000004867	Judul Buku 4867	0
4868	1000000004868	Judul Buku 4868	0
4869	1000000004869	Judul Buku 4869	0
4870	1000000004870	Judul Buku 4870	0
4871	1000000004871	Judul Buku 4871	0
4872	1000000004872	Judul Buku 4872	0
4873	1000000004873	Judul Buku 4873	0
4874	1000000004874	Judul Buku 4874	0
4875	1000000004875	Judul Buku 4875	0
4876	1000000004876	Judul Buku 4876	0
4877	1000000004877	Judul Buku 4877	0
4878	1000000004878	Judul Buku 4878	0
4879	1000000004879	Judul Buku 4879	0
4880	1000000004880	Judul Buku 4880	0
4881	1000000004881	Judul Buku 4881	0
4882	1000000004882	Judul Buku 4882	0
4883	1000000004883	Judul Buku 4883	0
4884	1000000004884	Judul Buku 4884	0
4885	1000000004885	Judul Buku 4885	0
4886	1000000004886	Judul Buku 4886	0
4887	1000000004887	Judul Buku 4887	0
4888	1000000004888	Judul Buku 4888	0
4889	1000000004889	Judul Buku 4889	0
4890	1000000004890	Judul Buku 4890	0
4891	1000000004891	Judul Buku 4891	0
4892	1000000004892	Judul Buku 4892	0
4893	1000000004893	Judul Buku 4893	0
4894	1000000004894	Judul Buku 4894	0
4895	1000000004895	Judul Buku 4895	0
4896	1000000004896	Judul Buku 4896	0
4897	1000000004897	Judul Buku 4897	0
4898	1000000004898	Judul Buku 4898	0
4899	1000000004899	Judul Buku 4899	0
4900	1000000004900	Judul Buku 4900	0
4901	1000000004901	Judul Buku 4901	0
4902	1000000004902	Judul Buku 4902	0
4903	1000000004903	Judul Buku 4903	0
4904	1000000004904	Judul Buku 4904	0
4905	1000000004905	Judul Buku 4905	0
4906	1000000004906	Judul Buku 4906	0
4907	1000000004907	Judul Buku 4907	0
4908	1000000004908	Judul Buku 4908	0
4909	1000000004909	Judul Buku 4909	0
4910	1000000004910	Judul Buku 4910	0
4911	1000000004911	Judul Buku 4911	0
4912	1000000004912	Judul Buku 4912	0
4913	1000000004913	Judul Buku 4913	0
4914	1000000004914	Judul Buku 4914	0
4915	1000000004915	Judul Buku 4915	0
4916	1000000004916	Judul Buku 4916	0
4917	1000000004917	Judul Buku 4917	0
4918	1000000004918	Judul Buku 4918	0
4919	1000000004919	Judul Buku 4919	0
4920	1000000004920	Judul Buku 4920	0
4921	1000000004921	Judul Buku 4921	0
4922	1000000004922	Judul Buku 4922	0
4923	1000000004923	Judul Buku 4923	0
4924	1000000004924	Judul Buku 4924	0
4925	1000000004925	Judul Buku 4925	0
4926	1000000004926	Judul Buku 4926	0
4927	1000000004927	Judul Buku 4927	0
4928	1000000004928	Judul Buku 4928	0
4929	1000000004929	Judul Buku 4929	0
4930	1000000004930	Judul Buku 4930	0
4931	1000000004931	Judul Buku 4931	0
4932	1000000004932	Judul Buku 4932	0
4933	1000000004933	Judul Buku 4933	0
4934	1000000004934	Judul Buku 4934	0
4935	1000000004935	Judul Buku 4935	0
4936	1000000004936	Judul Buku 4936	0
4937	1000000004937	Judul Buku 4937	0
4938	1000000004938	Judul Buku 4938	0
4939	1000000004939	Judul Buku 4939	0
4940	1000000004940	Judul Buku 4940	0
4941	1000000004941	Judul Buku 4941	0
4942	1000000004942	Judul Buku 4942	0
4943	1000000004943	Judul Buku 4943	0
4944	1000000004944	Judul Buku 4944	0
4945	1000000004945	Judul Buku 4945	0
4946	1000000004946	Judul Buku 4946	0
4947	1000000004947	Judul Buku 4947	0
4948	1000000004948	Judul Buku 4948	0
4949	1000000004949	Judul Buku 4949	0
4950	1000000004950	Judul Buku 4950	0
4951	1000000004951	Judul Buku 4951	0
4952	1000000004952	Judul Buku 4952	0
4953	1000000004953	Judul Buku 4953	0
4954	1000000004954	Judul Buku 4954	0
4955	1000000004955	Judul Buku 4955	0
4956	1000000004956	Judul Buku 4956	0
4957	1000000004957	Judul Buku 4957	0
4958	1000000004958	Judul Buku 4958	0
4959	1000000004959	Judul Buku 4959	0
4960	1000000004960	Judul Buku 4960	0
4961	1000000004961	Judul Buku 4961	0
4962	1000000004962	Judul Buku 4962	0
4963	1000000004963	Judul Buku 4963	0
4964	1000000004964	Judul Buku 4964	0
4965	1000000004965	Judul Buku 4965	0
4966	1000000004966	Judul Buku 4966	0
4967	1000000004967	Judul Buku 4967	0
4968	1000000004968	Judul Buku 4968	0
4969	1000000004969	Judul Buku 4969	0
4970	1000000004970	Judul Buku 4970	0
4971	1000000004971	Judul Buku 4971	0
4972	1000000004972	Judul Buku 4972	0
4973	1000000004973	Judul Buku 4973	0
4974	1000000004974	Judul Buku 4974	0
4975	1000000004975	Judul Buku 4975	0
4976	1000000004976	Judul Buku 4976	0
4977	1000000004977	Judul Buku 4977	0
4978	1000000004978	Judul Buku 4978	0
4979	1000000004979	Judul Buku 4979	0
4980	1000000004980	Judul Buku 4980	0
4981	1000000004981	Judul Buku 4981	0
4982	1000000004982	Judul Buku 4982	0
4983	1000000004983	Judul Buku 4983	0
4984	1000000004984	Judul Buku 4984	0
4985	1000000004985	Judul Buku 4985	0
4986	1000000004986	Judul Buku 4986	0
4987	1000000004987	Judul Buku 4987	0
4988	1000000004988	Judul Buku 4988	0
4989	1000000004989	Judul Buku 4989	0
4990	1000000004990	Judul Buku 4990	0
4991	1000000004991	Judul Buku 4991	0
4992	1000000004992	Judul Buku 4992	0
4993	1000000004993	Judul Buku 4993	0
4994	1000000004994	Judul Buku 4994	0
4995	1000000004995	Judul Buku 4995	0
4996	1000000004996	Judul Buku 4996	0
4997	1000000004997	Judul Buku 4997	0
4998	1000000004998	Judul Buku 4998	0
4999	1000000004999	Judul Buku 4999	0
5000	1000000005000	Judul Buku 5000	0
5001	1000000005001	Judul Buku 5001	0
5002	1000000005002	Judul Buku 5002	0
5003	1000000005003	Judul Buku 5003	0
5004	1000000005004	Judul Buku 5004	0
5005	1000000005005	Judul Buku 5005	0
5006	1000000005006	Judul Buku 5006	0
5007	1000000005007	Judul Buku 5007	0
5008	1000000005008	Judul Buku 5008	0
5009	1000000005009	Judul Buku 5009	0
5010	1000000005010	Judul Buku 5010	0
5011	1000000005011	Judul Buku 5011	0
5012	1000000005012	Judul Buku 5012	0
5013	1000000005013	Judul Buku 5013	0
5014	1000000005014	Judul Buku 5014	0
5015	1000000005015	Judul Buku 5015	0
5016	1000000005016	Judul Buku 5016	0
5017	1000000005017	Judul Buku 5017	0
5018	1000000005018	Judul Buku 5018	0
5019	1000000005019	Judul Buku 5019	0
5020	1000000005020	Judul Buku 5020	0
5021	1000000005021	Judul Buku 5021	0
5022	1000000005022	Judul Buku 5022	0
5023	1000000005023	Judul Buku 5023	0
5024	1000000005024	Judul Buku 5024	0
5025	1000000005025	Judul Buku 5025	0
5026	1000000005026	Judul Buku 5026	0
5027	1000000005027	Judul Buku 5027	0
5028	1000000005028	Judul Buku 5028	0
5029	1000000005029	Judul Buku 5029	0
5030	1000000005030	Judul Buku 5030	0
5031	1000000005031	Judul Buku 5031	0
5032	1000000005032	Judul Buku 5032	0
5033	1000000005033	Judul Buku 5033	0
5034	1000000005034	Judul Buku 5034	0
5035	1000000005035	Judul Buku 5035	0
5036	1000000005036	Judul Buku 5036	0
5037	1000000005037	Judul Buku 5037	0
5038	1000000005038	Judul Buku 5038	0
5039	1000000005039	Judul Buku 5039	0
5040	1000000005040	Judul Buku 5040	0
5041	1000000005041	Judul Buku 5041	0
5042	1000000005042	Judul Buku 5042	0
5043	1000000005043	Judul Buku 5043	0
5044	1000000005044	Judul Buku 5044	0
5045	1000000005045	Judul Buku 5045	0
5046	1000000005046	Judul Buku 5046	0
5047	1000000005047	Judul Buku 5047	0
5048	1000000005048	Judul Buku 5048	0
5049	1000000005049	Judul Buku 5049	0
5050	1000000005050	Judul Buku 5050	0
5051	1000000005051	Judul Buku 5051	0
5052	1000000005052	Judul Buku 5052	0
5053	1000000005053	Judul Buku 5053	0
5054	1000000005054	Judul Buku 5054	0
5055	1000000005055	Judul Buku 5055	0
5056	1000000005056	Judul Buku 5056	0
5057	1000000005057	Judul Buku 5057	0
5058	1000000005058	Judul Buku 5058	0
5059	1000000005059	Judul Buku 5059	0
5060	1000000005060	Judul Buku 5060	0
5061	1000000005061	Judul Buku 5061	0
5062	1000000005062	Judul Buku 5062	0
5063	1000000005063	Judul Buku 5063	0
5064	1000000005064	Judul Buku 5064	0
5065	1000000005065	Judul Buku 5065	0
5066	1000000005066	Judul Buku 5066	0
5067	1000000005067	Judul Buku 5067	0
5068	1000000005068	Judul Buku 5068	0
5069	1000000005069	Judul Buku 5069	0
5070	1000000005070	Judul Buku 5070	0
5071	1000000005071	Judul Buku 5071	0
5072	1000000005072	Judul Buku 5072	0
5073	1000000005073	Judul Buku 5073	0
5074	1000000005074	Judul Buku 5074	0
5075	1000000005075	Judul Buku 5075	0
5076	1000000005076	Judul Buku 5076	0
5077	1000000005077	Judul Buku 5077	0
5078	1000000005078	Judul Buku 5078	0
5079	1000000005079	Judul Buku 5079	0
5080	1000000005080	Judul Buku 5080	0
5081	1000000005081	Judul Buku 5081	0
5082	1000000005082	Judul Buku 5082	0
5083	1000000005083	Judul Buku 5083	0
5084	1000000005084	Judul Buku 5084	0
5085	1000000005085	Judul Buku 5085	0
5086	1000000005086	Judul Buku 5086	0
5087	1000000005087	Judul Buku 5087	0
5088	1000000005088	Judul Buku 5088	0
5089	1000000005089	Judul Buku 5089	0
5090	1000000005090	Judul Buku 5090	0
5091	1000000005091	Judul Buku 5091	0
5092	1000000005092	Judul Buku 5092	0
5093	1000000005093	Judul Buku 5093	0
5094	1000000005094	Judul Buku 5094	0
5095	1000000005095	Judul Buku 5095	0
5096	1000000005096	Judul Buku 5096	0
5097	1000000005097	Judul Buku 5097	0
5098	1000000005098	Judul Buku 5098	0
5099	1000000005099	Judul Buku 5099	0
5100	1000000005100	Judul Buku 5100	0
5101	1000000005101	Judul Buku 5101	0
5102	1000000005102	Judul Buku 5102	0
5103	1000000005103	Judul Buku 5103	0
5104	1000000005104	Judul Buku 5104	0
5105	1000000005105	Judul Buku 5105	0
5106	1000000005106	Judul Buku 5106	0
5107	1000000005107	Judul Buku 5107	0
5108	1000000005108	Judul Buku 5108	0
5109	1000000005109	Judul Buku 5109	0
5110	1000000005110	Judul Buku 5110	0
5111	1000000005111	Judul Buku 5111	0
5112	1000000005112	Judul Buku 5112	0
5113	1000000005113	Judul Buku 5113	0
5114	1000000005114	Judul Buku 5114	0
5115	1000000005115	Judul Buku 5115	0
5116	1000000005116	Judul Buku 5116	0
5117	1000000005117	Judul Buku 5117	0
5118	1000000005118	Judul Buku 5118	0
5119	1000000005119	Judul Buku 5119	0
5120	1000000005120	Judul Buku 5120	0
5121	1000000005121	Judul Buku 5121	0
5122	1000000005122	Judul Buku 5122	0
5123	1000000005123	Judul Buku 5123	0
5124	1000000005124	Judul Buku 5124	0
5125	1000000005125	Judul Buku 5125	0
5126	1000000005126	Judul Buku 5126	0
5127	1000000005127	Judul Buku 5127	0
5128	1000000005128	Judul Buku 5128	0
5129	1000000005129	Judul Buku 5129	0
5130	1000000005130	Judul Buku 5130	0
5131	1000000005131	Judul Buku 5131	0
5132	1000000005132	Judul Buku 5132	0
5133	1000000005133	Judul Buku 5133	0
5134	1000000005134	Judul Buku 5134	0
5135	1000000005135	Judul Buku 5135	0
5136	1000000005136	Judul Buku 5136	0
5137	1000000005137	Judul Buku 5137	0
5138	1000000005138	Judul Buku 5138	0
5139	1000000005139	Judul Buku 5139	0
5140	1000000005140	Judul Buku 5140	0
5141	1000000005141	Judul Buku 5141	0
5142	1000000005142	Judul Buku 5142	0
5143	1000000005143	Judul Buku 5143	0
5144	1000000005144	Judul Buku 5144	0
5145	1000000005145	Judul Buku 5145	0
5146	1000000005146	Judul Buku 5146	0
5147	1000000005147	Judul Buku 5147	0
5148	1000000005148	Judul Buku 5148	0
5149	1000000005149	Judul Buku 5149	0
5150	1000000005150	Judul Buku 5150	0
5151	1000000005151	Judul Buku 5151	0
5152	1000000005152	Judul Buku 5152	0
5153	1000000005153	Judul Buku 5153	0
5154	1000000005154	Judul Buku 5154	0
5155	1000000005155	Judul Buku 5155	0
5156	1000000005156	Judul Buku 5156	0
5157	1000000005157	Judul Buku 5157	0
5158	1000000005158	Judul Buku 5158	0
5159	1000000005159	Judul Buku 5159	0
5160	1000000005160	Judul Buku 5160	0
5161	1000000005161	Judul Buku 5161	0
5162	1000000005162	Judul Buku 5162	0
5163	1000000005163	Judul Buku 5163	0
5164	1000000005164	Judul Buku 5164	0
5165	1000000005165	Judul Buku 5165	0
5166	1000000005166	Judul Buku 5166	0
5167	1000000005167	Judul Buku 5167	0
5168	1000000005168	Judul Buku 5168	0
5169	1000000005169	Judul Buku 5169	0
5170	1000000005170	Judul Buku 5170	0
5171	1000000005171	Judul Buku 5171	0
5172	1000000005172	Judul Buku 5172	0
5173	1000000005173	Judul Buku 5173	0
5174	1000000005174	Judul Buku 5174	0
5175	1000000005175	Judul Buku 5175	0
5176	1000000005176	Judul Buku 5176	0
5177	1000000005177	Judul Buku 5177	0
5178	1000000005178	Judul Buku 5178	0
5179	1000000005179	Judul Buku 5179	0
5180	1000000005180	Judul Buku 5180	0
5181	1000000005181	Judul Buku 5181	0
5182	1000000005182	Judul Buku 5182	0
5183	1000000005183	Judul Buku 5183	0
5184	1000000005184	Judul Buku 5184	0
5185	1000000005185	Judul Buku 5185	0
5186	1000000005186	Judul Buku 5186	0
5187	1000000005187	Judul Buku 5187	0
5188	1000000005188	Judul Buku 5188	0
5189	1000000005189	Judul Buku 5189	0
5190	1000000005190	Judul Buku 5190	0
5191	1000000005191	Judul Buku 5191	0
5192	1000000005192	Judul Buku 5192	0
5193	1000000005193	Judul Buku 5193	0
5194	1000000005194	Judul Buku 5194	0
5195	1000000005195	Judul Buku 5195	0
5196	1000000005196	Judul Buku 5196	0
5197	1000000005197	Judul Buku 5197	0
5198	1000000005198	Judul Buku 5198	0
5199	1000000005199	Judul Buku 5199	0
5200	1000000005200	Judul Buku 5200	0
5201	1000000005201	Judul Buku 5201	0
5202	1000000005202	Judul Buku 5202	0
5203	1000000005203	Judul Buku 5203	0
5204	1000000005204	Judul Buku 5204	0
5205	1000000005205	Judul Buku 5205	0
5206	1000000005206	Judul Buku 5206	0
5207	1000000005207	Judul Buku 5207	0
5208	1000000005208	Judul Buku 5208	0
5209	1000000005209	Judul Buku 5209	0
5210	1000000005210	Judul Buku 5210	0
5211	1000000005211	Judul Buku 5211	0
5212	1000000005212	Judul Buku 5212	0
5213	1000000005213	Judul Buku 5213	0
5214	1000000005214	Judul Buku 5214	0
5215	1000000005215	Judul Buku 5215	0
5216	1000000005216	Judul Buku 5216	0
5217	1000000005217	Judul Buku 5217	0
5218	1000000005218	Judul Buku 5218	0
5219	1000000005219	Judul Buku 5219	0
5220	1000000005220	Judul Buku 5220	0
5221	1000000005221	Judul Buku 5221	0
5222	1000000005222	Judul Buku 5222	0
5223	1000000005223	Judul Buku 5223	0
5224	1000000005224	Judul Buku 5224	0
5225	1000000005225	Judul Buku 5225	0
5226	1000000005226	Judul Buku 5226	0
5227	1000000005227	Judul Buku 5227	0
5228	1000000005228	Judul Buku 5228	0
5229	1000000005229	Judul Buku 5229	0
5230	1000000005230	Judul Buku 5230	0
5231	1000000005231	Judul Buku 5231	0
5232	1000000005232	Judul Buku 5232	0
5233	1000000005233	Judul Buku 5233	0
5234	1000000005234	Judul Buku 5234	0
5235	1000000005235	Judul Buku 5235	0
5236	1000000005236	Judul Buku 5236	0
5237	1000000005237	Judul Buku 5237	0
5238	1000000005238	Judul Buku 5238	0
5239	1000000005239	Judul Buku 5239	0
5240	1000000005240	Judul Buku 5240	0
5241	1000000005241	Judul Buku 5241	0
5242	1000000005242	Judul Buku 5242	0
5243	1000000005243	Judul Buku 5243	0
5244	1000000005244	Judul Buku 5244	0
5245	1000000005245	Judul Buku 5245	0
5246	1000000005246	Judul Buku 5246	0
5247	1000000005247	Judul Buku 5247	0
5248	1000000005248	Judul Buku 5248	0
5249	1000000005249	Judul Buku 5249	0
5250	1000000005250	Judul Buku 5250	0
5251	1000000005251	Judul Buku 5251	0
5252	1000000005252	Judul Buku 5252	0
5253	1000000005253	Judul Buku 5253	0
5254	1000000005254	Judul Buku 5254	0
5255	1000000005255	Judul Buku 5255	0
5256	1000000005256	Judul Buku 5256	0
5257	1000000005257	Judul Buku 5257	0
5258	1000000005258	Judul Buku 5258	0
5259	1000000005259	Judul Buku 5259	0
5260	1000000005260	Judul Buku 5260	0
5261	1000000005261	Judul Buku 5261	0
5262	1000000005262	Judul Buku 5262	0
5263	1000000005263	Judul Buku 5263	0
5264	1000000005264	Judul Buku 5264	0
5265	1000000005265	Judul Buku 5265	0
5266	1000000005266	Judul Buku 5266	0
5267	1000000005267	Judul Buku 5267	0
5268	1000000005268	Judul Buku 5268	0
5269	1000000005269	Judul Buku 5269	0
5270	1000000005270	Judul Buku 5270	0
5271	1000000005271	Judul Buku 5271	0
5272	1000000005272	Judul Buku 5272	0
5273	1000000005273	Judul Buku 5273	0
5274	1000000005274	Judul Buku 5274	0
5275	1000000005275	Judul Buku 5275	0
5276	1000000005276	Judul Buku 5276	0
5277	1000000005277	Judul Buku 5277	0
5278	1000000005278	Judul Buku 5278	0
5279	1000000005279	Judul Buku 5279	0
5280	1000000005280	Judul Buku 5280	0
5281	1000000005281	Judul Buku 5281	0
5282	1000000005282	Judul Buku 5282	0
5283	1000000005283	Judul Buku 5283	0
5284	1000000005284	Judul Buku 5284	0
5285	1000000005285	Judul Buku 5285	0
5286	1000000005286	Judul Buku 5286	0
5287	1000000005287	Judul Buku 5287	0
5288	1000000005288	Judul Buku 5288	0
5289	1000000005289	Judul Buku 5289	0
5290	1000000005290	Judul Buku 5290	0
5291	1000000005291	Judul Buku 5291	0
5292	1000000005292	Judul Buku 5292	0
5293	1000000005293	Judul Buku 5293	0
5294	1000000005294	Judul Buku 5294	0
5295	1000000005295	Judul Buku 5295	0
5296	1000000005296	Judul Buku 5296	0
5297	1000000005297	Judul Buku 5297	0
5298	1000000005298	Judul Buku 5298	0
5299	1000000005299	Judul Buku 5299	0
5300	1000000005300	Judul Buku 5300	0
5301	1000000005301	Judul Buku 5301	0
5302	1000000005302	Judul Buku 5302	0
5303	1000000005303	Judul Buku 5303	0
5304	1000000005304	Judul Buku 5304	0
5305	1000000005305	Judul Buku 5305	0
5306	1000000005306	Judul Buku 5306	0
5307	1000000005307	Judul Buku 5307	0
5308	1000000005308	Judul Buku 5308	0
5309	1000000005309	Judul Buku 5309	0
5310	1000000005310	Judul Buku 5310	0
5311	1000000005311	Judul Buku 5311	0
5312	1000000005312	Judul Buku 5312	0
5313	1000000005313	Judul Buku 5313	0
5314	1000000005314	Judul Buku 5314	0
5315	1000000005315	Judul Buku 5315	0
5316	1000000005316	Judul Buku 5316	0
5317	1000000005317	Judul Buku 5317	0
5318	1000000005318	Judul Buku 5318	0
5319	1000000005319	Judul Buku 5319	0
5320	1000000005320	Judul Buku 5320	0
5321	1000000005321	Judul Buku 5321	0
5322	1000000005322	Judul Buku 5322	0
5323	1000000005323	Judul Buku 5323	0
5324	1000000005324	Judul Buku 5324	0
5325	1000000005325	Judul Buku 5325	0
5326	1000000005326	Judul Buku 5326	0
5327	1000000005327	Judul Buku 5327	0
5328	1000000005328	Judul Buku 5328	0
5329	1000000005329	Judul Buku 5329	0
5330	1000000005330	Judul Buku 5330	0
5331	1000000005331	Judul Buku 5331	0
5332	1000000005332	Judul Buku 5332	0
5333	1000000005333	Judul Buku 5333	0
5334	1000000005334	Judul Buku 5334	0
5335	1000000005335	Judul Buku 5335	0
5336	1000000005336	Judul Buku 5336	0
5337	1000000005337	Judul Buku 5337	0
5338	1000000005338	Judul Buku 5338	0
5339	1000000005339	Judul Buku 5339	0
5340	1000000005340	Judul Buku 5340	0
5341	1000000005341	Judul Buku 5341	0
5342	1000000005342	Judul Buku 5342	0
5343	1000000005343	Judul Buku 5343	0
5344	1000000005344	Judul Buku 5344	0
5345	1000000005345	Judul Buku 5345	0
5346	1000000005346	Judul Buku 5346	0
5347	1000000005347	Judul Buku 5347	0
5348	1000000005348	Judul Buku 5348	0
5349	1000000005349	Judul Buku 5349	0
5350	1000000005350	Judul Buku 5350	0
5351	1000000005351	Judul Buku 5351	0
5352	1000000005352	Judul Buku 5352	0
5353	1000000005353	Judul Buku 5353	0
5354	1000000005354	Judul Buku 5354	0
5355	1000000005355	Judul Buku 5355	0
5356	1000000005356	Judul Buku 5356	0
5357	1000000005357	Judul Buku 5357	0
5358	1000000005358	Judul Buku 5358	0
5359	1000000005359	Judul Buku 5359	0
5360	1000000005360	Judul Buku 5360	0
5361	1000000005361	Judul Buku 5361	0
5362	1000000005362	Judul Buku 5362	0
5363	1000000005363	Judul Buku 5363	0
5364	1000000005364	Judul Buku 5364	0
5365	1000000005365	Judul Buku 5365	0
5366	1000000005366	Judul Buku 5366	0
5367	1000000005367	Judul Buku 5367	0
5368	1000000005368	Judul Buku 5368	0
5369	1000000005369	Judul Buku 5369	0
5370	1000000005370	Judul Buku 5370	0
5371	1000000005371	Judul Buku 5371	0
5372	1000000005372	Judul Buku 5372	0
5373	1000000005373	Judul Buku 5373	0
5374	1000000005374	Judul Buku 5374	0
5375	1000000005375	Judul Buku 5375	0
5376	1000000005376	Judul Buku 5376	0
5377	1000000005377	Judul Buku 5377	0
5378	1000000005378	Judul Buku 5378	0
5379	1000000005379	Judul Buku 5379	0
5380	1000000005380	Judul Buku 5380	0
5381	1000000005381	Judul Buku 5381	0
5382	1000000005382	Judul Buku 5382	0
5383	1000000005383	Judul Buku 5383	0
5384	1000000005384	Judul Buku 5384	0
5385	1000000005385	Judul Buku 5385	0
5386	1000000005386	Judul Buku 5386	0
5387	1000000005387	Judul Buku 5387	0
5388	1000000005388	Judul Buku 5388	0
5389	1000000005389	Judul Buku 5389	0
5390	1000000005390	Judul Buku 5390	0
5391	1000000005391	Judul Buku 5391	0
5392	1000000005392	Judul Buku 5392	0
5393	1000000005393	Judul Buku 5393	0
5394	1000000005394	Judul Buku 5394	0
5395	1000000005395	Judul Buku 5395	0
5396	1000000005396	Judul Buku 5396	0
5397	1000000005397	Judul Buku 5397	0
5398	1000000005398	Judul Buku 5398	0
5399	1000000005399	Judul Buku 5399	0
5400	1000000005400	Judul Buku 5400	0
5401	1000000005401	Judul Buku 5401	0
5402	1000000005402	Judul Buku 5402	0
5403	1000000005403	Judul Buku 5403	0
5404	1000000005404	Judul Buku 5404	0
5405	1000000005405	Judul Buku 5405	0
5406	1000000005406	Judul Buku 5406	0
5407	1000000005407	Judul Buku 5407	0
5408	1000000005408	Judul Buku 5408	0
5409	1000000005409	Judul Buku 5409	0
5410	1000000005410	Judul Buku 5410	0
5411	1000000005411	Judul Buku 5411	0
5412	1000000005412	Judul Buku 5412	0
5413	1000000005413	Judul Buku 5413	0
5414	1000000005414	Judul Buku 5414	0
5415	1000000005415	Judul Buku 5415	0
5416	1000000005416	Judul Buku 5416	0
5417	1000000005417	Judul Buku 5417	0
5418	1000000005418	Judul Buku 5418	0
5419	1000000005419	Judul Buku 5419	0
5420	1000000005420	Judul Buku 5420	0
5421	1000000005421	Judul Buku 5421	0
5422	1000000005422	Judul Buku 5422	0
5423	1000000005423	Judul Buku 5423	0
5424	1000000005424	Judul Buku 5424	0
5425	1000000005425	Judul Buku 5425	0
5426	1000000005426	Judul Buku 5426	0
5427	1000000005427	Judul Buku 5427	0
5428	1000000005428	Judul Buku 5428	0
5429	1000000005429	Judul Buku 5429	0
5430	1000000005430	Judul Buku 5430	0
5431	1000000005431	Judul Buku 5431	0
5432	1000000005432	Judul Buku 5432	0
5433	1000000005433	Judul Buku 5433	0
5434	1000000005434	Judul Buku 5434	0
5435	1000000005435	Judul Buku 5435	0
5436	1000000005436	Judul Buku 5436	0
5437	1000000005437	Judul Buku 5437	0
5438	1000000005438	Judul Buku 5438	0
5439	1000000005439	Judul Buku 5439	0
5440	1000000005440	Judul Buku 5440	0
5441	1000000005441	Judul Buku 5441	0
5442	1000000005442	Judul Buku 5442	0
5443	1000000005443	Judul Buku 5443	0
5444	1000000005444	Judul Buku 5444	0
5445	1000000005445	Judul Buku 5445	0
5446	1000000005446	Judul Buku 5446	0
5447	1000000005447	Judul Buku 5447	0
5448	1000000005448	Judul Buku 5448	0
5449	1000000005449	Judul Buku 5449	0
5450	1000000005450	Judul Buku 5450	0
5451	1000000005451	Judul Buku 5451	0
5452	1000000005452	Judul Buku 5452	0
5453	1000000005453	Judul Buku 5453	0
5454	1000000005454	Judul Buku 5454	0
5455	1000000005455	Judul Buku 5455	0
5456	1000000005456	Judul Buku 5456	0
5457	1000000005457	Judul Buku 5457	0
5458	1000000005458	Judul Buku 5458	0
5459	1000000005459	Judul Buku 5459	0
5460	1000000005460	Judul Buku 5460	0
5461	1000000005461	Judul Buku 5461	0
5462	1000000005462	Judul Buku 5462	0
5463	1000000005463	Judul Buku 5463	0
5464	1000000005464	Judul Buku 5464	0
5465	1000000005465	Judul Buku 5465	0
5466	1000000005466	Judul Buku 5466	0
5467	1000000005467	Judul Buku 5467	0
5468	1000000005468	Judul Buku 5468	0
5469	1000000005469	Judul Buku 5469	0
5470	1000000005470	Judul Buku 5470	0
5471	1000000005471	Judul Buku 5471	0
5472	1000000005472	Judul Buku 5472	0
5473	1000000005473	Judul Buku 5473	0
5474	1000000005474	Judul Buku 5474	0
5475	1000000005475	Judul Buku 5475	0
5476	1000000005476	Judul Buku 5476	0
5477	1000000005477	Judul Buku 5477	0
5478	1000000005478	Judul Buku 5478	0
5479	1000000005479	Judul Buku 5479	0
5480	1000000005480	Judul Buku 5480	0
5481	1000000005481	Judul Buku 5481	0
5482	1000000005482	Judul Buku 5482	0
5483	1000000005483	Judul Buku 5483	0
5484	1000000005484	Judul Buku 5484	0
5485	1000000005485	Judul Buku 5485	0
5486	1000000005486	Judul Buku 5486	0
5487	1000000005487	Judul Buku 5487	0
5488	1000000005488	Judul Buku 5488	0
5489	1000000005489	Judul Buku 5489	0
5490	1000000005490	Judul Buku 5490	0
5491	1000000005491	Judul Buku 5491	0
5492	1000000005492	Judul Buku 5492	0
5493	1000000005493	Judul Buku 5493	0
5494	1000000005494	Judul Buku 5494	0
5495	1000000005495	Judul Buku 5495	0
5496	1000000005496	Judul Buku 5496	0
5497	1000000005497	Judul Buku 5497	0
5498	1000000005498	Judul Buku 5498	0
5499	1000000005499	Judul Buku 5499	0
5500	1000000005500	Judul Buku 5500	0
5501	1000000005501	Judul Buku 5501	0
5502	1000000005502	Judul Buku 5502	0
5503	1000000005503	Judul Buku 5503	0
5504	1000000005504	Judul Buku 5504	0
5505	1000000005505	Judul Buku 5505	0
5506	1000000005506	Judul Buku 5506	0
5507	1000000005507	Judul Buku 5507	0
5508	1000000005508	Judul Buku 5508	0
5509	1000000005509	Judul Buku 5509	0
5510	1000000005510	Judul Buku 5510	0
5511	1000000005511	Judul Buku 5511	0
5512	1000000005512	Judul Buku 5512	0
5513	1000000005513	Judul Buku 5513	0
5514	1000000005514	Judul Buku 5514	0
5515	1000000005515	Judul Buku 5515	0
5516	1000000005516	Judul Buku 5516	0
5517	1000000005517	Judul Buku 5517	0
5518	1000000005518	Judul Buku 5518	0
5519	1000000005519	Judul Buku 5519	0
5520	1000000005520	Judul Buku 5520	0
5521	1000000005521	Judul Buku 5521	0
5522	1000000005522	Judul Buku 5522	0
5523	1000000005523	Judul Buku 5523	0
5524	1000000005524	Judul Buku 5524	0
5525	1000000005525	Judul Buku 5525	0
5526	1000000005526	Judul Buku 5526	0
5527	1000000005527	Judul Buku 5527	0
5528	1000000005528	Judul Buku 5528	0
5529	1000000005529	Judul Buku 5529	0
5530	1000000005530	Judul Buku 5530	0
5531	1000000005531	Judul Buku 5531	0
5532	1000000005532	Judul Buku 5532	0
5533	1000000005533	Judul Buku 5533	0
5534	1000000005534	Judul Buku 5534	0
5535	1000000005535	Judul Buku 5535	0
5536	1000000005536	Judul Buku 5536	0
5537	1000000005537	Judul Buku 5537	0
5538	1000000005538	Judul Buku 5538	0
5539	1000000005539	Judul Buku 5539	0
5540	1000000005540	Judul Buku 5540	0
5541	1000000005541	Judul Buku 5541	0
5542	1000000005542	Judul Buku 5542	0
5543	1000000005543	Judul Buku 5543	0
5544	1000000005544	Judul Buku 5544	0
5545	1000000005545	Judul Buku 5545	0
5546	1000000005546	Judul Buku 5546	0
5547	1000000005547	Judul Buku 5547	0
5548	1000000005548	Judul Buku 5548	0
5549	1000000005549	Judul Buku 5549	0
5550	1000000005550	Judul Buku 5550	0
5551	1000000005551	Judul Buku 5551	0
5552	1000000005552	Judul Buku 5552	0
5553	1000000005553	Judul Buku 5553	0
5554	1000000005554	Judul Buku 5554	0
5555	1000000005555	Judul Buku 5555	0
5556	1000000005556	Judul Buku 5556	0
5557	1000000005557	Judul Buku 5557	0
5558	1000000005558	Judul Buku 5558	0
5559	1000000005559	Judul Buku 5559	0
5560	1000000005560	Judul Buku 5560	0
5561	1000000005561	Judul Buku 5561	0
5562	1000000005562	Judul Buku 5562	0
5563	1000000005563	Judul Buku 5563	0
5564	1000000005564	Judul Buku 5564	0
5565	1000000005565	Judul Buku 5565	0
5566	1000000005566	Judul Buku 5566	0
5567	1000000005567	Judul Buku 5567	0
5568	1000000005568	Judul Buku 5568	0
5569	1000000005569	Judul Buku 5569	0
5570	1000000005570	Judul Buku 5570	0
5571	1000000005571	Judul Buku 5571	0
5572	1000000005572	Judul Buku 5572	0
5573	1000000005573	Judul Buku 5573	0
5574	1000000005574	Judul Buku 5574	0
5575	1000000005575	Judul Buku 5575	0
5576	1000000005576	Judul Buku 5576	0
5577	1000000005577	Judul Buku 5577	0
5578	1000000005578	Judul Buku 5578	0
5579	1000000005579	Judul Buku 5579	0
5580	1000000005580	Judul Buku 5580	0
5581	1000000005581	Judul Buku 5581	0
5582	1000000005582	Judul Buku 5582	0
5583	1000000005583	Judul Buku 5583	0
5584	1000000005584	Judul Buku 5584	0
5585	1000000005585	Judul Buku 5585	0
5586	1000000005586	Judul Buku 5586	0
5587	1000000005587	Judul Buku 5587	0
5588	1000000005588	Judul Buku 5588	0
5589	1000000005589	Judul Buku 5589	0
5590	1000000005590	Judul Buku 5590	0
5591	1000000005591	Judul Buku 5591	0
5592	1000000005592	Judul Buku 5592	0
5593	1000000005593	Judul Buku 5593	0
5594	1000000005594	Judul Buku 5594	0
5595	1000000005595	Judul Buku 5595	0
5596	1000000005596	Judul Buku 5596	0
5597	1000000005597	Judul Buku 5597	0
5598	1000000005598	Judul Buku 5598	0
5599	1000000005599	Judul Buku 5599	0
5600	1000000005600	Judul Buku 5600	0
5601	1000000005601	Judul Buku 5601	0
5602	1000000005602	Judul Buku 5602	0
5603	1000000005603	Judul Buku 5603	0
5604	1000000005604	Judul Buku 5604	0
5605	1000000005605	Judul Buku 5605	0
5606	1000000005606	Judul Buku 5606	0
5607	1000000005607	Judul Buku 5607	0
5608	1000000005608	Judul Buku 5608	0
5609	1000000005609	Judul Buku 5609	0
5610	1000000005610	Judul Buku 5610	0
5611	1000000005611	Judul Buku 5611	0
5612	1000000005612	Judul Buku 5612	0
5613	1000000005613	Judul Buku 5613	0
5614	1000000005614	Judul Buku 5614	0
5615	1000000005615	Judul Buku 5615	0
5616	1000000005616	Judul Buku 5616	0
5617	1000000005617	Judul Buku 5617	0
5618	1000000005618	Judul Buku 5618	0
5619	1000000005619	Judul Buku 5619	0
5620	1000000005620	Judul Buku 5620	0
5621	1000000005621	Judul Buku 5621	0
5622	1000000005622	Judul Buku 5622	0
5623	1000000005623	Judul Buku 5623	0
5624	1000000005624	Judul Buku 5624	0
5625	1000000005625	Judul Buku 5625	0
5626	1000000005626	Judul Buku 5626	0
5627	1000000005627	Judul Buku 5627	0
5628	1000000005628	Judul Buku 5628	0
5629	1000000005629	Judul Buku 5629	0
5630	1000000005630	Judul Buku 5630	0
5631	1000000005631	Judul Buku 5631	0
5632	1000000005632	Judul Buku 5632	0
5633	1000000005633	Judul Buku 5633	0
5634	1000000005634	Judul Buku 5634	0
5635	1000000005635	Judul Buku 5635	0
5636	1000000005636	Judul Buku 5636	0
5637	1000000005637	Judul Buku 5637	0
5638	1000000005638	Judul Buku 5638	0
5639	1000000005639	Judul Buku 5639	0
5640	1000000005640	Judul Buku 5640	0
5641	1000000005641	Judul Buku 5641	0
5642	1000000005642	Judul Buku 5642	0
5643	1000000005643	Judul Buku 5643	0
5644	1000000005644	Judul Buku 5644	0
5645	1000000005645	Judul Buku 5645	0
5646	1000000005646	Judul Buku 5646	0
5647	1000000005647	Judul Buku 5647	0
5648	1000000005648	Judul Buku 5648	0
5649	1000000005649	Judul Buku 5649	0
5650	1000000005650	Judul Buku 5650	0
5651	1000000005651	Judul Buku 5651	0
5652	1000000005652	Judul Buku 5652	0
5653	1000000005653	Judul Buku 5653	0
5654	1000000005654	Judul Buku 5654	0
5655	1000000005655	Judul Buku 5655	0
5656	1000000005656	Judul Buku 5656	0
5657	1000000005657	Judul Buku 5657	0
5658	1000000005658	Judul Buku 5658	0
5659	1000000005659	Judul Buku 5659	0
5660	1000000005660	Judul Buku 5660	0
5661	1000000005661	Judul Buku 5661	0
5662	1000000005662	Judul Buku 5662	0
5663	1000000005663	Judul Buku 5663	0
5664	1000000005664	Judul Buku 5664	0
5665	1000000005665	Judul Buku 5665	0
5666	1000000005666	Judul Buku 5666	0
5667	1000000005667	Judul Buku 5667	0
5668	1000000005668	Judul Buku 5668	0
5669	1000000005669	Judul Buku 5669	0
5670	1000000005670	Judul Buku 5670	0
5671	1000000005671	Judul Buku 5671	0
5672	1000000005672	Judul Buku 5672	0
5673	1000000005673	Judul Buku 5673	0
5674	1000000005674	Judul Buku 5674	0
5675	1000000005675	Judul Buku 5675	0
5676	1000000005676	Judul Buku 5676	0
5677	1000000005677	Judul Buku 5677	0
5678	1000000005678	Judul Buku 5678	0
5679	1000000005679	Judul Buku 5679	0
5680	1000000005680	Judul Buku 5680	0
5681	1000000005681	Judul Buku 5681	0
5682	1000000005682	Judul Buku 5682	0
5683	1000000005683	Judul Buku 5683	0
5684	1000000005684	Judul Buku 5684	0
5685	1000000005685	Judul Buku 5685	0
5686	1000000005686	Judul Buku 5686	0
5687	1000000005687	Judul Buku 5687	0
5688	1000000005688	Judul Buku 5688	0
5689	1000000005689	Judul Buku 5689	0
5690	1000000005690	Judul Buku 5690	0
5691	1000000005691	Judul Buku 5691	0
5692	1000000005692	Judul Buku 5692	0
5693	1000000005693	Judul Buku 5693	0
5694	1000000005694	Judul Buku 5694	0
5695	1000000005695	Judul Buku 5695	0
5696	1000000005696	Judul Buku 5696	0
5697	1000000005697	Judul Buku 5697	0
5698	1000000005698	Judul Buku 5698	0
5699	1000000005699	Judul Buku 5699	0
5700	1000000005700	Judul Buku 5700	0
5701	1000000005701	Judul Buku 5701	0
5702	1000000005702	Judul Buku 5702	0
5703	1000000005703	Judul Buku 5703	0
5704	1000000005704	Judul Buku 5704	0
5705	1000000005705	Judul Buku 5705	0
5706	1000000005706	Judul Buku 5706	0
5707	1000000005707	Judul Buku 5707	0
5708	1000000005708	Judul Buku 5708	0
5709	1000000005709	Judul Buku 5709	0
5710	1000000005710	Judul Buku 5710	0
5711	1000000005711	Judul Buku 5711	0
5712	1000000005712	Judul Buku 5712	0
5713	1000000005713	Judul Buku 5713	0
5714	1000000005714	Judul Buku 5714	0
5715	1000000005715	Judul Buku 5715	0
5716	1000000005716	Judul Buku 5716	0
5717	1000000005717	Judul Buku 5717	0
5718	1000000005718	Judul Buku 5718	0
5719	1000000005719	Judul Buku 5719	0
5720	1000000005720	Judul Buku 5720	0
5721	1000000005721	Judul Buku 5721	0
5722	1000000005722	Judul Buku 5722	0
5723	1000000005723	Judul Buku 5723	0
5724	1000000005724	Judul Buku 5724	0
5725	1000000005725	Judul Buku 5725	0
5726	1000000005726	Judul Buku 5726	0
5727	1000000005727	Judul Buku 5727	0
5728	1000000005728	Judul Buku 5728	0
5729	1000000005729	Judul Buku 5729	0
5730	1000000005730	Judul Buku 5730	0
5731	1000000005731	Judul Buku 5731	0
5732	1000000005732	Judul Buku 5732	0
5733	1000000005733	Judul Buku 5733	0
5734	1000000005734	Judul Buku 5734	0
5735	1000000005735	Judul Buku 5735	0
5736	1000000005736	Judul Buku 5736	0
5737	1000000005737	Judul Buku 5737	0
5738	1000000005738	Judul Buku 5738	0
5739	1000000005739	Judul Buku 5739	0
5740	1000000005740	Judul Buku 5740	0
5741	1000000005741	Judul Buku 5741	0
5742	1000000005742	Judul Buku 5742	0
5743	1000000005743	Judul Buku 5743	0
5744	1000000005744	Judul Buku 5744	0
5745	1000000005745	Judul Buku 5745	0
5746	1000000005746	Judul Buku 5746	0
5747	1000000005747	Judul Buku 5747	0
5748	1000000005748	Judul Buku 5748	0
5749	1000000005749	Judul Buku 5749	0
5750	1000000005750	Judul Buku 5750	0
5751	1000000005751	Judul Buku 5751	0
5752	1000000005752	Judul Buku 5752	0
5753	1000000005753	Judul Buku 5753	0
5754	1000000005754	Judul Buku 5754	0
5755	1000000005755	Judul Buku 5755	0
5756	1000000005756	Judul Buku 5756	0
5757	1000000005757	Judul Buku 5757	0
5758	1000000005758	Judul Buku 5758	0
5759	1000000005759	Judul Buku 5759	0
5760	1000000005760	Judul Buku 5760	0
5761	1000000005761	Judul Buku 5761	0
5762	1000000005762	Judul Buku 5762	0
5763	1000000005763	Judul Buku 5763	0
5764	1000000005764	Judul Buku 5764	0
5765	1000000005765	Judul Buku 5765	0
5766	1000000005766	Judul Buku 5766	0
5767	1000000005767	Judul Buku 5767	0
5768	1000000005768	Judul Buku 5768	0
5769	1000000005769	Judul Buku 5769	0
5770	1000000005770	Judul Buku 5770	0
5771	1000000005771	Judul Buku 5771	0
5772	1000000005772	Judul Buku 5772	0
5773	1000000005773	Judul Buku 5773	0
5774	1000000005774	Judul Buku 5774	0
5775	1000000005775	Judul Buku 5775	0
5776	1000000005776	Judul Buku 5776	0
5777	1000000005777	Judul Buku 5777	0
5778	1000000005778	Judul Buku 5778	0
5779	1000000005779	Judul Buku 5779	0
5780	1000000005780	Judul Buku 5780	0
5781	1000000005781	Judul Buku 5781	0
5782	1000000005782	Judul Buku 5782	0
5783	1000000005783	Judul Buku 5783	0
5784	1000000005784	Judul Buku 5784	0
5785	1000000005785	Judul Buku 5785	0
5786	1000000005786	Judul Buku 5786	0
5787	1000000005787	Judul Buku 5787	0
5788	1000000005788	Judul Buku 5788	0
5789	1000000005789	Judul Buku 5789	0
5790	1000000005790	Judul Buku 5790	0
5791	1000000005791	Judul Buku 5791	0
5792	1000000005792	Judul Buku 5792	0
5793	1000000005793	Judul Buku 5793	0
5794	1000000005794	Judul Buku 5794	0
5795	1000000005795	Judul Buku 5795	0
5796	1000000005796	Judul Buku 5796	0
5797	1000000005797	Judul Buku 5797	0
5798	1000000005798	Judul Buku 5798	0
5799	1000000005799	Judul Buku 5799	0
5800	1000000005800	Judul Buku 5800	0
5801	1000000005801	Judul Buku 5801	0
5802	1000000005802	Judul Buku 5802	0
5803	1000000005803	Judul Buku 5803	0
5804	1000000005804	Judul Buku 5804	0
5805	1000000005805	Judul Buku 5805	0
5806	1000000005806	Judul Buku 5806	0
5807	1000000005807	Judul Buku 5807	0
5808	1000000005808	Judul Buku 5808	0
5809	1000000005809	Judul Buku 5809	0
5810	1000000005810	Judul Buku 5810	0
5811	1000000005811	Judul Buku 5811	0
5812	1000000005812	Judul Buku 5812	0
5813	1000000005813	Judul Buku 5813	0
5814	1000000005814	Judul Buku 5814	0
5815	1000000005815	Judul Buku 5815	0
5816	1000000005816	Judul Buku 5816	0
5817	1000000005817	Judul Buku 5817	0
5818	1000000005818	Judul Buku 5818	0
5819	1000000005819	Judul Buku 5819	0
5820	1000000005820	Judul Buku 5820	0
5821	1000000005821	Judul Buku 5821	0
5822	1000000005822	Judul Buku 5822	0
5823	1000000005823	Judul Buku 5823	0
5824	1000000005824	Judul Buku 5824	0
5825	1000000005825	Judul Buku 5825	0
5826	1000000005826	Judul Buku 5826	0
5827	1000000005827	Judul Buku 5827	0
5828	1000000005828	Judul Buku 5828	0
5829	1000000005829	Judul Buku 5829	0
5830	1000000005830	Judul Buku 5830	0
5831	1000000005831	Judul Buku 5831	0
5832	1000000005832	Judul Buku 5832	0
5833	1000000005833	Judul Buku 5833	0
5834	1000000005834	Judul Buku 5834	0
5835	1000000005835	Judul Buku 5835	0
5836	1000000005836	Judul Buku 5836	0
5837	1000000005837	Judul Buku 5837	0
5838	1000000005838	Judul Buku 5838	0
5839	1000000005839	Judul Buku 5839	0
5840	1000000005840	Judul Buku 5840	0
5841	1000000005841	Judul Buku 5841	0
5842	1000000005842	Judul Buku 5842	0
5843	1000000005843	Judul Buku 5843	0
5844	1000000005844	Judul Buku 5844	0
5845	1000000005845	Judul Buku 5845	0
5846	1000000005846	Judul Buku 5846	0
5847	1000000005847	Judul Buku 5847	0
5848	1000000005848	Judul Buku 5848	0
5849	1000000005849	Judul Buku 5849	0
5850	1000000005850	Judul Buku 5850	0
5851	1000000005851	Judul Buku 5851	0
5852	1000000005852	Judul Buku 5852	0
5853	1000000005853	Judul Buku 5853	0
5854	1000000005854	Judul Buku 5854	0
5855	1000000005855	Judul Buku 5855	0
5856	1000000005856	Judul Buku 5856	0
5857	1000000005857	Judul Buku 5857	0
5858	1000000005858	Judul Buku 5858	0
5859	1000000005859	Judul Buku 5859	0
5860	1000000005860	Judul Buku 5860	0
5861	1000000005861	Judul Buku 5861	0
5862	1000000005862	Judul Buku 5862	0
5863	1000000005863	Judul Buku 5863	0
5864	1000000005864	Judul Buku 5864	0
5865	1000000005865	Judul Buku 5865	0
5866	1000000005866	Judul Buku 5866	0
5867	1000000005867	Judul Buku 5867	0
5868	1000000005868	Judul Buku 5868	0
5869	1000000005869	Judul Buku 5869	0
5870	1000000005870	Judul Buku 5870	0
5871	1000000005871	Judul Buku 5871	0
5872	1000000005872	Judul Buku 5872	0
5873	1000000005873	Judul Buku 5873	0
5874	1000000005874	Judul Buku 5874	0
5875	1000000005875	Judul Buku 5875	0
5876	1000000005876	Judul Buku 5876	0
5877	1000000005877	Judul Buku 5877	0
5878	1000000005878	Judul Buku 5878	0
5879	1000000005879	Judul Buku 5879	0
5880	1000000005880	Judul Buku 5880	0
5881	1000000005881	Judul Buku 5881	0
5882	1000000005882	Judul Buku 5882	0
5883	1000000005883	Judul Buku 5883	0
5884	1000000005884	Judul Buku 5884	0
5885	1000000005885	Judul Buku 5885	0
5886	1000000005886	Judul Buku 5886	0
5887	1000000005887	Judul Buku 5887	0
5888	1000000005888	Judul Buku 5888	0
5889	1000000005889	Judul Buku 5889	0
5890	1000000005890	Judul Buku 5890	0
5891	1000000005891	Judul Buku 5891	0
5892	1000000005892	Judul Buku 5892	0
5893	1000000005893	Judul Buku 5893	0
5894	1000000005894	Judul Buku 5894	0
5895	1000000005895	Judul Buku 5895	0
5896	1000000005896	Judul Buku 5896	0
5897	1000000005897	Judul Buku 5897	0
5898	1000000005898	Judul Buku 5898	0
5899	1000000005899	Judul Buku 5899	0
5900	1000000005900	Judul Buku 5900	0
5901	1000000005901	Judul Buku 5901	0
5902	1000000005902	Judul Buku 5902	0
5903	1000000005903	Judul Buku 5903	0
5904	1000000005904	Judul Buku 5904	0
5905	1000000005905	Judul Buku 5905	0
5906	1000000005906	Judul Buku 5906	0
5907	1000000005907	Judul Buku 5907	0
5908	1000000005908	Judul Buku 5908	0
5909	1000000005909	Judul Buku 5909	0
5910	1000000005910	Judul Buku 5910	0
5911	1000000005911	Judul Buku 5911	0
5912	1000000005912	Judul Buku 5912	0
5913	1000000005913	Judul Buku 5913	0
5914	1000000005914	Judul Buku 5914	0
5915	1000000005915	Judul Buku 5915	0
5916	1000000005916	Judul Buku 5916	0
5917	1000000005917	Judul Buku 5917	0
5918	1000000005918	Judul Buku 5918	0
5919	1000000005919	Judul Buku 5919	0
5920	1000000005920	Judul Buku 5920	0
5921	1000000005921	Judul Buku 5921	0
5922	1000000005922	Judul Buku 5922	0
5923	1000000005923	Judul Buku 5923	0
5924	1000000005924	Judul Buku 5924	0
5925	1000000005925	Judul Buku 5925	0
5926	1000000005926	Judul Buku 5926	0
5927	1000000005927	Judul Buku 5927	0
5928	1000000005928	Judul Buku 5928	0
5929	1000000005929	Judul Buku 5929	0
5930	1000000005930	Judul Buku 5930	0
5931	1000000005931	Judul Buku 5931	0
5932	1000000005932	Judul Buku 5932	0
5933	1000000005933	Judul Buku 5933	0
5934	1000000005934	Judul Buku 5934	0
5935	1000000005935	Judul Buku 5935	0
5936	1000000005936	Judul Buku 5936	0
5937	1000000005937	Judul Buku 5937	0
5938	1000000005938	Judul Buku 5938	0
5939	1000000005939	Judul Buku 5939	0
5940	1000000005940	Judul Buku 5940	0
5941	1000000005941	Judul Buku 5941	0
5942	1000000005942	Judul Buku 5942	0
5943	1000000005943	Judul Buku 5943	0
5944	1000000005944	Judul Buku 5944	0
5945	1000000005945	Judul Buku 5945	0
5946	1000000005946	Judul Buku 5946	0
5947	1000000005947	Judul Buku 5947	0
5948	1000000005948	Judul Buku 5948	0
5949	1000000005949	Judul Buku 5949	0
5950	1000000005950	Judul Buku 5950	0
5951	1000000005951	Judul Buku 5951	0
5952	1000000005952	Judul Buku 5952	0
5953	1000000005953	Judul Buku 5953	0
5954	1000000005954	Judul Buku 5954	0
5955	1000000005955	Judul Buku 5955	0
5956	1000000005956	Judul Buku 5956	0
5957	1000000005957	Judul Buku 5957	0
5958	1000000005958	Judul Buku 5958	0
5959	1000000005959	Judul Buku 5959	0
5960	1000000005960	Judul Buku 5960	0
5961	1000000005961	Judul Buku 5961	0
5962	1000000005962	Judul Buku 5962	0
5963	1000000005963	Judul Buku 5963	0
5964	1000000005964	Judul Buku 5964	0
5965	1000000005965	Judul Buku 5965	0
5966	1000000005966	Judul Buku 5966	0
5967	1000000005967	Judul Buku 5967	0
5968	1000000005968	Judul Buku 5968	0
5969	1000000005969	Judul Buku 5969	0
5970	1000000005970	Judul Buku 5970	0
5971	1000000005971	Judul Buku 5971	0
5972	1000000005972	Judul Buku 5972	0
5973	1000000005973	Judul Buku 5973	0
5974	1000000005974	Judul Buku 5974	0
5975	1000000005975	Judul Buku 5975	0
5976	1000000005976	Judul Buku 5976	0
5977	1000000005977	Judul Buku 5977	0
5978	1000000005978	Judul Buku 5978	0
5979	1000000005979	Judul Buku 5979	0
5980	1000000005980	Judul Buku 5980	0
5981	1000000005981	Judul Buku 5981	0
5982	1000000005982	Judul Buku 5982	0
5983	1000000005983	Judul Buku 5983	0
5984	1000000005984	Judul Buku 5984	0
5985	1000000005985	Judul Buku 5985	0
5986	1000000005986	Judul Buku 5986	0
5987	1000000005987	Judul Buku 5987	0
5988	1000000005988	Judul Buku 5988	0
5989	1000000005989	Judul Buku 5989	0
5990	1000000005990	Judul Buku 5990	0
5991	1000000005991	Judul Buku 5991	0
5992	1000000005992	Judul Buku 5992	0
5993	1000000005993	Judul Buku 5993	0
5994	1000000005994	Judul Buku 5994	0
5995	1000000005995	Judul Buku 5995	0
5996	1000000005996	Judul Buku 5996	0
5997	1000000005997	Judul Buku 5997	0
5998	1000000005998	Judul Buku 5998	0
5999	1000000005999	Judul Buku 5999	0
6000	1000000006000	Judul Buku 6000	0
6001	1000000006001	Judul Buku 6001	0
6002	1000000006002	Judul Buku 6002	0
6003	1000000006003	Judul Buku 6003	0
6004	1000000006004	Judul Buku 6004	0
6005	1000000006005	Judul Buku 6005	0
6006	1000000006006	Judul Buku 6006	0
6007	1000000006007	Judul Buku 6007	0
6008	1000000006008	Judul Buku 6008	0
6009	1000000006009	Judul Buku 6009	0
6010	1000000006010	Judul Buku 6010	0
6011	1000000006011	Judul Buku 6011	0
6012	1000000006012	Judul Buku 6012	0
6013	1000000006013	Judul Buku 6013	0
6014	1000000006014	Judul Buku 6014	0
6015	1000000006015	Judul Buku 6015	0
6016	1000000006016	Judul Buku 6016	0
6017	1000000006017	Judul Buku 6017	0
6018	1000000006018	Judul Buku 6018	0
6019	1000000006019	Judul Buku 6019	0
6020	1000000006020	Judul Buku 6020	0
6021	1000000006021	Judul Buku 6021	0
6022	1000000006022	Judul Buku 6022	0
6023	1000000006023	Judul Buku 6023	0
6024	1000000006024	Judul Buku 6024	0
6025	1000000006025	Judul Buku 6025	0
6026	1000000006026	Judul Buku 6026	0
6027	1000000006027	Judul Buku 6027	0
6028	1000000006028	Judul Buku 6028	0
6029	1000000006029	Judul Buku 6029	0
6030	1000000006030	Judul Buku 6030	0
6031	1000000006031	Judul Buku 6031	0
6032	1000000006032	Judul Buku 6032	0
6033	1000000006033	Judul Buku 6033	0
6034	1000000006034	Judul Buku 6034	0
6035	1000000006035	Judul Buku 6035	0
6036	1000000006036	Judul Buku 6036	0
6037	1000000006037	Judul Buku 6037	0
6038	1000000006038	Judul Buku 6038	0
6039	1000000006039	Judul Buku 6039	0
6040	1000000006040	Judul Buku 6040	0
6041	1000000006041	Judul Buku 6041	0
6042	1000000006042	Judul Buku 6042	0
6043	1000000006043	Judul Buku 6043	0
6044	1000000006044	Judul Buku 6044	0
6045	1000000006045	Judul Buku 6045	0
6046	1000000006046	Judul Buku 6046	0
6047	1000000006047	Judul Buku 6047	0
6048	1000000006048	Judul Buku 6048	0
6049	1000000006049	Judul Buku 6049	0
6050	1000000006050	Judul Buku 6050	0
6051	1000000006051	Judul Buku 6051	0
6052	1000000006052	Judul Buku 6052	0
6053	1000000006053	Judul Buku 6053	0
6054	1000000006054	Judul Buku 6054	0
6055	1000000006055	Judul Buku 6055	0
6056	1000000006056	Judul Buku 6056	0
6057	1000000006057	Judul Buku 6057	0
6058	1000000006058	Judul Buku 6058	0
6059	1000000006059	Judul Buku 6059	0
6060	1000000006060	Judul Buku 6060	0
6061	1000000006061	Judul Buku 6061	0
6062	1000000006062	Judul Buku 6062	0
6063	1000000006063	Judul Buku 6063	0
6064	1000000006064	Judul Buku 6064	0
6065	1000000006065	Judul Buku 6065	0
6066	1000000006066	Judul Buku 6066	0
6067	1000000006067	Judul Buku 6067	0
6068	1000000006068	Judul Buku 6068	0
6069	1000000006069	Judul Buku 6069	0
6070	1000000006070	Judul Buku 6070	0
6071	1000000006071	Judul Buku 6071	0
6072	1000000006072	Judul Buku 6072	0
6073	1000000006073	Judul Buku 6073	0
6074	1000000006074	Judul Buku 6074	0
6075	1000000006075	Judul Buku 6075	0
6076	1000000006076	Judul Buku 6076	0
6077	1000000006077	Judul Buku 6077	0
6078	1000000006078	Judul Buku 6078	0
6079	1000000006079	Judul Buku 6079	0
6080	1000000006080	Judul Buku 6080	0
6081	1000000006081	Judul Buku 6081	0
6082	1000000006082	Judul Buku 6082	0
6083	1000000006083	Judul Buku 6083	0
6084	1000000006084	Judul Buku 6084	0
6085	1000000006085	Judul Buku 6085	0
6086	1000000006086	Judul Buku 6086	0
6087	1000000006087	Judul Buku 6087	0
6088	1000000006088	Judul Buku 6088	0
6089	1000000006089	Judul Buku 6089	0
6090	1000000006090	Judul Buku 6090	0
6091	1000000006091	Judul Buku 6091	0
6092	1000000006092	Judul Buku 6092	0
6093	1000000006093	Judul Buku 6093	0
6094	1000000006094	Judul Buku 6094	0
6095	1000000006095	Judul Buku 6095	0
6096	1000000006096	Judul Buku 6096	0
6097	1000000006097	Judul Buku 6097	0
6098	1000000006098	Judul Buku 6098	0
6099	1000000006099	Judul Buku 6099	0
6100	1000000006100	Judul Buku 6100	0
6101	1000000006101	Judul Buku 6101	0
6102	1000000006102	Judul Buku 6102	0
6103	1000000006103	Judul Buku 6103	0
6104	1000000006104	Judul Buku 6104	0
6105	1000000006105	Judul Buku 6105	0
6106	1000000006106	Judul Buku 6106	0
6107	1000000006107	Judul Buku 6107	0
6108	1000000006108	Judul Buku 6108	0
6109	1000000006109	Judul Buku 6109	0
6110	1000000006110	Judul Buku 6110	0
6111	1000000006111	Judul Buku 6111	0
6112	1000000006112	Judul Buku 6112	0
6113	1000000006113	Judul Buku 6113	0
6114	1000000006114	Judul Buku 6114	0
6115	1000000006115	Judul Buku 6115	0
6116	1000000006116	Judul Buku 6116	0
6117	1000000006117	Judul Buku 6117	0
6118	1000000006118	Judul Buku 6118	0
6119	1000000006119	Judul Buku 6119	0
6120	1000000006120	Judul Buku 6120	0
6121	1000000006121	Judul Buku 6121	0
6122	1000000006122	Judul Buku 6122	0
6123	1000000006123	Judul Buku 6123	0
6124	1000000006124	Judul Buku 6124	0
6125	1000000006125	Judul Buku 6125	0
6126	1000000006126	Judul Buku 6126	0
6127	1000000006127	Judul Buku 6127	0
6128	1000000006128	Judul Buku 6128	0
6129	1000000006129	Judul Buku 6129	0
6130	1000000006130	Judul Buku 6130	0
6131	1000000006131	Judul Buku 6131	0
6132	1000000006132	Judul Buku 6132	0
6133	1000000006133	Judul Buku 6133	0
6134	1000000006134	Judul Buku 6134	0
6135	1000000006135	Judul Buku 6135	0
6136	1000000006136	Judul Buku 6136	0
6137	1000000006137	Judul Buku 6137	0
6138	1000000006138	Judul Buku 6138	0
6139	1000000006139	Judul Buku 6139	0
6140	1000000006140	Judul Buku 6140	0
6141	1000000006141	Judul Buku 6141	0
6142	1000000006142	Judul Buku 6142	0
6143	1000000006143	Judul Buku 6143	0
6144	1000000006144	Judul Buku 6144	0
6145	1000000006145	Judul Buku 6145	0
6146	1000000006146	Judul Buku 6146	0
6147	1000000006147	Judul Buku 6147	0
6148	1000000006148	Judul Buku 6148	0
6149	1000000006149	Judul Buku 6149	0
6150	1000000006150	Judul Buku 6150	0
6151	1000000006151	Judul Buku 6151	0
6152	1000000006152	Judul Buku 6152	0
6153	1000000006153	Judul Buku 6153	0
6154	1000000006154	Judul Buku 6154	0
6155	1000000006155	Judul Buku 6155	0
6156	1000000006156	Judul Buku 6156	0
6157	1000000006157	Judul Buku 6157	0
6158	1000000006158	Judul Buku 6158	0
6159	1000000006159	Judul Buku 6159	0
6160	1000000006160	Judul Buku 6160	0
6161	1000000006161	Judul Buku 6161	0
6162	1000000006162	Judul Buku 6162	0
6163	1000000006163	Judul Buku 6163	0
6164	1000000006164	Judul Buku 6164	0
6165	1000000006165	Judul Buku 6165	0
6166	1000000006166	Judul Buku 6166	0
6167	1000000006167	Judul Buku 6167	0
6168	1000000006168	Judul Buku 6168	0
6169	1000000006169	Judul Buku 6169	0
6170	1000000006170	Judul Buku 6170	0
6171	1000000006171	Judul Buku 6171	0
6172	1000000006172	Judul Buku 6172	0
6173	1000000006173	Judul Buku 6173	0
6174	1000000006174	Judul Buku 6174	0
6175	1000000006175	Judul Buku 6175	0
6176	1000000006176	Judul Buku 6176	0
6177	1000000006177	Judul Buku 6177	0
6178	1000000006178	Judul Buku 6178	0
6179	1000000006179	Judul Buku 6179	0
6180	1000000006180	Judul Buku 6180	0
6181	1000000006181	Judul Buku 6181	0
6182	1000000006182	Judul Buku 6182	0
6183	1000000006183	Judul Buku 6183	0
6184	1000000006184	Judul Buku 6184	0
6185	1000000006185	Judul Buku 6185	0
6186	1000000006186	Judul Buku 6186	0
6187	1000000006187	Judul Buku 6187	0
6188	1000000006188	Judul Buku 6188	0
6189	1000000006189	Judul Buku 6189	0
6190	1000000006190	Judul Buku 6190	0
6191	1000000006191	Judul Buku 6191	0
6192	1000000006192	Judul Buku 6192	0
6193	1000000006193	Judul Buku 6193	0
6194	1000000006194	Judul Buku 6194	0
6195	1000000006195	Judul Buku 6195	0
6196	1000000006196	Judul Buku 6196	0
6197	1000000006197	Judul Buku 6197	0
6198	1000000006198	Judul Buku 6198	0
6199	1000000006199	Judul Buku 6199	0
6200	1000000006200	Judul Buku 6200	0
6201	1000000006201	Judul Buku 6201	0
6202	1000000006202	Judul Buku 6202	0
6203	1000000006203	Judul Buku 6203	0
6204	1000000006204	Judul Buku 6204	0
6205	1000000006205	Judul Buku 6205	0
6206	1000000006206	Judul Buku 6206	0
6207	1000000006207	Judul Buku 6207	0
6208	1000000006208	Judul Buku 6208	0
6209	1000000006209	Judul Buku 6209	0
6210	1000000006210	Judul Buku 6210	0
6211	1000000006211	Judul Buku 6211	0
6212	1000000006212	Judul Buku 6212	0
6213	1000000006213	Judul Buku 6213	0
6214	1000000006214	Judul Buku 6214	0
6215	1000000006215	Judul Buku 6215	0
6216	1000000006216	Judul Buku 6216	0
6217	1000000006217	Judul Buku 6217	0
6218	1000000006218	Judul Buku 6218	0
6219	1000000006219	Judul Buku 6219	0
6220	1000000006220	Judul Buku 6220	0
6221	1000000006221	Judul Buku 6221	0
6222	1000000006222	Judul Buku 6222	0
6223	1000000006223	Judul Buku 6223	0
6224	1000000006224	Judul Buku 6224	0
6225	1000000006225	Judul Buku 6225	0
6226	1000000006226	Judul Buku 6226	0
6227	1000000006227	Judul Buku 6227	0
6228	1000000006228	Judul Buku 6228	0
6229	1000000006229	Judul Buku 6229	0
6230	1000000006230	Judul Buku 6230	0
6231	1000000006231	Judul Buku 6231	0
6232	1000000006232	Judul Buku 6232	0
6233	1000000006233	Judul Buku 6233	0
6234	1000000006234	Judul Buku 6234	0
6235	1000000006235	Judul Buku 6235	0
6236	1000000006236	Judul Buku 6236	0
6237	1000000006237	Judul Buku 6237	0
6238	1000000006238	Judul Buku 6238	0
6239	1000000006239	Judul Buku 6239	0
6240	1000000006240	Judul Buku 6240	0
6241	1000000006241	Judul Buku 6241	0
6242	1000000006242	Judul Buku 6242	0
6243	1000000006243	Judul Buku 6243	0
6244	1000000006244	Judul Buku 6244	0
6245	1000000006245	Judul Buku 6245	0
6246	1000000006246	Judul Buku 6246	0
6247	1000000006247	Judul Buku 6247	0
6248	1000000006248	Judul Buku 6248	0
6249	1000000006249	Judul Buku 6249	0
6250	1000000006250	Judul Buku 6250	0
6251	1000000006251	Judul Buku 6251	0
6252	1000000006252	Judul Buku 6252	0
6253	1000000006253	Judul Buku 6253	0
6254	1000000006254	Judul Buku 6254	0
6255	1000000006255	Judul Buku 6255	0
6256	1000000006256	Judul Buku 6256	0
6257	1000000006257	Judul Buku 6257	0
6258	1000000006258	Judul Buku 6258	0
6259	1000000006259	Judul Buku 6259	0
6260	1000000006260	Judul Buku 6260	0
6261	1000000006261	Judul Buku 6261	0
6262	1000000006262	Judul Buku 6262	0
6263	1000000006263	Judul Buku 6263	0
6264	1000000006264	Judul Buku 6264	0
6265	1000000006265	Judul Buku 6265	0
6266	1000000006266	Judul Buku 6266	0
6267	1000000006267	Judul Buku 6267	0
6268	1000000006268	Judul Buku 6268	0
6269	1000000006269	Judul Buku 6269	0
6270	1000000006270	Judul Buku 6270	0
6271	1000000006271	Judul Buku 6271	0
6272	1000000006272	Judul Buku 6272	0
6273	1000000006273	Judul Buku 6273	0
6274	1000000006274	Judul Buku 6274	0
6275	1000000006275	Judul Buku 6275	0
6276	1000000006276	Judul Buku 6276	0
6277	1000000006277	Judul Buku 6277	0
6278	1000000006278	Judul Buku 6278	0
6279	1000000006279	Judul Buku 6279	0
6280	1000000006280	Judul Buku 6280	0
6281	1000000006281	Judul Buku 6281	0
6282	1000000006282	Judul Buku 6282	0
6283	1000000006283	Judul Buku 6283	0
6284	1000000006284	Judul Buku 6284	0
6285	1000000006285	Judul Buku 6285	0
6286	1000000006286	Judul Buku 6286	0
6287	1000000006287	Judul Buku 6287	0
6288	1000000006288	Judul Buku 6288	0
6289	1000000006289	Judul Buku 6289	0
6290	1000000006290	Judul Buku 6290	0
6291	1000000006291	Judul Buku 6291	0
6292	1000000006292	Judul Buku 6292	0
6293	1000000006293	Judul Buku 6293	0
6294	1000000006294	Judul Buku 6294	0
6295	1000000006295	Judul Buku 6295	0
6296	1000000006296	Judul Buku 6296	0
6297	1000000006297	Judul Buku 6297	0
6298	1000000006298	Judul Buku 6298	0
6299	1000000006299	Judul Buku 6299	0
6300	1000000006300	Judul Buku 6300	0
6301	1000000006301	Judul Buku 6301	0
6302	1000000006302	Judul Buku 6302	0
6303	1000000006303	Judul Buku 6303	0
6304	1000000006304	Judul Buku 6304	0
6305	1000000006305	Judul Buku 6305	0
6306	1000000006306	Judul Buku 6306	0
6307	1000000006307	Judul Buku 6307	0
6308	1000000006308	Judul Buku 6308	0
6309	1000000006309	Judul Buku 6309	0
6310	1000000006310	Judul Buku 6310	0
6311	1000000006311	Judul Buku 6311	0
6312	1000000006312	Judul Buku 6312	0
6313	1000000006313	Judul Buku 6313	0
6314	1000000006314	Judul Buku 6314	0
6315	1000000006315	Judul Buku 6315	0
6316	1000000006316	Judul Buku 6316	0
6317	1000000006317	Judul Buku 6317	0
6318	1000000006318	Judul Buku 6318	0
6319	1000000006319	Judul Buku 6319	0
6320	1000000006320	Judul Buku 6320	0
6321	1000000006321	Judul Buku 6321	0
6322	1000000006322	Judul Buku 6322	0
6323	1000000006323	Judul Buku 6323	0
6324	1000000006324	Judul Buku 6324	0
6325	1000000006325	Judul Buku 6325	0
6326	1000000006326	Judul Buku 6326	0
6327	1000000006327	Judul Buku 6327	0
6328	1000000006328	Judul Buku 6328	0
6329	1000000006329	Judul Buku 6329	0
6330	1000000006330	Judul Buku 6330	0
6331	1000000006331	Judul Buku 6331	0
6332	1000000006332	Judul Buku 6332	0
6333	1000000006333	Judul Buku 6333	0
6334	1000000006334	Judul Buku 6334	0
6335	1000000006335	Judul Buku 6335	0
6336	1000000006336	Judul Buku 6336	0
6337	1000000006337	Judul Buku 6337	0
6338	1000000006338	Judul Buku 6338	0
6339	1000000006339	Judul Buku 6339	0
6340	1000000006340	Judul Buku 6340	0
6341	1000000006341	Judul Buku 6341	0
6342	1000000006342	Judul Buku 6342	0
6343	1000000006343	Judul Buku 6343	0
6344	1000000006344	Judul Buku 6344	0
6345	1000000006345	Judul Buku 6345	0
6346	1000000006346	Judul Buku 6346	0
6347	1000000006347	Judul Buku 6347	0
6348	1000000006348	Judul Buku 6348	0
6349	1000000006349	Judul Buku 6349	0
6350	1000000006350	Judul Buku 6350	0
6351	1000000006351	Judul Buku 6351	0
6352	1000000006352	Judul Buku 6352	0
6353	1000000006353	Judul Buku 6353	0
6354	1000000006354	Judul Buku 6354	0
6355	1000000006355	Judul Buku 6355	0
6356	1000000006356	Judul Buku 6356	0
6357	1000000006357	Judul Buku 6357	0
6358	1000000006358	Judul Buku 6358	0
6359	1000000006359	Judul Buku 6359	0
6360	1000000006360	Judul Buku 6360	0
6361	1000000006361	Judul Buku 6361	0
6362	1000000006362	Judul Buku 6362	0
6363	1000000006363	Judul Buku 6363	0
6364	1000000006364	Judul Buku 6364	0
6365	1000000006365	Judul Buku 6365	0
6366	1000000006366	Judul Buku 6366	0
6367	1000000006367	Judul Buku 6367	0
6368	1000000006368	Judul Buku 6368	0
6369	1000000006369	Judul Buku 6369	0
6370	1000000006370	Judul Buku 6370	0
6371	1000000006371	Judul Buku 6371	0
6372	1000000006372	Judul Buku 6372	0
6373	1000000006373	Judul Buku 6373	0
6374	1000000006374	Judul Buku 6374	0
6375	1000000006375	Judul Buku 6375	0
6376	1000000006376	Judul Buku 6376	0
6377	1000000006377	Judul Buku 6377	0
6378	1000000006378	Judul Buku 6378	0
6379	1000000006379	Judul Buku 6379	0
6380	1000000006380	Judul Buku 6380	0
6381	1000000006381	Judul Buku 6381	0
6382	1000000006382	Judul Buku 6382	0
6383	1000000006383	Judul Buku 6383	0
6384	1000000006384	Judul Buku 6384	0
6385	1000000006385	Judul Buku 6385	0
6386	1000000006386	Judul Buku 6386	0
6387	1000000006387	Judul Buku 6387	0
6388	1000000006388	Judul Buku 6388	0
6389	1000000006389	Judul Buku 6389	0
6390	1000000006390	Judul Buku 6390	0
6391	1000000006391	Judul Buku 6391	0
6392	1000000006392	Judul Buku 6392	0
6393	1000000006393	Judul Buku 6393	0
6394	1000000006394	Judul Buku 6394	0
6395	1000000006395	Judul Buku 6395	0
6396	1000000006396	Judul Buku 6396	0
6397	1000000006397	Judul Buku 6397	0
6398	1000000006398	Judul Buku 6398	0
6399	1000000006399	Judul Buku 6399	0
6400	1000000006400	Judul Buku 6400	0
6401	1000000006401	Judul Buku 6401	0
6402	1000000006402	Judul Buku 6402	0
6403	1000000006403	Judul Buku 6403	0
6404	1000000006404	Judul Buku 6404	0
6405	1000000006405	Judul Buku 6405	0
6406	1000000006406	Judul Buku 6406	0
6407	1000000006407	Judul Buku 6407	0
6408	1000000006408	Judul Buku 6408	0
6409	1000000006409	Judul Buku 6409	0
6410	1000000006410	Judul Buku 6410	0
6411	1000000006411	Judul Buku 6411	0
6412	1000000006412	Judul Buku 6412	0
6413	1000000006413	Judul Buku 6413	0
6414	1000000006414	Judul Buku 6414	0
6415	1000000006415	Judul Buku 6415	0
6416	1000000006416	Judul Buku 6416	0
6417	1000000006417	Judul Buku 6417	0
6418	1000000006418	Judul Buku 6418	0
6419	1000000006419	Judul Buku 6419	0
6420	1000000006420	Judul Buku 6420	0
6421	1000000006421	Judul Buku 6421	0
6422	1000000006422	Judul Buku 6422	0
6423	1000000006423	Judul Buku 6423	0
6424	1000000006424	Judul Buku 6424	0
6425	1000000006425	Judul Buku 6425	0
6426	1000000006426	Judul Buku 6426	0
6427	1000000006427	Judul Buku 6427	0
6428	1000000006428	Judul Buku 6428	0
6429	1000000006429	Judul Buku 6429	0
6430	1000000006430	Judul Buku 6430	0
6431	1000000006431	Judul Buku 6431	0
6432	1000000006432	Judul Buku 6432	0
6433	1000000006433	Judul Buku 6433	0
6434	1000000006434	Judul Buku 6434	0
6435	1000000006435	Judul Buku 6435	0
6436	1000000006436	Judul Buku 6436	0
6437	1000000006437	Judul Buku 6437	0
6438	1000000006438	Judul Buku 6438	0
6439	1000000006439	Judul Buku 6439	0
6440	1000000006440	Judul Buku 6440	0
6441	1000000006441	Judul Buku 6441	0
6442	1000000006442	Judul Buku 6442	0
6443	1000000006443	Judul Buku 6443	0
6444	1000000006444	Judul Buku 6444	0
6445	1000000006445	Judul Buku 6445	0
6446	1000000006446	Judul Buku 6446	0
6447	1000000006447	Judul Buku 6447	0
6448	1000000006448	Judul Buku 6448	0
6449	1000000006449	Judul Buku 6449	0
6450	1000000006450	Judul Buku 6450	0
6451	1000000006451	Judul Buku 6451	0
6452	1000000006452	Judul Buku 6452	0
6453	1000000006453	Judul Buku 6453	0
6454	1000000006454	Judul Buku 6454	0
6455	1000000006455	Judul Buku 6455	0
6456	1000000006456	Judul Buku 6456	0
6457	1000000006457	Judul Buku 6457	0
6458	1000000006458	Judul Buku 6458	0
6459	1000000006459	Judul Buku 6459	0
6460	1000000006460	Judul Buku 6460	0
6461	1000000006461	Judul Buku 6461	0
6462	1000000006462	Judul Buku 6462	0
6463	1000000006463	Judul Buku 6463	0
6464	1000000006464	Judul Buku 6464	0
6465	1000000006465	Judul Buku 6465	0
6466	1000000006466	Judul Buku 6466	0
6467	1000000006467	Judul Buku 6467	0
6468	1000000006468	Judul Buku 6468	0
6469	1000000006469	Judul Buku 6469	0
6470	1000000006470	Judul Buku 6470	0
6471	1000000006471	Judul Buku 6471	0
6472	1000000006472	Judul Buku 6472	0
6473	1000000006473	Judul Buku 6473	0
6474	1000000006474	Judul Buku 6474	0
6475	1000000006475	Judul Buku 6475	0
6476	1000000006476	Judul Buku 6476	0
6477	1000000006477	Judul Buku 6477	0
6478	1000000006478	Judul Buku 6478	0
6479	1000000006479	Judul Buku 6479	0
6480	1000000006480	Judul Buku 6480	0
6481	1000000006481	Judul Buku 6481	0
6482	1000000006482	Judul Buku 6482	0
6483	1000000006483	Judul Buku 6483	0
6484	1000000006484	Judul Buku 6484	0
6485	1000000006485	Judul Buku 6485	0
6486	1000000006486	Judul Buku 6486	0
6487	1000000006487	Judul Buku 6487	0
6488	1000000006488	Judul Buku 6488	0
6489	1000000006489	Judul Buku 6489	0
6490	1000000006490	Judul Buku 6490	0
6491	1000000006491	Judul Buku 6491	0
6492	1000000006492	Judul Buku 6492	0
6493	1000000006493	Judul Buku 6493	0
6494	1000000006494	Judul Buku 6494	0
6495	1000000006495	Judul Buku 6495	0
6496	1000000006496	Judul Buku 6496	0
6497	1000000006497	Judul Buku 6497	0
6498	1000000006498	Judul Buku 6498	0
6499	1000000006499	Judul Buku 6499	0
6500	1000000006500	Judul Buku 6500	0
6501	1000000006501	Judul Buku 6501	0
6502	1000000006502	Judul Buku 6502	0
6503	1000000006503	Judul Buku 6503	0
6504	1000000006504	Judul Buku 6504	0
6505	1000000006505	Judul Buku 6505	0
6506	1000000006506	Judul Buku 6506	0
6507	1000000006507	Judul Buku 6507	0
6508	1000000006508	Judul Buku 6508	0
6509	1000000006509	Judul Buku 6509	0
6510	1000000006510	Judul Buku 6510	0
6511	1000000006511	Judul Buku 6511	0
6512	1000000006512	Judul Buku 6512	0
6513	1000000006513	Judul Buku 6513	0
6514	1000000006514	Judul Buku 6514	0
6515	1000000006515	Judul Buku 6515	0
6516	1000000006516	Judul Buku 6516	0
6517	1000000006517	Judul Buku 6517	0
6518	1000000006518	Judul Buku 6518	0
6519	1000000006519	Judul Buku 6519	0
6520	1000000006520	Judul Buku 6520	0
6521	1000000006521	Judul Buku 6521	0
6522	1000000006522	Judul Buku 6522	0
6523	1000000006523	Judul Buku 6523	0
6524	1000000006524	Judul Buku 6524	0
6525	1000000006525	Judul Buku 6525	0
6526	1000000006526	Judul Buku 6526	0
6527	1000000006527	Judul Buku 6527	0
6528	1000000006528	Judul Buku 6528	0
6529	1000000006529	Judul Buku 6529	0
6530	1000000006530	Judul Buku 6530	0
6531	1000000006531	Judul Buku 6531	0
6532	1000000006532	Judul Buku 6532	0
6533	1000000006533	Judul Buku 6533	0
6534	1000000006534	Judul Buku 6534	0
6535	1000000006535	Judul Buku 6535	0
6536	1000000006536	Judul Buku 6536	0
6537	1000000006537	Judul Buku 6537	0
6538	1000000006538	Judul Buku 6538	0
6539	1000000006539	Judul Buku 6539	0
6540	1000000006540	Judul Buku 6540	0
6541	1000000006541	Judul Buku 6541	0
6542	1000000006542	Judul Buku 6542	0
6543	1000000006543	Judul Buku 6543	0
6544	1000000006544	Judul Buku 6544	0
6545	1000000006545	Judul Buku 6545	0
6546	1000000006546	Judul Buku 6546	0
6547	1000000006547	Judul Buku 6547	0
6548	1000000006548	Judul Buku 6548	0
6549	1000000006549	Judul Buku 6549	0
6550	1000000006550	Judul Buku 6550	0
6551	1000000006551	Judul Buku 6551	0
6552	1000000006552	Judul Buku 6552	0
6553	1000000006553	Judul Buku 6553	0
6554	1000000006554	Judul Buku 6554	0
6555	1000000006555	Judul Buku 6555	0
6556	1000000006556	Judul Buku 6556	0
6557	1000000006557	Judul Buku 6557	0
6558	1000000006558	Judul Buku 6558	0
6559	1000000006559	Judul Buku 6559	0
6560	1000000006560	Judul Buku 6560	0
6561	1000000006561	Judul Buku 6561	0
6562	1000000006562	Judul Buku 6562	0
6563	1000000006563	Judul Buku 6563	0
6564	1000000006564	Judul Buku 6564	0
6565	1000000006565	Judul Buku 6565	0
6566	1000000006566	Judul Buku 6566	0
6567	1000000006567	Judul Buku 6567	0
6568	1000000006568	Judul Buku 6568	0
6569	1000000006569	Judul Buku 6569	0
6570	1000000006570	Judul Buku 6570	0
6571	1000000006571	Judul Buku 6571	0
6572	1000000006572	Judul Buku 6572	0
6573	1000000006573	Judul Buku 6573	0
6574	1000000006574	Judul Buku 6574	0
6575	1000000006575	Judul Buku 6575	0
6576	1000000006576	Judul Buku 6576	0
6577	1000000006577	Judul Buku 6577	0
6578	1000000006578	Judul Buku 6578	0
6579	1000000006579	Judul Buku 6579	0
6580	1000000006580	Judul Buku 6580	0
6581	1000000006581	Judul Buku 6581	0
6582	1000000006582	Judul Buku 6582	0
6583	1000000006583	Judul Buku 6583	0
6584	1000000006584	Judul Buku 6584	0
6585	1000000006585	Judul Buku 6585	0
6586	1000000006586	Judul Buku 6586	0
6587	1000000006587	Judul Buku 6587	0
6588	1000000006588	Judul Buku 6588	0
6589	1000000006589	Judul Buku 6589	0
6590	1000000006590	Judul Buku 6590	0
6591	1000000006591	Judul Buku 6591	0
6592	1000000006592	Judul Buku 6592	0
6593	1000000006593	Judul Buku 6593	0
6594	1000000006594	Judul Buku 6594	0
6595	1000000006595	Judul Buku 6595	0
6596	1000000006596	Judul Buku 6596	0
6597	1000000006597	Judul Buku 6597	0
6598	1000000006598	Judul Buku 6598	0
6599	1000000006599	Judul Buku 6599	0
6600	1000000006600	Judul Buku 6600	0
6601	1000000006601	Judul Buku 6601	0
6602	1000000006602	Judul Buku 6602	0
6603	1000000006603	Judul Buku 6603	0
6604	1000000006604	Judul Buku 6604	0
6605	1000000006605	Judul Buku 6605	0
6606	1000000006606	Judul Buku 6606	0
6607	1000000006607	Judul Buku 6607	0
6608	1000000006608	Judul Buku 6608	0
6609	1000000006609	Judul Buku 6609	0
6610	1000000006610	Judul Buku 6610	0
6611	1000000006611	Judul Buku 6611	0
6612	1000000006612	Judul Buku 6612	0
6613	1000000006613	Judul Buku 6613	0
6614	1000000006614	Judul Buku 6614	0
6615	1000000006615	Judul Buku 6615	0
6616	1000000006616	Judul Buku 6616	0
6617	1000000006617	Judul Buku 6617	0
6618	1000000006618	Judul Buku 6618	0
6619	1000000006619	Judul Buku 6619	0
6620	1000000006620	Judul Buku 6620	0
6621	1000000006621	Judul Buku 6621	0
6622	1000000006622	Judul Buku 6622	0
6623	1000000006623	Judul Buku 6623	0
6624	1000000006624	Judul Buku 6624	0
6625	1000000006625	Judul Buku 6625	0
6626	1000000006626	Judul Buku 6626	0
6627	1000000006627	Judul Buku 6627	0
6628	1000000006628	Judul Buku 6628	0
6629	1000000006629	Judul Buku 6629	0
6630	1000000006630	Judul Buku 6630	0
6631	1000000006631	Judul Buku 6631	0
6632	1000000006632	Judul Buku 6632	0
6633	1000000006633	Judul Buku 6633	0
6634	1000000006634	Judul Buku 6634	0
6635	1000000006635	Judul Buku 6635	0
6636	1000000006636	Judul Buku 6636	0
6637	1000000006637	Judul Buku 6637	0
6638	1000000006638	Judul Buku 6638	0
6639	1000000006639	Judul Buku 6639	0
6640	1000000006640	Judul Buku 6640	0
6641	1000000006641	Judul Buku 6641	0
6642	1000000006642	Judul Buku 6642	0
6643	1000000006643	Judul Buku 6643	0
6644	1000000006644	Judul Buku 6644	0
6645	1000000006645	Judul Buku 6645	0
6646	1000000006646	Judul Buku 6646	0
6647	1000000006647	Judul Buku 6647	0
6648	1000000006648	Judul Buku 6648	0
6649	1000000006649	Judul Buku 6649	0
6650	1000000006650	Judul Buku 6650	0
6651	1000000006651	Judul Buku 6651	0
6652	1000000006652	Judul Buku 6652	0
6653	1000000006653	Judul Buku 6653	0
6654	1000000006654	Judul Buku 6654	0
6655	1000000006655	Judul Buku 6655	0
6656	1000000006656	Judul Buku 6656	0
6657	1000000006657	Judul Buku 6657	0
6658	1000000006658	Judul Buku 6658	0
6659	1000000006659	Judul Buku 6659	0
6660	1000000006660	Judul Buku 6660	0
6661	1000000006661	Judul Buku 6661	0
6662	1000000006662	Judul Buku 6662	0
6663	1000000006663	Judul Buku 6663	0
6664	1000000006664	Judul Buku 6664	0
6665	1000000006665	Judul Buku 6665	0
6666	1000000006666	Judul Buku 6666	0
6667	1000000006667	Judul Buku 6667	0
6668	1000000006668	Judul Buku 6668	0
6669	1000000006669	Judul Buku 6669	0
6670	1000000006670	Judul Buku 6670	0
6671	1000000006671	Judul Buku 6671	0
6672	1000000006672	Judul Buku 6672	0
6673	1000000006673	Judul Buku 6673	0
6674	1000000006674	Judul Buku 6674	0
6675	1000000006675	Judul Buku 6675	0
6676	1000000006676	Judul Buku 6676	0
6677	1000000006677	Judul Buku 6677	0
6678	1000000006678	Judul Buku 6678	0
6679	1000000006679	Judul Buku 6679	0
6680	1000000006680	Judul Buku 6680	0
6681	1000000006681	Judul Buku 6681	0
6682	1000000006682	Judul Buku 6682	0
6683	1000000006683	Judul Buku 6683	0
6684	1000000006684	Judul Buku 6684	0
6685	1000000006685	Judul Buku 6685	0
6686	1000000006686	Judul Buku 6686	0
6687	1000000006687	Judul Buku 6687	0
6688	1000000006688	Judul Buku 6688	0
6689	1000000006689	Judul Buku 6689	0
6690	1000000006690	Judul Buku 6690	0
6691	1000000006691	Judul Buku 6691	0
6692	1000000006692	Judul Buku 6692	0
6693	1000000006693	Judul Buku 6693	0
6694	1000000006694	Judul Buku 6694	0
6695	1000000006695	Judul Buku 6695	0
6696	1000000006696	Judul Buku 6696	0
6697	1000000006697	Judul Buku 6697	0
6698	1000000006698	Judul Buku 6698	0
6699	1000000006699	Judul Buku 6699	0
6700	1000000006700	Judul Buku 6700	0
6701	1000000006701	Judul Buku 6701	0
6702	1000000006702	Judul Buku 6702	0
6703	1000000006703	Judul Buku 6703	0
6704	1000000006704	Judul Buku 6704	0
6705	1000000006705	Judul Buku 6705	0
6706	1000000006706	Judul Buku 6706	0
6707	1000000006707	Judul Buku 6707	0
6708	1000000006708	Judul Buku 6708	0
6709	1000000006709	Judul Buku 6709	0
6710	1000000006710	Judul Buku 6710	0
6711	1000000006711	Judul Buku 6711	0
6712	1000000006712	Judul Buku 6712	0
6713	1000000006713	Judul Buku 6713	0
6714	1000000006714	Judul Buku 6714	0
6715	1000000006715	Judul Buku 6715	0
6716	1000000006716	Judul Buku 6716	0
6717	1000000006717	Judul Buku 6717	0
6718	1000000006718	Judul Buku 6718	0
6719	1000000006719	Judul Buku 6719	0
6720	1000000006720	Judul Buku 6720	0
6721	1000000006721	Judul Buku 6721	0
6722	1000000006722	Judul Buku 6722	0
6723	1000000006723	Judul Buku 6723	0
6724	1000000006724	Judul Buku 6724	0
6725	1000000006725	Judul Buku 6725	0
6726	1000000006726	Judul Buku 6726	0
6727	1000000006727	Judul Buku 6727	0
6728	1000000006728	Judul Buku 6728	0
6729	1000000006729	Judul Buku 6729	0
6730	1000000006730	Judul Buku 6730	0
6731	1000000006731	Judul Buku 6731	0
6732	1000000006732	Judul Buku 6732	0
6733	1000000006733	Judul Buku 6733	0
6734	1000000006734	Judul Buku 6734	0
6735	1000000006735	Judul Buku 6735	0
6736	1000000006736	Judul Buku 6736	0
6737	1000000006737	Judul Buku 6737	0
6738	1000000006738	Judul Buku 6738	0
6739	1000000006739	Judul Buku 6739	0
6740	1000000006740	Judul Buku 6740	0
6741	1000000006741	Judul Buku 6741	0
6742	1000000006742	Judul Buku 6742	0
6743	1000000006743	Judul Buku 6743	0
6744	1000000006744	Judul Buku 6744	0
6745	1000000006745	Judul Buku 6745	0
6746	1000000006746	Judul Buku 6746	0
6747	1000000006747	Judul Buku 6747	0
6748	1000000006748	Judul Buku 6748	0
6749	1000000006749	Judul Buku 6749	0
6750	1000000006750	Judul Buku 6750	0
6751	1000000006751	Judul Buku 6751	0
6752	1000000006752	Judul Buku 6752	0
6753	1000000006753	Judul Buku 6753	0
6754	1000000006754	Judul Buku 6754	0
6755	1000000006755	Judul Buku 6755	0
6756	1000000006756	Judul Buku 6756	0
6757	1000000006757	Judul Buku 6757	0
6758	1000000006758	Judul Buku 6758	0
6759	1000000006759	Judul Buku 6759	0
6760	1000000006760	Judul Buku 6760	0
6761	1000000006761	Judul Buku 6761	0
6762	1000000006762	Judul Buku 6762	0
6763	1000000006763	Judul Buku 6763	0
6764	1000000006764	Judul Buku 6764	0
6765	1000000006765	Judul Buku 6765	0
6766	1000000006766	Judul Buku 6766	0
6767	1000000006767	Judul Buku 6767	0
6768	1000000006768	Judul Buku 6768	0
6769	1000000006769	Judul Buku 6769	0
6770	1000000006770	Judul Buku 6770	0
6771	1000000006771	Judul Buku 6771	0
6772	1000000006772	Judul Buku 6772	0
6773	1000000006773	Judul Buku 6773	0
6774	1000000006774	Judul Buku 6774	0
6775	1000000006775	Judul Buku 6775	0
6776	1000000006776	Judul Buku 6776	0
6777	1000000006777	Judul Buku 6777	0
6778	1000000006778	Judul Buku 6778	0
6779	1000000006779	Judul Buku 6779	0
6780	1000000006780	Judul Buku 6780	0
6781	1000000006781	Judul Buku 6781	0
6782	1000000006782	Judul Buku 6782	0
6783	1000000006783	Judul Buku 6783	0
6784	1000000006784	Judul Buku 6784	0
6785	1000000006785	Judul Buku 6785	0
6786	1000000006786	Judul Buku 6786	0
6787	1000000006787	Judul Buku 6787	0
6788	1000000006788	Judul Buku 6788	0
6789	1000000006789	Judul Buku 6789	0
6790	1000000006790	Judul Buku 6790	0
6791	1000000006791	Judul Buku 6791	0
6792	1000000006792	Judul Buku 6792	0
6793	1000000006793	Judul Buku 6793	0
6794	1000000006794	Judul Buku 6794	0
6795	1000000006795	Judul Buku 6795	0
6796	1000000006796	Judul Buku 6796	0
6797	1000000006797	Judul Buku 6797	0
6798	1000000006798	Judul Buku 6798	0
6799	1000000006799	Judul Buku 6799	0
6800	1000000006800	Judul Buku 6800	0
6801	1000000006801	Judul Buku 6801	0
6802	1000000006802	Judul Buku 6802	0
6803	1000000006803	Judul Buku 6803	0
6804	1000000006804	Judul Buku 6804	0
6805	1000000006805	Judul Buku 6805	0
6806	1000000006806	Judul Buku 6806	0
6807	1000000006807	Judul Buku 6807	0
6808	1000000006808	Judul Buku 6808	0
6809	1000000006809	Judul Buku 6809	0
6810	1000000006810	Judul Buku 6810	0
6811	1000000006811	Judul Buku 6811	0
6812	1000000006812	Judul Buku 6812	0
6813	1000000006813	Judul Buku 6813	0
6814	1000000006814	Judul Buku 6814	0
6815	1000000006815	Judul Buku 6815	0
6816	1000000006816	Judul Buku 6816	0
6817	1000000006817	Judul Buku 6817	0
6818	1000000006818	Judul Buku 6818	0
6819	1000000006819	Judul Buku 6819	0
6820	1000000006820	Judul Buku 6820	0
6821	1000000006821	Judul Buku 6821	0
6822	1000000006822	Judul Buku 6822	0
6823	1000000006823	Judul Buku 6823	0
6824	1000000006824	Judul Buku 6824	0
6825	1000000006825	Judul Buku 6825	0
6826	1000000006826	Judul Buku 6826	0
6827	1000000006827	Judul Buku 6827	0
6828	1000000006828	Judul Buku 6828	0
6829	1000000006829	Judul Buku 6829	0
6830	1000000006830	Judul Buku 6830	0
6831	1000000006831	Judul Buku 6831	0
6832	1000000006832	Judul Buku 6832	0
6833	1000000006833	Judul Buku 6833	0
6834	1000000006834	Judul Buku 6834	0
6835	1000000006835	Judul Buku 6835	0
6836	1000000006836	Judul Buku 6836	0
6837	1000000006837	Judul Buku 6837	0
6838	1000000006838	Judul Buku 6838	0
6839	1000000006839	Judul Buku 6839	0
6840	1000000006840	Judul Buku 6840	0
6841	1000000006841	Judul Buku 6841	0
6842	1000000006842	Judul Buku 6842	0
6843	1000000006843	Judul Buku 6843	0
6844	1000000006844	Judul Buku 6844	0
6845	1000000006845	Judul Buku 6845	0
6846	1000000006846	Judul Buku 6846	0
6847	1000000006847	Judul Buku 6847	0
6848	1000000006848	Judul Buku 6848	0
6849	1000000006849	Judul Buku 6849	0
6850	1000000006850	Judul Buku 6850	0
6851	1000000006851	Judul Buku 6851	0
6852	1000000006852	Judul Buku 6852	0
6853	1000000006853	Judul Buku 6853	0
6854	1000000006854	Judul Buku 6854	0
6855	1000000006855	Judul Buku 6855	0
6856	1000000006856	Judul Buku 6856	0
6857	1000000006857	Judul Buku 6857	0
6858	1000000006858	Judul Buku 6858	0
6859	1000000006859	Judul Buku 6859	0
6860	1000000006860	Judul Buku 6860	0
6861	1000000006861	Judul Buku 6861	0
6862	1000000006862	Judul Buku 6862	0
6863	1000000006863	Judul Buku 6863	0
6864	1000000006864	Judul Buku 6864	0
6865	1000000006865	Judul Buku 6865	0
6866	1000000006866	Judul Buku 6866	0
6867	1000000006867	Judul Buku 6867	0
6868	1000000006868	Judul Buku 6868	0
6869	1000000006869	Judul Buku 6869	0
6870	1000000006870	Judul Buku 6870	0
6871	1000000006871	Judul Buku 6871	0
6872	1000000006872	Judul Buku 6872	0
6873	1000000006873	Judul Buku 6873	0
6874	1000000006874	Judul Buku 6874	0
6875	1000000006875	Judul Buku 6875	0
6876	1000000006876	Judul Buku 6876	0
6877	1000000006877	Judul Buku 6877	0
6878	1000000006878	Judul Buku 6878	0
6879	1000000006879	Judul Buku 6879	0
6880	1000000006880	Judul Buku 6880	0
6881	1000000006881	Judul Buku 6881	0
6882	1000000006882	Judul Buku 6882	0
6883	1000000006883	Judul Buku 6883	0
6884	1000000006884	Judul Buku 6884	0
6885	1000000006885	Judul Buku 6885	0
6886	1000000006886	Judul Buku 6886	0
6887	1000000006887	Judul Buku 6887	0
6888	1000000006888	Judul Buku 6888	0
6889	1000000006889	Judul Buku 6889	0
6890	1000000006890	Judul Buku 6890	0
6891	1000000006891	Judul Buku 6891	0
6892	1000000006892	Judul Buku 6892	0
6893	1000000006893	Judul Buku 6893	0
6894	1000000006894	Judul Buku 6894	0
6895	1000000006895	Judul Buku 6895	0
6896	1000000006896	Judul Buku 6896	0
6897	1000000006897	Judul Buku 6897	0
6898	1000000006898	Judul Buku 6898	0
6899	1000000006899	Judul Buku 6899	0
6900	1000000006900	Judul Buku 6900	0
6901	1000000006901	Judul Buku 6901	0
6902	1000000006902	Judul Buku 6902	0
6903	1000000006903	Judul Buku 6903	0
6904	1000000006904	Judul Buku 6904	0
6905	1000000006905	Judul Buku 6905	0
6906	1000000006906	Judul Buku 6906	0
6907	1000000006907	Judul Buku 6907	0
6908	1000000006908	Judul Buku 6908	0
6909	1000000006909	Judul Buku 6909	0
6910	1000000006910	Judul Buku 6910	0
6911	1000000006911	Judul Buku 6911	0
6912	1000000006912	Judul Buku 6912	0
6913	1000000006913	Judul Buku 6913	0
6914	1000000006914	Judul Buku 6914	0
6915	1000000006915	Judul Buku 6915	0
6916	1000000006916	Judul Buku 6916	0
6917	1000000006917	Judul Buku 6917	0
6918	1000000006918	Judul Buku 6918	0
6919	1000000006919	Judul Buku 6919	0
6920	1000000006920	Judul Buku 6920	0
6921	1000000006921	Judul Buku 6921	0
6922	1000000006922	Judul Buku 6922	0
6923	1000000006923	Judul Buku 6923	0
6924	1000000006924	Judul Buku 6924	0
6925	1000000006925	Judul Buku 6925	0
6926	1000000006926	Judul Buku 6926	0
6927	1000000006927	Judul Buku 6927	0
6928	1000000006928	Judul Buku 6928	0
6929	1000000006929	Judul Buku 6929	0
6930	1000000006930	Judul Buku 6930	0
6931	1000000006931	Judul Buku 6931	0
6932	1000000006932	Judul Buku 6932	0
6933	1000000006933	Judul Buku 6933	0
6934	1000000006934	Judul Buku 6934	0
6935	1000000006935	Judul Buku 6935	0
6936	1000000006936	Judul Buku 6936	0
6937	1000000006937	Judul Buku 6937	0
6938	1000000006938	Judul Buku 6938	0
6939	1000000006939	Judul Buku 6939	0
6940	1000000006940	Judul Buku 6940	0
6941	1000000006941	Judul Buku 6941	0
6942	1000000006942	Judul Buku 6942	0
6943	1000000006943	Judul Buku 6943	0
6944	1000000006944	Judul Buku 6944	0
6945	1000000006945	Judul Buku 6945	0
6946	1000000006946	Judul Buku 6946	0
6947	1000000006947	Judul Buku 6947	0
6948	1000000006948	Judul Buku 6948	0
6949	1000000006949	Judul Buku 6949	0
6950	1000000006950	Judul Buku 6950	0
6951	1000000006951	Judul Buku 6951	0
6952	1000000006952	Judul Buku 6952	0
6953	1000000006953	Judul Buku 6953	0
6954	1000000006954	Judul Buku 6954	0
6955	1000000006955	Judul Buku 6955	0
6956	1000000006956	Judul Buku 6956	0
6957	1000000006957	Judul Buku 6957	0
6958	1000000006958	Judul Buku 6958	0
6959	1000000006959	Judul Buku 6959	0
6960	1000000006960	Judul Buku 6960	0
6961	1000000006961	Judul Buku 6961	0
6962	1000000006962	Judul Buku 6962	0
6963	1000000006963	Judul Buku 6963	0
6964	1000000006964	Judul Buku 6964	0
6965	1000000006965	Judul Buku 6965	0
6966	1000000006966	Judul Buku 6966	0
6967	1000000006967	Judul Buku 6967	0
6968	1000000006968	Judul Buku 6968	0
6969	1000000006969	Judul Buku 6969	0
6970	1000000006970	Judul Buku 6970	0
6971	1000000006971	Judul Buku 6971	0
6972	1000000006972	Judul Buku 6972	0
6973	1000000006973	Judul Buku 6973	0
6974	1000000006974	Judul Buku 6974	0
6975	1000000006975	Judul Buku 6975	0
6976	1000000006976	Judul Buku 6976	0
6977	1000000006977	Judul Buku 6977	0
6978	1000000006978	Judul Buku 6978	0
6979	1000000006979	Judul Buku 6979	0
6980	1000000006980	Judul Buku 6980	0
6981	1000000006981	Judul Buku 6981	0
6982	1000000006982	Judul Buku 6982	0
6983	1000000006983	Judul Buku 6983	0
6984	1000000006984	Judul Buku 6984	0
6985	1000000006985	Judul Buku 6985	0
6986	1000000006986	Judul Buku 6986	0
6987	1000000006987	Judul Buku 6987	0
6988	1000000006988	Judul Buku 6988	0
6989	1000000006989	Judul Buku 6989	0
6990	1000000006990	Judul Buku 6990	0
6991	1000000006991	Judul Buku 6991	0
6992	1000000006992	Judul Buku 6992	0
6993	1000000006993	Judul Buku 6993	0
6994	1000000006994	Judul Buku 6994	0
6995	1000000006995	Judul Buku 6995	0
6996	1000000006996	Judul Buku 6996	0
6997	1000000006997	Judul Buku 6997	0
6998	1000000006998	Judul Buku 6998	0
6999	1000000006999	Judul Buku 6999	0
7000	1000000007000	Judul Buku 7000	0
7001	1000000007001	Judul Buku 7001	0
7002	1000000007002	Judul Buku 7002	0
7003	1000000007003	Judul Buku 7003	0
7004	1000000007004	Judul Buku 7004	0
7005	1000000007005	Judul Buku 7005	0
7006	1000000007006	Judul Buku 7006	0
7007	1000000007007	Judul Buku 7007	0
7008	1000000007008	Judul Buku 7008	0
7009	1000000007009	Judul Buku 7009	0
7010	1000000007010	Judul Buku 7010	0
7011	1000000007011	Judul Buku 7011	0
7012	1000000007012	Judul Buku 7012	0
7013	1000000007013	Judul Buku 7013	0
7014	1000000007014	Judul Buku 7014	0
7015	1000000007015	Judul Buku 7015	0
7016	1000000007016	Judul Buku 7016	0
7017	1000000007017	Judul Buku 7017	0
7018	1000000007018	Judul Buku 7018	0
7019	1000000007019	Judul Buku 7019	0
7020	1000000007020	Judul Buku 7020	0
7021	1000000007021	Judul Buku 7021	0
7022	1000000007022	Judul Buku 7022	0
7023	1000000007023	Judul Buku 7023	0
7024	1000000007024	Judul Buku 7024	0
7025	1000000007025	Judul Buku 7025	0
7026	1000000007026	Judul Buku 7026	0
7027	1000000007027	Judul Buku 7027	0
7028	1000000007028	Judul Buku 7028	0
7029	1000000007029	Judul Buku 7029	0
7030	1000000007030	Judul Buku 7030	0
7031	1000000007031	Judul Buku 7031	0
7032	1000000007032	Judul Buku 7032	0
7033	1000000007033	Judul Buku 7033	0
7034	1000000007034	Judul Buku 7034	0
7035	1000000007035	Judul Buku 7035	0
7036	1000000007036	Judul Buku 7036	0
7037	1000000007037	Judul Buku 7037	0
7038	1000000007038	Judul Buku 7038	0
7039	1000000007039	Judul Buku 7039	0
7040	1000000007040	Judul Buku 7040	0
7041	1000000007041	Judul Buku 7041	0
7042	1000000007042	Judul Buku 7042	0
7043	1000000007043	Judul Buku 7043	0
7044	1000000007044	Judul Buku 7044	0
7045	1000000007045	Judul Buku 7045	0
7046	1000000007046	Judul Buku 7046	0
7047	1000000007047	Judul Buku 7047	0
7048	1000000007048	Judul Buku 7048	0
7049	1000000007049	Judul Buku 7049	0
7050	1000000007050	Judul Buku 7050	0
7051	1000000007051	Judul Buku 7051	0
7052	1000000007052	Judul Buku 7052	0
7053	1000000007053	Judul Buku 7053	0
7054	1000000007054	Judul Buku 7054	0
7055	1000000007055	Judul Buku 7055	0
7056	1000000007056	Judul Buku 7056	0
7057	1000000007057	Judul Buku 7057	0
7058	1000000007058	Judul Buku 7058	0
7059	1000000007059	Judul Buku 7059	0
7060	1000000007060	Judul Buku 7060	0
7061	1000000007061	Judul Buku 7061	0
7062	1000000007062	Judul Buku 7062	0
7063	1000000007063	Judul Buku 7063	0
7064	1000000007064	Judul Buku 7064	0
7065	1000000007065	Judul Buku 7065	0
7066	1000000007066	Judul Buku 7066	0
7067	1000000007067	Judul Buku 7067	0
7068	1000000007068	Judul Buku 7068	0
7069	1000000007069	Judul Buku 7069	0
7070	1000000007070	Judul Buku 7070	0
7071	1000000007071	Judul Buku 7071	0
7072	1000000007072	Judul Buku 7072	0
7073	1000000007073	Judul Buku 7073	0
7074	1000000007074	Judul Buku 7074	0
7075	1000000007075	Judul Buku 7075	0
7076	1000000007076	Judul Buku 7076	0
7077	1000000007077	Judul Buku 7077	0
7078	1000000007078	Judul Buku 7078	0
7079	1000000007079	Judul Buku 7079	0
7080	1000000007080	Judul Buku 7080	0
7081	1000000007081	Judul Buku 7081	0
7082	1000000007082	Judul Buku 7082	0
7083	1000000007083	Judul Buku 7083	0
7084	1000000007084	Judul Buku 7084	0
7085	1000000007085	Judul Buku 7085	0
7086	1000000007086	Judul Buku 7086	0
7087	1000000007087	Judul Buku 7087	0
7088	1000000007088	Judul Buku 7088	0
7089	1000000007089	Judul Buku 7089	0
7090	1000000007090	Judul Buku 7090	0
7091	1000000007091	Judul Buku 7091	0
7092	1000000007092	Judul Buku 7092	0
7093	1000000007093	Judul Buku 7093	0
7094	1000000007094	Judul Buku 7094	0
7095	1000000007095	Judul Buku 7095	0
7096	1000000007096	Judul Buku 7096	0
7097	1000000007097	Judul Buku 7097	0
7098	1000000007098	Judul Buku 7098	0
7099	1000000007099	Judul Buku 7099	0
7100	1000000007100	Judul Buku 7100	0
7101	1000000007101	Judul Buku 7101	0
7102	1000000007102	Judul Buku 7102	0
7103	1000000007103	Judul Buku 7103	0
7104	1000000007104	Judul Buku 7104	0
7105	1000000007105	Judul Buku 7105	0
7106	1000000007106	Judul Buku 7106	0
7107	1000000007107	Judul Buku 7107	0
7108	1000000007108	Judul Buku 7108	0
7109	1000000007109	Judul Buku 7109	0
7110	1000000007110	Judul Buku 7110	0
7111	1000000007111	Judul Buku 7111	0
7112	1000000007112	Judul Buku 7112	0
7113	1000000007113	Judul Buku 7113	0
7114	1000000007114	Judul Buku 7114	0
7115	1000000007115	Judul Buku 7115	0
7116	1000000007116	Judul Buku 7116	0
7117	1000000007117	Judul Buku 7117	0
7118	1000000007118	Judul Buku 7118	0
7119	1000000007119	Judul Buku 7119	0
7120	1000000007120	Judul Buku 7120	0
7121	1000000007121	Judul Buku 7121	0
7122	1000000007122	Judul Buku 7122	0
7123	1000000007123	Judul Buku 7123	0
7124	1000000007124	Judul Buku 7124	0
7125	1000000007125	Judul Buku 7125	0
7126	1000000007126	Judul Buku 7126	0
7127	1000000007127	Judul Buku 7127	0
7128	1000000007128	Judul Buku 7128	0
7129	1000000007129	Judul Buku 7129	0
7130	1000000007130	Judul Buku 7130	0
7131	1000000007131	Judul Buku 7131	0
7132	1000000007132	Judul Buku 7132	0
7133	1000000007133	Judul Buku 7133	0
7134	1000000007134	Judul Buku 7134	0
7135	1000000007135	Judul Buku 7135	0
7136	1000000007136	Judul Buku 7136	0
7137	1000000007137	Judul Buku 7137	0
7138	1000000007138	Judul Buku 7138	0
7139	1000000007139	Judul Buku 7139	0
7140	1000000007140	Judul Buku 7140	0
7141	1000000007141	Judul Buku 7141	0
7142	1000000007142	Judul Buku 7142	0
7143	1000000007143	Judul Buku 7143	0
7144	1000000007144	Judul Buku 7144	0
7145	1000000007145	Judul Buku 7145	0
7146	1000000007146	Judul Buku 7146	0
7147	1000000007147	Judul Buku 7147	0
7148	1000000007148	Judul Buku 7148	0
7149	1000000007149	Judul Buku 7149	0
7150	1000000007150	Judul Buku 7150	0
7151	1000000007151	Judul Buku 7151	0
7152	1000000007152	Judul Buku 7152	0
7153	1000000007153	Judul Buku 7153	0
7154	1000000007154	Judul Buku 7154	0
7155	1000000007155	Judul Buku 7155	0
7156	1000000007156	Judul Buku 7156	0
7157	1000000007157	Judul Buku 7157	0
7158	1000000007158	Judul Buku 7158	0
7159	1000000007159	Judul Buku 7159	0
7160	1000000007160	Judul Buku 7160	0
7161	1000000007161	Judul Buku 7161	0
7162	1000000007162	Judul Buku 7162	0
7163	1000000007163	Judul Buku 7163	0
7164	1000000007164	Judul Buku 7164	0
7165	1000000007165	Judul Buku 7165	0
7166	1000000007166	Judul Buku 7166	0
7167	1000000007167	Judul Buku 7167	0
7168	1000000007168	Judul Buku 7168	0
7169	1000000007169	Judul Buku 7169	0
7170	1000000007170	Judul Buku 7170	0
7171	1000000007171	Judul Buku 7171	0
7172	1000000007172	Judul Buku 7172	0
7173	1000000007173	Judul Buku 7173	0
7174	1000000007174	Judul Buku 7174	0
7175	1000000007175	Judul Buku 7175	0
7176	1000000007176	Judul Buku 7176	0
7177	1000000007177	Judul Buku 7177	0
7178	1000000007178	Judul Buku 7178	0
7179	1000000007179	Judul Buku 7179	0
7180	1000000007180	Judul Buku 7180	0
7181	1000000007181	Judul Buku 7181	0
7182	1000000007182	Judul Buku 7182	0
7183	1000000007183	Judul Buku 7183	0
7184	1000000007184	Judul Buku 7184	0
7185	1000000007185	Judul Buku 7185	0
7186	1000000007186	Judul Buku 7186	0
7187	1000000007187	Judul Buku 7187	0
7188	1000000007188	Judul Buku 7188	0
7189	1000000007189	Judul Buku 7189	0
7190	1000000007190	Judul Buku 7190	0
7191	1000000007191	Judul Buku 7191	0
7192	1000000007192	Judul Buku 7192	0
7193	1000000007193	Judul Buku 7193	0
7194	1000000007194	Judul Buku 7194	0
7195	1000000007195	Judul Buku 7195	0
7196	1000000007196	Judul Buku 7196	0
7197	1000000007197	Judul Buku 7197	0
7198	1000000007198	Judul Buku 7198	0
7199	1000000007199	Judul Buku 7199	0
7200	1000000007200	Judul Buku 7200	0
7201	1000000007201	Judul Buku 7201	0
7202	1000000007202	Judul Buku 7202	0
7203	1000000007203	Judul Buku 7203	0
7204	1000000007204	Judul Buku 7204	0
7205	1000000007205	Judul Buku 7205	0
7206	1000000007206	Judul Buku 7206	0
7207	1000000007207	Judul Buku 7207	0
7208	1000000007208	Judul Buku 7208	0
7209	1000000007209	Judul Buku 7209	0
7210	1000000007210	Judul Buku 7210	0
7211	1000000007211	Judul Buku 7211	0
7212	1000000007212	Judul Buku 7212	0
7213	1000000007213	Judul Buku 7213	0
7214	1000000007214	Judul Buku 7214	0
7215	1000000007215	Judul Buku 7215	0
7216	1000000007216	Judul Buku 7216	0
7217	1000000007217	Judul Buku 7217	0
7218	1000000007218	Judul Buku 7218	0
7219	1000000007219	Judul Buku 7219	0
7220	1000000007220	Judul Buku 7220	0
7221	1000000007221	Judul Buku 7221	0
7222	1000000007222	Judul Buku 7222	0
7223	1000000007223	Judul Buku 7223	0
7224	1000000007224	Judul Buku 7224	0
7225	1000000007225	Judul Buku 7225	0
7226	1000000007226	Judul Buku 7226	0
7227	1000000007227	Judul Buku 7227	0
7228	1000000007228	Judul Buku 7228	0
7229	1000000007229	Judul Buku 7229	0
7230	1000000007230	Judul Buku 7230	0
7231	1000000007231	Judul Buku 7231	0
7232	1000000007232	Judul Buku 7232	0
7233	1000000007233	Judul Buku 7233	0
7234	1000000007234	Judul Buku 7234	0
7235	1000000007235	Judul Buku 7235	0
7236	1000000007236	Judul Buku 7236	0
7237	1000000007237	Judul Buku 7237	0
7238	1000000007238	Judul Buku 7238	0
7239	1000000007239	Judul Buku 7239	0
7240	1000000007240	Judul Buku 7240	0
7241	1000000007241	Judul Buku 7241	0
7242	1000000007242	Judul Buku 7242	0
7243	1000000007243	Judul Buku 7243	0
7244	1000000007244	Judul Buku 7244	0
7245	1000000007245	Judul Buku 7245	0
7246	1000000007246	Judul Buku 7246	0
7247	1000000007247	Judul Buku 7247	0
7248	1000000007248	Judul Buku 7248	0
7249	1000000007249	Judul Buku 7249	0
7250	1000000007250	Judul Buku 7250	0
7251	1000000007251	Judul Buku 7251	0
7252	1000000007252	Judul Buku 7252	0
7253	1000000007253	Judul Buku 7253	0
7254	1000000007254	Judul Buku 7254	0
7255	1000000007255	Judul Buku 7255	0
7256	1000000007256	Judul Buku 7256	0
7257	1000000007257	Judul Buku 7257	0
7258	1000000007258	Judul Buku 7258	0
7259	1000000007259	Judul Buku 7259	0
7260	1000000007260	Judul Buku 7260	0
7261	1000000007261	Judul Buku 7261	0
7262	1000000007262	Judul Buku 7262	0
7263	1000000007263	Judul Buku 7263	0
7264	1000000007264	Judul Buku 7264	0
7265	1000000007265	Judul Buku 7265	0
7266	1000000007266	Judul Buku 7266	0
7267	1000000007267	Judul Buku 7267	0
7268	1000000007268	Judul Buku 7268	0
7269	1000000007269	Judul Buku 7269	0
7270	1000000007270	Judul Buku 7270	0
7271	1000000007271	Judul Buku 7271	0
7272	1000000007272	Judul Buku 7272	0
7273	1000000007273	Judul Buku 7273	0
7274	1000000007274	Judul Buku 7274	0
7275	1000000007275	Judul Buku 7275	0
7276	1000000007276	Judul Buku 7276	0
7277	1000000007277	Judul Buku 7277	0
7278	1000000007278	Judul Buku 7278	0
7279	1000000007279	Judul Buku 7279	0
7280	1000000007280	Judul Buku 7280	0
7281	1000000007281	Judul Buku 7281	0
7282	1000000007282	Judul Buku 7282	0
7283	1000000007283	Judul Buku 7283	0
7284	1000000007284	Judul Buku 7284	0
7285	1000000007285	Judul Buku 7285	0
7286	1000000007286	Judul Buku 7286	0
7287	1000000007287	Judul Buku 7287	0
7288	1000000007288	Judul Buku 7288	0
7289	1000000007289	Judul Buku 7289	0
7290	1000000007290	Judul Buku 7290	0
7291	1000000007291	Judul Buku 7291	0
7292	1000000007292	Judul Buku 7292	0
7293	1000000007293	Judul Buku 7293	0
7294	1000000007294	Judul Buku 7294	0
7295	1000000007295	Judul Buku 7295	0
7296	1000000007296	Judul Buku 7296	0
7297	1000000007297	Judul Buku 7297	0
7298	1000000007298	Judul Buku 7298	0
7299	1000000007299	Judul Buku 7299	0
7300	1000000007300	Judul Buku 7300	0
7301	1000000007301	Judul Buku 7301	0
7302	1000000007302	Judul Buku 7302	0
7303	1000000007303	Judul Buku 7303	0
7304	1000000007304	Judul Buku 7304	0
7305	1000000007305	Judul Buku 7305	0
7306	1000000007306	Judul Buku 7306	0
7307	1000000007307	Judul Buku 7307	0
7308	1000000007308	Judul Buku 7308	0
7309	1000000007309	Judul Buku 7309	0
7310	1000000007310	Judul Buku 7310	0
7311	1000000007311	Judul Buku 7311	0
7312	1000000007312	Judul Buku 7312	0
7313	1000000007313	Judul Buku 7313	0
7314	1000000007314	Judul Buku 7314	0
7315	1000000007315	Judul Buku 7315	0
7316	1000000007316	Judul Buku 7316	0
7317	1000000007317	Judul Buku 7317	0
7318	1000000007318	Judul Buku 7318	0
7319	1000000007319	Judul Buku 7319	0
7320	1000000007320	Judul Buku 7320	0
7321	1000000007321	Judul Buku 7321	0
7322	1000000007322	Judul Buku 7322	0
7323	1000000007323	Judul Buku 7323	0
7324	1000000007324	Judul Buku 7324	0
7325	1000000007325	Judul Buku 7325	0
7326	1000000007326	Judul Buku 7326	0
7327	1000000007327	Judul Buku 7327	0
7328	1000000007328	Judul Buku 7328	0
7329	1000000007329	Judul Buku 7329	0
7330	1000000007330	Judul Buku 7330	0
7331	1000000007331	Judul Buku 7331	0
7332	1000000007332	Judul Buku 7332	0
7333	1000000007333	Judul Buku 7333	0
7334	1000000007334	Judul Buku 7334	0
7335	1000000007335	Judul Buku 7335	0
7336	1000000007336	Judul Buku 7336	0
7337	1000000007337	Judul Buku 7337	0
7338	1000000007338	Judul Buku 7338	0
7339	1000000007339	Judul Buku 7339	0
7340	1000000007340	Judul Buku 7340	0
7341	1000000007341	Judul Buku 7341	0
7342	1000000007342	Judul Buku 7342	0
7343	1000000007343	Judul Buku 7343	0
7344	1000000007344	Judul Buku 7344	0
7345	1000000007345	Judul Buku 7345	0
7346	1000000007346	Judul Buku 7346	0
7347	1000000007347	Judul Buku 7347	0
7348	1000000007348	Judul Buku 7348	0
7349	1000000007349	Judul Buku 7349	0
7350	1000000007350	Judul Buku 7350	0
7351	1000000007351	Judul Buku 7351	0
7352	1000000007352	Judul Buku 7352	0
7353	1000000007353	Judul Buku 7353	0
7354	1000000007354	Judul Buku 7354	0
7355	1000000007355	Judul Buku 7355	0
7356	1000000007356	Judul Buku 7356	0
7357	1000000007357	Judul Buku 7357	0
7358	1000000007358	Judul Buku 7358	0
7359	1000000007359	Judul Buku 7359	0
7360	1000000007360	Judul Buku 7360	0
7361	1000000007361	Judul Buku 7361	0
7362	1000000007362	Judul Buku 7362	0
7363	1000000007363	Judul Buku 7363	0
7364	1000000007364	Judul Buku 7364	0
7365	1000000007365	Judul Buku 7365	0
7366	1000000007366	Judul Buku 7366	0
7367	1000000007367	Judul Buku 7367	0
7368	1000000007368	Judul Buku 7368	0
7369	1000000007369	Judul Buku 7369	0
7370	1000000007370	Judul Buku 7370	0
7371	1000000007371	Judul Buku 7371	0
7372	1000000007372	Judul Buku 7372	0
7373	1000000007373	Judul Buku 7373	0
7374	1000000007374	Judul Buku 7374	0
7375	1000000007375	Judul Buku 7375	0
7376	1000000007376	Judul Buku 7376	0
7377	1000000007377	Judul Buku 7377	0
7378	1000000007378	Judul Buku 7378	0
7379	1000000007379	Judul Buku 7379	0
7380	1000000007380	Judul Buku 7380	0
7381	1000000007381	Judul Buku 7381	0
7382	1000000007382	Judul Buku 7382	0
7383	1000000007383	Judul Buku 7383	0
7384	1000000007384	Judul Buku 7384	0
7385	1000000007385	Judul Buku 7385	0
7386	1000000007386	Judul Buku 7386	0
7387	1000000007387	Judul Buku 7387	0
7388	1000000007388	Judul Buku 7388	0
7389	1000000007389	Judul Buku 7389	0
7390	1000000007390	Judul Buku 7390	0
7391	1000000007391	Judul Buku 7391	0
7392	1000000007392	Judul Buku 7392	0
7393	1000000007393	Judul Buku 7393	0
7394	1000000007394	Judul Buku 7394	0
7395	1000000007395	Judul Buku 7395	0
7396	1000000007396	Judul Buku 7396	0
7397	1000000007397	Judul Buku 7397	0
7398	1000000007398	Judul Buku 7398	0
7399	1000000007399	Judul Buku 7399	0
7400	1000000007400	Judul Buku 7400	0
7401	1000000007401	Judul Buku 7401	0
7402	1000000007402	Judul Buku 7402	0
7403	1000000007403	Judul Buku 7403	0
7404	1000000007404	Judul Buku 7404	0
7405	1000000007405	Judul Buku 7405	0
7406	1000000007406	Judul Buku 7406	0
7407	1000000007407	Judul Buku 7407	0
7408	1000000007408	Judul Buku 7408	0
7409	1000000007409	Judul Buku 7409	0
7410	1000000007410	Judul Buku 7410	0
7411	1000000007411	Judul Buku 7411	0
7412	1000000007412	Judul Buku 7412	0
7413	1000000007413	Judul Buku 7413	0
7414	1000000007414	Judul Buku 7414	0
7415	1000000007415	Judul Buku 7415	0
7416	1000000007416	Judul Buku 7416	0
7417	1000000007417	Judul Buku 7417	0
7418	1000000007418	Judul Buku 7418	0
7419	1000000007419	Judul Buku 7419	0
7420	1000000007420	Judul Buku 7420	0
7421	1000000007421	Judul Buku 7421	0
7422	1000000007422	Judul Buku 7422	0
7423	1000000007423	Judul Buku 7423	0
7424	1000000007424	Judul Buku 7424	0
7425	1000000007425	Judul Buku 7425	0
7426	1000000007426	Judul Buku 7426	0
7427	1000000007427	Judul Buku 7427	0
7428	1000000007428	Judul Buku 7428	0
7429	1000000007429	Judul Buku 7429	0
7430	1000000007430	Judul Buku 7430	0
7431	1000000007431	Judul Buku 7431	0
7432	1000000007432	Judul Buku 7432	0
7433	1000000007433	Judul Buku 7433	0
7434	1000000007434	Judul Buku 7434	0
7435	1000000007435	Judul Buku 7435	0
7436	1000000007436	Judul Buku 7436	0
7437	1000000007437	Judul Buku 7437	0
7438	1000000007438	Judul Buku 7438	0
7439	1000000007439	Judul Buku 7439	0
7440	1000000007440	Judul Buku 7440	0
7441	1000000007441	Judul Buku 7441	0
7442	1000000007442	Judul Buku 7442	0
7443	1000000007443	Judul Buku 7443	0
7444	1000000007444	Judul Buku 7444	0
7445	1000000007445	Judul Buku 7445	0
7446	1000000007446	Judul Buku 7446	0
7447	1000000007447	Judul Buku 7447	0
7448	1000000007448	Judul Buku 7448	0
7449	1000000007449	Judul Buku 7449	0
7450	1000000007450	Judul Buku 7450	0
7451	1000000007451	Judul Buku 7451	0
7452	1000000007452	Judul Buku 7452	0
7453	1000000007453	Judul Buku 7453	0
7454	1000000007454	Judul Buku 7454	0
7455	1000000007455	Judul Buku 7455	0
7456	1000000007456	Judul Buku 7456	0
7457	1000000007457	Judul Buku 7457	0
7458	1000000007458	Judul Buku 7458	0
7459	1000000007459	Judul Buku 7459	0
7460	1000000007460	Judul Buku 7460	0
7461	1000000007461	Judul Buku 7461	0
7462	1000000007462	Judul Buku 7462	0
7463	1000000007463	Judul Buku 7463	0
7464	1000000007464	Judul Buku 7464	0
7465	1000000007465	Judul Buku 7465	0
7466	1000000007466	Judul Buku 7466	0
7467	1000000007467	Judul Buku 7467	0
7468	1000000007468	Judul Buku 7468	0
7469	1000000007469	Judul Buku 7469	0
7470	1000000007470	Judul Buku 7470	0
7471	1000000007471	Judul Buku 7471	0
7472	1000000007472	Judul Buku 7472	0
7473	1000000007473	Judul Buku 7473	0
7474	1000000007474	Judul Buku 7474	0
7475	1000000007475	Judul Buku 7475	0
7476	1000000007476	Judul Buku 7476	0
7477	1000000007477	Judul Buku 7477	0
7478	1000000007478	Judul Buku 7478	0
7479	1000000007479	Judul Buku 7479	0
7480	1000000007480	Judul Buku 7480	0
7481	1000000007481	Judul Buku 7481	0
7482	1000000007482	Judul Buku 7482	0
7483	1000000007483	Judul Buku 7483	0
7484	1000000007484	Judul Buku 7484	0
7485	1000000007485	Judul Buku 7485	0
7486	1000000007486	Judul Buku 7486	0
7487	1000000007487	Judul Buku 7487	0
7488	1000000007488	Judul Buku 7488	0
7489	1000000007489	Judul Buku 7489	0
7490	1000000007490	Judul Buku 7490	0
7491	1000000007491	Judul Buku 7491	0
7492	1000000007492	Judul Buku 7492	0
7493	1000000007493	Judul Buku 7493	0
7494	1000000007494	Judul Buku 7494	0
7495	1000000007495	Judul Buku 7495	0
7496	1000000007496	Judul Buku 7496	0
7497	1000000007497	Judul Buku 7497	0
7498	1000000007498	Judul Buku 7498	0
7499	1000000007499	Judul Buku 7499	0
7500	1000000007500	Judul Buku 7500	0
7501	1000000007501	Judul Buku 7501	0
7502	1000000007502	Judul Buku 7502	0
7503	1000000007503	Judul Buku 7503	0
7504	1000000007504	Judul Buku 7504	0
7505	1000000007505	Judul Buku 7505	0
7506	1000000007506	Judul Buku 7506	0
7507	1000000007507	Judul Buku 7507	0
7508	1000000007508	Judul Buku 7508	0
7509	1000000007509	Judul Buku 7509	0
7510	1000000007510	Judul Buku 7510	0
7511	1000000007511	Judul Buku 7511	0
7512	1000000007512	Judul Buku 7512	0
7513	1000000007513	Judul Buku 7513	0
7514	1000000007514	Judul Buku 7514	0
7515	1000000007515	Judul Buku 7515	0
7516	1000000007516	Judul Buku 7516	0
7517	1000000007517	Judul Buku 7517	0
7518	1000000007518	Judul Buku 7518	0
7519	1000000007519	Judul Buku 7519	0
7520	1000000007520	Judul Buku 7520	0
7521	1000000007521	Judul Buku 7521	0
7522	1000000007522	Judul Buku 7522	0
7523	1000000007523	Judul Buku 7523	0
7524	1000000007524	Judul Buku 7524	0
7525	1000000007525	Judul Buku 7525	0
7526	1000000007526	Judul Buku 7526	0
7527	1000000007527	Judul Buku 7527	0
7528	1000000007528	Judul Buku 7528	0
7529	1000000007529	Judul Buku 7529	0
7530	1000000007530	Judul Buku 7530	0
7531	1000000007531	Judul Buku 7531	0
7532	1000000007532	Judul Buku 7532	0
7533	1000000007533	Judul Buku 7533	0
7534	1000000007534	Judul Buku 7534	0
7535	1000000007535	Judul Buku 7535	0
7536	1000000007536	Judul Buku 7536	0
7537	1000000007537	Judul Buku 7537	0
7538	1000000007538	Judul Buku 7538	0
7539	1000000007539	Judul Buku 7539	0
7540	1000000007540	Judul Buku 7540	0
7541	1000000007541	Judul Buku 7541	0
7542	1000000007542	Judul Buku 7542	0
7543	1000000007543	Judul Buku 7543	0
7544	1000000007544	Judul Buku 7544	0
7545	1000000007545	Judul Buku 7545	0
7546	1000000007546	Judul Buku 7546	0
7547	1000000007547	Judul Buku 7547	0
7548	1000000007548	Judul Buku 7548	0
7549	1000000007549	Judul Buku 7549	0
7550	1000000007550	Judul Buku 7550	0
7551	1000000007551	Judul Buku 7551	0
7552	1000000007552	Judul Buku 7552	0
7553	1000000007553	Judul Buku 7553	0
7554	1000000007554	Judul Buku 7554	0
7555	1000000007555	Judul Buku 7555	0
7556	1000000007556	Judul Buku 7556	0
7557	1000000007557	Judul Buku 7557	0
7558	1000000007558	Judul Buku 7558	0
7559	1000000007559	Judul Buku 7559	0
7560	1000000007560	Judul Buku 7560	0
7561	1000000007561	Judul Buku 7561	0
7562	1000000007562	Judul Buku 7562	0
7563	1000000007563	Judul Buku 7563	0
7564	1000000007564	Judul Buku 7564	0
7565	1000000007565	Judul Buku 7565	0
7566	1000000007566	Judul Buku 7566	0
7567	1000000007567	Judul Buku 7567	0
7568	1000000007568	Judul Buku 7568	0
7569	1000000007569	Judul Buku 7569	0
7570	1000000007570	Judul Buku 7570	0
7571	1000000007571	Judul Buku 7571	0
7572	1000000007572	Judul Buku 7572	0
7573	1000000007573	Judul Buku 7573	0
7574	1000000007574	Judul Buku 7574	0
7575	1000000007575	Judul Buku 7575	0
7576	1000000007576	Judul Buku 7576	0
7577	1000000007577	Judul Buku 7577	0
7578	1000000007578	Judul Buku 7578	0
7579	1000000007579	Judul Buku 7579	0
7580	1000000007580	Judul Buku 7580	0
7581	1000000007581	Judul Buku 7581	0
7582	1000000007582	Judul Buku 7582	0
7583	1000000007583	Judul Buku 7583	0
7584	1000000007584	Judul Buku 7584	0
7585	1000000007585	Judul Buku 7585	0
7586	1000000007586	Judul Buku 7586	0
7587	1000000007587	Judul Buku 7587	0
7588	1000000007588	Judul Buku 7588	0
7589	1000000007589	Judul Buku 7589	0
7590	1000000007590	Judul Buku 7590	0
7591	1000000007591	Judul Buku 7591	0
7592	1000000007592	Judul Buku 7592	0
7593	1000000007593	Judul Buku 7593	0
7594	1000000007594	Judul Buku 7594	0
7595	1000000007595	Judul Buku 7595	0
7596	1000000007596	Judul Buku 7596	0
7597	1000000007597	Judul Buku 7597	0
7598	1000000007598	Judul Buku 7598	0
7599	1000000007599	Judul Buku 7599	0
7600	1000000007600	Judul Buku 7600	0
7601	1000000007601	Judul Buku 7601	0
7602	1000000007602	Judul Buku 7602	0
7603	1000000007603	Judul Buku 7603	0
7604	1000000007604	Judul Buku 7604	0
7605	1000000007605	Judul Buku 7605	0
7606	1000000007606	Judul Buku 7606	0
7607	1000000007607	Judul Buku 7607	0
7608	1000000007608	Judul Buku 7608	0
7609	1000000007609	Judul Buku 7609	0
7610	1000000007610	Judul Buku 7610	0
7611	1000000007611	Judul Buku 7611	0
7612	1000000007612	Judul Buku 7612	0
7613	1000000007613	Judul Buku 7613	0
7614	1000000007614	Judul Buku 7614	0
7615	1000000007615	Judul Buku 7615	0
7616	1000000007616	Judul Buku 7616	0
7617	1000000007617	Judul Buku 7617	0
7618	1000000007618	Judul Buku 7618	0
7619	1000000007619	Judul Buku 7619	0
7620	1000000007620	Judul Buku 7620	0
7621	1000000007621	Judul Buku 7621	0
7622	1000000007622	Judul Buku 7622	0
7623	1000000007623	Judul Buku 7623	0
7624	1000000007624	Judul Buku 7624	0
7625	1000000007625	Judul Buku 7625	0
7626	1000000007626	Judul Buku 7626	0
7627	1000000007627	Judul Buku 7627	0
7628	1000000007628	Judul Buku 7628	0
7629	1000000007629	Judul Buku 7629	0
7630	1000000007630	Judul Buku 7630	0
7631	1000000007631	Judul Buku 7631	0
7632	1000000007632	Judul Buku 7632	0
7633	1000000007633	Judul Buku 7633	0
7634	1000000007634	Judul Buku 7634	0
7635	1000000007635	Judul Buku 7635	0
7636	1000000007636	Judul Buku 7636	0
7637	1000000007637	Judul Buku 7637	0
7638	1000000007638	Judul Buku 7638	0
7639	1000000007639	Judul Buku 7639	0
7640	1000000007640	Judul Buku 7640	0
7641	1000000007641	Judul Buku 7641	0
7642	1000000007642	Judul Buku 7642	0
7643	1000000007643	Judul Buku 7643	0
7644	1000000007644	Judul Buku 7644	0
7645	1000000007645	Judul Buku 7645	0
7646	1000000007646	Judul Buku 7646	0
7647	1000000007647	Judul Buku 7647	0
7648	1000000007648	Judul Buku 7648	0
7649	1000000007649	Judul Buku 7649	0
7650	1000000007650	Judul Buku 7650	0
7651	1000000007651	Judul Buku 7651	0
7652	1000000007652	Judul Buku 7652	0
7653	1000000007653	Judul Buku 7653	0
7654	1000000007654	Judul Buku 7654	0
7655	1000000007655	Judul Buku 7655	0
7656	1000000007656	Judul Buku 7656	0
7657	1000000007657	Judul Buku 7657	0
7658	1000000007658	Judul Buku 7658	0
7659	1000000007659	Judul Buku 7659	0
7660	1000000007660	Judul Buku 7660	0
7661	1000000007661	Judul Buku 7661	0
7662	1000000007662	Judul Buku 7662	0
7663	1000000007663	Judul Buku 7663	0
7664	1000000007664	Judul Buku 7664	0
7665	1000000007665	Judul Buku 7665	0
7666	1000000007666	Judul Buku 7666	0
7667	1000000007667	Judul Buku 7667	0
7668	1000000007668	Judul Buku 7668	0
7669	1000000007669	Judul Buku 7669	0
7670	1000000007670	Judul Buku 7670	0
7671	1000000007671	Judul Buku 7671	0
7672	1000000007672	Judul Buku 7672	0
7673	1000000007673	Judul Buku 7673	0
7674	1000000007674	Judul Buku 7674	0
7675	1000000007675	Judul Buku 7675	0
7676	1000000007676	Judul Buku 7676	0
7677	1000000007677	Judul Buku 7677	0
7678	1000000007678	Judul Buku 7678	0
7679	1000000007679	Judul Buku 7679	0
7680	1000000007680	Judul Buku 7680	0
7681	1000000007681	Judul Buku 7681	0
7682	1000000007682	Judul Buku 7682	0
7683	1000000007683	Judul Buku 7683	0
7684	1000000007684	Judul Buku 7684	0
7685	1000000007685	Judul Buku 7685	0
7686	1000000007686	Judul Buku 7686	0
7687	1000000007687	Judul Buku 7687	0
7688	1000000007688	Judul Buku 7688	0
7689	1000000007689	Judul Buku 7689	0
7690	1000000007690	Judul Buku 7690	0
7691	1000000007691	Judul Buku 7691	0
7692	1000000007692	Judul Buku 7692	0
7693	1000000007693	Judul Buku 7693	0
7694	1000000007694	Judul Buku 7694	0
7695	1000000007695	Judul Buku 7695	0
7696	1000000007696	Judul Buku 7696	0
7697	1000000007697	Judul Buku 7697	0
7698	1000000007698	Judul Buku 7698	0
7699	1000000007699	Judul Buku 7699	0
7700	1000000007700	Judul Buku 7700	0
7701	1000000007701	Judul Buku 7701	0
7702	1000000007702	Judul Buku 7702	0
7703	1000000007703	Judul Buku 7703	0
7704	1000000007704	Judul Buku 7704	0
7705	1000000007705	Judul Buku 7705	0
7706	1000000007706	Judul Buku 7706	0
7707	1000000007707	Judul Buku 7707	0
7708	1000000007708	Judul Buku 7708	0
7709	1000000007709	Judul Buku 7709	0
7710	1000000007710	Judul Buku 7710	0
7711	1000000007711	Judul Buku 7711	0
7712	1000000007712	Judul Buku 7712	0
7713	1000000007713	Judul Buku 7713	0
7714	1000000007714	Judul Buku 7714	0
7715	1000000007715	Judul Buku 7715	0
7716	1000000007716	Judul Buku 7716	0
7717	1000000007717	Judul Buku 7717	0
7718	1000000007718	Judul Buku 7718	0
7719	1000000007719	Judul Buku 7719	0
7720	1000000007720	Judul Buku 7720	0
7721	1000000007721	Judul Buku 7721	0
7722	1000000007722	Judul Buku 7722	0
7723	1000000007723	Judul Buku 7723	0
7724	1000000007724	Judul Buku 7724	0
7725	1000000007725	Judul Buku 7725	0
7726	1000000007726	Judul Buku 7726	0
7727	1000000007727	Judul Buku 7727	0
7728	1000000007728	Judul Buku 7728	0
7729	1000000007729	Judul Buku 7729	0
7730	1000000007730	Judul Buku 7730	0
7731	1000000007731	Judul Buku 7731	0
7732	1000000007732	Judul Buku 7732	0
7733	1000000007733	Judul Buku 7733	0
7734	1000000007734	Judul Buku 7734	0
7735	1000000007735	Judul Buku 7735	0
7736	1000000007736	Judul Buku 7736	0
7737	1000000007737	Judul Buku 7737	0
7738	1000000007738	Judul Buku 7738	0
7739	1000000007739	Judul Buku 7739	0
7740	1000000007740	Judul Buku 7740	0
7741	1000000007741	Judul Buku 7741	0
7742	1000000007742	Judul Buku 7742	0
7743	1000000007743	Judul Buku 7743	0
7744	1000000007744	Judul Buku 7744	0
7745	1000000007745	Judul Buku 7745	0
7746	1000000007746	Judul Buku 7746	0
7747	1000000007747	Judul Buku 7747	0
7748	1000000007748	Judul Buku 7748	0
7749	1000000007749	Judul Buku 7749	0
7750	1000000007750	Judul Buku 7750	0
7751	1000000007751	Judul Buku 7751	0
7752	1000000007752	Judul Buku 7752	0
7753	1000000007753	Judul Buku 7753	0
7754	1000000007754	Judul Buku 7754	0
7755	1000000007755	Judul Buku 7755	0
7756	1000000007756	Judul Buku 7756	0
7757	1000000007757	Judul Buku 7757	0
7758	1000000007758	Judul Buku 7758	0
7759	1000000007759	Judul Buku 7759	0
7760	1000000007760	Judul Buku 7760	0
7761	1000000007761	Judul Buku 7761	0
7762	1000000007762	Judul Buku 7762	0
7763	1000000007763	Judul Buku 7763	0
7764	1000000007764	Judul Buku 7764	0
7765	1000000007765	Judul Buku 7765	0
7766	1000000007766	Judul Buku 7766	0
7767	1000000007767	Judul Buku 7767	0
7768	1000000007768	Judul Buku 7768	0
7769	1000000007769	Judul Buku 7769	0
7770	1000000007770	Judul Buku 7770	0
7771	1000000007771	Judul Buku 7771	0
7772	1000000007772	Judul Buku 7772	0
7773	1000000007773	Judul Buku 7773	0
7774	1000000007774	Judul Buku 7774	0
7775	1000000007775	Judul Buku 7775	0
7776	1000000007776	Judul Buku 7776	0
7777	1000000007777	Judul Buku 7777	0
7778	1000000007778	Judul Buku 7778	0
7779	1000000007779	Judul Buku 7779	0
7780	1000000007780	Judul Buku 7780	0
7781	1000000007781	Judul Buku 7781	0
7782	1000000007782	Judul Buku 7782	0
7783	1000000007783	Judul Buku 7783	0
7784	1000000007784	Judul Buku 7784	0
7785	1000000007785	Judul Buku 7785	0
7786	1000000007786	Judul Buku 7786	0
7787	1000000007787	Judul Buku 7787	0
7788	1000000007788	Judul Buku 7788	0
7789	1000000007789	Judul Buku 7789	0
7790	1000000007790	Judul Buku 7790	0
7791	1000000007791	Judul Buku 7791	0
7792	1000000007792	Judul Buku 7792	0
7793	1000000007793	Judul Buku 7793	0
7794	1000000007794	Judul Buku 7794	0
7795	1000000007795	Judul Buku 7795	0
7796	1000000007796	Judul Buku 7796	0
7797	1000000007797	Judul Buku 7797	0
7798	1000000007798	Judul Buku 7798	0
7799	1000000007799	Judul Buku 7799	0
7800	1000000007800	Judul Buku 7800	0
7801	1000000007801	Judul Buku 7801	0
7802	1000000007802	Judul Buku 7802	0
7803	1000000007803	Judul Buku 7803	0
7804	1000000007804	Judul Buku 7804	0
7805	1000000007805	Judul Buku 7805	0
7806	1000000007806	Judul Buku 7806	0
7807	1000000007807	Judul Buku 7807	0
7808	1000000007808	Judul Buku 7808	0
7809	1000000007809	Judul Buku 7809	0
7810	1000000007810	Judul Buku 7810	0
7811	1000000007811	Judul Buku 7811	0
7812	1000000007812	Judul Buku 7812	0
7813	1000000007813	Judul Buku 7813	0
7814	1000000007814	Judul Buku 7814	0
7815	1000000007815	Judul Buku 7815	0
7816	1000000007816	Judul Buku 7816	0
7817	1000000007817	Judul Buku 7817	0
7818	1000000007818	Judul Buku 7818	0
7819	1000000007819	Judul Buku 7819	0
7820	1000000007820	Judul Buku 7820	0
7821	1000000007821	Judul Buku 7821	0
7822	1000000007822	Judul Buku 7822	0
7823	1000000007823	Judul Buku 7823	0
7824	1000000007824	Judul Buku 7824	0
7825	1000000007825	Judul Buku 7825	0
7826	1000000007826	Judul Buku 7826	0
7827	1000000007827	Judul Buku 7827	0
7828	1000000007828	Judul Buku 7828	0
7829	1000000007829	Judul Buku 7829	0
7830	1000000007830	Judul Buku 7830	0
7831	1000000007831	Judul Buku 7831	0
7832	1000000007832	Judul Buku 7832	0
7833	1000000007833	Judul Buku 7833	0
7834	1000000007834	Judul Buku 7834	0
7835	1000000007835	Judul Buku 7835	0
7836	1000000007836	Judul Buku 7836	0
7837	1000000007837	Judul Buku 7837	0
7838	1000000007838	Judul Buku 7838	0
7839	1000000007839	Judul Buku 7839	0
7840	1000000007840	Judul Buku 7840	0
7841	1000000007841	Judul Buku 7841	0
7842	1000000007842	Judul Buku 7842	0
7843	1000000007843	Judul Buku 7843	0
7844	1000000007844	Judul Buku 7844	0
7845	1000000007845	Judul Buku 7845	0
7846	1000000007846	Judul Buku 7846	0
7847	1000000007847	Judul Buku 7847	0
7848	1000000007848	Judul Buku 7848	0
7849	1000000007849	Judul Buku 7849	0
7850	1000000007850	Judul Buku 7850	0
7851	1000000007851	Judul Buku 7851	0
7852	1000000007852	Judul Buku 7852	0
7853	1000000007853	Judul Buku 7853	0
7854	1000000007854	Judul Buku 7854	0
7855	1000000007855	Judul Buku 7855	0
7856	1000000007856	Judul Buku 7856	0
7857	1000000007857	Judul Buku 7857	0
7858	1000000007858	Judul Buku 7858	0
7859	1000000007859	Judul Buku 7859	0
7860	1000000007860	Judul Buku 7860	0
7861	1000000007861	Judul Buku 7861	0
7862	1000000007862	Judul Buku 7862	0
7863	1000000007863	Judul Buku 7863	0
7864	1000000007864	Judul Buku 7864	0
7865	1000000007865	Judul Buku 7865	0
7866	1000000007866	Judul Buku 7866	0
7867	1000000007867	Judul Buku 7867	0
7868	1000000007868	Judul Buku 7868	0
7869	1000000007869	Judul Buku 7869	0
7870	1000000007870	Judul Buku 7870	0
7871	1000000007871	Judul Buku 7871	0
7872	1000000007872	Judul Buku 7872	0
7873	1000000007873	Judul Buku 7873	0
7874	1000000007874	Judul Buku 7874	0
7875	1000000007875	Judul Buku 7875	0
7876	1000000007876	Judul Buku 7876	0
7877	1000000007877	Judul Buku 7877	0
7878	1000000007878	Judul Buku 7878	0
7879	1000000007879	Judul Buku 7879	0
7880	1000000007880	Judul Buku 7880	0
7881	1000000007881	Judul Buku 7881	0
7882	1000000007882	Judul Buku 7882	0
7883	1000000007883	Judul Buku 7883	0
7884	1000000007884	Judul Buku 7884	0
7885	1000000007885	Judul Buku 7885	0
7886	1000000007886	Judul Buku 7886	0
7887	1000000007887	Judul Buku 7887	0
7888	1000000007888	Judul Buku 7888	0
7889	1000000007889	Judul Buku 7889	0
7890	1000000007890	Judul Buku 7890	0
7891	1000000007891	Judul Buku 7891	0
7892	1000000007892	Judul Buku 7892	0
7893	1000000007893	Judul Buku 7893	0
7894	1000000007894	Judul Buku 7894	0
7895	1000000007895	Judul Buku 7895	0
7896	1000000007896	Judul Buku 7896	0
7897	1000000007897	Judul Buku 7897	0
7898	1000000007898	Judul Buku 7898	0
7899	1000000007899	Judul Buku 7899	0
7900	1000000007900	Judul Buku 7900	0
7901	1000000007901	Judul Buku 7901	0
7902	1000000007902	Judul Buku 7902	0
7903	1000000007903	Judul Buku 7903	0
7904	1000000007904	Judul Buku 7904	0
7905	1000000007905	Judul Buku 7905	0
7906	1000000007906	Judul Buku 7906	0
7907	1000000007907	Judul Buku 7907	0
7908	1000000007908	Judul Buku 7908	0
7909	1000000007909	Judul Buku 7909	0
7910	1000000007910	Judul Buku 7910	0
7911	1000000007911	Judul Buku 7911	0
7912	1000000007912	Judul Buku 7912	0
7913	1000000007913	Judul Buku 7913	0
7914	1000000007914	Judul Buku 7914	0
7915	1000000007915	Judul Buku 7915	0
7916	1000000007916	Judul Buku 7916	0
7917	1000000007917	Judul Buku 7917	0
7918	1000000007918	Judul Buku 7918	0
7919	1000000007919	Judul Buku 7919	0
7920	1000000007920	Judul Buku 7920	0
7921	1000000007921	Judul Buku 7921	0
7922	1000000007922	Judul Buku 7922	0
7923	1000000007923	Judul Buku 7923	0
7924	1000000007924	Judul Buku 7924	0
7925	1000000007925	Judul Buku 7925	0
7926	1000000007926	Judul Buku 7926	0
7927	1000000007927	Judul Buku 7927	0
7928	1000000007928	Judul Buku 7928	0
7929	1000000007929	Judul Buku 7929	0
7930	1000000007930	Judul Buku 7930	0
7931	1000000007931	Judul Buku 7931	0
7932	1000000007932	Judul Buku 7932	0
7933	1000000007933	Judul Buku 7933	0
7934	1000000007934	Judul Buku 7934	0
7935	1000000007935	Judul Buku 7935	0
7936	1000000007936	Judul Buku 7936	0
7937	1000000007937	Judul Buku 7937	0
7938	1000000007938	Judul Buku 7938	0
7939	1000000007939	Judul Buku 7939	0
7940	1000000007940	Judul Buku 7940	0
7941	1000000007941	Judul Buku 7941	0
7942	1000000007942	Judul Buku 7942	0
7943	1000000007943	Judul Buku 7943	0
7944	1000000007944	Judul Buku 7944	0
7945	1000000007945	Judul Buku 7945	0
7946	1000000007946	Judul Buku 7946	0
7947	1000000007947	Judul Buku 7947	0
7948	1000000007948	Judul Buku 7948	0
7949	1000000007949	Judul Buku 7949	0
7950	1000000007950	Judul Buku 7950	0
7951	1000000007951	Judul Buku 7951	0
7952	1000000007952	Judul Buku 7952	0
7953	1000000007953	Judul Buku 7953	0
7954	1000000007954	Judul Buku 7954	0
7955	1000000007955	Judul Buku 7955	0
7956	1000000007956	Judul Buku 7956	0
7957	1000000007957	Judul Buku 7957	0
7958	1000000007958	Judul Buku 7958	0
7959	1000000007959	Judul Buku 7959	0
7960	1000000007960	Judul Buku 7960	0
7961	1000000007961	Judul Buku 7961	0
7962	1000000007962	Judul Buku 7962	0
7963	1000000007963	Judul Buku 7963	0
7964	1000000007964	Judul Buku 7964	0
7965	1000000007965	Judul Buku 7965	0
7966	1000000007966	Judul Buku 7966	0
7967	1000000007967	Judul Buku 7967	0
7968	1000000007968	Judul Buku 7968	0
7969	1000000007969	Judul Buku 7969	0
7970	1000000007970	Judul Buku 7970	0
7971	1000000007971	Judul Buku 7971	0
7972	1000000007972	Judul Buku 7972	0
7973	1000000007973	Judul Buku 7973	0
7974	1000000007974	Judul Buku 7974	0
7975	1000000007975	Judul Buku 7975	0
7976	1000000007976	Judul Buku 7976	0
7977	1000000007977	Judul Buku 7977	0
7978	1000000007978	Judul Buku 7978	0
7979	1000000007979	Judul Buku 7979	0
7980	1000000007980	Judul Buku 7980	0
7981	1000000007981	Judul Buku 7981	0
7982	1000000007982	Judul Buku 7982	0
7983	1000000007983	Judul Buku 7983	0
7984	1000000007984	Judul Buku 7984	0
7985	1000000007985	Judul Buku 7985	0
7986	1000000007986	Judul Buku 7986	0
7987	1000000007987	Judul Buku 7987	0
7988	1000000007988	Judul Buku 7988	0
7989	1000000007989	Judul Buku 7989	0
7990	1000000007990	Judul Buku 7990	0
7991	1000000007991	Judul Buku 7991	0
7992	1000000007992	Judul Buku 7992	0
7993	1000000007993	Judul Buku 7993	0
7994	1000000007994	Judul Buku 7994	0
7995	1000000007995	Judul Buku 7995	0
7996	1000000007996	Judul Buku 7996	0
7997	1000000007997	Judul Buku 7997	0
7998	1000000007998	Judul Buku 7998	0
7999	1000000007999	Judul Buku 7999	0
8000	1000000008000	Judul Buku 8000	0
8001	1000000008001	Judul Buku 8001	0
8002	1000000008002	Judul Buku 8002	0
8003	1000000008003	Judul Buku 8003	0
8004	1000000008004	Judul Buku 8004	0
8005	1000000008005	Judul Buku 8005	0
8006	1000000008006	Judul Buku 8006	0
8007	1000000008007	Judul Buku 8007	0
8008	1000000008008	Judul Buku 8008	0
8009	1000000008009	Judul Buku 8009	0
8010	1000000008010	Judul Buku 8010	0
8011	1000000008011	Judul Buku 8011	0
8012	1000000008012	Judul Buku 8012	0
8013	1000000008013	Judul Buku 8013	0
8014	1000000008014	Judul Buku 8014	0
8015	1000000008015	Judul Buku 8015	0
8016	1000000008016	Judul Buku 8016	0
8017	1000000008017	Judul Buku 8017	0
8018	1000000008018	Judul Buku 8018	0
8019	1000000008019	Judul Buku 8019	0
8020	1000000008020	Judul Buku 8020	0
8021	1000000008021	Judul Buku 8021	0
8022	1000000008022	Judul Buku 8022	0
8023	1000000008023	Judul Buku 8023	0
8024	1000000008024	Judul Buku 8024	0
8025	1000000008025	Judul Buku 8025	0
8026	1000000008026	Judul Buku 8026	0
8027	1000000008027	Judul Buku 8027	0
8028	1000000008028	Judul Buku 8028	0
8029	1000000008029	Judul Buku 8029	0
8030	1000000008030	Judul Buku 8030	0
8031	1000000008031	Judul Buku 8031	0
8032	1000000008032	Judul Buku 8032	0
8033	1000000008033	Judul Buku 8033	0
8034	1000000008034	Judul Buku 8034	0
8035	1000000008035	Judul Buku 8035	0
8036	1000000008036	Judul Buku 8036	0
8037	1000000008037	Judul Buku 8037	0
8038	1000000008038	Judul Buku 8038	0
8039	1000000008039	Judul Buku 8039	0
8040	1000000008040	Judul Buku 8040	0
8041	1000000008041	Judul Buku 8041	0
8042	1000000008042	Judul Buku 8042	0
8043	1000000008043	Judul Buku 8043	0
8044	1000000008044	Judul Buku 8044	0
8045	1000000008045	Judul Buku 8045	0
8046	1000000008046	Judul Buku 8046	0
8047	1000000008047	Judul Buku 8047	0
8048	1000000008048	Judul Buku 8048	0
8049	1000000008049	Judul Buku 8049	0
8050	1000000008050	Judul Buku 8050	0
8051	1000000008051	Judul Buku 8051	0
8052	1000000008052	Judul Buku 8052	0
8053	1000000008053	Judul Buku 8053	0
8054	1000000008054	Judul Buku 8054	0
8055	1000000008055	Judul Buku 8055	0
8056	1000000008056	Judul Buku 8056	0
8057	1000000008057	Judul Buku 8057	0
8058	1000000008058	Judul Buku 8058	0
8059	1000000008059	Judul Buku 8059	0
8060	1000000008060	Judul Buku 8060	0
8061	1000000008061	Judul Buku 8061	0
8062	1000000008062	Judul Buku 8062	0
8063	1000000008063	Judul Buku 8063	0
8064	1000000008064	Judul Buku 8064	0
8065	1000000008065	Judul Buku 8065	0
8066	1000000008066	Judul Buku 8066	0
8067	1000000008067	Judul Buku 8067	0
8068	1000000008068	Judul Buku 8068	0
8069	1000000008069	Judul Buku 8069	0
8070	1000000008070	Judul Buku 8070	0
8071	1000000008071	Judul Buku 8071	0
8072	1000000008072	Judul Buku 8072	0
8073	1000000008073	Judul Buku 8073	0
8074	1000000008074	Judul Buku 8074	0
8075	1000000008075	Judul Buku 8075	0
8076	1000000008076	Judul Buku 8076	0
8077	1000000008077	Judul Buku 8077	0
8078	1000000008078	Judul Buku 8078	0
8079	1000000008079	Judul Buku 8079	0
8080	1000000008080	Judul Buku 8080	0
8081	1000000008081	Judul Buku 8081	0
8082	1000000008082	Judul Buku 8082	0
8083	1000000008083	Judul Buku 8083	0
8084	1000000008084	Judul Buku 8084	0
8085	1000000008085	Judul Buku 8085	0
8086	1000000008086	Judul Buku 8086	0
8087	1000000008087	Judul Buku 8087	0
8088	1000000008088	Judul Buku 8088	0
8089	1000000008089	Judul Buku 8089	0
8090	1000000008090	Judul Buku 8090	0
8091	1000000008091	Judul Buku 8091	0
8092	1000000008092	Judul Buku 8092	0
8093	1000000008093	Judul Buku 8093	0
8094	1000000008094	Judul Buku 8094	0
8095	1000000008095	Judul Buku 8095	0
8096	1000000008096	Judul Buku 8096	0
8097	1000000008097	Judul Buku 8097	0
8098	1000000008098	Judul Buku 8098	0
8099	1000000008099	Judul Buku 8099	0
8100	1000000008100	Judul Buku 8100	0
8101	1000000008101	Judul Buku 8101	0
8102	1000000008102	Judul Buku 8102	0
8103	1000000008103	Judul Buku 8103	0
8104	1000000008104	Judul Buku 8104	0
8105	1000000008105	Judul Buku 8105	0
8106	1000000008106	Judul Buku 8106	0
8107	1000000008107	Judul Buku 8107	0
8108	1000000008108	Judul Buku 8108	0
8109	1000000008109	Judul Buku 8109	0
8110	1000000008110	Judul Buku 8110	0
8111	1000000008111	Judul Buku 8111	0
8112	1000000008112	Judul Buku 8112	0
8113	1000000008113	Judul Buku 8113	0
8114	1000000008114	Judul Buku 8114	0
8115	1000000008115	Judul Buku 8115	0
8116	1000000008116	Judul Buku 8116	0
8117	1000000008117	Judul Buku 8117	0
8118	1000000008118	Judul Buku 8118	0
8119	1000000008119	Judul Buku 8119	0
8120	1000000008120	Judul Buku 8120	0
8121	1000000008121	Judul Buku 8121	0
8122	1000000008122	Judul Buku 8122	0
8123	1000000008123	Judul Buku 8123	0
8124	1000000008124	Judul Buku 8124	0
8125	1000000008125	Judul Buku 8125	0
8126	1000000008126	Judul Buku 8126	0
8127	1000000008127	Judul Buku 8127	0
8128	1000000008128	Judul Buku 8128	0
8129	1000000008129	Judul Buku 8129	0
8130	1000000008130	Judul Buku 8130	0
8131	1000000008131	Judul Buku 8131	0
8132	1000000008132	Judul Buku 8132	0
8133	1000000008133	Judul Buku 8133	0
8134	1000000008134	Judul Buku 8134	0
8135	1000000008135	Judul Buku 8135	0
8136	1000000008136	Judul Buku 8136	0
8137	1000000008137	Judul Buku 8137	0
8138	1000000008138	Judul Buku 8138	0
8139	1000000008139	Judul Buku 8139	0
8140	1000000008140	Judul Buku 8140	0
8141	1000000008141	Judul Buku 8141	0
8142	1000000008142	Judul Buku 8142	0
8143	1000000008143	Judul Buku 8143	0
8144	1000000008144	Judul Buku 8144	0
8145	1000000008145	Judul Buku 8145	0
8146	1000000008146	Judul Buku 8146	0
8147	1000000008147	Judul Buku 8147	0
8148	1000000008148	Judul Buku 8148	0
8149	1000000008149	Judul Buku 8149	0
8150	1000000008150	Judul Buku 8150	0
8151	1000000008151	Judul Buku 8151	0
8152	1000000008152	Judul Buku 8152	0
8153	1000000008153	Judul Buku 8153	0
8154	1000000008154	Judul Buku 8154	0
8155	1000000008155	Judul Buku 8155	0
8156	1000000008156	Judul Buku 8156	0
8157	1000000008157	Judul Buku 8157	0
8158	1000000008158	Judul Buku 8158	0
8159	1000000008159	Judul Buku 8159	0
8160	1000000008160	Judul Buku 8160	0
8161	1000000008161	Judul Buku 8161	0
8162	1000000008162	Judul Buku 8162	0
8163	1000000008163	Judul Buku 8163	0
8164	1000000008164	Judul Buku 8164	0
8165	1000000008165	Judul Buku 8165	0
8166	1000000008166	Judul Buku 8166	0
8167	1000000008167	Judul Buku 8167	0
8168	1000000008168	Judul Buku 8168	0
8169	1000000008169	Judul Buku 8169	0
8170	1000000008170	Judul Buku 8170	0
8171	1000000008171	Judul Buku 8171	0
8172	1000000008172	Judul Buku 8172	0
8173	1000000008173	Judul Buku 8173	0
8174	1000000008174	Judul Buku 8174	0
8175	1000000008175	Judul Buku 8175	0
8176	1000000008176	Judul Buku 8176	0
8177	1000000008177	Judul Buku 8177	0
8178	1000000008178	Judul Buku 8178	0
8179	1000000008179	Judul Buku 8179	0
8180	1000000008180	Judul Buku 8180	0
8181	1000000008181	Judul Buku 8181	0
8182	1000000008182	Judul Buku 8182	0
8183	1000000008183	Judul Buku 8183	0
8184	1000000008184	Judul Buku 8184	0
8185	1000000008185	Judul Buku 8185	0
8186	1000000008186	Judul Buku 8186	0
8187	1000000008187	Judul Buku 8187	0
8188	1000000008188	Judul Buku 8188	0
8189	1000000008189	Judul Buku 8189	0
8190	1000000008190	Judul Buku 8190	0
8191	1000000008191	Judul Buku 8191	0
8192	1000000008192	Judul Buku 8192	0
8193	1000000008193	Judul Buku 8193	0
8194	1000000008194	Judul Buku 8194	0
8195	1000000008195	Judul Buku 8195	0
8196	1000000008196	Judul Buku 8196	0
8197	1000000008197	Judul Buku 8197	0
8198	1000000008198	Judul Buku 8198	0
8199	1000000008199	Judul Buku 8199	0
8200	1000000008200	Judul Buku 8200	0
8201	1000000008201	Judul Buku 8201	0
8202	1000000008202	Judul Buku 8202	0
8203	1000000008203	Judul Buku 8203	0
8204	1000000008204	Judul Buku 8204	0
8205	1000000008205	Judul Buku 8205	0
8206	1000000008206	Judul Buku 8206	0
8207	1000000008207	Judul Buku 8207	0
8208	1000000008208	Judul Buku 8208	0
8209	1000000008209	Judul Buku 8209	0
8210	1000000008210	Judul Buku 8210	0
8211	1000000008211	Judul Buku 8211	0
8212	1000000008212	Judul Buku 8212	0
8213	1000000008213	Judul Buku 8213	0
8214	1000000008214	Judul Buku 8214	0
8215	1000000008215	Judul Buku 8215	0
8216	1000000008216	Judul Buku 8216	0
8217	1000000008217	Judul Buku 8217	0
8218	1000000008218	Judul Buku 8218	0
8219	1000000008219	Judul Buku 8219	0
8220	1000000008220	Judul Buku 8220	0
8221	1000000008221	Judul Buku 8221	0
8222	1000000008222	Judul Buku 8222	0
8223	1000000008223	Judul Buku 8223	0
8224	1000000008224	Judul Buku 8224	0
8225	1000000008225	Judul Buku 8225	0
8226	1000000008226	Judul Buku 8226	0
8227	1000000008227	Judul Buku 8227	0
8228	1000000008228	Judul Buku 8228	0
8229	1000000008229	Judul Buku 8229	0
8230	1000000008230	Judul Buku 8230	0
8231	1000000008231	Judul Buku 8231	0
8232	1000000008232	Judul Buku 8232	0
8233	1000000008233	Judul Buku 8233	0
8234	1000000008234	Judul Buku 8234	0
8235	1000000008235	Judul Buku 8235	0
8236	1000000008236	Judul Buku 8236	0
8237	1000000008237	Judul Buku 8237	0
8238	1000000008238	Judul Buku 8238	0
8239	1000000008239	Judul Buku 8239	0
8240	1000000008240	Judul Buku 8240	0
8241	1000000008241	Judul Buku 8241	0
8242	1000000008242	Judul Buku 8242	0
8243	1000000008243	Judul Buku 8243	0
8244	1000000008244	Judul Buku 8244	0
8245	1000000008245	Judul Buku 8245	0
8246	1000000008246	Judul Buku 8246	0
8247	1000000008247	Judul Buku 8247	0
8248	1000000008248	Judul Buku 8248	0
8249	1000000008249	Judul Buku 8249	0
8250	1000000008250	Judul Buku 8250	0
8251	1000000008251	Judul Buku 8251	0
8252	1000000008252	Judul Buku 8252	0
8253	1000000008253	Judul Buku 8253	0
8254	1000000008254	Judul Buku 8254	0
8255	1000000008255	Judul Buku 8255	0
8256	1000000008256	Judul Buku 8256	0
8257	1000000008257	Judul Buku 8257	0
8258	1000000008258	Judul Buku 8258	0
8259	1000000008259	Judul Buku 8259	0
8260	1000000008260	Judul Buku 8260	0
8261	1000000008261	Judul Buku 8261	0
8262	1000000008262	Judul Buku 8262	0
8263	1000000008263	Judul Buku 8263	0
8264	1000000008264	Judul Buku 8264	0
8265	1000000008265	Judul Buku 8265	0
8266	1000000008266	Judul Buku 8266	0
8267	1000000008267	Judul Buku 8267	0
8268	1000000008268	Judul Buku 8268	0
8269	1000000008269	Judul Buku 8269	0
8270	1000000008270	Judul Buku 8270	0
8271	1000000008271	Judul Buku 8271	0
8272	1000000008272	Judul Buku 8272	0
8273	1000000008273	Judul Buku 8273	0
8274	1000000008274	Judul Buku 8274	0
8275	1000000008275	Judul Buku 8275	0
8276	1000000008276	Judul Buku 8276	0
8277	1000000008277	Judul Buku 8277	0
8278	1000000008278	Judul Buku 8278	0
8279	1000000008279	Judul Buku 8279	0
8280	1000000008280	Judul Buku 8280	0
8281	1000000008281	Judul Buku 8281	0
8282	1000000008282	Judul Buku 8282	0
8283	1000000008283	Judul Buku 8283	0
8284	1000000008284	Judul Buku 8284	0
8285	1000000008285	Judul Buku 8285	0
8286	1000000008286	Judul Buku 8286	0
8287	1000000008287	Judul Buku 8287	0
8288	1000000008288	Judul Buku 8288	0
8289	1000000008289	Judul Buku 8289	0
8290	1000000008290	Judul Buku 8290	0
8291	1000000008291	Judul Buku 8291	0
8292	1000000008292	Judul Buku 8292	0
8293	1000000008293	Judul Buku 8293	0
8294	1000000008294	Judul Buku 8294	0
8295	1000000008295	Judul Buku 8295	0
8296	1000000008296	Judul Buku 8296	0
8297	1000000008297	Judul Buku 8297	0
8298	1000000008298	Judul Buku 8298	0
8299	1000000008299	Judul Buku 8299	0
8300	1000000008300	Judul Buku 8300	0
8301	1000000008301	Judul Buku 8301	0
8302	1000000008302	Judul Buku 8302	0
8303	1000000008303	Judul Buku 8303	0
8304	1000000008304	Judul Buku 8304	0
8305	1000000008305	Judul Buku 8305	0
8306	1000000008306	Judul Buku 8306	0
8307	1000000008307	Judul Buku 8307	0
8308	1000000008308	Judul Buku 8308	0
8309	1000000008309	Judul Buku 8309	0
8310	1000000008310	Judul Buku 8310	0
8311	1000000008311	Judul Buku 8311	0
8312	1000000008312	Judul Buku 8312	0
8313	1000000008313	Judul Buku 8313	0
8314	1000000008314	Judul Buku 8314	0
8315	1000000008315	Judul Buku 8315	0
8316	1000000008316	Judul Buku 8316	0
8317	1000000008317	Judul Buku 8317	0
8318	1000000008318	Judul Buku 8318	0
8319	1000000008319	Judul Buku 8319	0
8320	1000000008320	Judul Buku 8320	0
8321	1000000008321	Judul Buku 8321	0
8322	1000000008322	Judul Buku 8322	0
8323	1000000008323	Judul Buku 8323	0
8324	1000000008324	Judul Buku 8324	0
8325	1000000008325	Judul Buku 8325	0
8326	1000000008326	Judul Buku 8326	0
8327	1000000008327	Judul Buku 8327	0
8328	1000000008328	Judul Buku 8328	0
8329	1000000008329	Judul Buku 8329	0
8330	1000000008330	Judul Buku 8330	0
8331	1000000008331	Judul Buku 8331	0
8332	1000000008332	Judul Buku 8332	0
8333	1000000008333	Judul Buku 8333	0
8334	1000000008334	Judul Buku 8334	0
8335	1000000008335	Judul Buku 8335	0
8336	1000000008336	Judul Buku 8336	0
8337	1000000008337	Judul Buku 8337	0
8338	1000000008338	Judul Buku 8338	0
8339	1000000008339	Judul Buku 8339	0
8340	1000000008340	Judul Buku 8340	0
8341	1000000008341	Judul Buku 8341	0
8342	1000000008342	Judul Buku 8342	0
8343	1000000008343	Judul Buku 8343	0
8344	1000000008344	Judul Buku 8344	0
8345	1000000008345	Judul Buku 8345	0
8346	1000000008346	Judul Buku 8346	0
8347	1000000008347	Judul Buku 8347	0
8348	1000000008348	Judul Buku 8348	0
8349	1000000008349	Judul Buku 8349	0
8350	1000000008350	Judul Buku 8350	0
8351	1000000008351	Judul Buku 8351	0
8352	1000000008352	Judul Buku 8352	0
8353	1000000008353	Judul Buku 8353	0
8354	1000000008354	Judul Buku 8354	0
8355	1000000008355	Judul Buku 8355	0
8356	1000000008356	Judul Buku 8356	0
8357	1000000008357	Judul Buku 8357	0
8358	1000000008358	Judul Buku 8358	0
8359	1000000008359	Judul Buku 8359	0
8360	1000000008360	Judul Buku 8360	0
8361	1000000008361	Judul Buku 8361	0
8362	1000000008362	Judul Buku 8362	0
8363	1000000008363	Judul Buku 8363	0
8364	1000000008364	Judul Buku 8364	0
8365	1000000008365	Judul Buku 8365	0
8366	1000000008366	Judul Buku 8366	0
8367	1000000008367	Judul Buku 8367	0
8368	1000000008368	Judul Buku 8368	0
8369	1000000008369	Judul Buku 8369	0
8370	1000000008370	Judul Buku 8370	0
8371	1000000008371	Judul Buku 8371	0
8372	1000000008372	Judul Buku 8372	0
8373	1000000008373	Judul Buku 8373	0
8374	1000000008374	Judul Buku 8374	0
8375	1000000008375	Judul Buku 8375	0
8376	1000000008376	Judul Buku 8376	0
8377	1000000008377	Judul Buku 8377	0
8378	1000000008378	Judul Buku 8378	0
8379	1000000008379	Judul Buku 8379	0
8380	1000000008380	Judul Buku 8380	0
8381	1000000008381	Judul Buku 8381	0
8382	1000000008382	Judul Buku 8382	0
8383	1000000008383	Judul Buku 8383	0
8384	1000000008384	Judul Buku 8384	0
8385	1000000008385	Judul Buku 8385	0
8386	1000000008386	Judul Buku 8386	0
8387	1000000008387	Judul Buku 8387	0
8388	1000000008388	Judul Buku 8388	0
8389	1000000008389	Judul Buku 8389	0
8390	1000000008390	Judul Buku 8390	0
8391	1000000008391	Judul Buku 8391	0
8392	1000000008392	Judul Buku 8392	0
8393	1000000008393	Judul Buku 8393	0
8394	1000000008394	Judul Buku 8394	0
8395	1000000008395	Judul Buku 8395	0
8396	1000000008396	Judul Buku 8396	0
8397	1000000008397	Judul Buku 8397	0
8398	1000000008398	Judul Buku 8398	0
8399	1000000008399	Judul Buku 8399	0
8400	1000000008400	Judul Buku 8400	0
8401	1000000008401	Judul Buku 8401	0
8402	1000000008402	Judul Buku 8402	0
8403	1000000008403	Judul Buku 8403	0
8404	1000000008404	Judul Buku 8404	0
8405	1000000008405	Judul Buku 8405	0
8406	1000000008406	Judul Buku 8406	0
8407	1000000008407	Judul Buku 8407	0
8408	1000000008408	Judul Buku 8408	0
8409	1000000008409	Judul Buku 8409	0
8410	1000000008410	Judul Buku 8410	0
8411	1000000008411	Judul Buku 8411	0
8412	1000000008412	Judul Buku 8412	0
8413	1000000008413	Judul Buku 8413	0
8414	1000000008414	Judul Buku 8414	0
8415	1000000008415	Judul Buku 8415	0
8416	1000000008416	Judul Buku 8416	0
8417	1000000008417	Judul Buku 8417	0
8418	1000000008418	Judul Buku 8418	0
8419	1000000008419	Judul Buku 8419	0
8420	1000000008420	Judul Buku 8420	0
8421	1000000008421	Judul Buku 8421	0
8422	1000000008422	Judul Buku 8422	0
8423	1000000008423	Judul Buku 8423	0
8424	1000000008424	Judul Buku 8424	0
8425	1000000008425	Judul Buku 8425	0
8426	1000000008426	Judul Buku 8426	0
8427	1000000008427	Judul Buku 8427	0
8428	1000000008428	Judul Buku 8428	0
8429	1000000008429	Judul Buku 8429	0
8430	1000000008430	Judul Buku 8430	0
8431	1000000008431	Judul Buku 8431	0
8432	1000000008432	Judul Buku 8432	0
8433	1000000008433	Judul Buku 8433	0
8434	1000000008434	Judul Buku 8434	0
8435	1000000008435	Judul Buku 8435	0
8436	1000000008436	Judul Buku 8436	0
8437	1000000008437	Judul Buku 8437	0
8438	1000000008438	Judul Buku 8438	0
8439	1000000008439	Judul Buku 8439	0
8440	1000000008440	Judul Buku 8440	0
8441	1000000008441	Judul Buku 8441	0
8442	1000000008442	Judul Buku 8442	0
8443	1000000008443	Judul Buku 8443	0
8444	1000000008444	Judul Buku 8444	0
8445	1000000008445	Judul Buku 8445	0
8446	1000000008446	Judul Buku 8446	0
8447	1000000008447	Judul Buku 8447	0
8448	1000000008448	Judul Buku 8448	0
8449	1000000008449	Judul Buku 8449	0
8450	1000000008450	Judul Buku 8450	0
8451	1000000008451	Judul Buku 8451	0
8452	1000000008452	Judul Buku 8452	0
8453	1000000008453	Judul Buku 8453	0
8454	1000000008454	Judul Buku 8454	0
8455	1000000008455	Judul Buku 8455	0
8456	1000000008456	Judul Buku 8456	0
8457	1000000008457	Judul Buku 8457	0
8458	1000000008458	Judul Buku 8458	0
8459	1000000008459	Judul Buku 8459	0
8460	1000000008460	Judul Buku 8460	0
8461	1000000008461	Judul Buku 8461	0
8462	1000000008462	Judul Buku 8462	0
8463	1000000008463	Judul Buku 8463	0
8464	1000000008464	Judul Buku 8464	0
8465	1000000008465	Judul Buku 8465	0
8466	1000000008466	Judul Buku 8466	0
8467	1000000008467	Judul Buku 8467	0
8468	1000000008468	Judul Buku 8468	0
8469	1000000008469	Judul Buku 8469	0
8470	1000000008470	Judul Buku 8470	0
8471	1000000008471	Judul Buku 8471	0
8472	1000000008472	Judul Buku 8472	0
8473	1000000008473	Judul Buku 8473	0
8474	1000000008474	Judul Buku 8474	0
8475	1000000008475	Judul Buku 8475	0
8476	1000000008476	Judul Buku 8476	0
8477	1000000008477	Judul Buku 8477	0
8478	1000000008478	Judul Buku 8478	0
8479	1000000008479	Judul Buku 8479	0
8480	1000000008480	Judul Buku 8480	0
8481	1000000008481	Judul Buku 8481	0
8482	1000000008482	Judul Buku 8482	0
8483	1000000008483	Judul Buku 8483	0
8484	1000000008484	Judul Buku 8484	0
8485	1000000008485	Judul Buku 8485	0
8486	1000000008486	Judul Buku 8486	0
8487	1000000008487	Judul Buku 8487	0
8488	1000000008488	Judul Buku 8488	0
8489	1000000008489	Judul Buku 8489	0
8490	1000000008490	Judul Buku 8490	0
8491	1000000008491	Judul Buku 8491	0
8492	1000000008492	Judul Buku 8492	0
8493	1000000008493	Judul Buku 8493	0
8494	1000000008494	Judul Buku 8494	0
8495	1000000008495	Judul Buku 8495	0
8496	1000000008496	Judul Buku 8496	0
8497	1000000008497	Judul Buku 8497	0
8498	1000000008498	Judul Buku 8498	0
8499	1000000008499	Judul Buku 8499	0
8500	1000000008500	Judul Buku 8500	0
8501	1000000008501	Judul Buku 8501	0
8502	1000000008502	Judul Buku 8502	0
8503	1000000008503	Judul Buku 8503	0
8504	1000000008504	Judul Buku 8504	0
8505	1000000008505	Judul Buku 8505	0
8506	1000000008506	Judul Buku 8506	0
8507	1000000008507	Judul Buku 8507	0
8508	1000000008508	Judul Buku 8508	0
8509	1000000008509	Judul Buku 8509	0
8510	1000000008510	Judul Buku 8510	0
8511	1000000008511	Judul Buku 8511	0
8512	1000000008512	Judul Buku 8512	0
8513	1000000008513	Judul Buku 8513	0
8514	1000000008514	Judul Buku 8514	0
8515	1000000008515	Judul Buku 8515	0
8516	1000000008516	Judul Buku 8516	0
8517	1000000008517	Judul Buku 8517	0
8518	1000000008518	Judul Buku 8518	0
8519	1000000008519	Judul Buku 8519	0
8520	1000000008520	Judul Buku 8520	0
8521	1000000008521	Judul Buku 8521	0
8522	1000000008522	Judul Buku 8522	0
8523	1000000008523	Judul Buku 8523	0
8524	1000000008524	Judul Buku 8524	0
8525	1000000008525	Judul Buku 8525	0
8526	1000000008526	Judul Buku 8526	0
8527	1000000008527	Judul Buku 8527	0
8528	1000000008528	Judul Buku 8528	0
8529	1000000008529	Judul Buku 8529	0
8530	1000000008530	Judul Buku 8530	0
8531	1000000008531	Judul Buku 8531	0
8532	1000000008532	Judul Buku 8532	0
8533	1000000008533	Judul Buku 8533	0
8534	1000000008534	Judul Buku 8534	0
8535	1000000008535	Judul Buku 8535	0
8536	1000000008536	Judul Buku 8536	0
8537	1000000008537	Judul Buku 8537	0
8538	1000000008538	Judul Buku 8538	0
8539	1000000008539	Judul Buku 8539	0
8540	1000000008540	Judul Buku 8540	0
8541	1000000008541	Judul Buku 8541	0
8542	1000000008542	Judul Buku 8542	0
8543	1000000008543	Judul Buku 8543	0
8544	1000000008544	Judul Buku 8544	0
8545	1000000008545	Judul Buku 8545	0
8546	1000000008546	Judul Buku 8546	0
8547	1000000008547	Judul Buku 8547	0
8548	1000000008548	Judul Buku 8548	0
8549	1000000008549	Judul Buku 8549	0
8550	1000000008550	Judul Buku 8550	0
8551	1000000008551	Judul Buku 8551	0
8552	1000000008552	Judul Buku 8552	0
8553	1000000008553	Judul Buku 8553	0
8554	1000000008554	Judul Buku 8554	0
8555	1000000008555	Judul Buku 8555	0
8556	1000000008556	Judul Buku 8556	0
8557	1000000008557	Judul Buku 8557	0
8558	1000000008558	Judul Buku 8558	0
8559	1000000008559	Judul Buku 8559	0
8560	1000000008560	Judul Buku 8560	0
8561	1000000008561	Judul Buku 8561	0
8562	1000000008562	Judul Buku 8562	0
8563	1000000008563	Judul Buku 8563	0
8564	1000000008564	Judul Buku 8564	0
8565	1000000008565	Judul Buku 8565	0
8566	1000000008566	Judul Buku 8566	0
8567	1000000008567	Judul Buku 8567	0
8568	1000000008568	Judul Buku 8568	0
8569	1000000008569	Judul Buku 8569	0
8570	1000000008570	Judul Buku 8570	0
8571	1000000008571	Judul Buku 8571	0
8572	1000000008572	Judul Buku 8572	0
8573	1000000008573	Judul Buku 8573	0
8574	1000000008574	Judul Buku 8574	0
8575	1000000008575	Judul Buku 8575	0
8576	1000000008576	Judul Buku 8576	0
8577	1000000008577	Judul Buku 8577	0
8578	1000000008578	Judul Buku 8578	0
8579	1000000008579	Judul Buku 8579	0
8580	1000000008580	Judul Buku 8580	0
8581	1000000008581	Judul Buku 8581	0
8582	1000000008582	Judul Buku 8582	0
8583	1000000008583	Judul Buku 8583	0
8584	1000000008584	Judul Buku 8584	0
8585	1000000008585	Judul Buku 8585	0
8586	1000000008586	Judul Buku 8586	0
8587	1000000008587	Judul Buku 8587	0
8588	1000000008588	Judul Buku 8588	0
8589	1000000008589	Judul Buku 8589	0
8590	1000000008590	Judul Buku 8590	0
8591	1000000008591	Judul Buku 8591	0
8592	1000000008592	Judul Buku 8592	0
8593	1000000008593	Judul Buku 8593	0
8594	1000000008594	Judul Buku 8594	0
8595	1000000008595	Judul Buku 8595	0
8596	1000000008596	Judul Buku 8596	0
8597	1000000008597	Judul Buku 8597	0
8598	1000000008598	Judul Buku 8598	0
8599	1000000008599	Judul Buku 8599	0
8600	1000000008600	Judul Buku 8600	0
8601	1000000008601	Judul Buku 8601	0
8602	1000000008602	Judul Buku 8602	0
8603	1000000008603	Judul Buku 8603	0
8604	1000000008604	Judul Buku 8604	0
8605	1000000008605	Judul Buku 8605	0
8606	1000000008606	Judul Buku 8606	0
8607	1000000008607	Judul Buku 8607	0
8608	1000000008608	Judul Buku 8608	0
8609	1000000008609	Judul Buku 8609	0
8610	1000000008610	Judul Buku 8610	0
8611	1000000008611	Judul Buku 8611	0
8612	1000000008612	Judul Buku 8612	0
8613	1000000008613	Judul Buku 8613	0
8614	1000000008614	Judul Buku 8614	0
8615	1000000008615	Judul Buku 8615	0
8616	1000000008616	Judul Buku 8616	0
8617	1000000008617	Judul Buku 8617	0
8618	1000000008618	Judul Buku 8618	0
8619	1000000008619	Judul Buku 8619	0
8620	1000000008620	Judul Buku 8620	0
8621	1000000008621	Judul Buku 8621	0
8622	1000000008622	Judul Buku 8622	0
8623	1000000008623	Judul Buku 8623	0
8624	1000000008624	Judul Buku 8624	0
8625	1000000008625	Judul Buku 8625	0
8626	1000000008626	Judul Buku 8626	0
8627	1000000008627	Judul Buku 8627	0
8628	1000000008628	Judul Buku 8628	0
8629	1000000008629	Judul Buku 8629	0
8630	1000000008630	Judul Buku 8630	0
8631	1000000008631	Judul Buku 8631	0
8632	1000000008632	Judul Buku 8632	0
8633	1000000008633	Judul Buku 8633	0
8634	1000000008634	Judul Buku 8634	0
8635	1000000008635	Judul Buku 8635	0
8636	1000000008636	Judul Buku 8636	0
8637	1000000008637	Judul Buku 8637	0
8638	1000000008638	Judul Buku 8638	0
8639	1000000008639	Judul Buku 8639	0
8640	1000000008640	Judul Buku 8640	0
8641	1000000008641	Judul Buku 8641	0
8642	1000000008642	Judul Buku 8642	0
8643	1000000008643	Judul Buku 8643	0
8644	1000000008644	Judul Buku 8644	0
8645	1000000008645	Judul Buku 8645	0
8646	1000000008646	Judul Buku 8646	0
8647	1000000008647	Judul Buku 8647	0
8648	1000000008648	Judul Buku 8648	0
8649	1000000008649	Judul Buku 8649	0
8650	1000000008650	Judul Buku 8650	0
8651	1000000008651	Judul Buku 8651	0
8652	1000000008652	Judul Buku 8652	0
8653	1000000008653	Judul Buku 8653	0
8654	1000000008654	Judul Buku 8654	0
8655	1000000008655	Judul Buku 8655	0
8656	1000000008656	Judul Buku 8656	0
8657	1000000008657	Judul Buku 8657	0
8658	1000000008658	Judul Buku 8658	0
8659	1000000008659	Judul Buku 8659	0
8660	1000000008660	Judul Buku 8660	0
8661	1000000008661	Judul Buku 8661	0
8662	1000000008662	Judul Buku 8662	0
8663	1000000008663	Judul Buku 8663	0
8664	1000000008664	Judul Buku 8664	0
8665	1000000008665	Judul Buku 8665	0
8666	1000000008666	Judul Buku 8666	0
8667	1000000008667	Judul Buku 8667	0
8668	1000000008668	Judul Buku 8668	0
8669	1000000008669	Judul Buku 8669	0
8670	1000000008670	Judul Buku 8670	0
8671	1000000008671	Judul Buku 8671	0
8672	1000000008672	Judul Buku 8672	0
8673	1000000008673	Judul Buku 8673	0
8674	1000000008674	Judul Buku 8674	0
8675	1000000008675	Judul Buku 8675	0
8676	1000000008676	Judul Buku 8676	0
8677	1000000008677	Judul Buku 8677	0
8678	1000000008678	Judul Buku 8678	0
8679	1000000008679	Judul Buku 8679	0
8680	1000000008680	Judul Buku 8680	0
8681	1000000008681	Judul Buku 8681	0
8682	1000000008682	Judul Buku 8682	0
8683	1000000008683	Judul Buku 8683	0
8684	1000000008684	Judul Buku 8684	0
8685	1000000008685	Judul Buku 8685	0
8686	1000000008686	Judul Buku 8686	0
8687	1000000008687	Judul Buku 8687	0
8688	1000000008688	Judul Buku 8688	0
8689	1000000008689	Judul Buku 8689	0
8690	1000000008690	Judul Buku 8690	0
8691	1000000008691	Judul Buku 8691	0
8692	1000000008692	Judul Buku 8692	0
8693	1000000008693	Judul Buku 8693	0
8694	1000000008694	Judul Buku 8694	0
8695	1000000008695	Judul Buku 8695	0
8696	1000000008696	Judul Buku 8696	0
8697	1000000008697	Judul Buku 8697	0
8698	1000000008698	Judul Buku 8698	0
8699	1000000008699	Judul Buku 8699	0
8700	1000000008700	Judul Buku 8700	0
8701	1000000008701	Judul Buku 8701	0
8702	1000000008702	Judul Buku 8702	0
8703	1000000008703	Judul Buku 8703	0
8704	1000000008704	Judul Buku 8704	0
8705	1000000008705	Judul Buku 8705	0
8706	1000000008706	Judul Buku 8706	0
8707	1000000008707	Judul Buku 8707	0
8708	1000000008708	Judul Buku 8708	0
8709	1000000008709	Judul Buku 8709	0
8710	1000000008710	Judul Buku 8710	0
8711	1000000008711	Judul Buku 8711	0
8712	1000000008712	Judul Buku 8712	0
8713	1000000008713	Judul Buku 8713	0
8714	1000000008714	Judul Buku 8714	0
8715	1000000008715	Judul Buku 8715	0
8716	1000000008716	Judul Buku 8716	0
8717	1000000008717	Judul Buku 8717	0
8718	1000000008718	Judul Buku 8718	0
8719	1000000008719	Judul Buku 8719	0
8720	1000000008720	Judul Buku 8720	0
8721	1000000008721	Judul Buku 8721	0
8722	1000000008722	Judul Buku 8722	0
8723	1000000008723	Judul Buku 8723	0
8724	1000000008724	Judul Buku 8724	0
8725	1000000008725	Judul Buku 8725	0
8726	1000000008726	Judul Buku 8726	0
8727	1000000008727	Judul Buku 8727	0
8728	1000000008728	Judul Buku 8728	0
8729	1000000008729	Judul Buku 8729	0
8730	1000000008730	Judul Buku 8730	0
8731	1000000008731	Judul Buku 8731	0
8732	1000000008732	Judul Buku 8732	0
8733	1000000008733	Judul Buku 8733	0
8734	1000000008734	Judul Buku 8734	0
8735	1000000008735	Judul Buku 8735	0
8736	1000000008736	Judul Buku 8736	0
8737	1000000008737	Judul Buku 8737	0
8738	1000000008738	Judul Buku 8738	0
8739	1000000008739	Judul Buku 8739	0
8740	1000000008740	Judul Buku 8740	0
8741	1000000008741	Judul Buku 8741	0
8742	1000000008742	Judul Buku 8742	0
8743	1000000008743	Judul Buku 8743	0
8744	1000000008744	Judul Buku 8744	0
8745	1000000008745	Judul Buku 8745	0
8746	1000000008746	Judul Buku 8746	0
8747	1000000008747	Judul Buku 8747	0
8748	1000000008748	Judul Buku 8748	0
8749	1000000008749	Judul Buku 8749	0
8750	1000000008750	Judul Buku 8750	0
8751	1000000008751	Judul Buku 8751	0
8752	1000000008752	Judul Buku 8752	0
8753	1000000008753	Judul Buku 8753	0
8754	1000000008754	Judul Buku 8754	0
8755	1000000008755	Judul Buku 8755	0
8756	1000000008756	Judul Buku 8756	0
8757	1000000008757	Judul Buku 8757	0
8758	1000000008758	Judul Buku 8758	0
8759	1000000008759	Judul Buku 8759	0
8760	1000000008760	Judul Buku 8760	0
8761	1000000008761	Judul Buku 8761	0
8762	1000000008762	Judul Buku 8762	0
8763	1000000008763	Judul Buku 8763	0
8764	1000000008764	Judul Buku 8764	0
8765	1000000008765	Judul Buku 8765	0
8766	1000000008766	Judul Buku 8766	0
8767	1000000008767	Judul Buku 8767	0
8768	1000000008768	Judul Buku 8768	0
8769	1000000008769	Judul Buku 8769	0
8770	1000000008770	Judul Buku 8770	0
8771	1000000008771	Judul Buku 8771	0
8772	1000000008772	Judul Buku 8772	0
8773	1000000008773	Judul Buku 8773	0
8774	1000000008774	Judul Buku 8774	0
8775	1000000008775	Judul Buku 8775	0
8776	1000000008776	Judul Buku 8776	0
8777	1000000008777	Judul Buku 8777	0
8778	1000000008778	Judul Buku 8778	0
8779	1000000008779	Judul Buku 8779	0
8780	1000000008780	Judul Buku 8780	0
8781	1000000008781	Judul Buku 8781	0
8782	1000000008782	Judul Buku 8782	0
8783	1000000008783	Judul Buku 8783	0
8784	1000000008784	Judul Buku 8784	0
8785	1000000008785	Judul Buku 8785	0
8786	1000000008786	Judul Buku 8786	0
8787	1000000008787	Judul Buku 8787	0
8788	1000000008788	Judul Buku 8788	0
8789	1000000008789	Judul Buku 8789	0
8790	1000000008790	Judul Buku 8790	0
8791	1000000008791	Judul Buku 8791	0
8792	1000000008792	Judul Buku 8792	0
8793	1000000008793	Judul Buku 8793	0
8794	1000000008794	Judul Buku 8794	0
8795	1000000008795	Judul Buku 8795	0
8796	1000000008796	Judul Buku 8796	0
8797	1000000008797	Judul Buku 8797	0
8798	1000000008798	Judul Buku 8798	0
8799	1000000008799	Judul Buku 8799	0
8800	1000000008800	Judul Buku 8800	0
8801	1000000008801	Judul Buku 8801	0
8802	1000000008802	Judul Buku 8802	0
8803	1000000008803	Judul Buku 8803	0
8804	1000000008804	Judul Buku 8804	0
8805	1000000008805	Judul Buku 8805	0
8806	1000000008806	Judul Buku 8806	0
8807	1000000008807	Judul Buku 8807	0
8808	1000000008808	Judul Buku 8808	0
8809	1000000008809	Judul Buku 8809	0
8810	1000000008810	Judul Buku 8810	0
8811	1000000008811	Judul Buku 8811	0
8812	1000000008812	Judul Buku 8812	0
8813	1000000008813	Judul Buku 8813	0
8814	1000000008814	Judul Buku 8814	0
8815	1000000008815	Judul Buku 8815	0
8816	1000000008816	Judul Buku 8816	0
8817	1000000008817	Judul Buku 8817	0
8818	1000000008818	Judul Buku 8818	0
8819	1000000008819	Judul Buku 8819	0
8820	1000000008820	Judul Buku 8820	0
8821	1000000008821	Judul Buku 8821	0
8822	1000000008822	Judul Buku 8822	0
8823	1000000008823	Judul Buku 8823	0
8824	1000000008824	Judul Buku 8824	0
8825	1000000008825	Judul Buku 8825	0
8826	1000000008826	Judul Buku 8826	0
8827	1000000008827	Judul Buku 8827	0
8828	1000000008828	Judul Buku 8828	0
8829	1000000008829	Judul Buku 8829	0
8830	1000000008830	Judul Buku 8830	0
8831	1000000008831	Judul Buku 8831	0
8832	1000000008832	Judul Buku 8832	0
8833	1000000008833	Judul Buku 8833	0
8834	1000000008834	Judul Buku 8834	0
8835	1000000008835	Judul Buku 8835	0
8836	1000000008836	Judul Buku 8836	0
8837	1000000008837	Judul Buku 8837	0
8838	1000000008838	Judul Buku 8838	0
8839	1000000008839	Judul Buku 8839	0
8840	1000000008840	Judul Buku 8840	0
8841	1000000008841	Judul Buku 8841	0
8842	1000000008842	Judul Buku 8842	0
8843	1000000008843	Judul Buku 8843	0
8844	1000000008844	Judul Buku 8844	0
8845	1000000008845	Judul Buku 8845	0
8846	1000000008846	Judul Buku 8846	0
8847	1000000008847	Judul Buku 8847	0
8848	1000000008848	Judul Buku 8848	0
8849	1000000008849	Judul Buku 8849	0
8850	1000000008850	Judul Buku 8850	0
8851	1000000008851	Judul Buku 8851	0
8852	1000000008852	Judul Buku 8852	0
8853	1000000008853	Judul Buku 8853	0
8854	1000000008854	Judul Buku 8854	0
8855	1000000008855	Judul Buku 8855	0
8856	1000000008856	Judul Buku 8856	0
8857	1000000008857	Judul Buku 8857	0
8858	1000000008858	Judul Buku 8858	0
8859	1000000008859	Judul Buku 8859	0
8860	1000000008860	Judul Buku 8860	0
8861	1000000008861	Judul Buku 8861	0
8862	1000000008862	Judul Buku 8862	0
8863	1000000008863	Judul Buku 8863	0
8864	1000000008864	Judul Buku 8864	0
8865	1000000008865	Judul Buku 8865	0
8866	1000000008866	Judul Buku 8866	0
8867	1000000008867	Judul Buku 8867	0
8868	1000000008868	Judul Buku 8868	0
8869	1000000008869	Judul Buku 8869	0
8870	1000000008870	Judul Buku 8870	0
8871	1000000008871	Judul Buku 8871	0
8872	1000000008872	Judul Buku 8872	0
8873	1000000008873	Judul Buku 8873	0
8874	1000000008874	Judul Buku 8874	0
8875	1000000008875	Judul Buku 8875	0
8876	1000000008876	Judul Buku 8876	0
8877	1000000008877	Judul Buku 8877	0
8878	1000000008878	Judul Buku 8878	0
8879	1000000008879	Judul Buku 8879	0
8880	1000000008880	Judul Buku 8880	0
8881	1000000008881	Judul Buku 8881	0
8882	1000000008882	Judul Buku 8882	0
8883	1000000008883	Judul Buku 8883	0
8884	1000000008884	Judul Buku 8884	0
8885	1000000008885	Judul Buku 8885	0
8886	1000000008886	Judul Buku 8886	0
8887	1000000008887	Judul Buku 8887	0
8888	1000000008888	Judul Buku 8888	0
8889	1000000008889	Judul Buku 8889	0
8890	1000000008890	Judul Buku 8890	0
8891	1000000008891	Judul Buku 8891	0
8892	1000000008892	Judul Buku 8892	0
8893	1000000008893	Judul Buku 8893	0
8894	1000000008894	Judul Buku 8894	0
8895	1000000008895	Judul Buku 8895	0
8896	1000000008896	Judul Buku 8896	0
8897	1000000008897	Judul Buku 8897	0
8898	1000000008898	Judul Buku 8898	0
8899	1000000008899	Judul Buku 8899	0
8900	1000000008900	Judul Buku 8900	0
8901	1000000008901	Judul Buku 8901	0
8902	1000000008902	Judul Buku 8902	0
8903	1000000008903	Judul Buku 8903	0
8904	1000000008904	Judul Buku 8904	0
8905	1000000008905	Judul Buku 8905	0
8906	1000000008906	Judul Buku 8906	0
8907	1000000008907	Judul Buku 8907	0
8908	1000000008908	Judul Buku 8908	0
8909	1000000008909	Judul Buku 8909	0
8910	1000000008910	Judul Buku 8910	0
8911	1000000008911	Judul Buku 8911	0
8912	1000000008912	Judul Buku 8912	0
8913	1000000008913	Judul Buku 8913	0
8914	1000000008914	Judul Buku 8914	0
8915	1000000008915	Judul Buku 8915	0
8916	1000000008916	Judul Buku 8916	0
8917	1000000008917	Judul Buku 8917	0
8918	1000000008918	Judul Buku 8918	0
8919	1000000008919	Judul Buku 8919	0
8920	1000000008920	Judul Buku 8920	0
8921	1000000008921	Judul Buku 8921	0
8922	1000000008922	Judul Buku 8922	0
8923	1000000008923	Judul Buku 8923	0
8924	1000000008924	Judul Buku 8924	0
8925	1000000008925	Judul Buku 8925	0
8926	1000000008926	Judul Buku 8926	0
8927	1000000008927	Judul Buku 8927	0
8928	1000000008928	Judul Buku 8928	0
8929	1000000008929	Judul Buku 8929	0
8930	1000000008930	Judul Buku 8930	0
8931	1000000008931	Judul Buku 8931	0
8932	1000000008932	Judul Buku 8932	0
8933	1000000008933	Judul Buku 8933	0
8934	1000000008934	Judul Buku 8934	0
8935	1000000008935	Judul Buku 8935	0
8936	1000000008936	Judul Buku 8936	0
8937	1000000008937	Judul Buku 8937	0
8938	1000000008938	Judul Buku 8938	0
8939	1000000008939	Judul Buku 8939	0
8940	1000000008940	Judul Buku 8940	0
8941	1000000008941	Judul Buku 8941	0
8942	1000000008942	Judul Buku 8942	0
8943	1000000008943	Judul Buku 8943	0
8944	1000000008944	Judul Buku 8944	0
8945	1000000008945	Judul Buku 8945	0
8946	1000000008946	Judul Buku 8946	0
8947	1000000008947	Judul Buku 8947	0
8948	1000000008948	Judul Buku 8948	0
8949	1000000008949	Judul Buku 8949	0
8950	1000000008950	Judul Buku 8950	0
8951	1000000008951	Judul Buku 8951	0
8952	1000000008952	Judul Buku 8952	0
8953	1000000008953	Judul Buku 8953	0
8954	1000000008954	Judul Buku 8954	0
8955	1000000008955	Judul Buku 8955	0
8956	1000000008956	Judul Buku 8956	0
8957	1000000008957	Judul Buku 8957	0
8958	1000000008958	Judul Buku 8958	0
8959	1000000008959	Judul Buku 8959	0
8960	1000000008960	Judul Buku 8960	0
8961	1000000008961	Judul Buku 8961	0
8962	1000000008962	Judul Buku 8962	0
8963	1000000008963	Judul Buku 8963	0
8964	1000000008964	Judul Buku 8964	0
8965	1000000008965	Judul Buku 8965	0
8966	1000000008966	Judul Buku 8966	0
8967	1000000008967	Judul Buku 8967	0
8968	1000000008968	Judul Buku 8968	0
8969	1000000008969	Judul Buku 8969	0
8970	1000000008970	Judul Buku 8970	0
8971	1000000008971	Judul Buku 8971	0
8972	1000000008972	Judul Buku 8972	0
8973	1000000008973	Judul Buku 8973	0
8974	1000000008974	Judul Buku 8974	0
8975	1000000008975	Judul Buku 8975	0
8976	1000000008976	Judul Buku 8976	0
8977	1000000008977	Judul Buku 8977	0
8978	1000000008978	Judul Buku 8978	0
8979	1000000008979	Judul Buku 8979	0
8980	1000000008980	Judul Buku 8980	0
8981	1000000008981	Judul Buku 8981	0
8982	1000000008982	Judul Buku 8982	0
8983	1000000008983	Judul Buku 8983	0
8984	1000000008984	Judul Buku 8984	0
8985	1000000008985	Judul Buku 8985	0
8986	1000000008986	Judul Buku 8986	0
8987	1000000008987	Judul Buku 8987	0
8988	1000000008988	Judul Buku 8988	0
8989	1000000008989	Judul Buku 8989	0
8990	1000000008990	Judul Buku 8990	0
8991	1000000008991	Judul Buku 8991	0
8992	1000000008992	Judul Buku 8992	0
8993	1000000008993	Judul Buku 8993	0
8994	1000000008994	Judul Buku 8994	0
8995	1000000008995	Judul Buku 8995	0
8996	1000000008996	Judul Buku 8996	0
8997	1000000008997	Judul Buku 8997	0
8998	1000000008998	Judul Buku 8998	0
8999	1000000008999	Judul Buku 8999	0
9000	1000000009000	Judul Buku 9000	0
9001	1000000009001	Judul Buku 9001	0
9002	1000000009002	Judul Buku 9002	0
9003	1000000009003	Judul Buku 9003	0
9004	1000000009004	Judul Buku 9004	0
9005	1000000009005	Judul Buku 9005	0
9006	1000000009006	Judul Buku 9006	0
9007	1000000009007	Judul Buku 9007	0
9008	1000000009008	Judul Buku 9008	0
9009	1000000009009	Judul Buku 9009	0
9010	1000000009010	Judul Buku 9010	0
9011	1000000009011	Judul Buku 9011	0
9012	1000000009012	Judul Buku 9012	0
9013	1000000009013	Judul Buku 9013	0
9014	1000000009014	Judul Buku 9014	0
9015	1000000009015	Judul Buku 9015	0
9016	1000000009016	Judul Buku 9016	0
9017	1000000009017	Judul Buku 9017	0
9018	1000000009018	Judul Buku 9018	0
9019	1000000009019	Judul Buku 9019	0
9020	1000000009020	Judul Buku 9020	0
9021	1000000009021	Judul Buku 9021	0
9022	1000000009022	Judul Buku 9022	0
9023	1000000009023	Judul Buku 9023	0
9024	1000000009024	Judul Buku 9024	0
9025	1000000009025	Judul Buku 9025	0
9026	1000000009026	Judul Buku 9026	0
9027	1000000009027	Judul Buku 9027	0
9028	1000000009028	Judul Buku 9028	0
9029	1000000009029	Judul Buku 9029	0
9030	1000000009030	Judul Buku 9030	0
9031	1000000009031	Judul Buku 9031	0
9032	1000000009032	Judul Buku 9032	0
9033	1000000009033	Judul Buku 9033	0
9034	1000000009034	Judul Buku 9034	0
9035	1000000009035	Judul Buku 9035	0
9036	1000000009036	Judul Buku 9036	0
9037	1000000009037	Judul Buku 9037	0
9038	1000000009038	Judul Buku 9038	0
9039	1000000009039	Judul Buku 9039	0
9040	1000000009040	Judul Buku 9040	0
9041	1000000009041	Judul Buku 9041	0
9042	1000000009042	Judul Buku 9042	0
9043	1000000009043	Judul Buku 9043	0
9044	1000000009044	Judul Buku 9044	0
9045	1000000009045	Judul Buku 9045	0
9046	1000000009046	Judul Buku 9046	0
9047	1000000009047	Judul Buku 9047	0
9048	1000000009048	Judul Buku 9048	0
9049	1000000009049	Judul Buku 9049	0
9050	1000000009050	Judul Buku 9050	0
9051	1000000009051	Judul Buku 9051	0
9052	1000000009052	Judul Buku 9052	0
9053	1000000009053	Judul Buku 9053	0
9054	1000000009054	Judul Buku 9054	0
9055	1000000009055	Judul Buku 9055	0
9056	1000000009056	Judul Buku 9056	0
9057	1000000009057	Judul Buku 9057	0
9058	1000000009058	Judul Buku 9058	0
9059	1000000009059	Judul Buku 9059	0
9060	1000000009060	Judul Buku 9060	0
9061	1000000009061	Judul Buku 9061	0
9062	1000000009062	Judul Buku 9062	0
9063	1000000009063	Judul Buku 9063	0
9064	1000000009064	Judul Buku 9064	0
9065	1000000009065	Judul Buku 9065	0
9066	1000000009066	Judul Buku 9066	0
9067	1000000009067	Judul Buku 9067	0
9068	1000000009068	Judul Buku 9068	0
9069	1000000009069	Judul Buku 9069	0
9070	1000000009070	Judul Buku 9070	0
9071	1000000009071	Judul Buku 9071	0
9072	1000000009072	Judul Buku 9072	0
9073	1000000009073	Judul Buku 9073	0
9074	1000000009074	Judul Buku 9074	0
9075	1000000009075	Judul Buku 9075	0
9076	1000000009076	Judul Buku 9076	0
9077	1000000009077	Judul Buku 9077	0
9078	1000000009078	Judul Buku 9078	0
9079	1000000009079	Judul Buku 9079	0
9080	1000000009080	Judul Buku 9080	0
9081	1000000009081	Judul Buku 9081	0
9082	1000000009082	Judul Buku 9082	0
9083	1000000009083	Judul Buku 9083	0
9084	1000000009084	Judul Buku 9084	0
9085	1000000009085	Judul Buku 9085	0
9086	1000000009086	Judul Buku 9086	0
9087	1000000009087	Judul Buku 9087	0
9088	1000000009088	Judul Buku 9088	0
9089	1000000009089	Judul Buku 9089	0
9090	1000000009090	Judul Buku 9090	0
9091	1000000009091	Judul Buku 9091	0
9092	1000000009092	Judul Buku 9092	0
9093	1000000009093	Judul Buku 9093	0
9094	1000000009094	Judul Buku 9094	0
9095	1000000009095	Judul Buku 9095	0
9096	1000000009096	Judul Buku 9096	0
9097	1000000009097	Judul Buku 9097	0
9098	1000000009098	Judul Buku 9098	0
9099	1000000009099	Judul Buku 9099	0
9100	1000000009100	Judul Buku 9100	0
9101	1000000009101	Judul Buku 9101	0
9102	1000000009102	Judul Buku 9102	0
9103	1000000009103	Judul Buku 9103	0
9104	1000000009104	Judul Buku 9104	0
9105	1000000009105	Judul Buku 9105	0
9106	1000000009106	Judul Buku 9106	0
9107	1000000009107	Judul Buku 9107	0
9108	1000000009108	Judul Buku 9108	0
9109	1000000009109	Judul Buku 9109	0
9110	1000000009110	Judul Buku 9110	0
9111	1000000009111	Judul Buku 9111	0
9112	1000000009112	Judul Buku 9112	0
9113	1000000009113	Judul Buku 9113	0
9114	1000000009114	Judul Buku 9114	0
9115	1000000009115	Judul Buku 9115	0
9116	1000000009116	Judul Buku 9116	0
9117	1000000009117	Judul Buku 9117	0
9118	1000000009118	Judul Buku 9118	0
9119	1000000009119	Judul Buku 9119	0
9120	1000000009120	Judul Buku 9120	0
9121	1000000009121	Judul Buku 9121	0
9122	1000000009122	Judul Buku 9122	0
9123	1000000009123	Judul Buku 9123	0
9124	1000000009124	Judul Buku 9124	0
9125	1000000009125	Judul Buku 9125	0
9126	1000000009126	Judul Buku 9126	0
9127	1000000009127	Judul Buku 9127	0
9128	1000000009128	Judul Buku 9128	0
9129	1000000009129	Judul Buku 9129	0
9130	1000000009130	Judul Buku 9130	0
9131	1000000009131	Judul Buku 9131	0
9132	1000000009132	Judul Buku 9132	0
9133	1000000009133	Judul Buku 9133	0
9134	1000000009134	Judul Buku 9134	0
9135	1000000009135	Judul Buku 9135	0
9136	1000000009136	Judul Buku 9136	0
9137	1000000009137	Judul Buku 9137	0
9138	1000000009138	Judul Buku 9138	0
9139	1000000009139	Judul Buku 9139	0
9140	1000000009140	Judul Buku 9140	0
9141	1000000009141	Judul Buku 9141	0
9142	1000000009142	Judul Buku 9142	0
9143	1000000009143	Judul Buku 9143	0
9144	1000000009144	Judul Buku 9144	0
9145	1000000009145	Judul Buku 9145	0
9146	1000000009146	Judul Buku 9146	0
9147	1000000009147	Judul Buku 9147	0
9148	1000000009148	Judul Buku 9148	0
9149	1000000009149	Judul Buku 9149	0
9150	1000000009150	Judul Buku 9150	0
9151	1000000009151	Judul Buku 9151	0
9152	1000000009152	Judul Buku 9152	0
9153	1000000009153	Judul Buku 9153	0
9154	1000000009154	Judul Buku 9154	0
9155	1000000009155	Judul Buku 9155	0
9156	1000000009156	Judul Buku 9156	0
9157	1000000009157	Judul Buku 9157	0
9158	1000000009158	Judul Buku 9158	0
9159	1000000009159	Judul Buku 9159	0
9160	1000000009160	Judul Buku 9160	0
9161	1000000009161	Judul Buku 9161	0
9162	1000000009162	Judul Buku 9162	0
9163	1000000009163	Judul Buku 9163	0
9164	1000000009164	Judul Buku 9164	0
9165	1000000009165	Judul Buku 9165	0
9166	1000000009166	Judul Buku 9166	0
9167	1000000009167	Judul Buku 9167	0
9168	1000000009168	Judul Buku 9168	0
9169	1000000009169	Judul Buku 9169	0
9170	1000000009170	Judul Buku 9170	0
9171	1000000009171	Judul Buku 9171	0
9172	1000000009172	Judul Buku 9172	0
9173	1000000009173	Judul Buku 9173	0
9174	1000000009174	Judul Buku 9174	0
9175	1000000009175	Judul Buku 9175	0
9176	1000000009176	Judul Buku 9176	0
9177	1000000009177	Judul Buku 9177	0
9178	1000000009178	Judul Buku 9178	0
9179	1000000009179	Judul Buku 9179	0
9180	1000000009180	Judul Buku 9180	0
9181	1000000009181	Judul Buku 9181	0
9182	1000000009182	Judul Buku 9182	0
9183	1000000009183	Judul Buku 9183	0
9184	1000000009184	Judul Buku 9184	0
9185	1000000009185	Judul Buku 9185	0
9186	1000000009186	Judul Buku 9186	0
9187	1000000009187	Judul Buku 9187	0
9188	1000000009188	Judul Buku 9188	0
9189	1000000009189	Judul Buku 9189	0
9190	1000000009190	Judul Buku 9190	0
9191	1000000009191	Judul Buku 9191	0
9192	1000000009192	Judul Buku 9192	0
9193	1000000009193	Judul Buku 9193	0
9194	1000000009194	Judul Buku 9194	0
9195	1000000009195	Judul Buku 9195	0
9196	1000000009196	Judul Buku 9196	0
9197	1000000009197	Judul Buku 9197	0
9198	1000000009198	Judul Buku 9198	0
9199	1000000009199	Judul Buku 9199	0
9200	1000000009200	Judul Buku 9200	0
9201	1000000009201	Judul Buku 9201	0
9202	1000000009202	Judul Buku 9202	0
9203	1000000009203	Judul Buku 9203	0
9204	1000000009204	Judul Buku 9204	0
9205	1000000009205	Judul Buku 9205	0
9206	1000000009206	Judul Buku 9206	0
9207	1000000009207	Judul Buku 9207	0
9208	1000000009208	Judul Buku 9208	0
9209	1000000009209	Judul Buku 9209	0
9210	1000000009210	Judul Buku 9210	0
9211	1000000009211	Judul Buku 9211	0
9212	1000000009212	Judul Buku 9212	0
9213	1000000009213	Judul Buku 9213	0
9214	1000000009214	Judul Buku 9214	0
9215	1000000009215	Judul Buku 9215	0
9216	1000000009216	Judul Buku 9216	0
9217	1000000009217	Judul Buku 9217	0
9218	1000000009218	Judul Buku 9218	0
9219	1000000009219	Judul Buku 9219	0
9220	1000000009220	Judul Buku 9220	0
9221	1000000009221	Judul Buku 9221	0
9222	1000000009222	Judul Buku 9222	0
9223	1000000009223	Judul Buku 9223	0
9224	1000000009224	Judul Buku 9224	0
9225	1000000009225	Judul Buku 9225	0
9226	1000000009226	Judul Buku 9226	0
9227	1000000009227	Judul Buku 9227	0
9228	1000000009228	Judul Buku 9228	0
9229	1000000009229	Judul Buku 9229	0
9230	1000000009230	Judul Buku 9230	0
9231	1000000009231	Judul Buku 9231	0
9232	1000000009232	Judul Buku 9232	0
9233	1000000009233	Judul Buku 9233	0
9234	1000000009234	Judul Buku 9234	0
9235	1000000009235	Judul Buku 9235	0
9236	1000000009236	Judul Buku 9236	0
9237	1000000009237	Judul Buku 9237	0
9238	1000000009238	Judul Buku 9238	0
9239	1000000009239	Judul Buku 9239	0
9240	1000000009240	Judul Buku 9240	0
9241	1000000009241	Judul Buku 9241	0
9242	1000000009242	Judul Buku 9242	0
9243	1000000009243	Judul Buku 9243	0
9244	1000000009244	Judul Buku 9244	0
9245	1000000009245	Judul Buku 9245	0
9246	1000000009246	Judul Buku 9246	0
9247	1000000009247	Judul Buku 9247	0
9248	1000000009248	Judul Buku 9248	0
9249	1000000009249	Judul Buku 9249	0
9250	1000000009250	Judul Buku 9250	0
9251	1000000009251	Judul Buku 9251	0
9252	1000000009252	Judul Buku 9252	0
9253	1000000009253	Judul Buku 9253	0
9254	1000000009254	Judul Buku 9254	0
9255	1000000009255	Judul Buku 9255	0
9256	1000000009256	Judul Buku 9256	0
9257	1000000009257	Judul Buku 9257	0
9258	1000000009258	Judul Buku 9258	0
9259	1000000009259	Judul Buku 9259	0
9260	1000000009260	Judul Buku 9260	0
9261	1000000009261	Judul Buku 9261	0
9262	1000000009262	Judul Buku 9262	0
9263	1000000009263	Judul Buku 9263	0
9264	1000000009264	Judul Buku 9264	0
9265	1000000009265	Judul Buku 9265	0
9266	1000000009266	Judul Buku 9266	0
9267	1000000009267	Judul Buku 9267	0
9268	1000000009268	Judul Buku 9268	0
9269	1000000009269	Judul Buku 9269	0
9270	1000000009270	Judul Buku 9270	0
9271	1000000009271	Judul Buku 9271	0
9272	1000000009272	Judul Buku 9272	0
9273	1000000009273	Judul Buku 9273	0
9274	1000000009274	Judul Buku 9274	0
9275	1000000009275	Judul Buku 9275	0
9276	1000000009276	Judul Buku 9276	0
9277	1000000009277	Judul Buku 9277	0
9278	1000000009278	Judul Buku 9278	0
9279	1000000009279	Judul Buku 9279	0
9280	1000000009280	Judul Buku 9280	0
9281	1000000009281	Judul Buku 9281	0
9282	1000000009282	Judul Buku 9282	0
9283	1000000009283	Judul Buku 9283	0
9284	1000000009284	Judul Buku 9284	0
9285	1000000009285	Judul Buku 9285	0
9286	1000000009286	Judul Buku 9286	0
9287	1000000009287	Judul Buku 9287	0
9288	1000000009288	Judul Buku 9288	0
9289	1000000009289	Judul Buku 9289	0
9290	1000000009290	Judul Buku 9290	0
9291	1000000009291	Judul Buku 9291	0
9292	1000000009292	Judul Buku 9292	0
9293	1000000009293	Judul Buku 9293	0
9294	1000000009294	Judul Buku 9294	0
9295	1000000009295	Judul Buku 9295	0
9296	1000000009296	Judul Buku 9296	0
9297	1000000009297	Judul Buku 9297	0
9298	1000000009298	Judul Buku 9298	0
9299	1000000009299	Judul Buku 9299	0
9300	1000000009300	Judul Buku 9300	0
9301	1000000009301	Judul Buku 9301	0
9302	1000000009302	Judul Buku 9302	0
9303	1000000009303	Judul Buku 9303	0
9304	1000000009304	Judul Buku 9304	0
9305	1000000009305	Judul Buku 9305	0
9306	1000000009306	Judul Buku 9306	0
9307	1000000009307	Judul Buku 9307	0
9308	1000000009308	Judul Buku 9308	0
9309	1000000009309	Judul Buku 9309	0
9310	1000000009310	Judul Buku 9310	0
9311	1000000009311	Judul Buku 9311	0
9312	1000000009312	Judul Buku 9312	0
9313	1000000009313	Judul Buku 9313	0
9314	1000000009314	Judul Buku 9314	0
9315	1000000009315	Judul Buku 9315	0
9316	1000000009316	Judul Buku 9316	0
9317	1000000009317	Judul Buku 9317	0
9318	1000000009318	Judul Buku 9318	0
9319	1000000009319	Judul Buku 9319	0
9320	1000000009320	Judul Buku 9320	0
9321	1000000009321	Judul Buku 9321	0
9322	1000000009322	Judul Buku 9322	0
9323	1000000009323	Judul Buku 9323	0
9324	1000000009324	Judul Buku 9324	0
9325	1000000009325	Judul Buku 9325	0
9326	1000000009326	Judul Buku 9326	0
9327	1000000009327	Judul Buku 9327	0
9328	1000000009328	Judul Buku 9328	0
9329	1000000009329	Judul Buku 9329	0
9330	1000000009330	Judul Buku 9330	0
9331	1000000009331	Judul Buku 9331	0
9332	1000000009332	Judul Buku 9332	0
9333	1000000009333	Judul Buku 9333	0
9334	1000000009334	Judul Buku 9334	0
9335	1000000009335	Judul Buku 9335	0
9336	1000000009336	Judul Buku 9336	0
9337	1000000009337	Judul Buku 9337	0
9338	1000000009338	Judul Buku 9338	0
9339	1000000009339	Judul Buku 9339	0
9340	1000000009340	Judul Buku 9340	0
9341	1000000009341	Judul Buku 9341	0
9342	1000000009342	Judul Buku 9342	0
9343	1000000009343	Judul Buku 9343	0
9344	1000000009344	Judul Buku 9344	0
9345	1000000009345	Judul Buku 9345	0
9346	1000000009346	Judul Buku 9346	0
9347	1000000009347	Judul Buku 9347	0
9348	1000000009348	Judul Buku 9348	0
9349	1000000009349	Judul Buku 9349	0
9350	1000000009350	Judul Buku 9350	0
9351	1000000009351	Judul Buku 9351	0
9352	1000000009352	Judul Buku 9352	0
9353	1000000009353	Judul Buku 9353	0
9354	1000000009354	Judul Buku 9354	0
9355	1000000009355	Judul Buku 9355	0
9356	1000000009356	Judul Buku 9356	0
9357	1000000009357	Judul Buku 9357	0
9358	1000000009358	Judul Buku 9358	0
9359	1000000009359	Judul Buku 9359	0
9360	1000000009360	Judul Buku 9360	0
9361	1000000009361	Judul Buku 9361	0
9362	1000000009362	Judul Buku 9362	0
9363	1000000009363	Judul Buku 9363	0
9364	1000000009364	Judul Buku 9364	0
9365	1000000009365	Judul Buku 9365	0
9366	1000000009366	Judul Buku 9366	0
9367	1000000009367	Judul Buku 9367	0
9368	1000000009368	Judul Buku 9368	0
9369	1000000009369	Judul Buku 9369	0
9370	1000000009370	Judul Buku 9370	0
9371	1000000009371	Judul Buku 9371	0
9372	1000000009372	Judul Buku 9372	0
9373	1000000009373	Judul Buku 9373	0
9374	1000000009374	Judul Buku 9374	0
9375	1000000009375	Judul Buku 9375	0
9376	1000000009376	Judul Buku 9376	0
9377	1000000009377	Judul Buku 9377	0
9378	1000000009378	Judul Buku 9378	0
9379	1000000009379	Judul Buku 9379	0
9380	1000000009380	Judul Buku 9380	0
9381	1000000009381	Judul Buku 9381	0
9382	1000000009382	Judul Buku 9382	0
9383	1000000009383	Judul Buku 9383	0
9384	1000000009384	Judul Buku 9384	0
9385	1000000009385	Judul Buku 9385	0
9386	1000000009386	Judul Buku 9386	0
9387	1000000009387	Judul Buku 9387	0
9388	1000000009388	Judul Buku 9388	0
9389	1000000009389	Judul Buku 9389	0
9390	1000000009390	Judul Buku 9390	0
9391	1000000009391	Judul Buku 9391	0
9392	1000000009392	Judul Buku 9392	0
9393	1000000009393	Judul Buku 9393	0
9394	1000000009394	Judul Buku 9394	0
9395	1000000009395	Judul Buku 9395	0
9396	1000000009396	Judul Buku 9396	0
9397	1000000009397	Judul Buku 9397	0
9398	1000000009398	Judul Buku 9398	0
9399	1000000009399	Judul Buku 9399	0
9400	1000000009400	Judul Buku 9400	0
9401	1000000009401	Judul Buku 9401	0
9402	1000000009402	Judul Buku 9402	0
9403	1000000009403	Judul Buku 9403	0
9404	1000000009404	Judul Buku 9404	0
9405	1000000009405	Judul Buku 9405	0
9406	1000000009406	Judul Buku 9406	0
9407	1000000009407	Judul Buku 9407	0
9408	1000000009408	Judul Buku 9408	0
9409	1000000009409	Judul Buku 9409	0
9410	1000000009410	Judul Buku 9410	0
9411	1000000009411	Judul Buku 9411	0
9412	1000000009412	Judul Buku 9412	0
9413	1000000009413	Judul Buku 9413	0
9414	1000000009414	Judul Buku 9414	0
9415	1000000009415	Judul Buku 9415	0
9416	1000000009416	Judul Buku 9416	0
9417	1000000009417	Judul Buku 9417	0
9418	1000000009418	Judul Buku 9418	0
9419	1000000009419	Judul Buku 9419	0
9420	1000000009420	Judul Buku 9420	0
9421	1000000009421	Judul Buku 9421	0
9422	1000000009422	Judul Buku 9422	0
9423	1000000009423	Judul Buku 9423	0
9424	1000000009424	Judul Buku 9424	0
9425	1000000009425	Judul Buku 9425	0
9426	1000000009426	Judul Buku 9426	0
9427	1000000009427	Judul Buku 9427	0
9428	1000000009428	Judul Buku 9428	0
9429	1000000009429	Judul Buku 9429	0
9430	1000000009430	Judul Buku 9430	0
9431	1000000009431	Judul Buku 9431	0
9432	1000000009432	Judul Buku 9432	0
9433	1000000009433	Judul Buku 9433	0
9434	1000000009434	Judul Buku 9434	0
9435	1000000009435	Judul Buku 9435	0
9436	1000000009436	Judul Buku 9436	0
9437	1000000009437	Judul Buku 9437	0
9438	1000000009438	Judul Buku 9438	0
9439	1000000009439	Judul Buku 9439	0
9440	1000000009440	Judul Buku 9440	0
9441	1000000009441	Judul Buku 9441	0
9442	1000000009442	Judul Buku 9442	0
9443	1000000009443	Judul Buku 9443	0
9444	1000000009444	Judul Buku 9444	0
9445	1000000009445	Judul Buku 9445	0
9446	1000000009446	Judul Buku 9446	0
9447	1000000009447	Judul Buku 9447	0
9448	1000000009448	Judul Buku 9448	0
9449	1000000009449	Judul Buku 9449	0
9450	1000000009450	Judul Buku 9450	0
9451	1000000009451	Judul Buku 9451	0
9452	1000000009452	Judul Buku 9452	0
9453	1000000009453	Judul Buku 9453	0
9454	1000000009454	Judul Buku 9454	0
9455	1000000009455	Judul Buku 9455	0
9456	1000000009456	Judul Buku 9456	0
9457	1000000009457	Judul Buku 9457	0
9458	1000000009458	Judul Buku 9458	0
9459	1000000009459	Judul Buku 9459	0
9460	1000000009460	Judul Buku 9460	0
9461	1000000009461	Judul Buku 9461	0
9462	1000000009462	Judul Buku 9462	0
9463	1000000009463	Judul Buku 9463	0
9464	1000000009464	Judul Buku 9464	0
9465	1000000009465	Judul Buku 9465	0
9466	1000000009466	Judul Buku 9466	0
9467	1000000009467	Judul Buku 9467	0
9468	1000000009468	Judul Buku 9468	0
9469	1000000009469	Judul Buku 9469	0
9470	1000000009470	Judul Buku 9470	0
9471	1000000009471	Judul Buku 9471	0
9472	1000000009472	Judul Buku 9472	0
9473	1000000009473	Judul Buku 9473	0
9474	1000000009474	Judul Buku 9474	0
9475	1000000009475	Judul Buku 9475	0
9476	1000000009476	Judul Buku 9476	0
9477	1000000009477	Judul Buku 9477	0
9478	1000000009478	Judul Buku 9478	0
9479	1000000009479	Judul Buku 9479	0
9480	1000000009480	Judul Buku 9480	0
9481	1000000009481	Judul Buku 9481	0
9482	1000000009482	Judul Buku 9482	0
9483	1000000009483	Judul Buku 9483	0
9484	1000000009484	Judul Buku 9484	0
9485	1000000009485	Judul Buku 9485	0
9486	1000000009486	Judul Buku 9486	0
9487	1000000009487	Judul Buku 9487	0
9488	1000000009488	Judul Buku 9488	0
9489	1000000009489	Judul Buku 9489	0
9490	1000000009490	Judul Buku 9490	0
9491	1000000009491	Judul Buku 9491	0
9492	1000000009492	Judul Buku 9492	0
9493	1000000009493	Judul Buku 9493	0
9494	1000000009494	Judul Buku 9494	0
9495	1000000009495	Judul Buku 9495	0
9496	1000000009496	Judul Buku 9496	0
9497	1000000009497	Judul Buku 9497	0
9498	1000000009498	Judul Buku 9498	0
9499	1000000009499	Judul Buku 9499	0
9500	1000000009500	Judul Buku 9500	0
9501	1000000009501	Judul Buku 9501	0
9502	1000000009502	Judul Buku 9502	0
9503	1000000009503	Judul Buku 9503	0
9504	1000000009504	Judul Buku 9504	0
9505	1000000009505	Judul Buku 9505	0
9506	1000000009506	Judul Buku 9506	0
9507	1000000009507	Judul Buku 9507	0
9508	1000000009508	Judul Buku 9508	0
9509	1000000009509	Judul Buku 9509	0
9510	1000000009510	Judul Buku 9510	0
9511	1000000009511	Judul Buku 9511	0
9512	1000000009512	Judul Buku 9512	0
9513	1000000009513	Judul Buku 9513	0
9514	1000000009514	Judul Buku 9514	0
9515	1000000009515	Judul Buku 9515	0
9516	1000000009516	Judul Buku 9516	0
9517	1000000009517	Judul Buku 9517	0
9518	1000000009518	Judul Buku 9518	0
9519	1000000009519	Judul Buku 9519	0
9520	1000000009520	Judul Buku 9520	0
9521	1000000009521	Judul Buku 9521	0
9522	1000000009522	Judul Buku 9522	0
9523	1000000009523	Judul Buku 9523	0
9524	1000000009524	Judul Buku 9524	0
9525	1000000009525	Judul Buku 9525	0
9526	1000000009526	Judul Buku 9526	0
9527	1000000009527	Judul Buku 9527	0
9528	1000000009528	Judul Buku 9528	0
9529	1000000009529	Judul Buku 9529	0
9530	1000000009530	Judul Buku 9530	0
9531	1000000009531	Judul Buku 9531	0
9532	1000000009532	Judul Buku 9532	0
9533	1000000009533	Judul Buku 9533	0
9534	1000000009534	Judul Buku 9534	0
9535	1000000009535	Judul Buku 9535	0
9536	1000000009536	Judul Buku 9536	0
9537	1000000009537	Judul Buku 9537	0
9538	1000000009538	Judul Buku 9538	0
9539	1000000009539	Judul Buku 9539	0
9540	1000000009540	Judul Buku 9540	0
9541	1000000009541	Judul Buku 9541	0
9542	1000000009542	Judul Buku 9542	0
9543	1000000009543	Judul Buku 9543	0
9544	1000000009544	Judul Buku 9544	0
9545	1000000009545	Judul Buku 9545	0
9546	1000000009546	Judul Buku 9546	0
9547	1000000009547	Judul Buku 9547	0
9548	1000000009548	Judul Buku 9548	0
9549	1000000009549	Judul Buku 9549	0
9550	1000000009550	Judul Buku 9550	0
9551	1000000009551	Judul Buku 9551	0
9552	1000000009552	Judul Buku 9552	0
9553	1000000009553	Judul Buku 9553	0
9554	1000000009554	Judul Buku 9554	0
9555	1000000009555	Judul Buku 9555	0
9556	1000000009556	Judul Buku 9556	0
9557	1000000009557	Judul Buku 9557	0
9558	1000000009558	Judul Buku 9558	0
9559	1000000009559	Judul Buku 9559	0
9560	1000000009560	Judul Buku 9560	0
9561	1000000009561	Judul Buku 9561	0
9562	1000000009562	Judul Buku 9562	0
9563	1000000009563	Judul Buku 9563	0
9564	1000000009564	Judul Buku 9564	0
9565	1000000009565	Judul Buku 9565	0
9566	1000000009566	Judul Buku 9566	0
9567	1000000009567	Judul Buku 9567	0
9568	1000000009568	Judul Buku 9568	0
9569	1000000009569	Judul Buku 9569	0
9570	1000000009570	Judul Buku 9570	0
9571	1000000009571	Judul Buku 9571	0
9572	1000000009572	Judul Buku 9572	0
9573	1000000009573	Judul Buku 9573	0
9574	1000000009574	Judul Buku 9574	0
9575	1000000009575	Judul Buku 9575	0
9576	1000000009576	Judul Buku 9576	0
9577	1000000009577	Judul Buku 9577	0
9578	1000000009578	Judul Buku 9578	0
9579	1000000009579	Judul Buku 9579	0
9580	1000000009580	Judul Buku 9580	0
9581	1000000009581	Judul Buku 9581	0
9582	1000000009582	Judul Buku 9582	0
9583	1000000009583	Judul Buku 9583	0
9584	1000000009584	Judul Buku 9584	0
9585	1000000009585	Judul Buku 9585	0
9586	1000000009586	Judul Buku 9586	0
9587	1000000009587	Judul Buku 9587	0
9588	1000000009588	Judul Buku 9588	0
9589	1000000009589	Judul Buku 9589	0
9590	1000000009590	Judul Buku 9590	0
9591	1000000009591	Judul Buku 9591	0
9592	1000000009592	Judul Buku 9592	0
9593	1000000009593	Judul Buku 9593	0
9594	1000000009594	Judul Buku 9594	0
9595	1000000009595	Judul Buku 9595	0
9596	1000000009596	Judul Buku 9596	0
9597	1000000009597	Judul Buku 9597	0
9598	1000000009598	Judul Buku 9598	0
9599	1000000009599	Judul Buku 9599	0
9600	1000000009600	Judul Buku 9600	0
9601	1000000009601	Judul Buku 9601	0
9602	1000000009602	Judul Buku 9602	0
9603	1000000009603	Judul Buku 9603	0
9604	1000000009604	Judul Buku 9604	0
9605	1000000009605	Judul Buku 9605	0
9606	1000000009606	Judul Buku 9606	0
9607	1000000009607	Judul Buku 9607	0
9608	1000000009608	Judul Buku 9608	0
9609	1000000009609	Judul Buku 9609	0
9610	1000000009610	Judul Buku 9610	0
9611	1000000009611	Judul Buku 9611	0
9612	1000000009612	Judul Buku 9612	0
9613	1000000009613	Judul Buku 9613	0
9614	1000000009614	Judul Buku 9614	0
9615	1000000009615	Judul Buku 9615	0
9616	1000000009616	Judul Buku 9616	0
9617	1000000009617	Judul Buku 9617	0
9618	1000000009618	Judul Buku 9618	0
9619	1000000009619	Judul Buku 9619	0
9620	1000000009620	Judul Buku 9620	0
9621	1000000009621	Judul Buku 9621	0
9622	1000000009622	Judul Buku 9622	0
9623	1000000009623	Judul Buku 9623	0
9624	1000000009624	Judul Buku 9624	0
9625	1000000009625	Judul Buku 9625	0
9626	1000000009626	Judul Buku 9626	0
9627	1000000009627	Judul Buku 9627	0
9628	1000000009628	Judul Buku 9628	0
9629	1000000009629	Judul Buku 9629	0
9630	1000000009630	Judul Buku 9630	0
9631	1000000009631	Judul Buku 9631	0
9632	1000000009632	Judul Buku 9632	0
9633	1000000009633	Judul Buku 9633	0
9634	1000000009634	Judul Buku 9634	0
9635	1000000009635	Judul Buku 9635	0
9636	1000000009636	Judul Buku 9636	0
9637	1000000009637	Judul Buku 9637	0
9638	1000000009638	Judul Buku 9638	0
9639	1000000009639	Judul Buku 9639	0
9640	1000000009640	Judul Buku 9640	0
9641	1000000009641	Judul Buku 9641	0
9642	1000000009642	Judul Buku 9642	0
9643	1000000009643	Judul Buku 9643	0
9644	1000000009644	Judul Buku 9644	0
9645	1000000009645	Judul Buku 9645	0
9646	1000000009646	Judul Buku 9646	0
9647	1000000009647	Judul Buku 9647	0
9648	1000000009648	Judul Buku 9648	0
9649	1000000009649	Judul Buku 9649	0
9650	1000000009650	Judul Buku 9650	0
9651	1000000009651	Judul Buku 9651	0
9652	1000000009652	Judul Buku 9652	0
9653	1000000009653	Judul Buku 9653	0
9654	1000000009654	Judul Buku 9654	0
9655	1000000009655	Judul Buku 9655	0
9656	1000000009656	Judul Buku 9656	0
9657	1000000009657	Judul Buku 9657	0
9658	1000000009658	Judul Buku 9658	0
9659	1000000009659	Judul Buku 9659	0
9660	1000000009660	Judul Buku 9660	0
9661	1000000009661	Judul Buku 9661	0
9662	1000000009662	Judul Buku 9662	0
9663	1000000009663	Judul Buku 9663	0
9664	1000000009664	Judul Buku 9664	0
9665	1000000009665	Judul Buku 9665	0
9666	1000000009666	Judul Buku 9666	0
9667	1000000009667	Judul Buku 9667	0
9668	1000000009668	Judul Buku 9668	0
9669	1000000009669	Judul Buku 9669	0
9670	1000000009670	Judul Buku 9670	0
9671	1000000009671	Judul Buku 9671	0
9672	1000000009672	Judul Buku 9672	0
9673	1000000009673	Judul Buku 9673	0
9674	1000000009674	Judul Buku 9674	0
9675	1000000009675	Judul Buku 9675	0
9676	1000000009676	Judul Buku 9676	0
9677	1000000009677	Judul Buku 9677	0
9678	1000000009678	Judul Buku 9678	0
9679	1000000009679	Judul Buku 9679	0
9680	1000000009680	Judul Buku 9680	0
9681	1000000009681	Judul Buku 9681	0
9682	1000000009682	Judul Buku 9682	0
9683	1000000009683	Judul Buku 9683	0
9684	1000000009684	Judul Buku 9684	0
9685	1000000009685	Judul Buku 9685	0
9686	1000000009686	Judul Buku 9686	0
9687	1000000009687	Judul Buku 9687	0
9688	1000000009688	Judul Buku 9688	0
9689	1000000009689	Judul Buku 9689	0
9690	1000000009690	Judul Buku 9690	0
9691	1000000009691	Judul Buku 9691	0
9692	1000000009692	Judul Buku 9692	0
9693	1000000009693	Judul Buku 9693	0
9694	1000000009694	Judul Buku 9694	0
9695	1000000009695	Judul Buku 9695	0
9696	1000000009696	Judul Buku 9696	0
9697	1000000009697	Judul Buku 9697	0
9698	1000000009698	Judul Buku 9698	0
9699	1000000009699	Judul Buku 9699	0
9700	1000000009700	Judul Buku 9700	0
9701	1000000009701	Judul Buku 9701	0
9702	1000000009702	Judul Buku 9702	0
9703	1000000009703	Judul Buku 9703	0
9704	1000000009704	Judul Buku 9704	0
9705	1000000009705	Judul Buku 9705	0
9706	1000000009706	Judul Buku 9706	0
9707	1000000009707	Judul Buku 9707	0
9708	1000000009708	Judul Buku 9708	0
9709	1000000009709	Judul Buku 9709	0
9710	1000000009710	Judul Buku 9710	0
9711	1000000009711	Judul Buku 9711	0
9712	1000000009712	Judul Buku 9712	0
9713	1000000009713	Judul Buku 9713	0
9714	1000000009714	Judul Buku 9714	0
9715	1000000009715	Judul Buku 9715	0
9716	1000000009716	Judul Buku 9716	0
9717	1000000009717	Judul Buku 9717	0
9718	1000000009718	Judul Buku 9718	0
9719	1000000009719	Judul Buku 9719	0
9720	1000000009720	Judul Buku 9720	0
9721	1000000009721	Judul Buku 9721	0
9722	1000000009722	Judul Buku 9722	0
9723	1000000009723	Judul Buku 9723	0
9724	1000000009724	Judul Buku 9724	0
9725	1000000009725	Judul Buku 9725	0
9726	1000000009726	Judul Buku 9726	0
9727	1000000009727	Judul Buku 9727	0
9728	1000000009728	Judul Buku 9728	0
9729	1000000009729	Judul Buku 9729	0
9730	1000000009730	Judul Buku 9730	0
9731	1000000009731	Judul Buku 9731	0
9732	1000000009732	Judul Buku 9732	0
9733	1000000009733	Judul Buku 9733	0
9734	1000000009734	Judul Buku 9734	0
9735	1000000009735	Judul Buku 9735	0
9736	1000000009736	Judul Buku 9736	0
9737	1000000009737	Judul Buku 9737	0
9738	1000000009738	Judul Buku 9738	0
9739	1000000009739	Judul Buku 9739	0
9740	1000000009740	Judul Buku 9740	0
9741	1000000009741	Judul Buku 9741	0
9742	1000000009742	Judul Buku 9742	0
9743	1000000009743	Judul Buku 9743	0
9744	1000000009744	Judul Buku 9744	0
9745	1000000009745	Judul Buku 9745	0
9746	1000000009746	Judul Buku 9746	0
9747	1000000009747	Judul Buku 9747	0
9748	1000000009748	Judul Buku 9748	0
9749	1000000009749	Judul Buku 9749	0
9750	1000000009750	Judul Buku 9750	0
9751	1000000009751	Judul Buku 9751	0
9752	1000000009752	Judul Buku 9752	0
9753	1000000009753	Judul Buku 9753	0
9754	1000000009754	Judul Buku 9754	0
9755	1000000009755	Judul Buku 9755	0
9756	1000000009756	Judul Buku 9756	0
9757	1000000009757	Judul Buku 9757	0
9758	1000000009758	Judul Buku 9758	0
9759	1000000009759	Judul Buku 9759	0
9760	1000000009760	Judul Buku 9760	0
9761	1000000009761	Judul Buku 9761	0
9762	1000000009762	Judul Buku 9762	0
9763	1000000009763	Judul Buku 9763	0
9764	1000000009764	Judul Buku 9764	0
9765	1000000009765	Judul Buku 9765	0
9766	1000000009766	Judul Buku 9766	0
9767	1000000009767	Judul Buku 9767	0
9768	1000000009768	Judul Buku 9768	0
9769	1000000009769	Judul Buku 9769	0
9770	1000000009770	Judul Buku 9770	0
9771	1000000009771	Judul Buku 9771	0
9772	1000000009772	Judul Buku 9772	0
9773	1000000009773	Judul Buku 9773	0
9774	1000000009774	Judul Buku 9774	0
9775	1000000009775	Judul Buku 9775	0
9776	1000000009776	Judul Buku 9776	0
9777	1000000009777	Judul Buku 9777	0
9778	1000000009778	Judul Buku 9778	0
9779	1000000009779	Judul Buku 9779	0
9780	1000000009780	Judul Buku 9780	0
9781	1000000009781	Judul Buku 9781	0
9782	1000000009782	Judul Buku 9782	0
9783	1000000009783	Judul Buku 9783	0
9784	1000000009784	Judul Buku 9784	0
9785	1000000009785	Judul Buku 9785	0
9786	1000000009786	Judul Buku 9786	0
9787	1000000009787	Judul Buku 9787	0
9788	1000000009788	Judul Buku 9788	0
9789	1000000009789	Judul Buku 9789	0
9790	1000000009790	Judul Buku 9790	0
9791	1000000009791	Judul Buku 9791	0
9792	1000000009792	Judul Buku 9792	0
9793	1000000009793	Judul Buku 9793	0
9794	1000000009794	Judul Buku 9794	0
9795	1000000009795	Judul Buku 9795	0
9796	1000000009796	Judul Buku 9796	0
9797	1000000009797	Judul Buku 9797	0
9798	1000000009798	Judul Buku 9798	0
9799	1000000009799	Judul Buku 9799	0
9800	1000000009800	Judul Buku 9800	0
9801	1000000009801	Judul Buku 9801	0
9802	1000000009802	Judul Buku 9802	0
9803	1000000009803	Judul Buku 9803	0
9804	1000000009804	Judul Buku 9804	0
9805	1000000009805	Judul Buku 9805	0
9806	1000000009806	Judul Buku 9806	0
9807	1000000009807	Judul Buku 9807	0
9808	1000000009808	Judul Buku 9808	0
9809	1000000009809	Judul Buku 9809	0
9810	1000000009810	Judul Buku 9810	0
9811	1000000009811	Judul Buku 9811	0
9812	1000000009812	Judul Buku 9812	0
9813	1000000009813	Judul Buku 9813	0
9814	1000000009814	Judul Buku 9814	0
9815	1000000009815	Judul Buku 9815	0
9816	1000000009816	Judul Buku 9816	0
9817	1000000009817	Judul Buku 9817	0
9818	1000000009818	Judul Buku 9818	0
9819	1000000009819	Judul Buku 9819	0
9820	1000000009820	Judul Buku 9820	0
9821	1000000009821	Judul Buku 9821	0
9822	1000000009822	Judul Buku 9822	0
9823	1000000009823	Judul Buku 9823	0
9824	1000000009824	Judul Buku 9824	0
9825	1000000009825	Judul Buku 9825	0
9826	1000000009826	Judul Buku 9826	0
9827	1000000009827	Judul Buku 9827	0
9828	1000000009828	Judul Buku 9828	0
9829	1000000009829	Judul Buku 9829	0
9830	1000000009830	Judul Buku 9830	0
9831	1000000009831	Judul Buku 9831	0
9832	1000000009832	Judul Buku 9832	0
9833	1000000009833	Judul Buku 9833	0
9834	1000000009834	Judul Buku 9834	0
9835	1000000009835	Judul Buku 9835	0
9836	1000000009836	Judul Buku 9836	0
9837	1000000009837	Judul Buku 9837	0
9838	1000000009838	Judul Buku 9838	0
9839	1000000009839	Judul Buku 9839	0
9840	1000000009840	Judul Buku 9840	0
9841	1000000009841	Judul Buku 9841	0
9842	1000000009842	Judul Buku 9842	0
9843	1000000009843	Judul Buku 9843	0
9844	1000000009844	Judul Buku 9844	0
9845	1000000009845	Judul Buku 9845	0
9846	1000000009846	Judul Buku 9846	0
9847	1000000009847	Judul Buku 9847	0
9848	1000000009848	Judul Buku 9848	0
9849	1000000009849	Judul Buku 9849	0
9850	1000000009850	Judul Buku 9850	0
9851	1000000009851	Judul Buku 9851	0
9852	1000000009852	Judul Buku 9852	0
9853	1000000009853	Judul Buku 9853	0
9854	1000000009854	Judul Buku 9854	0
9855	1000000009855	Judul Buku 9855	0
9856	1000000009856	Judul Buku 9856	0
9857	1000000009857	Judul Buku 9857	0
9858	1000000009858	Judul Buku 9858	0
9859	1000000009859	Judul Buku 9859	0
9860	1000000009860	Judul Buku 9860	0
9861	1000000009861	Judul Buku 9861	0
9862	1000000009862	Judul Buku 9862	0
9863	1000000009863	Judul Buku 9863	0
9864	1000000009864	Judul Buku 9864	0
9865	1000000009865	Judul Buku 9865	0
9866	1000000009866	Judul Buku 9866	0
9867	1000000009867	Judul Buku 9867	0
9868	1000000009868	Judul Buku 9868	0
9869	1000000009869	Judul Buku 9869	0
9870	1000000009870	Judul Buku 9870	0
9871	1000000009871	Judul Buku 9871	0
9872	1000000009872	Judul Buku 9872	0
9873	1000000009873	Judul Buku 9873	0
9874	1000000009874	Judul Buku 9874	0
9875	1000000009875	Judul Buku 9875	0
9876	1000000009876	Judul Buku 9876	0
9877	1000000009877	Judul Buku 9877	0
9878	1000000009878	Judul Buku 9878	0
9879	1000000009879	Judul Buku 9879	0
9880	1000000009880	Judul Buku 9880	0
9881	1000000009881	Judul Buku 9881	0
9882	1000000009882	Judul Buku 9882	0
9883	1000000009883	Judul Buku 9883	0
9884	1000000009884	Judul Buku 9884	0
9885	1000000009885	Judul Buku 9885	0
9886	1000000009886	Judul Buku 9886	0
9887	1000000009887	Judul Buku 9887	0
9888	1000000009888	Judul Buku 9888	0
9889	1000000009889	Judul Buku 9889	0
9890	1000000009890	Judul Buku 9890	0
9891	1000000009891	Judul Buku 9891	0
9892	1000000009892	Judul Buku 9892	0
9893	1000000009893	Judul Buku 9893	0
9894	1000000009894	Judul Buku 9894	0
9895	1000000009895	Judul Buku 9895	0
9896	1000000009896	Judul Buku 9896	0
9897	1000000009897	Judul Buku 9897	0
9898	1000000009898	Judul Buku 9898	0
9899	1000000009899	Judul Buku 9899	0
9900	1000000009900	Judul Buku 9900	0
9901	1000000009901	Judul Buku 9901	0
9902	1000000009902	Judul Buku 9902	0
9903	1000000009903	Judul Buku 9903	0
9904	1000000009904	Judul Buku 9904	0
9905	1000000009905	Judul Buku 9905	0
9906	1000000009906	Judul Buku 9906	0
9907	1000000009907	Judul Buku 9907	0
9908	1000000009908	Judul Buku 9908	0
9909	1000000009909	Judul Buku 9909	0
9910	1000000009910	Judul Buku 9910	0
9911	1000000009911	Judul Buku 9911	0
9912	1000000009912	Judul Buku 9912	0
9913	1000000009913	Judul Buku 9913	0
9914	1000000009914	Judul Buku 9914	0
9915	1000000009915	Judul Buku 9915	0
9916	1000000009916	Judul Buku 9916	0
9917	1000000009917	Judul Buku 9917	0
9918	1000000009918	Judul Buku 9918	0
9919	1000000009919	Judul Buku 9919	0
9920	1000000009920	Judul Buku 9920	0
9921	1000000009921	Judul Buku 9921	0
9922	1000000009922	Judul Buku 9922	0
9923	1000000009923	Judul Buku 9923	0
9924	1000000009924	Judul Buku 9924	0
9925	1000000009925	Judul Buku 9925	0
9926	1000000009926	Judul Buku 9926	0
9927	1000000009927	Judul Buku 9927	0
9928	1000000009928	Judul Buku 9928	0
9929	1000000009929	Judul Buku 9929	0
9930	1000000009930	Judul Buku 9930	0
9931	1000000009931	Judul Buku 9931	0
9932	1000000009932	Judul Buku 9932	0
9933	1000000009933	Judul Buku 9933	0
9934	1000000009934	Judul Buku 9934	0
9935	1000000009935	Judul Buku 9935	0
9936	1000000009936	Judul Buku 9936	0
9937	1000000009937	Judul Buku 9937	0
9938	1000000009938	Judul Buku 9938	0
9939	1000000009939	Judul Buku 9939	0
9940	1000000009940	Judul Buku 9940	0
9941	1000000009941	Judul Buku 9941	0
9942	1000000009942	Judul Buku 9942	0
9943	1000000009943	Judul Buku 9943	0
9944	1000000009944	Judul Buku 9944	0
9945	1000000009945	Judul Buku 9945	0
9946	1000000009946	Judul Buku 9946	0
9947	1000000009947	Judul Buku 9947	0
9948	1000000009948	Judul Buku 9948	0
9949	1000000009949	Judul Buku 9949	0
9950	1000000009950	Judul Buku 9950	0
9951	1000000009951	Judul Buku 9951	0
9952	1000000009952	Judul Buku 9952	0
9953	1000000009953	Judul Buku 9953	0
9954	1000000009954	Judul Buku 9954	0
9955	1000000009955	Judul Buku 9955	0
9956	1000000009956	Judul Buku 9956	0
9957	1000000009957	Judul Buku 9957	0
9958	1000000009958	Judul Buku 9958	0
9959	1000000009959	Judul Buku 9959	0
9960	1000000009960	Judul Buku 9960	0
9961	1000000009961	Judul Buku 9961	0
9962	1000000009962	Judul Buku 9962	0
9963	1000000009963	Judul Buku 9963	0
9964	1000000009964	Judul Buku 9964	0
9965	1000000009965	Judul Buku 9965	0
9966	1000000009966	Judul Buku 9966	0
9967	1000000009967	Judul Buku 9967	0
9968	1000000009968	Judul Buku 9968	0
9969	1000000009969	Judul Buku 9969	0
9970	1000000009970	Judul Buku 9970	0
9971	1000000009971	Judul Buku 9971	0
9972	1000000009972	Judul Buku 9972	0
9973	1000000009973	Judul Buku 9973	0
9974	1000000009974	Judul Buku 9974	0
9975	1000000009975	Judul Buku 9975	0
9976	1000000009976	Judul Buku 9976	0
9977	1000000009977	Judul Buku 9977	0
9978	1000000009978	Judul Buku 9978	0
9979	1000000009979	Judul Buku 9979	0
9980	1000000009980	Judul Buku 9980	0
9981	1000000009981	Judul Buku 9981	0
9982	1000000009982	Judul Buku 9982	0
9983	1000000009983	Judul Buku 9983	0
9984	1000000009984	Judul Buku 9984	0
9985	1000000009985	Judul Buku 9985	0
9986	1000000009986	Judul Buku 9986	0
9987	1000000009987	Judul Buku 9987	0
9988	1000000009988	Judul Buku 9988	0
9989	1000000009989	Judul Buku 9989	0
9990	1000000009990	Judul Buku 9990	0
9991	1000000009991	Judul Buku 9991	0
9992	1000000009992	Judul Buku 9992	0
9993	1000000009993	Judul Buku 9993	0
9994	1000000009994	Judul Buku 9994	0
9995	1000000009995	Judul Buku 9995	0
9996	1000000009996	Judul Buku 9996	0
9997	1000000009997	Judul Buku 9997	0
9998	1000000009998	Judul Buku 9998	0
9999	1000000009999	Judul Buku 9999	0
10000	1000000010000	Judul Buku 10000	0
\.


--
-- TOC entry 5009 (class 0 OID 17512)
-- Dependencies: 231
-- Data for Name: buku_kategori; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.buku_kategori (id_buku, id_kategori) FROM stdin;
1	8
2	17
3	6
4	7
5	13
6	16
7	7
8	15
9	5
10	5
11	16
12	16
13	12
14	13
15	8
16	5
17	7
18	19
19	2
20	3
21	1
22	5
23	6
24	19
25	3
26	16
27	4
28	9
29	17
30	16
31	2
32	4
33	18
34	6
35	7
36	13
37	1
38	10
39	4
40	16
41	17
42	10
43	9
44	17
45	5
46	5
47	5
48	5
49	9
50	6
51	16
52	15
53	7
54	10
55	13
56	10
57	8
58	6
59	20
60	18
61	16
62	14
63	10
64	8
65	4
66	2
67	17
68	1
69	9
70	15
71	14
72	15
73	17
74	16
75	8
76	16
77	18
78	18
79	11
80	2
81	13
82	16
83	7
84	12
85	9
86	14
87	1
88	11
89	12
90	5
91	19
92	9
93	9
94	11
95	15
96	6
97	7
98	16
99	4
100	19
101	5
102	2
103	4
104	6
105	15
106	6
107	12
108	19
109	10
110	14
111	8
112	9
113	8
114	7
115	10
116	16
117	2
118	8
119	19
120	12
121	7
122	7
123	1
124	6
125	15
126	18
127	8
128	17
129	5
130	2
131	4
132	6
133	17
134	10
135	9
136	12
137	10
138	3
139	9
140	16
141	19
142	15
143	9
144	8
145	16
146	4
147	4
148	5
149	18
150	19
151	18
152	17
153	9
154	8
155	11
156	4
157	6
158	18
159	18
160	16
161	17
162	3
163	6
164	6
165	5
166	13
167	9
168	7
169	7
170	14
171	20
172	15
173	16
174	10
175	16
176	16
177	8
178	12
179	17
180	1
181	17
182	3
183	5
184	7
185	18
186	1
187	6
188	10
189	14
190	16
191	8
192	19
193	16
194	4
195	9
196	7
197	7
198	10
199	17
200	17
201	20
202	20
203	5
204	17
205	18
206	5
207	15
208	13
209	11
210	3
211	4
212	7
213	13
214	10
215	17
216	5
217	4
218	13
219	6
220	4
221	15
222	8
223	7
224	1
225	9
226	7
227	18
228	7
229	18
230	12
231	11
232	13
233	11
234	20
235	8
236	10
237	6
238	3
239	18
240	3
241	15
242	4
243	15
244	16
245	15
246	3
247	4
248	7
249	7
250	20
251	19
252	9
253	17
254	16
255	8
256	9
257	12
258	12
259	8
260	10
261	14
262	3
263	4
264	18
265	2
266	13
267	18
268	19
269	16
270	2
271	15
272	16
273	10
274	17
275	19
276	6
277	18
278	6
279	16
280	10
281	7
282	3
283	3
284	10
285	10
286	3
287	2
288	15
289	5
290	16
291	3
292	7
293	17
294	13
295	2
296	10
297	15
298	5
299	8
300	18
301	1
302	13
303	12
304	18
305	15
306	12
307	4
308	9
309	18
310	18
311	7
312	20
313	13
314	3
315	14
316	12
317	14
318	8
319	12
320	19
321	7
322	12
323	20
324	17
325	11
326	7
327	5
328	8
329	7
330	10
331	16
332	15
333	14
334	11
335	7
336	6
337	9
338	15
339	9
340	7
341	11
342	18
343	19
344	19
345	14
346	14
347	16
348	7
349	9
350	13
351	15
352	7
353	3
354	7
355	6
356	11
357	16
358	12
359	18
360	5
361	3
362	17
363	8
364	17
365	20
366	18
367	14
368	13
369	12
370	10
371	2
372	8
373	18
374	4
375	10
376	10
377	7
378	17
379	7
380	16
381	7
382	5
383	2
384	5
385	16
386	6
387	6
388	6
389	16
390	17
391	14
392	5
393	5
394	10
395	18
396	4
397	18
398	15
399	15
400	19
401	20
402	18
403	3
404	7
405	10
406	6
407	14
408	4
409	13
410	19
411	2
412	7
413	9
414	16
415	3
416	12
417	5
418	11
419	9
420	3
421	15
422	7
423	14
424	17
425	15
426	6
427	2
428	16
429	12
430	5
431	13
432	15
433	13
434	17
435	16
436	11
437	2
438	10
439	20
440	15
441	15
442	11
443	3
444	4
445	7
446	3
447	2
448	17
449	4
450	9
451	13
452	8
453	12
454	11
455	3
456	6
457	4
458	20
459	14
460	8
461	3
462	13
463	16
464	8
465	6
466	9
467	3
468	2
469	6
470	12
471	4
472	7
473	18
474	11
475	15
476	11
477	18
478	17
479	13
480	17
481	2
482	7
483	13
484	2
485	4
486	5
487	3
488	12
489	16
490	18
491	13
492	4
493	8
494	8
495	5
496	2
497	14
498	16
499	9
500	7
501	14
502	9
503	6
504	16
505	8
506	18
507	9
508	16
509	12
510	8
511	16
512	17
513	16
514	15
515	6
516	8
517	11
518	19
519	20
520	4
521	15
522	20
523	7
524	18
525	13
526	9
527	13
528	13
529	16
530	17
531	11
532	2
533	17
534	3
535	3
536	8
537	2
538	5
539	4
540	7
541	4
542	4
543	10
544	7
545	18
546	13
547	5
548	8
549	16
550	16
551	15
552	3
553	6
554	4
555	12
556	17
557	17
558	6
559	11
560	3
561	3
562	18
563	17
564	2
565	7
566	16
567	8
568	14
569	4
570	18
571	11
572	11
573	18
574	8
575	2
576	10
577	19
578	9
579	5
580	19
581	9
582	7
583	15
584	20
585	16
586	3
587	15
588	11
589	16
590	4
591	13
592	10
593	11
594	10
595	13
596	13
597	2
598	9
599	16
600	3
601	12
602	16
603	5
604	16
605	13
606	7
607	19
608	2
609	2
610	17
611	10
612	11
613	7
614	16
615	7
616	8
617	12
618	4
619	7
620	7
621	16
622	11
623	9
624	4
625	2
626	14
627	4
628	10
629	20
630	9
631	2
632	5
633	11
634	6
635	2
636	5
637	17
638	5
639	15
640	5
641	10
642	14
643	9
644	14
645	6
646	5
647	13
648	7
649	11
650	7
651	8
652	7
653	8
654	6
655	7
656	5
657	2
658	2
659	1
660	10
661	7
662	5
663	6
664	17
665	3
666	6
667	7
668	8
669	15
670	7
671	13
672	2
673	9
674	17
675	17
676	7
677	16
678	1
679	18
680	7
681	18
682	6
683	20
684	6
685	7
686	11
687	9
688	5
689	12
690	13
691	14
692	16
693	8
694	14
695	19
696	8
697	5
698	12
699	12
700	6
701	19
702	6
703	2
704	16
705	8
706	7
707	5
708	7
709	14
710	6
711	3
712	10
713	14
714	19
715	17
716	11
717	10
718	4
719	10
720	4
721	19
722	5
723	10
724	15
725	6
726	13
727	6
728	15
729	7
730	9
731	5
732	5
733	13
734	3
735	6
736	2
737	9
738	14
739	17
740	8
741	4
742	8
743	2
744	17
745	12
746	5
747	7
748	7
749	5
750	15
751	15
752	6
753	5
754	4
755	14
756	14
757	16
758	16
759	5
760	6
761	17
762	14
763	7
764	2
765	11
766	19
767	4
768	17
769	1
770	3
771	18
772	7
773	4
774	14
775	13
776	9
777	17
778	2
779	2
780	18
781	4
782	8
783	10
784	12
785	18
786	2
787	5
788	4
789	14
790	18
791	17
792	16
793	11
794	11
795	9
796	15
797	8
798	14
799	17
800	7
801	11
802	13
803	8
804	8
805	9
806	10
807	12
808	12
809	11
810	14
811	10
812	3
813	19
814	11
815	11
816	3
817	20
818	9
819	9
820	9
821	20
822	19
823	20
824	13
825	10
826	2
827	17
828	5
829	18
830	19
831	17
832	9
833	12
834	3
835	2
836	4
837	14
838	4
839	11
840	15
841	4
842	7
843	5
844	10
845	7
846	11
847	2
848	19
849	13
850	3
851	5
852	15
853	9
854	14
855	18
856	2
857	11
858	18
859	2
860	8
861	5
862	20
863	8
864	10
865	16
866	19
867	13
868	4
869	14
870	8
871	10
872	14
873	16
874	16
875	12
876	2
877	2
878	11
879	15
880	12
881	6
882	5
883	11
884	1
885	8
886	9
887	10
888	3
889	8
890	6
891	12
892	17
893	6
894	13
895	17
896	12
897	17
898	9
899	6
900	7
901	4
902	9
903	14
904	18
905	8
906	13
907	7
908	5
909	7
910	15
911	15
912	2
913	7
914	19
915	1
916	6
917	2
918	2
919	8
920	7
921	15
922	15
923	4
924	4
925	18
926	9
927	12
928	3
929	20
930	6
931	5
932	14
933	8
934	19
935	6
936	15
937	17
938	13
939	7
940	1
941	10
942	12
943	14
944	15
945	10
946	15
947	12
948	15
949	4
950	17
951	13
952	19
953	16
954	15
955	12
956	19
957	19
958	11
959	18
960	4
961	17
962	13
963	5
964	19
965	19
966	12
967	2
968	5
969	1
970	13
971	4
972	19
973	19
974	19
975	4
976	8
977	3
978	4
979	5
980	19
981	20
982	17
983	9
984	15
985	11
986	11
987	12
988	19
989	8
990	4
991	17
992	14
993	18
994	17
995	7
996	17
997	19
998	5
999	17
1000	4
1001	19
1002	10
1003	13
1004	15
1005	3
1006	11
1007	5
1008	2
1009	17
1010	10
1011	3
1012	6
1013	4
1014	3
1015	3
1016	9
1017	19
1018	20
1019	6
1020	9
1021	12
1022	12
1023	6
1024	5
1025	15
1026	4
1027	15
1028	16
1029	17
1030	14
1031	12
1032	13
1033	19
1034	8
1035	6
1036	4
1037	8
1038	12
1039	16
1040	19
1041	14
1042	2
1043	10
1044	6
1045	18
1046	2
1047	5
1048	9
1049	16
1050	17
1051	18
1052	3
1053	9
1054	6
1055	13
1056	8
1057	10
1058	13
1059	11
1060	2
1061	14
1062	7
1063	1
1064	6
1065	17
1066	10
1067	19
1068	11
1069	6
1070	1
1071	11
1072	15
1073	3
1074	14
1075	13
1076	15
1077	10
1078	16
1079	5
1080	11
1081	10
1082	15
1083	7
1084	1
1085	17
1086	11
1087	6
1088	7
1089	17
1090	16
1091	5
1092	13
1093	13
1094	18
1095	1
1096	12
1097	7
1098	4
1099	2
1100	11
1101	18
1102	7
1103	19
1104	6
1105	3
1106	10
1107	3
1108	5
1109	6
1110	17
1111	4
1112	13
1113	7
1114	8
1115	15
1116	6
1117	7
1118	11
1119	5
1120	12
1121	13
1122	1
1123	4
1124	11
1125	19
1126	6
1127	7
1128	9
1129	14
1130	3
1131	13
1132	4
1133	14
1134	2
1135	17
1136	2
1137	20
1138	18
1139	2
1140	15
1141	11
1142	1
1143	20
1144	13
1145	1
1146	15
1147	11
1148	2
1149	1
1150	14
1151	5
1152	5
1153	8
1154	4
1155	14
1156	13
1157	1
1158	7
1159	3
1160	3
1161	5
1162	17
1163	2
1164	16
1165	4
1166	19
1167	5
1168	10
1169	2
1170	7
1171	14
1172	4
1173	2
1174	15
1175	12
1176	1
1177	18
1178	9
1179	7
1180	5
1181	12
1182	10
1183	18
1184	12
1185	3
1186	11
1187	18
1188	10
1189	15
1190	6
1191	1
1192	14
1193	11
1194	10
1195	12
1196	19
1197	20
1198	5
1199	11
1200	19
1201	16
1202	13
1203	14
1204	13
1205	13
1206	2
1207	6
1208	18
1209	8
1210	10
1211	14
1212	12
1213	20
1214	4
1215	14
1216	6
1217	10
1218	15
1219	15
1220	12
1221	6
1222	19
1223	13
1224	14
1225	9
1226	19
1227	14
1228	1
1229	14
1230	2
1231	17
1232	6
1233	6
1234	5
1235	19
1236	14
1237	3
1238	19
1239	13
1240	13
1241	4
1242	8
1243	19
1244	10
1245	17
1246	10
1247	5
1248	19
1249	2
1250	13
1251	8
1252	1
1253	7
1254	8
1255	15
1256	8
1257	13
1258	14
1259	15
1260	12
1261	14
1262	7
1263	8
1264	14
1265	20
1266	13
1267	12
1268	10
1269	10
1270	5
1271	5
1272	9
1273	10
1274	18
1275	19
1276	1
1277	19
1278	16
1279	13
1280	11
1281	20
1282	11
1283	20
1284	14
1285	14
1286	4
1287	8
1288	5
1289	7
1290	14
1291	5
1292	18
1293	5
1294	12
1295	17
1296	7
1297	12
1298	14
1299	9
1300	11
1301	15
1302	2
1303	3
1304	15
1305	1
1306	4
1307	17
1308	10
1309	9
1310	4
1311	19
1312	14
1313	18
1314	20
1315	19
1316	11
1317	13
1318	18
1319	17
1320	18
1321	20
1322	4
1323	8
1324	9
1325	10
1326	18
1327	7
1328	6
1329	12
1330	17
1331	20
1332	20
1333	16
1334	17
1335	2
1336	7
1337	5
1338	13
1339	17
1340	8
1341	17
1342	16
1343	17
1344	4
1345	15
1346	16
1347	17
1348	15
1349	3
1350	20
1351	7
1352	9
1353	12
1354	18
1355	14
1356	7
1357	8
1358	3
1359	11
1360	7
1361	9
1362	12
1363	14
1364	6
1365	3
1366	20
1367	3
1368	15
1369	5
1370	2
1371	5
1372	2
1373	9
1374	15
1375	4
1376	14
1377	19
1378	16
1379	1
1380	10
1381	15
1382	17
1383	6
1384	4
1385	5
1386	4
1387	8
1388	16
1389	19
1390	8
1391	17
1392	15
1393	19
1394	8
1395	8
1396	12
1397	11
1398	17
1399	3
1400	18
1401	19
1402	15
1403	6
1404	19
1405	17
1406	16
1407	19
1408	17
1409	2
1410	8
1411	5
1412	12
1413	7
1414	10
1415	2
1416	10
1417	13
1418	8
1419	19
1420	17
1421	14
1422	6
1423	13
1424	2
1425	7
1426	5
1427	8
1428	11
1429	8
1430	2
1431	17
1432	15
1433	15
1434	7
1435	18
1436	13
1437	5
1438	5
1439	12
1440	6
1441	1
1442	14
1443	15
1444	2
1445	17
1446	18
1447	16
1448	16
1449	13
1450	9
1451	4
1452	11
1453	13
1454	16
1455	20
1456	4
1457	5
1458	10
1459	18
1460	15
1461	8
1462	14
1463	7
1464	2
1465	15
1466	11
1467	8
1468	8
1469	12
1470	16
1471	13
1472	7
1473	20
1474	11
1475	16
1476	17
1477	17
1478	20
1479	4
1480	3
1481	4
1482	2
1483	13
1484	1
1485	6
1486	19
1487	2
1488	6
1489	2
1490	18
1491	4
1492	10
1493	8
1494	18
1495	11
1496	20
1497	19
1498	7
1499	14
1500	13
1501	3
1502	5
1503	15
1504	18
1505	3
1506	3
1507	14
1508	10
1509	17
1510	5
1511	15
1512	17
1513	5
1514	14
1515	14
1516	16
1517	17
1518	7
1519	5
1520	16
1521	17
1522	10
1523	16
1524	6
1525	9
1526	9
1527	8
1528	8
1529	2
1530	3
1531	7
1532	15
1533	13
1534	9
1535	5
1536	13
1537	15
1538	18
1539	13
1540	13
1541	10
1542	6
1543	2
1544	8
1545	10
1546	13
1547	2
1548	13
1549	1
1550	13
1551	12
1552	7
1553	11
1554	12
1555	16
1556	9
1557	20
1558	10
1559	11
1560	15
1561	3
1562	19
1563	18
1564	2
1565	15
1566	17
1567	6
1568	11
1569	8
1570	12
1571	12
1572	5
1573	8
1574	14
1575	12
1576	7
1577	3
1578	7
1579	10
1580	5
1581	14
1582	13
1583	2
1584	7
1585	15
1586	1
1587	9
1588	14
1589	11
1590	13
1591	15
1592	16
1593	17
1594	1
1595	19
1596	15
1597	9
1598	14
1599	8
1600	8
1601	7
1602	18
1603	9
1604	10
1605	1
1606	9
1607	2
1608	1
1609	13
1610	5
1611	12
1612	7
1613	17
1614	10
1615	14
1616	3
1617	10
1618	17
1619	8
1620	20
1621	13
1622	18
1623	3
1624	11
1625	20
1626	9
1627	8
1628	3
1629	13
1630	10
1631	4
1632	17
1633	2
1634	10
1635	3
1636	13
1637	16
1638	15
1639	14
1640	16
1641	18
1642	11
1643	11
1644	9
1645	3
1646	6
1647	8
1648	12
1649	7
1650	15
1651	19
1652	7
1653	7
1654	3
1655	14
1656	18
1657	13
1658	18
1659	1
1660	19
1661	19
1662	1
1663	7
1664	18
1665	8
1666	18
1667	3
1668	7
1669	15
1670	11
1671	2
1672	7
1673	3
1674	7
1675	2
1676	11
1677	5
1678	6
1679	11
1680	14
1681	10
1682	16
1683	13
1684	13
1685	9
1686	2
1687	7
1688	13
1689	14
1690	15
1691	19
1692	20
1693	3
1694	16
1695	16
1696	20
1697	15
1698	1
1699	12
1700	14
1701	16
1702	17
1703	9
1704	9
1705	7
1706	5
1707	10
1708	18
1709	2
1710	6
1711	5
1712	3
1713	16
1714	5
1715	12
1716	10
1717	12
1718	19
1719	1
1720	14
1721	3
1722	17
1723	2
1724	12
1725	6
1726	3
1727	1
1728	11
1729	7
1730	17
1731	16
1732	1
1733	4
1734	15
1735	2
1736	19
1737	6
1738	6
1739	6
1740	14
1741	5
1742	11
1743	16
1744	9
1745	17
1746	14
1747	4
1748	3
1749	10
1750	6
1751	18
1752	14
1753	3
1754	4
1755	15
1756	15
1757	14
1758	2
1759	9
1760	10
1761	11
1762	5
1763	3
1764	15
1765	18
1766	13
1767	7
1768	6
1769	4
1770	16
1771	13
1772	13
1773	11
1774	5
1775	5
1776	4
1777	19
1778	9
1779	14
1780	1
1781	2
1782	16
1783	11
1784	15
1785	3
1786	18
1787	16
1788	13
1789	9
1790	16
1791	15
1792	2
1793	17
1794	7
1795	3
1796	2
1797	5
1798	10
1799	20
1800	18
1801	11
1802	2
1803	5
1804	5
1805	8
1806	12
1807	16
1808	5
1809	16
1810	16
1811	11
1812	5
1813	15
1814	15
1815	10
1816	3
1817	15
1818	19
1819	2
1820	5
1821	13
1822	20
1823	5
1824	16
1825	12
1826	7
1827	5
1828	20
1829	14
1830	17
1831	10
1832	5
1833	9
1834	16
1835	15
1836	8
1837	18
1838	8
1839	6
1840	6
1841	5
1842	9
1843	13
1844	19
1845	6
1846	18
1847	2
1848	5
1849	20
1850	10
1851	15
1852	17
1853	13
1854	19
1855	17
1856	7
1857	5
1858	16
1859	5
1860	6
1861	17
1862	6
1863	7
1864	17
1865	11
1866	14
1867	10
1868	5
1869	19
1870	2
1871	7
1872	18
1873	2
1874	6
1875	19
1876	17
1877	5
1878	13
1879	10
1880	15
1881	16
1882	11
1883	7
1884	17
1885	18
1886	17
1887	15
1888	16
1889	18
1890	15
1891	7
1892	16
1893	16
1894	17
1895	11
1896	17
1897	2
1898	18
1899	10
1900	13
1901	13
1902	18
1903	18
1904	8
1905	10
1906	18
1907	8
1908	13
1909	18
1910	6
1911	8
1912	12
1913	3
1914	14
1915	13
1916	6
1917	3
1918	19
1919	6
1920	3
1921	15
1922	2
1923	3
1924	3
1925	7
1926	5
1927	5
1928	10
1929	5
1930	10
1931	13
1932	9
1933	9
1934	3
1935	10
1936	12
1937	19
1938	2
1939	6
1940	2
1941	14
1942	9
1943	5
1944	16
1945	14
1946	17
1947	19
1948	11
1949	2
1950	16
1951	13
1952	6
1953	14
1954	9
1955	20
1956	2
1957	16
1958	4
1959	16
1960	13
1961	8
1962	3
1963	12
1964	6
1965	2
1966	6
1967	18
1968	19
1969	4
1970	2
1971	13
1972	12
1973	7
1974	4
1975	18
1976	12
1977	7
1978	8
1979	1
1980	8
1981	18
1982	6
1983	17
1984	19
1985	10
1986	6
1987	18
1988	11
1989	3
1990	12
1991	15
1992	8
1993	9
1994	12
1995	11
1996	9
1997	2
1998	7
1999	1
2000	4
2001	3
2002	18
2003	15
2004	11
2005	17
2006	15
2007	20
2008	4
2009	3
2010	20
2011	15
2012	20
2013	8
2014	17
2015	14
2016	19
2017	10
2018	13
2019	11
2020	13
2021	18
2022	8
2023	10
2024	18
2025	10
2026	17
2027	14
2028	2
2029	20
2030	8
2031	14
2032	14
2033	18
2034	14
2035	15
2036	2
2037	15
2038	9
2039	6
2040	7
2041	19
2042	8
2043	12
2044	18
2045	6
2046	4
2047	11
2048	9
2049	9
2050	9
2051	6
2052	3
2053	12
2054	5
2055	10
2056	16
2057	17
2058	9
2059	16
2060	8
2061	2
2062	12
2063	14
2064	17
2065	9
2066	15
2067	18
2068	12
2069	9
2070	3
2071	3
2072	17
2073	17
2074	12
2075	7
2076	7
2077	2
2078	11
2079	5
2080	19
2081	5
2082	18
2083	4
2084	4
2085	6
2086	20
2087	15
2088	16
2089	11
2090	17
2091	5
2092	17
2093	14
2094	12
2095	10
2096	18
2097	13
2098	4
2099	16
2100	5
2101	3
2102	16
2103	14
2104	16
2105	18
2106	17
2107	18
2108	19
2109	14
2110	4
2111	17
2112	9
2113	12
2114	13
2115	13
2116	10
2117	19
2118	10
2119	17
2120	6
2121	2
2122	2
2123	3
2124	6
2125	18
2126	16
2127	9
2128	18
2129	2
2130	17
2131	6
2132	10
2133	19
2134	19
2135	13
2136	10
2137	17
2138	4
2139	4
2140	17
2141	2
2142	16
2143	5
2144	7
2145	19
2146	11
2147	11
2148	6
2149	13
2150	16
2151	9
2152	8
2153	5
2154	7
2155	10
2156	6
2157	7
2158	4
2159	4
2160	16
2161	15
2162	14
2163	12
2164	9
2165	18
2166	11
2167	15
2168	19
2169	19
2170	7
2171	19
2172	7
2173	7
2174	1
2175	11
2176	20
2177	16
2178	6
2179	4
2180	9
2181	7
2182	7
2183	9
2184	9
2185	7
2186	10
2187	19
2188	11
2189	9
2190	6
2191	3
2192	9
2193	5
2194	20
2195	5
2196	15
2197	14
2198	9
2199	19
2200	19
2201	16
2202	11
2203	1
2204	8
2205	18
2206	11
2207	7
2208	4
2209	16
2210	6
2211	14
2212	9
2213	7
2214	2
2215	9
2216	8
2217	2
2218	13
2219	12
2220	3
2221	6
2222	9
2223	10
2224	11
2225	20
2226	15
2227	7
2228	15
2229	7
2230	5
2231	18
2232	18
2233	13
2234	7
2235	15
2236	11
2237	6
2238	11
2239	20
2240	17
2241	13
2242	2
2243	15
2244	19
2245	14
2246	8
2247	5
2248	6
2249	7
2250	1
2251	8
2252	13
2253	19
2254	8
2255	7
2256	14
2257	2
2258	1
2259	9
2260	17
2261	12
2262	18
2263	2
2264	18
2265	8
2266	3
2267	1
2268	4
2269	8
2270	3
2271	5
2272	3
2273	11
2274	2
2275	3
2276	8
2277	6
2278	13
2279	19
2280	17
2281	16
2282	16
2283	14
2284	17
2285	6
2286	17
2287	12
2288	12
2289	18
2290	10
2291	4
2292	13
2293	15
2294	8
2295	3
2296	7
2297	8
2298	20
2299	15
2300	16
2301	2
2302	8
2303	6
2304	3
2305	14
2306	15
2307	3
2308	15
2309	14
2310	8
2311	20
2312	19
2313	2
2314	15
2315	6
2316	11
2317	13
2318	8
2319	11
2320	14
2321	2
2322	12
2323	17
2324	6
2325	8
2326	5
2327	5
2328	14
2329	19
2330	4
2331	2
2332	19
2333	13
2334	7
2335	16
2336	2
2337	18
2338	4
2339	12
2340	16
2341	19
2342	15
2343	7
2344	18
2345	4
2346	7
2347	3
2348	17
2349	12
2350	12
2351	15
2352	13
2353	14
2354	2
2355	1
2356	3
2357	1
2358	4
2359	16
2360	6
2361	18
2362	13
2363	16
2364	14
2365	8
2366	10
2367	1
2368	19
2369	11
2370	5
2371	14
2372	8
2373	16
2374	18
2375	10
2376	2
2377	10
2378	6
2379	18
2380	5
2381	15
2382	14
2383	16
2384	9
2385	4
2386	18
2387	9
2388	12
2389	14
2390	10
2391	16
2392	20
2393	7
2394	3
2395	2
2396	11
2397	11
2398	12
2399	15
2400	9
2401	3
2402	15
2403	4
2404	4
2405	20
2406	11
2407	15
2408	3
2409	8
2410	4
2411	7
2412	1
2413	2
2414	12
2415	6
2416	16
2417	15
2418	7
2419	11
2420	11
2421	6
2422	3
2423	3
2424	11
2425	9
2426	17
2427	18
2428	1
2429	19
2430	18
2431	8
2432	20
2433	19
2434	19
2435	6
2436	9
2437	18
2438	1
2439	7
2440	20
2441	13
2442	16
2443	5
2444	8
2445	17
2446	16
2447	13
2448	12
2449	11
2450	5
2451	10
2452	9
2453	12
2454	2
2455	1
2456	16
2457	8
2458	8
2459	6
2460	3
2461	15
2462	10
2463	17
2464	7
2465	12
2466	19
2467	7
2468	2
2469	17
2470	11
2471	6
2472	18
2473	10
2474	5
2475	8
2476	14
2477	19
2478	2
2479	10
2480	10
2481	17
2482	6
2483	4
2484	14
2485	20
2486	9
2487	19
2488	9
2489	4
2490	19
2491	8
2492	5
2493	11
2494	11
2495	15
2496	8
2497	19
2498	5
2499	17
2500	1
2501	19
2502	3
2503	6
2504	14
2505	9
2506	20
2507	6
2508	7
2509	19
2510	8
2511	4
2512	19
2513	1
2514	7
2515	11
2516	12
2517	16
2518	18
2519	5
2520	5
2521	5
2522	9
2523	9
2524	11
2525	9
2526	3
2527	7
2528	17
2529	4
2530	17
2531	15
2532	6
2533	14
2534	5
2535	7
2536	13
2537	13
2538	17
2539	5
2540	18
2541	16
2542	4
2543	9
2544	18
2545	19
2546	18
2547	1
2548	6
2549	16
2550	14
2551	14
2552	17
2553	9
2554	5
2555	14
2556	3
2557	18
2558	18
2559	6
2560	15
2561	4
2562	20
2563	20
2564	18
2565	4
2566	6
2567	5
2568	19
2569	16
2570	18
2571	9
2572	15
2573	4
2574	8
2575	9
2576	2
2577	3
2578	5
2579	17
2580	8
2581	3
2582	16
2583	15
2584	15
2585	11
2586	10
2587	10
2588	10
2589	7
2590	6
2591	7
2592	12
2593	1
2594	14
2595	15
2596	6
2597	17
2598	11
2599	13
2600	6
2601	19
2602	13
2603	17
2604	10
2605	19
2606	9
2607	12
2608	17
2609	13
2610	11
2611	16
2612	9
2613	8
2614	14
2615	13
2616	4
2617	12
2618	13
2619	7
2620	4
2621	18
2622	2
2623	13
2624	17
2625	10
2626	4
2627	4
2628	10
2629	13
2630	15
2631	15
2632	14
2633	1
2634	1
2635	11
2636	10
2637	8
2638	19
2639	6
2640	14
2641	16
2642	15
2643	6
2644	10
2645	6
2646	7
2647	5
2648	7
2649	10
2650	6
2651	16
2652	18
2653	19
2654	14
2655	4
2656	9
2657	2
2658	12
2659	15
2660	16
2661	2
2662	14
2663	12
2664	1
2665	15
2666	2
2667	4
2668	7
2669	15
2670	19
2671	17
2672	2
2673	4
2674	8
2675	4
2676	19
2677	1
2678	12
2679	12
2680	6
2681	10
2682	6
2683	5
2684	18
2685	16
2686	2
2687	19
2688	10
2689	1
2690	1
2691	13
2692	11
2693	2
2694	4
2695	8
2696	4
2697	13
2698	18
2699	17
2700	12
2701	6
2702	7
2703	10
2704	9
2705	1
2706	7
2707	7
2708	12
2709	7
2710	9
2711	1
2712	12
2713	12
2714	13
2715	6
2716	9
2717	9
2718	9
2719	13
2720	5
2721	18
2722	16
2723	16
2724	16
2725	11
2726	6
2727	9
2728	18
2729	2
2730	9
2731	10
2732	15
2733	2
2734	6
2735	3
2736	8
2737	3
2738	3
2739	10
2740	15
2741	15
2742	4
2743	16
2744	10
2745	9
2746	15
2747	4
2748	15
2749	9
2750	14
2751	3
2752	7
2753	13
2754	5
2755	9
2756	9
2757	8
2758	17
2759	12
2760	16
2761	11
2762	5
2763	18
2764	3
2765	3
2766	5
2767	11
2768	19
2769	5
2770	3
2771	20
2772	14
2773	15
2774	19
2775	18
2776	6
2777	2
2778	12
2779	4
2780	9
2781	15
2782	14
2783	15
2784	17
2785	8
2786	15
2787	11
2788	18
2789	1
2790	15
2791	3
2792	1
2793	15
2794	7
2795	7
2796	20
2797	5
2798	15
2799	12
2800	19
2801	18
2802	17
2803	14
2804	17
2805	20
2806	11
2807	6
2808	12
2809	18
2810	3
2811	7
2812	16
2813	16
2814	2
2815	11
2816	2
2817	14
2818	7
2819	8
2820	8
2821	14
2822	20
2823	19
2824	1
2825	19
2826	2
2827	15
2828	4
2829	9
2830	15
2831	14
2832	5
2833	9
2834	11
2835	19
2836	17
2837	12
2838	16
2839	13
2840	15
2841	14
2842	17
2843	2
2844	7
2845	3
2846	4
2847	9
2848	18
2849	15
2850	10
2851	18
2852	19
2853	16
2854	14
2855	1
2856	17
2857	10
2858	5
2859	5
2860	9
2861	16
2862	19
2863	4
2864	12
2865	19
2866	1
2867	9
2868	4
2869	13
2870	20
2871	19
2872	14
2873	10
2874	3
2875	19
2876	8
2877	4
2878	10
2879	9
2880	15
2881	20
2882	4
2883	20
2884	10
2885	9
2886	14
2887	4
2888	18
2889	12
2890	15
2891	10
2892	19
2893	17
2894	5
2895	12
2896	20
2897	18
2898	11
2899	14
2900	11
2901	4
2902	11
2903	15
2904	13
2905	3
2906	8
2907	5
2908	17
2909	17
2910	20
2911	19
2912	5
2913	8
2914	4
2915	7
2916	17
2917	15
2918	19
2919	19
2920	17
2921	5
2922	19
2923	4
2924	20
2925	2
2926	12
2927	5
2928	18
2929	13
2930	13
2931	19
2932	12
2933	6
2934	2
2935	13
2936	9
2937	16
2938	12
2939	2
2940	18
2941	2
2942	8
2943	12
2944	20
2945	3
2946	4
2947	11
2948	18
2949	11
2950	17
2951	11
2952	9
2953	18
2954	17
2955	9
2956	20
2957	16
2958	12
2959	12
2960	8
2961	3
2962	16
2963	2
2964	2
2965	13
2966	8
2967	13
2968	8
2969	8
2970	10
2971	5
2972	18
2973	13
2974	12
2975	17
2976	9
2977	15
2978	17
2979	3
2980	9
2981	11
2982	7
2983	10
2984	3
2985	13
2986	3
2987	16
2988	8
2989	20
2990	8
2991	9
2992	18
2993	11
2994	5
2995	4
2996	14
2997	16
2998	16
2999	4
3000	9
3001	10
3002	4
3003	18
3004	20
3005	9
3006	7
3007	5
3008	7
3009	7
3010	19
3011	16
3012	19
3013	18
3014	16
3015	18
3016	10
3017	9
3018	12
3019	7
3020	19
3021	18
3022	4
3023	2
3024	4
3025	6
3026	16
3027	8
3028	19
3029	18
3030	4
3031	6
3032	11
3033	5
3034	20
3035	19
3036	9
3037	17
3038	17
3039	8
3040	16
3041	10
3042	14
3043	3
3044	17
3045	13
3046	16
3047	19
3048	2
3049	6
3050	19
3051	18
3052	1
3053	20
3054	18
3055	18
3056	14
3057	15
3058	18
3059	11
3060	19
3061	14
3062	6
3063	16
3064	9
3065	6
3066	6
3067	12
3068	2
3069	3
3070	12
3071	5
3072	15
3073	12
3074	18
3075	3
3076	7
3077	2
3078	16
3079	6
3080	17
3081	11
3082	19
3083	9
3084	8
3085	6
3086	19
3087	12
3088	19
3089	8
3090	11
3091	2
3092	14
3093	17
3094	4
3095	16
3096	15
3097	10
3098	13
3099	12
3100	4
3101	18
3102	2
3103	11
3104	12
3105	13
3106	2
3107	9
3108	18
3109	9
3110	11
3111	4
3112	15
3113	6
3114	14
3115	13
3116	15
3117	20
3118	11
3119	14
3120	9
3121	8
3122	2
3123	12
3124	5
3125	13
3126	19
3127	20
3128	7
3129	13
3130	4
3131	9
3132	7
3133	13
3134	18
3135	3
3136	13
3137	15
3138	9
3139	2
3140	16
3141	4
3142	3
3143	9
3144	2
3145	15
3146	17
3147	5
3148	12
3149	9
3150	2
3151	2
3152	19
3153	11
3154	5
3155	10
3156	5
3157	16
3158	17
3159	18
3160	17
3161	18
3162	10
3163	3
3164	15
3165	16
3166	4
3167	15
3168	17
3169	18
3170	11
3171	1
3172	13
3173	7
3174	15
3175	11
3176	7
3177	2
3178	13
3179	2
3180	13
3181	4
3182	17
3183	15
3184	4
3185	14
3186	13
3187	11
3188	14
3189	8
3190	12
3191	8
3192	20
3193	14
3194	3
3195	17
3196	1
3197	3
3198	15
3199	6
3200	20
3201	11
3202	12
3203	8
3204	11
3205	8
3206	11
3207	7
3208	17
3209	13
3210	6
3211	4
3212	1
3213	17
3214	14
3215	6
3216	2
3217	12
3218	9
3219	9
3220	4
3221	16
3222	9
3223	12
3224	18
3225	4
3226	14
3227	10
3228	13
3229	10
3230	10
3231	18
3232	6
3233	16
3234	6
3235	6
3236	6
3237	12
3238	6
3239	7
3240	9
3241	11
3242	5
3243	6
3244	3
3245	14
3246	17
3247	8
3248	11
3249	11
3250	11
3251	1
3252	9
3253	14
3254	7
3255	1
3256	2
3257	9
3258	3
3259	17
3260	13
3261	1
3262	20
3263	8
3264	5
3265	10
3266	15
3267	2
3268	5
3269	2
3270	11
3271	4
3272	13
3273	18
3274	5
3275	1
3276	7
3277	7
3278	12
3279	4
3280	17
3281	18
3282	15
3283	13
3284	5
3285	6
3286	5
3287	13
3288	3
3289	13
3290	15
3291	14
3292	3
3293	2
3294	14
3295	10
3296	3
3297	13
3298	17
3299	4
3300	3
3301	13
3302	16
3303	5
3304	18
3305	18
3306	2
3307	11
3308	5
3309	5
3310	11
3311	2
3312	14
3313	8
3314	10
3315	19
3316	11
3317	12
3318	4
3319	7
3320	17
3321	2
3322	2
3323	4
3324	11
3325	9
3326	19
3327	20
3328	2
3329	1
3330	5
3331	3
3332	18
3333	8
3334	13
3335	6
3336	17
3337	9
3338	20
3339	18
3340	12
3341	15
3342	1
3343	12
3344	7
3345	3
3346	4
3347	10
3348	12
3349	11
3350	4
3351	5
3352	9
3353	5
3354	9
3355	8
3356	2
3357	19
3358	14
3359	14
3360	7
3361	4
3362	18
3363	4
3364	14
3365	20
3366	6
3367	8
3368	20
3369	14
3370	9
3371	13
3372	8
3373	14
3374	19
3375	15
3376	9
3377	19
3378	18
3379	6
3380	17
3381	16
3382	18
3383	9
3384	6
3385	3
3386	5
3387	3
3388	10
3389	4
3390	9
3391	5
3392	8
3393	17
3394	14
3395	12
3396	19
3397	8
3398	15
3399	2
3400	17
3401	16
3402	11
3403	8
3404	10
3405	12
3406	10
3407	7
3408	3
3409	17
3410	7
3411	5
3412	10
3413	7
3414	1
3415	13
3416	1
3417	1
3418	14
3419	11
3420	8
3421	3
3422	14
3423	14
3424	9
3425	6
3426	7
3427	9
3428	2
3429	8
3430	17
3431	17
3432	7
3433	10
3434	3
3435	2
3436	6
3437	6
3438	15
3439	14
3440	19
3441	6
3442	6
3443	18
3444	4
3445	16
3446	8
3447	12
3448	6
3449	17
3450	7
3451	12
3452	9
3453	12
3454	14
3455	2
3456	19
3457	16
3458	6
3459	11
3460	18
3461	20
3462	15
3463	7
3464	3
3465	8
3466	13
3467	15
3468	2
3469	5
3470	15
3471	13
3472	6
3473	6
3474	18
3475	2
3476	19
3477	18
3478	2
3479	3
3480	1
3481	7
3482	19
3483	1
3484	13
3485	12
3486	4
3487	11
3488	6
3489	11
3490	1
3491	19
3492	5
3493	13
3494	15
3495	2
3496	11
3497	19
3498	12
3499	16
3500	11
3501	11
3502	16
3503	10
3504	18
3505	10
3506	15
3507	18
3508	19
3509	6
3510	16
3511	5
3512	4
3513	7
3514	2
3515	6
3516	12
3517	1
3518	15
3519	3
3520	17
3521	16
3522	13
3523	2
3524	18
3525	6
3526	12
3527	19
3528	4
3529	5
3530	15
3531	8
3532	13
3533	12
3534	18
3535	18
3536	17
3537	11
3538	20
3539	7
3540	16
3541	11
3542	19
3543	4
3544	16
3545	14
3546	14
3547	14
3548	8
3549	9
3550	19
3551	17
3552	18
3553	16
3554	7
3555	2
3556	13
3557	7
3558	11
3559	4
3560	2
3561	19
3562	14
3563	8
3564	2
3565	20
3566	15
3567	16
3568	18
3569	15
3570	16
3571	10
3572	12
3573	2
3574	18
3575	19
3576	10
3577	7
3578	11
3579	13
3580	13
3581	4
3582	4
3583	10
3584	4
3585	9
3586	16
3587	2
3588	5
3589	9
3590	5
3591	10
3592	12
3593	12
3594	18
3595	15
3596	3
3597	7
3598	5
3599	3
3600	20
3601	3
3602	9
3603	3
3604	16
3605	17
3606	14
3607	12
3608	3
3609	5
3610	9
3611	10
3612	3
3613	11
3614	4
3615	16
3616	14
3617	9
3618	5
3619	7
3620	10
3621	15
3622	12
3623	19
3624	15
3625	16
3626	15
3627	3
3628	8
3629	14
3630	18
3631	5
3632	11
3633	7
3634	6
3635	6
3636	7
3637	6
3638	13
3639	18
3640	2
3641	19
3642	3
3643	15
3644	10
3645	8
3646	6
3647	2
3648	14
3649	19
3650	9
3651	16
3652	2
3653	20
3654	11
3655	10
3656	2
3657	9
3658	15
3659	17
3660	11
3661	10
3662	7
3663	14
3664	15
3665	4
3666	17
3667	11
3668	12
3669	15
3670	9
3671	5
3672	12
3673	16
3674	13
3675	15
3676	10
3677	15
3678	12
3679	3
3680	4
3681	10
3682	12
3683	20
3684	14
3685	11
3686	8
3687	8
3688	5
3689	17
3690	2
3691	8
3692	10
3693	5
3694	1
3695	4
3696	13
3697	10
3698	11
3699	9
3700	7
3701	1
3702	8
3703	9
3704	14
3705	2
3706	12
3707	6
3708	8
3709	17
3710	6
3711	13
3712	2
3713	2
3714	9
3715	10
3716	18
3717	13
3718	17
3719	7
3720	18
3721	5
3722	2
3723	8
3724	17
3725	3
3726	2
3727	7
3728	6
3729	12
3730	17
3731	1
3732	16
3733	2
3734	2
3735	3
3736	8
3737	13
3738	19
3739	15
3740	12
3741	3
3742	18
3743	14
3744	8
3745	16
3746	7
3747	15
3748	18
3749	1
3750	8
3751	8
3752	4
3753	16
3754	2
3755	10
3756	7
3757	19
3758	20
3759	19
3760	15
3761	1
3762	19
3763	2
3764	4
3765	11
3766	3
3767	19
3768	7
3769	8
3770	6
3771	6
3772	17
3773	8
3774	1
3775	3
3776	6
3777	6
3778	18
3779	7
3780	13
3781	2
3782	16
3783	11
3784	16
3785	15
3786	2
3787	8
3788	20
3789	16
3790	4
3791	18
3792	17
3793	9
3794	9
3795	1
3796	6
3797	16
3798	5
3799	16
3800	3
3801	18
3802	6
3803	8
3804	18
3805	6
3806	9
3807	2
3808	17
3809	12
3810	19
3811	7
3812	6
3813	15
3814	6
3815	4
3816	9
3817	2
3818	14
3819	20
3820	19
3821	1
3822	5
3823	4
3824	14
3825	5
3826	13
3827	4
3828	11
3829	11
3830	19
3831	12
3832	4
3833	9
3834	5
3835	11
3836	2
3837	8
3838	18
3839	19
3840	8
3841	11
3842	8
3843	19
3844	5
3845	14
3846	11
3847	11
3848	15
3849	11
3850	10
3851	16
3852	20
3853	17
3854	17
3855	19
3856	14
3857	6
3858	10
3859	14
3860	3
3861	17
3862	6
3863	19
3864	15
3865	11
3866	6
3867	6
3868	15
3869	9
3870	12
3871	6
3872	6
3873	6
3874	4
3875	12
3876	15
3877	11
3878	7
3879	18
3880	19
3881	20
3882	3
3883	15
3884	15
3885	17
3886	3
3887	1
3888	4
3889	10
3890	16
3891	15
3892	6
3893	18
3894	6
3895	11
3896	12
3897	15
3898	9
3899	7
3900	12
3901	17
3902	13
3903	14
3904	9
3905	12
3906	15
3907	9
3908	19
3909	2
3910	3
3911	16
3912	15
3913	12
3914	2
3915	2
3916	5
3917	14
3918	13
3919	10
3920	8
3921	20
3922	11
3923	17
3924	7
3925	1
3926	6
3927	8
3928	9
3929	18
3930	13
3931	11
3932	1
3933	18
3934	20
3935	7
3936	5
3937	9
3938	17
3939	9
3940	3
3941	16
3942	9
3943	17
3944	3
3945	4
3946	9
3947	20
3948	18
3949	9
3950	12
3951	15
3952	17
3953	8
3954	15
3955	3
3956	4
3957	7
3958	10
3959	3
3960	5
3961	7
3962	8
3963	5
3964	15
3965	17
3966	12
3967	16
3968	3
3969	5
3970	16
3971	3
3972	8
3973	11
3974	18
3975	7
3976	10
3977	19
3978	12
3979	17
3980	8
3981	18
3982	4
3983	3
3984	3
3985	18
3986	17
3987	14
3988	9
3989	11
3990	17
3991	9
3992	8
3993	15
3994	17
3995	20
3996	10
3997	8
3998	11
3999	9
4000	14
4001	5
4002	9
4003	15
4004	6
4005	4
4006	17
4007	17
4008	11
4009	10
4010	4
4011	8
4012	9
4013	2
4014	9
4015	11
4016	2
4017	3
4018	10
4019	6
4020	7
4021	13
4022	19
4023	5
4024	6
4025	5
4026	19
4027	11
4028	2
4029	11
4030	20
4031	14
4032	2
4033	8
4034	4
4035	20
4036	11
4037	19
4038	17
4039	2
4040	14
4041	3
4042	5
4043	20
4044	18
4045	5
4046	14
4047	3
4048	17
4049	12
4050	19
4051	13
4052	7
4053	10
4054	7
4055	12
4056	18
4057	2
4058	19
4059	8
4060	6
4061	6
4062	9
4063	14
4064	15
4065	15
4066	5
4067	12
4068	18
4069	3
4070	19
4071	5
4072	14
4073	20
4074	17
4075	3
4076	18
4077	13
4078	3
4079	9
4080	12
4081	9
4082	3
4083	5
4084	12
4085	6
4086	11
4087	6
4088	18
4089	15
4090	17
4091	5
4092	11
4093	10
4094	10
4095	10
4096	16
4097	18
4098	3
4099	16
4100	15
4101	15
4102	17
4103	7
4104	19
4105	18
4106	11
4107	9
4108	5
4109	14
4110	19
4111	10
4112	6
4113	1
4114	13
4115	16
4116	8
4117	10
4118	17
4119	7
4120	4
4121	18
4122	11
4123	17
4124	1
4125	14
4126	7
4127	16
4128	10
4129	12
4130	19
4131	2
4132	16
4133	6
4134	11
4135	12
4136	12
4137	10
4138	1
4139	17
4140	20
4141	5
4142	9
4143	20
4144	15
4145	12
4146	5
4147	17
4148	8
4149	5
4150	9
4151	14
4152	19
4153	4
4154	5
4155	7
4156	7
4157	4
4158	4
4159	7
4160	14
4161	19
4162	7
4163	3
4164	5
4165	10
4166	19
4167	3
4168	8
4169	20
4170	11
4171	13
4172	13
4173	9
4174	18
4175	9
4176	12
4177	5
4178	2
4179	5
4180	18
4181	4
4182	18
4183	19
4184	10
4185	2
4186	12
4187	15
4188	6
4189	18
4190	14
4191	1
4192	4
4193	8
4194	18
4195	10
4196	19
4197	7
4198	4
4199	8
4200	5
4201	17
4202	20
4203	16
4204	15
4205	12
4206	4
4207	8
4208	6
4209	7
4210	15
4211	4
4212	16
4213	14
4214	7
4215	18
4216	7
4217	11
4218	11
4219	7
4220	13
4221	17
4222	1
4223	12
4224	14
4225	9
4226	12
4227	3
4228	3
4229	14
4230	17
4231	12
4232	12
4233	6
4234	16
4235	5
4236	17
4237	11
4238	15
4239	7
4240	19
4241	1
4242	9
4243	9
4244	3
4245	11
4246	3
4247	13
4248	5
4249	6
4250	15
4251	14
4252	7
4253	17
4254	17
4255	6
4256	19
4257	13
4258	17
4259	9
4260	19
4261	2
4262	18
4263	4
4264	13
4265	8
4266	8
4267	5
4268	19
4269	9
4270	17
4271	9
4272	16
4273	19
4274	1
4275	3
4276	5
4277	5
4278	16
4279	9
4280	18
4281	3
4282	4
4283	18
4284	10
4285	11
4286	4
4287	2
4288	10
4289	2
4290	18
4291	20
4292	11
4293	5
4294	11
4295	5
4296	12
4297	8
4298	4
4299	11
4300	9
4301	4
4302	9
4303	8
4304	12
4305	16
4306	11
4307	12
4308	14
4309	18
4310	11
4311	15
4312	16
4313	2
4314	5
4315	2
4316	9
4317	2
4318	3
4319	1
4320	8
4321	11
4322	17
4323	8
4324	17
4325	15
4326	3
4327	19
4328	9
4329	10
4330	12
4331	10
4332	13
4333	4
4334	6
4335	13
4336	17
4337	9
4338	11
4339	12
4340	3
4341	3
4342	17
4343	1
4344	19
4345	13
4346	13
4347	6
4348	19
4349	3
4350	12
4351	5
4352	14
4353	11
4354	13
4355	6
4356	1
4357	11
4358	18
4359	9
4360	12
4361	9
4362	6
4363	7
4364	8
4365	9
4366	12
4367	10
4368	16
4369	7
4370	19
4371	6
4372	19
4373	4
4374	14
4375	3
4376	6
4377	20
4378	6
4379	11
4380	16
4381	8
4382	7
4383	18
4384	19
4385	15
4386	16
4387	14
4388	13
4389	5
4390	5
4391	16
4392	10
4393	18
4394	9
4395	7
4396	15
4397	2
4398	17
4399	13
4400	8
4401	15
4402	15
4403	7
4404	10
4405	18
4406	16
4407	17
4408	15
4409	5
4410	14
4411	7
4412	8
4413	8
4414	3
4415	14
4416	4
4417	9
4418	2
4419	19
4420	4
4421	18
4422	8
4423	13
4424	4
4425	1
4426	19
4427	5
4428	19
4429	15
4430	9
4431	16
4432	13
4433	6
4434	5
4435	6
4436	2
4437	14
4438	12
4439	17
4440	2
4441	8
4442	20
4443	5
4444	7
4445	19
4446	16
4447	1
4448	17
4449	4
4450	16
4451	17
4452	3
4453	4
4454	14
4455	6
4456	4
4457	6
4458	6
4459	4
4460	13
4461	13
4462	14
4463	17
4464	14
4465	9
4466	12
4467	10
4468	8
4469	14
4470	9
4471	3
4472	17
4473	7
4474	12
4475	1
4476	11
4477	10
4478	4
4479	2
4480	15
4481	13
4482	3
4483	3
4484	5
4485	13
4486	15
4487	3
4488	7
4489	8
4490	2
4491	16
4492	12
4493	5
4494	16
4495	8
4496	8
4497	2
4498	10
4499	7
4500	11
4501	15
4502	2
4503	19
4504	8
4505	18
4506	13
4507	1
4508	18
4509	9
4510	5
4511	8
4512	17
4513	19
4514	13
4515	10
4516	19
4517	10
4518	4
4519	14
4520	18
4521	16
4522	7
4523	13
4524	4
4525	15
4526	6
4527	13
4528	5
4529	17
4530	14
4531	13
4532	3
4533	4
4534	8
4535	2
4536	12
4537	17
4538	13
4539	19
4540	13
4541	10
4542	20
4543	19
4544	8
4545	19
4546	13
4547	4
4548	15
4549	16
4550	8
4551	6
4552	9
4553	7
4554	18
4555	20
4556	19
4557	15
4558	18
4559	18
4560	16
4561	18
4562	1
4563	6
4564	9
4565	14
4566	15
4567	14
4568	10
4569	10
4570	7
4571	8
4572	2
4573	3
4574	12
4575	17
4576	5
4577	15
4578	3
4579	11
4580	7
4581	15
4582	18
4583	16
4584	10
4585	7
4586	5
4587	7
4588	6
4589	15
4590	10
4591	4
4592	9
4593	4
4594	2
4595	11
4596	14
4597	6
4598	7
4599	18
4600	9
4601	3
4602	4
4603	5
4604	3
4605	7
4606	14
4607	16
4608	16
4609	14
4610	15
4611	10
4612	5
4613	9
4614	18
4615	15
4616	1
4617	11
4618	20
4619	10
4620	18
4621	13
4622	4
4623	2
4624	17
4625	18
4626	2
4627	6
4628	4
4629	7
4630	13
4631	11
4632	5
4633	10
4634	7
4635	13
4636	15
4637	10
4638	2
4639	20
4640	2
4641	19
4642	13
4643	18
4644	14
4645	12
4646	5
4647	6
4648	6
4649	12
4650	7
4651	8
4652	2
4653	2
4654	18
4655	5
4656	7
4657	18
4658	19
4659	11
4660	13
4661	8
4662	9
4663	7
4664	15
4665	9
4666	11
4667	11
4668	4
4669	5
4670	11
4671	10
4672	2
4673	6
4674	12
4675	3
4676	15
4677	19
4678	8
4679	4
4680	11
4681	18
4682	10
4683	11
4684	16
4685	5
4686	9
4687	15
4688	7
4689	3
4690	20
4691	8
4692	9
4693	4
4694	16
4695	16
4696	6
4697	5
4698	19
4699	6
4700	1
4701	13
4702	17
4703	16
4704	11
4705	9
4706	10
4707	17
4708	10
4709	6
4710	18
4711	18
4712	12
4713	16
4714	17
4715	18
4716	10
4717	18
4718	6
4719	9
4720	6
4721	3
4722	13
4723	6
4724	10
4725	15
4726	19
4727	6
4728	4
4729	16
4730	12
4731	6
4732	2
4733	6
4734	16
4735	14
4736	6
4737	7
4738	8
4739	19
4740	11
4741	2
4742	10
4743	11
4744	3
4745	7
4746	12
4747	19
4748	8
4749	20
4750	3
4751	8
4752	16
4753	4
4754	17
4755	18
4756	8
4757	18
4758	12
4759	10
4760	5
4761	15
4762	13
4763	1
4764	12
4765	17
4766	10
4767	13
4768	14
4769	16
4770	10
4771	2
4772	19
4773	14
4774	2
4775	16
4776	1
4777	15
4778	11
4779	12
4780	19
4781	8
4782	3
4783	17
4784	12
4785	16
4786	8
4787	12
4788	11
4789	19
4790	13
4791	12
4792	19
4793	4
4794	14
4795	9
4796	13
4797	16
4798	14
4799	6
4800	3
4801	15
4802	15
4803	2
4804	5
4805	19
4806	6
4807	9
4808	19
4809	2
4810	18
4811	18
4812	10
4813	11
4814	6
4815	14
4816	15
4817	15
4818	14
4819	13
4820	15
4821	17
4822	19
4823	3
4824	16
4825	2
4826	17
4827	3
4828	7
4829	17
4830	15
4831	18
4832	19
4833	10
4834	17
4835	14
4836	17
4837	6
4838	20
4839	16
4840	11
4841	3
4842	3
4843	1
4844	3
4845	12
4846	20
4847	1
4848	16
4849	3
4850	3
4851	9
4852	10
4853	6
4854	13
4855	2
4856	14
4857	1
4858	16
4859	19
4860	6
4861	17
4862	3
4863	15
4864	4
4865	6
4866	7
4867	3
4868	7
4869	8
4870	9
4871	2
4872	7
4873	18
4874	14
4875	2
4876	6
4877	12
4878	3
4879	19
4880	17
4881	14
4882	16
4883	17
4884	9
4885	2
4886	6
4887	8
4888	19
4889	20
4890	9
4891	14
4892	14
4893	18
4894	18
4895	6
4896	5
4897	11
4898	10
4899	19
4900	6
4901	15
4902	14
4903	16
4904	3
4905	15
4906	3
4907	7
4908	7
4909	3
4910	6
4911	13
4912	18
4913	10
4914	16
4915	2
4916	14
4917	7
4918	4
4919	4
4920	14
4921	18
4922	3
4923	15
4924	10
4925	10
4926	13
4927	9
4928	8
4929	15
4930	6
4931	6
4932	15
4933	12
4934	8
4935	4
4936	15
4937	11
4938	19
4939	16
4940	2
4941	19
4942	19
4943	17
4944	8
4945	6
4946	4
4947	15
4948	20
4949	12
4950	16
4951	3
4952	6
4953	16
4954	7
4955	8
4956	19
4957	3
4958	19
4959	16
4960	19
4961	7
4962	5
4963	7
4964	2
4965	8
4966	2
4967	19
4968	17
4969	17
4970	8
4971	13
4972	17
4973	14
4974	17
4975	19
4976	2
4977	6
4978	18
4979	17
4980	13
4981	12
4982	4
4983	19
4984	4
4985	10
4986	14
4987	5
4988	11
4989	19
4990	8
4991	3
4992	8
4993	8
4994	5
4995	13
4996	14
4997	13
4998	9
4999	12
5000	9
5001	5
5002	4
5003	3
5004	19
5005	19
5006	15
5007	20
5008	17
5009	7
5010	15
5011	6
5012	9
5013	15
5014	16
5015	7
5016	2
5017	10
5018	5
5019	3
5020	14
5021	12
5022	5
5023	11
5024	19
5025	2
5026	11
5027	3
5028	3
5029	11
5030	2
5031	13
5032	10
5033	3
5034	6
5035	19
5036	17
5037	1
5038	11
5039	6
5040	11
5041	5
5042	17
5043	3
5044	12
5045	14
5046	6
5047	2
5048	9
5049	9
5050	14
5051	13
5052	17
5053	16
5054	6
5055	3
5056	12
5057	6
5058	1
5059	6
5060	18
5061	17
5062	6
5063	5
5064	18
5065	7
5066	10
5067	19
5068	14
5069	2
5070	14
5071	13
5072	9
5073	18
5074	4
5075	14
5076	6
5077	4
5078	13
5079	2
5080	19
5081	13
5082	8
5083	4
5084	18
5085	19
5086	12
5087	7
5088	11
5089	14
5090	5
5091	6
5092	2
5093	9
5094	4
5095	11
5096	10
5097	11
5098	16
5099	9
5100	3
5101	14
5102	14
5103	6
5104	14
5105	4
5106	15
5107	17
5108	19
5109	4
5110	8
5111	5
5112	17
5113	15
5114	4
5115	9
5116	8
5117	11
5118	18
5119	8
5120	7
5121	14
5122	7
5123	17
5124	19
5125	4
5126	5
5127	10
5128	14
5129	8
5130	4
5131	15
5132	15
5133	19
5134	2
5135	2
5136	9
5137	6
5138	6
5139	14
5140	18
5141	18
5142	12
5143	16
5144	2
5145	4
5146	16
5147	20
5148	17
5149	4
5150	9
5151	7
5152	13
5153	5
5154	11
5155	4
5156	15
5157	1
5158	15
5159	2
5160	9
5161	3
5162	1
5163	10
5164	4
5165	7
5166	5
5167	10
5168	8
5169	8
5170	17
5171	13
5172	12
5173	8
5174	9
5175	16
5176	12
5177	6
5178	16
5179	4
5180	17
5181	3
5182	5
5183	8
5184	9
5185	6
5186	3
5187	14
5188	5
5189	6
5190	9
5191	18
5192	19
5193	20
5194	15
5195	6
5196	16
5197	12
5198	18
5199	12
5200	14
5201	17
5202	10
5203	7
5204	10
5205	13
5206	9
5207	17
5208	5
5209	5
5210	5
5211	4
5212	3
5213	2
5214	7
5215	6
5216	11
5217	9
5218	14
5219	9
5220	8
5221	15
5222	6
5223	19
5224	10
5225	19
5226	19
5227	13
5228	11
5229	2
5230	12
5231	15
5232	19
5233	13
5234	6
5235	7
5236	5
5237	13
5238	4
5239	19
5240	8
5241	20
5242	4
5243	12
5244	6
5245	3
5246	1
5247	18
5248	10
5249	9
5250	16
5251	19
5252	17
5253	15
5254	11
5255	19
5256	2
5257	17
5258	17
5259	2
5260	20
5261	4
5262	20
5263	13
5264	19
5265	20
5266	14
5267	13
5268	7
5269	3
5270	13
5271	12
5272	3
5273	15
5274	16
5275	14
5276	15
5277	3
5278	11
5279	1
5280	16
5281	6
5282	15
5283	4
5284	9
5285	15
5286	2
5287	3
5288	15
5289	15
5290	6
5291	12
5292	10
5293	20
5294	9
5295	12
5296	4
5297	14
5298	6
5299	9
5300	9
5301	12
5302	15
5303	1
5304	15
5305	5
5306	16
5307	9
5308	2
5309	15
5310	2
5311	11
5312	18
5313	16
5314	11
5315	3
5316	10
5317	7
5318	15
5319	13
5320	15
5321	5
5322	11
5323	8
5324	1
5325	4
5326	17
5327	12
5328	3
5329	1
5330	3
5331	4
5332	4
5333	9
5334	18
5335	6
5336	13
5337	10
5338	5
5339	10
5340	7
5341	16
5342	15
5343	15
5344	20
5345	19
5346	9
5347	8
5348	12
5349	18
5350	18
5351	8
5352	2
5353	18
5354	12
5355	18
5356	16
5357	14
5358	1
5359	5
5360	4
5361	3
5362	6
5363	4
5364	18
5365	17
5366	14
5367	2
5368	15
5369	3
5370	12
5371	10
5372	7
5373	8
5374	9
5375	9
5376	6
5377	5
5378	8
5379	9
5380	5
5381	12
5382	2
5383	4
5384	17
5385	10
5386	8
5387	2
5388	7
5389	20
5390	3
5391	18
5392	8
5393	10
5394	5
5395	3
5396	6
5397	18
5398	5
5399	12
5400	10
5401	10
5402	14
5403	4
5404	20
5405	11
5406	14
5407	15
5408	16
5409	14
5410	9
5411	12
5412	17
5413	16
5414	18
5415	5
5416	6
5417	4
5418	3
5419	10
5420	2
5421	4
5422	2
5423	12
5424	3
5425	4
5426	19
5427	7
5428	6
5429	16
5430	18
5431	18
5432	10
5433	5
5434	3
5435	16
5436	6
5437	11
5438	5
5439	12
5440	2
5441	20
5442	4
5443	7
5444	18
5445	9
5446	2
5447	7
5448	5
5449	5
5450	16
5451	14
5452	6
5453	2
5454	13
5455	15
5456	16
5457	16
5458	20
5459	7
5460	5
5461	6
5462	19
5463	2
5464	13
5465	9
5466	16
5467	6
5468	15
5469	17
5470	9
5471	14
5472	17
5473	18
5474	6
5475	9
5476	2
5477	10
5478	14
5479	13
5480	6
5481	4
5482	5
5483	19
5484	4
5485	4
5486	18
5487	15
5488	12
5489	5
5490	9
5491	12
5492	2
5493	13
5494	6
5495	9
5496	5
5497	11
5498	8
5499	12
5500	4
5501	1
5502	11
5503	12
5504	14
5505	4
5506	3
5507	16
5508	13
5509	17
5510	16
5511	5
5512	20
5513	15
5514	6
5515	6
5516	2
5517	16
5518	9
5519	18
5520	17
5521	20
5522	14
5523	18
5524	17
5525	7
5526	6
5527	18
5528	13
5529	11
5530	18
5531	2
5532	6
5533	15
5534	15
5535	8
5536	7
5537	19
5538	17
5539	1
5540	14
5541	15
5542	4
5543	14
5544	11
5545	8
5546	9
5547	9
5548	6
5549	16
5550	11
5551	5
5552	12
5553	8
5554	16
5555	8
5556	10
5557	18
5558	13
5559	11
5560	3
5561	11
5562	19
5563	3
5564	12
5565	3
5566	17
5567	13
5568	13
5569	10
5570	5
5571	5
5572	17
5573	6
5574	1
5575	2
5576	19
5577	6
5578	12
5579	9
5580	9
5581	5
5582	5
5583	10
5584	20
5585	9
5586	10
5587	8
5588	7
5589	19
5590	11
5591	11
5592	17
5593	17
5594	9
5595	11
5596	9
5597	13
5598	6
5599	14
5600	13
5601	12
5602	1
5603	1
5604	11
5605	12
5606	19
5607	9
5608	18
5609	5
5610	17
5611	7
5612	3
5613	18
5614	2
5615	9
5616	18
5617	9
5618	20
5619	8
5620	19
5621	12
5622	4
5623	13
5624	9
5625	18
5626	16
5627	17
5628	9
5629	6
5630	2
5631	6
5632	9
5633	6
5634	9
5635	14
5636	2
5637	14
5638	20
5639	10
5640	2
5641	10
5642	5
5643	1
5644	9
5645	8
5646	5
5647	12
5648	13
5649	9
5650	2
5651	4
5652	7
5653	16
5654	7
5655	7
5656	11
5657	5
5658	7
5659	18
5660	10
5661	6
5662	1
5663	7
5664	16
5665	15
5666	19
5667	19
5668	3
5669	13
5670	19
5671	15
5672	16
5673	4
5674	17
5675	9
5676	4
5677	6
5678	17
5679	2
5680	11
5681	15
5682	12
5683	4
5684	11
5685	7
5686	6
5687	12
5688	8
5689	11
5690	12
5691	6
5692	15
5693	7
5694	3
5695	1
5696	16
5697	11
5698	17
5699	17
5700	15
5701	6
5702	3
5703	18
5704	7
5705	19
5706	6
5707	2
5708	3
5709	8
5710	13
5711	4
5712	10
5713	4
5714	12
5715	6
5716	17
5717	3
5718	14
5719	8
5720	17
5721	20
5722	11
5723	17
5724	13
5725	17
5726	12
5727	12
5728	10
5729	6
5730	11
5731	4
5732	18
5733	19
5734	13
5735	3
5736	9
5737	9
5738	10
5739	16
5740	4
5741	20
5742	18
5743	16
5744	6
5745	12
5746	19
5747	14
5748	19
5749	10
5750	18
5751	7
5752	5
5753	2
5754	14
5755	3
5756	6
5757	15
5758	2
5759	18
5760	4
5761	16
5762	18
5763	11
5764	17
5765	17
5766	13
5767	14
5768	11
5769	10
5770	5
5771	12
5772	12
5773	15
5774	15
5775	10
5776	12
5777	16
5778	15
5779	1
5780	2
5781	1
5782	10
5783	12
5784	18
5785	2
5786	7
5787	17
5788	8
5789	11
5790	11
5791	10
5792	18
5793	18
5794	7
5795	14
5796	16
5797	4
5798	1
5799	8
5800	4
5801	2
5802	13
5803	9
5804	10
5805	10
5806	6
5807	8
5808	10
5809	17
5810	9
5811	14
5812	9
5813	17
5814	7
5815	19
5816	11
5817	14
5818	8
5819	1
5820	14
5821	9
5822	7
5823	6
5824	19
5825	15
5826	16
5827	15
5828	2
5829	3
5830	5
5831	19
5832	14
5833	2
5834	8
5835	13
5836	3
5837	14
5838	2
5839	7
5840	13
5841	16
5842	12
5843	18
5844	8
5845	10
5846	4
5847	14
5848	12
5849	2
5850	12
5851	16
5852	9
5853	7
5854	5
5855	16
5856	12
5857	18
5858	18
5859	8
5860	15
5861	12
5862	15
5863	9
5864	11
5865	5
5866	1
5867	1
5868	14
5869	3
5870	16
5871	4
5872	6
5873	19
5874	5
5875	19
5876	19
5877	5
5878	20
5879	17
5880	16
5881	9
5882	17
5883	3
5884	6
5885	1
5886	11
5887	1
5888	17
5889	1
5890	11
5891	18
5892	1
5893	2
5894	15
5895	19
5896	19
5897	5
5898	13
5899	19
5900	5
5901	1
5902	10
5903	6
5904	4
5905	7
5906	4
5907	15
5908	10
5909	6
5910	16
5911	19
5912	3
5913	2
5914	12
5915	16
5916	13
5917	6
5918	15
5919	10
5920	14
5921	9
5922	14
5923	14
5924	17
5925	11
5926	7
5927	9
5928	17
5929	4
5930	13
5931	18
5932	20
5933	6
5934	19
5935	18
5936	3
5937	17
5938	9
5939	7
5940	16
5941	13
5942	7
5943	9
5944	13
5945	2
5946	7
5947	16
5948	10
5949	9
5950	18
5951	2
5952	3
5953	18
5954	8
5955	13
5956	12
5957	13
5958	11
5959	7
5960	20
5961	8
5962	17
5963	19
5964	9
5965	13
5966	7
5967	4
5968	9
5969	18
5970	14
5971	20
5972	17
5973	17
5974	7
5975	12
5976	15
5977	4
5978	15
5979	17
5980	13
5981	10
5982	17
5983	2
5984	9
5985	19
5986	20
5987	16
5988	4
5989	5
5990	13
5991	14
5992	2
5993	12
5994	8
5995	7
5996	3
5997	14
5998	2
5999	6
6000	9
6001	6
6002	11
6003	5
6004	11
6005	19
6006	13
6007	2
6008	14
6009	9
6010	11
6011	19
6012	7
6013	6
6014	8
6015	12
6016	17
6017	11
6018	18
6019	5
6020	16
6021	1
6022	8
6023	16
6024	18
6025	6
6026	15
6027	1
6028	12
6029	9
6030	15
6031	6
6032	15
6033	4
6034	10
6035	6
6036	6
6037	17
6038	13
6039	5
6040	18
6041	14
6042	16
6043	16
6044	11
6045	5
6046	16
6047	17
6048	14
6049	2
6050	8
6051	8
6052	10
6053	13
6054	3
6055	6
6056	8
6057	1
6058	17
6059	18
6060	7
6061	18
6062	11
6063	10
6064	17
6065	16
6066	19
6067	9
6068	10
6069	13
6070	12
6071	8
6072	14
6073	12
6074	5
6075	14
6076	17
6077	1
6078	13
6079	4
6080	13
6081	18
6082	6
6083	1
6084	16
6085	4
6086	5
6087	13
6088	7
6089	20
6090	19
6091	17
6092	10
6093	4
6094	10
6095	7
6096	6
6097	5
6098	10
6099	17
6100	18
6101	3
6102	16
6103	19
6104	2
6105	7
6106	10
6107	15
6108	15
6109	20
6110	20
6111	14
6112	9
6113	4
6114	3
6115	6
6116	9
6117	16
6118	16
6119	18
6120	9
6121	16
6122	4
6123	6
6124	17
6125	13
6126	2
6127	10
6128	1
6129	17
6130	8
6131	6
6132	10
6133	12
6134	8
6135	18
6136	13
6137	7
6138	7
6139	15
6140	2
6141	19
6142	9
6143	3
6144	13
6145	9
6146	11
6147	14
6148	5
6149	8
6150	7
6151	8
6152	11
6153	1
6154	6
6155	2
6156	14
6157	15
6158	17
6159	10
6160	17
6161	12
6162	18
6163	16
6164	13
6165	17
6166	19
6167	19
6168	6
6169	19
6170	17
6171	9
6172	6
6173	5
6174	12
6175	14
6176	7
6177	7
6178	8
6179	10
6180	5
6181	8
6182	7
6183	20
6184	14
6185	16
6186	13
6187	7
6188	16
6189	18
6190	5
6191	17
6192	19
6193	5
6194	4
6195	12
6196	6
6197	8
6198	6
6199	13
6200	4
6201	8
6202	15
6203	14
6204	8
6205	4
6206	19
6207	18
6208	18
6209	18
6210	5
6211	9
6212	3
6213	7
6214	6
6215	11
6216	15
6217	5
6218	6
6219	14
6220	20
6221	5
6222	2
6223	15
6224	7
6225	10
6226	15
6227	3
6228	7
6229	6
6230	9
6231	8
6232	18
6233	18
6234	3
6235	19
6236	16
6237	7
6238	19
6239	9
6240	17
6241	19
6242	2
6243	4
6244	9
6245	2
6246	8
6247	4
6248	16
6249	18
6250	14
6251	3
6252	19
6253	17
6254	7
6255	8
6256	19
6257	7
6258	8
6259	3
6260	12
6261	12
6262	19
6263	13
6264	18
6265	10
6266	10
6267	13
6268	12
6269	3
6270	16
6271	6
6272	19
6273	5
6274	7
6275	3
6276	6
6277	8
6278	17
6279	9
6280	20
6281	10
6282	9
6283	15
6284	11
6285	5
6286	12
6287	3
6288	16
6289	5
6290	4
6291	3
6292	9
6293	3
6294	15
6295	15
6296	10
6297	16
6298	11
6299	12
6300	10
6301	16
6302	10
6303	19
6304	7
6305	13
6306	19
6307	17
6308	12
6309	7
6310	6
6311	4
6312	4
6313	13
6314	11
6315	3
6316	5
6317	9
6318	9
6319	13
6320	16
6321	6
6322	14
6323	12
6324	5
6325	6
6326	20
6327	8
6328	1
6329	10
6330	15
6331	11
6332	3
6333	4
6334	20
6335	4
6336	6
6337	13
6338	12
6339	17
6340	15
6341	10
6342	12
6343	2
6344	18
6345	15
6346	17
6347	4
6348	17
6349	7
6350	17
6351	8
6352	8
6353	12
6354	17
6355	2
6356	13
6357	2
6358	10
6359	3
6360	8
6361	6
6362	17
6363	3
6364	9
6365	16
6366	11
6367	11
6368	12
6369	13
6370	5
6371	2
6372	15
6373	9
6374	3
6375	20
6376	3
6377	5
6378	19
6379	5
6380	14
6381	3
6382	12
6383	9
6384	14
6385	17
6386	13
6387	2
6388	16
6389	8
6390	3
6391	13
6392	12
6393	1
6394	10
6395	7
6396	3
6397	15
6398	13
6399	2
6400	7
6401	5
6402	5
6403	6
6404	16
6405	9
6406	18
6407	3
6408	1
6409	10
6410	14
6411	8
6412	7
6413	18
6414	2
6415	13
6416	9
6417	12
6418	17
6419	18
6420	12
6421	14
6422	20
6423	5
6424	18
6425	13
6426	4
6427	12
6428	13
6429	14
6430	6
6431	11
6432	19
6433	14
6434	6
6435	10
6436	15
6437	4
6438	3
6439	12
6440	8
6441	6
6442	8
6443	15
6444	19
6445	10
6446	15
6447	10
6448	17
6449	10
6450	7
6451	20
6452	9
6453	13
6454	18
6455	5
6456	17
6457	3
6458	20
6459	10
6460	17
6461	19
6462	3
6463	14
6464	12
6465	4
6466	13
6467	8
6468	10
6469	6
6470	17
6471	10
6472	1
6473	3
6474	5
6475	18
6476	16
6477	4
6478	2
6479	7
6480	2
6481	2
6482	10
6483	17
6484	10
6485	10
6486	1
6487	19
6488	13
6489	12
6490	13
6491	13
6492	4
6493	12
6494	18
6495	1
6496	7
6497	13
6498	14
6499	13
6500	14
6501	18
6502	4
6503	4
6504	16
6505	18
6506	3
6507	16
6508	9
6509	15
6510	2
6511	3
6512	3
6513	10
6514	17
6515	5
6516	7
6517	16
6518	10
6519	5
6520	6
6521	7
6522	11
6523	4
6524	19
6525	9
6526	8
6527	10
6528	15
6529	2
6530	9
6531	11
6532	12
6533	17
6534	20
6535	9
6536	1
6537	17
6538	17
6539	15
6540	12
6541	20
6542	13
6543	10
6544	8
6545	16
6546	13
6547	17
6548	11
6549	15
6550	20
6551	8
6552	13
6553	18
6554	9
6555	18
6556	18
6557	8
6558	16
6559	17
6560	17
6561	12
6562	2
6563	4
6564	2
6565	18
6566	19
6567	4
6568	15
6569	7
6570	12
6571	19
6572	12
6573	4
6574	14
6575	9
6576	7
6577	16
6578	5
6579	4
6580	6
6581	5
6582	10
6583	4
6584	19
6585	8
6586	19
6587	14
6588	10
6589	20
6590	17
6591	1
6592	18
6593	14
6594	9
6595	4
6596	19
6597	8
6598	14
6599	5
6600	19
6601	18
6602	17
6603	19
6604	14
6605	11
6606	6
6607	12
6608	2
6609	6
6610	3
6611	19
6612	2
6613	16
6614	19
6615	9
6616	10
6617	12
6618	16
6619	13
6620	6
6621	14
6622	7
6623	19
6624	8
6625	15
6626	3
6627	19
6628	9
6629	3
6630	17
6631	9
6632	19
6633	20
6634	15
6635	9
6636	16
6637	16
6638	2
6639	8
6640	1
6641	18
6642	12
6643	9
6644	19
6645	14
6646	6
6647	7
6648	12
6649	16
6650	13
6651	13
6652	18
6653	13
6654	12
6655	20
6656	15
6657	7
6658	9
6659	10
6660	20
6661	15
6662	1
6663	3
6664	19
6665	18
6666	20
6667	17
6668	19
6669	10
6670	9
6671	18
6672	8
6673	3
6674	3
6675	10
6676	9
6677	3
6678	7
6679	12
6680	2
6681	13
6682	15
6683	12
6684	17
6685	5
6686	14
6687	11
6688	10
6689	10
6690	10
6691	4
6692	20
6693	8
6694	11
6695	5
6696	11
6697	18
6698	4
6699	6
6700	16
6701	14
6702	5
6703	8
6704	4
6705	2
6706	4
6707	15
6708	11
6709	13
6710	11
6711	12
6712	15
6713	19
6714	13
6715	14
6716	6
6717	13
6718	10
6719	17
6720	14
6721	18
6722	5
6723	16
6724	3
6725	16
6726	19
6727	7
6728	12
6729	11
6730	15
6731	13
6732	13
6733	6
6734	13
6735	5
6736	14
6737	2
6738	12
6739	19
6740	11
6741	16
6742	1
6743	5
6744	10
6745	4
6746	15
6747	2
6748	4
6749	14
6750	12
6751	15
6752	9
6753	10
6754	15
6755	5
6756	19
6757	10
6758	2
6759	15
6760	13
6761	3
6762	18
6763	17
6764	18
6765	8
6766	8
6767	4
6768	19
6769	13
6770	18
6771	10
6772	18
6773	11
6774	10
6775	10
6776	11
6777	18
6778	12
6779	4
6780	16
6781	18
6782	14
6783	8
6784	6
6785	9
6786	6
6787	12
6788	1
6789	11
6790	5
6791	2
6792	7
6793	9
6794	10
6795	13
6796	19
6797	8
6798	9
6799	10
6800	4
6801	3
6802	13
6803	7
6804	15
6805	11
6806	9
6807	3
6808	18
6809	4
6810	11
6811	2
6812	17
6813	16
6814	13
6815	2
6816	16
6817	9
6818	3
6819	7
6820	19
6821	12
6822	16
6823	19
6824	11
6825	15
6826	15
6827	9
6828	17
6829	4
6830	8
6831	14
6832	8
6833	12
6834	7
6835	13
6836	16
6837	19
6838	13
6839	5
6840	15
6841	7
6842	9
6843	14
6844	7
6845	3
6846	3
6847	6
6848	17
6849	20
6850	14
6851	5
6852	10
6853	14
6854	6
6855	7
6856	10
6857	16
6858	8
6859	5
6860	6
6861	14
6862	8
6863	17
6864	13
6865	8
6866	2
6867	13
6868	14
6869	9
6870	18
6871	11
6872	12
6873	11
6874	11
6875	6
6876	15
6877	19
6878	5
6879	12
6880	8
6881	20
6882	9
6883	9
6884	14
6885	9
6886	12
6887	11
6888	1
6889	8
6890	2
6891	6
6892	4
6893	12
6894	15
6895	19
6896	11
6897	5
6898	6
6899	14
6900	12
6901	19
6902	19
6903	12
6904	17
6905	11
6906	11
6907	18
6908	6
6909	12
6910	10
6911	14
6912	6
6913	20
6914	14
6915	13
6916	20
6917	18
6918	8
6919	19
6920	19
6921	12
6922	6
6923	8
6924	13
6925	6
6926	6
6927	3
6928	4
6929	4
6930	20
6931	4
6932	13
6933	2
6934	3
6935	17
6936	19
6937	20
6938	14
6939	18
6940	11
6941	8
6942	5
6943	13
6944	8
6945	5
6946	14
6947	4
6948	3
6949	5
6950	18
6951	14
6952	5
6953	9
6954	19
6955	3
6956	18
6957	7
6958	5
6959	14
6960	2
6961	11
6962	12
6963	2
6964	14
6965	20
6966	6
6967	12
6968	4
6969	2
6970	9
6971	19
6972	5
6973	5
6974	16
6975	17
6976	15
6977	18
6978	20
6979	15
6980	17
6981	16
6982	14
6983	18
6984	7
6985	12
6986	17
6987	6
6988	3
6989	16
6990	17
6991	6
6992	7
6993	13
6994	4
6995	20
6996	7
6997	14
6998	11
6999	9
7000	3
7001	2
7002	14
7003	14
7004	15
7005	14
7006	20
7007	4
7008	15
7009	9
7010	5
7011	12
7012	18
7013	10
7014	15
7015	6
7016	1
7017	13
7018	6
7019	3
7020	2
7021	10
7022	17
7023	9
7024	13
7025	14
7026	2
7027	19
7028	3
7029	5
7030	19
7031	14
7032	15
7033	15
7034	18
7035	20
7036	15
7037	15
7038	10
7039	1
7040	14
7041	10
7042	18
7043	1
7044	2
7045	12
7046	7
7047	3
7048	4
7049	5
7050	16
7051	15
7052	14
7053	1
7054	3
7055	14
7056	18
7057	5
7058	19
7059	14
7060	6
7061	18
7062	13
7063	4
7064	7
7065	11
7066	8
7067	20
7068	14
7069	17
7070	12
7071	15
7072	17
7073	19
7074	9
7075	16
7076	7
7077	9
7078	10
7079	3
7080	5
7081	8
7082	14
7083	13
7084	18
7085	2
7086	19
7087	2
7088	20
7089	17
7090	13
7091	12
7092	11
7093	12
7094	7
7095	2
7096	12
7097	4
7098	11
7099	4
7100	12
7101	15
7102	16
7103	3
7104	8
7105	19
7106	11
7107	16
7108	20
7109	15
7110	14
7111	8
7112	8
7113	7
7114	6
7115	8
7116	4
7117	18
7118	12
7119	12
7120	12
7121	13
7122	15
7123	19
7124	9
7125	3
7126	4
7127	19
7128	9
7129	13
7130	11
7131	16
7132	7
7133	8
7134	5
7135	13
7136	13
7137	2
7138	6
7139	15
7140	16
7141	14
7142	3
7143	12
7144	8
7145	8
7146	7
7147	13
7148	11
7149	14
7150	6
7151	6
7152	5
7153	13
7154	12
7155	17
7156	11
7157	20
7158	14
7159	5
7160	17
7161	10
7162	7
7163	19
7164	19
7165	12
7166	7
7167	10
7168	13
7169	3
7170	7
7171	10
7172	2
7173	14
7174	10
7175	13
7176	12
7177	16
7178	4
7179	1
7180	12
7181	1
7182	2
7183	7
7184	14
7185	5
7186	1
7187	3
7188	1
7189	17
7190	14
7191	19
7192	4
7193	13
7194	16
7195	6
7196	9
7197	14
7198	14
7199	15
7200	8
7201	15
7202	18
7203	15
7204	12
7205	14
7206	4
7207	16
7208	11
7209	12
7210	11
7211	18
7212	13
7213	5
7214	9
7215	9
7216	5
7217	15
7218	14
7219	8
7220	10
7221	8
7222	15
7223	16
7224	13
7225	7
7226	14
7227	12
7228	11
7229	7
7230	16
7231	18
7232	19
7233	18
7234	6
7235	2
7236	2
7237	4
7238	14
7239	5
7240	7
7241	6
7242	18
7243	19
7244	20
7245	3
7246	15
7247	7
7248	2
7249	12
7250	1
7251	20
7252	10
7253	19
7254	1
7255	18
7256	4
7257	12
7258	12
7259	14
7260	1
7261	2
7262	12
7263	3
7264	10
7265	7
7266	19
7267	15
7268	5
7269	8
7270	6
7271	2
7272	11
7273	4
7274	11
7275	18
7276	6
7277	5
7278	12
7279	10
7280	8
7281	10
7282	10
7283	7
7284	13
7285	10
7286	8
7287	18
7288	19
7289	10
7290	16
7291	9
7292	17
7293	6
7294	12
7295	5
7296	18
7297	20
7298	8
7299	19
7300	10
7301	10
7302	10
7303	8
7304	6
7305	2
7306	18
7307	20
7308	4
7309	14
7310	15
7311	3
7312	11
7313	16
7314	12
7315	1
7316	3
7317	20
7318	17
7319	9
7320	7
7321	1
7322	3
7323	7
7324	1
7325	18
7326	7
7327	13
7328	14
7329	7
7330	19
7331	2
7332	12
7333	13
7334	7
7335	3
7336	9
7337	2
7338	13
7339	8
7340	16
7341	3
7342	8
7343	18
7344	3
7345	6
7346	13
7347	6
7348	8
7349	12
7350	4
7351	11
7352	19
7353	2
7354	14
7355	17
7356	7
7357	16
7358	4
7359	19
7360	10
7361	7
7362	14
7363	12
7364	16
7365	18
7366	19
7367	16
7368	13
7369	14
7370	14
7371	11
7372	9
7373	12
7374	5
7375	8
7376	17
7377	14
7378	5
7379	13
7380	9
7381	4
7382	2
7383	7
7384	9
7385	2
7386	16
7387	18
7388	16
7389	1
7390	18
7391	2
7392	13
7393	15
7394	10
7395	19
7396	14
7397	8
7398	15
7399	9
7400	20
7401	5
7402	17
7403	5
7404	15
7405	9
7406	2
7407	5
7408	6
7409	5
7410	8
7411	5
7412	4
7413	1
7414	5
7415	17
7416	19
7417	15
7418	2
7419	14
7420	4
7421	19
7422	9
7423	11
7424	16
7425	10
7426	9
7427	19
7428	13
7429	14
7430	6
7431	15
7432	9
7433	8
7434	11
7435	4
7436	8
7437	16
7438	10
7439	8
7440	17
7441	14
7442	11
7443	8
7444	18
7445	12
7446	17
7447	6
7448	14
7449	5
7450	7
7451	16
7452	5
7453	15
7454	10
7455	7
7456	12
7457	6
7458	10
7459	11
7460	11
7461	3
7462	12
7463	16
7464	18
7465	10
7466	3
7467	4
7468	6
7469	16
7470	2
7471	13
7472	6
7473	4
7474	13
7475	2
7476	14
7477	7
7478	11
7479	15
7480	4
7481	16
7482	9
7483	7
7484	3
7485	9
7486	3
7487	2
7488	13
7489	12
7490	12
7491	8
7492	15
7493	13
7494	5
7495	4
7496	7
7497	12
7498	11
7499	19
7500	18
7501	20
7502	5
7503	1
7504	14
7505	10
7506	14
7507	19
7508	14
7509	3
7510	3
7511	18
7512	20
7513	18
7514	3
7515	17
7516	16
7517	12
7518	19
7519	5
7520	3
7521	8
7522	12
7523	5
7524	4
7525	19
7526	12
7527	9
7528	8
7529	8
7530	8
7531	14
7532	5
7533	13
7534	5
7535	9
7536	7
7537	12
7538	8
7539	9
7540	11
7541	4
7542	8
7543	11
7544	10
7545	3
7546	11
7547	6
7548	3
7549	6
7550	11
7551	19
7552	7
7553	14
7554	20
7555	16
7556	12
7557	3
7558	10
7559	5
7560	12
7561	9
7562	11
7563	5
7564	4
7565	14
7566	15
7567	18
7568	2
7569	20
7570	9
7571	13
7572	16
7573	15
7574	1
7575	17
7576	10
7577	16
7578	19
7579	4
7580	15
7581	15
7582	11
7583	18
7584	12
7585	7
7586	19
7587	20
7588	8
7589	9
7590	17
7591	12
7592	1
7593	19
7594	14
7595	3
7596	19
7597	13
7598	15
7599	5
7600	10
7601	10
7602	4
7603	11
7604	4
7605	19
7606	6
7607	10
7608	13
7609	5
7610	19
7611	14
7612	15
7613	11
7614	17
7615	16
7616	8
7617	13
7618	19
7619	8
7620	5
7621	9
7622	7
7623	14
7624	18
7625	18
7626	18
7627	19
7628	13
7629	8
7630	14
7631	1
7632	15
7633	16
7634	18
7635	12
7636	4
7637	19
7638	9
7639	18
7640	12
7641	16
7642	17
7643	9
7644	13
7645	12
7646	9
7647	13
7648	5
7649	8
7650	11
7651	19
7652	12
7653	8
7654	17
7655	8
7656	14
7657	12
7658	19
7659	15
7660	18
7661	14
7662	20
7663	5
7664	5
7665	2
7666	11
7667	19
7668	16
7669	6
7670	6
7671	5
7672	10
7673	20
7674	11
7675	17
7676	6
7677	9
7678	4
7679	8
7680	5
7681	14
7682	20
7683	1
7684	6
7685	19
7686	2
7687	17
7688	19
7689	18
7690	4
7691	11
7692	12
7693	19
7694	1
7695	2
7696	15
7697	13
7698	6
7699	9
7700	19
7701	6
7702	1
7703	6
7704	1
7705	12
7706	19
7707	13
7708	5
7709	7
7710	16
7711	13
7712	9
7713	17
7714	15
7715	16
7716	3
7717	6
7718	7
7719	18
7720	9
7721	3
7722	18
7723	3
7724	6
7725	4
7726	14
7727	4
7728	13
7729	2
7730	13
7731	5
7732	10
7733	7
7734	13
7735	8
7736	6
7737	18
7738	14
7739	14
7740	4
7741	18
7742	16
7743	9
7744	15
7745	11
7746	10
7747	6
7748	2
7749	15
7750	16
7751	14
7752	18
7753	4
7754	8
7755	3
7756	10
7757	3
7758	6
7759	20
7760	18
7761	20
7762	3
7763	5
7764	14
7765	7
7766	14
7767	14
7768	7
7769	15
7770	19
7771	17
7772	4
7773	3
7774	13
7775	19
7776	11
7777	11
7778	19
7779	19
7780	10
7781	1
7782	15
7783	9
7784	6
7785	16
7786	15
7787	14
7788	9
7789	13
7790	16
7791	15
7792	10
7793	19
7794	13
7795	19
7796	15
7797	6
7798	14
7799	13
7800	5
7801	13
7802	10
7803	7
7804	14
7805	8
7806	12
7807	18
7808	2
7809	16
7810	14
7811	4
7812	16
7813	20
7814	8
7815	5
7816	12
7817	7
7818	19
7819	20
7820	10
7821	10
7822	8
7823	2
7824	15
7825	7
7826	17
7827	10
7828	19
7829	11
7830	11
7831	4
7832	19
7833	5
7834	15
7835	19
7836	18
7837	8
7838	17
7839	17
7840	11
7841	3
7842	17
7843	5
7844	10
7845	8
7846	12
7847	18
7848	20
7849	7
7850	7
7851	2
7852	4
7853	6
7854	5
7855	17
7856	12
7857	15
7858	14
7859	6
7860	7
7861	14
7862	12
7863	8
7864	5
7865	2
7866	18
7867	18
7868	19
7869	2
7870	10
7871	15
7872	7
7873	15
7874	9
7875	12
7876	10
7877	15
7878	1
7879	2
7880	11
7881	12
7882	2
7883	11
7884	13
7885	20
7886	10
7887	9
7888	14
7889	1
7890	2
7891	18
7892	10
7893	5
7894	6
7895	7
7896	18
7897	5
7898	13
7899	8
7900	19
7901	4
7902	18
7903	9
7904	20
7905	20
7906	13
7907	15
7908	18
7909	7
7910	4
7911	18
7912	11
7913	5
7914	2
7915	6
7916	10
7917	14
7918	6
7919	13
7920	3
7921	13
7922	14
7923	13
7924	14
7925	8
7926	14
7927	12
7928	4
7929	11
7930	8
7931	18
7932	4
7933	12
7934	3
7935	3
7936	12
7937	12
7938	4
7939	17
7940	13
7941	20
7942	8
7943	16
7944	10
7945	8
7946	20
7947	16
7948	8
7949	13
7950	18
7951	7
7952	9
7953	20
7954	16
7955	9
7956	12
7957	7
7958	13
7959	9
7960	16
7961	14
7962	18
7963	10
7964	13
7965	13
7966	9
7967	17
7968	13
7969	9
7970	6
7971	17
7972	6
7973	10
7974	2
7975	7
7976	14
7977	19
7978	4
7979	20
7980	12
7981	2
7982	14
7983	9
7984	8
7985	8
7986	5
7987	11
7988	3
7989	17
7990	1
7991	3
7992	1
7993	19
7994	14
7995	4
7996	10
7997	16
7998	7
7999	9
8000	1
8001	9
8002	4
8003	12
8004	1
8005	3
8006	3
8007	12
8008	3
8009	15
8010	9
8011	5
8012	4
8013	5
8014	6
8015	6
8016	4
8017	9
8018	10
8019	18
8020	8
8021	14
8022	17
8023	7
8024	9
8025	8
8026	14
8027	6
8028	13
8029	16
8030	14
8031	1
8032	18
8033	6
8034	10
8035	15
8036	10
8037	16
8038	7
8039	2
8040	18
8041	8
8042	9
8043	2
8044	6
8045	18
8046	7
8047	12
8048	12
8049	6
8050	17
8051	7
8052	4
8053	16
8054	2
8055	20
8056	8
8057	8
8058	18
8059	2
8060	6
8061	3
8062	10
8063	14
8064	5
8065	15
8066	9
8067	6
8068	11
8069	8
8070	8
8071	3
8072	16
8073	5
8074	15
8075	16
8076	15
8077	18
8078	6
8079	17
8080	3
8081	17
8082	17
8083	6
8084	1
8085	5
8086	6
8087	3
8088	3
8089	6
8090	6
8091	12
8092	11
8093	5
8094	19
8095	2
8096	8
8097	6
8098	20
8099	5
8100	13
8101	9
8102	17
8103	8
8104	9
8105	7
8106	8
8107	14
8108	17
8109	17
8110	1
8111	2
8112	20
8113	20
8114	10
8115	3
8116	14
8117	3
8118	9
8119	15
8120	18
8121	16
8122	2
8123	2
8124	11
8125	6
8126	11
8127	15
8128	6
8129	18
8130	1
8131	5
8132	17
8133	9
8134	4
8135	11
8136	18
8137	20
8138	11
8139	14
8140	2
8141	12
8142	3
8143	8
8144	8
8145	5
8146	1
8147	3
8148	12
8149	3
8150	20
8151	6
8152	2
8153	11
8154	14
8155	17
8156	10
8157	16
8158	20
8159	13
8160	2
8161	6
8162	9
8163	20
8164	17
8165	15
8166	16
8167	9
8168	18
8169	3
8170	11
8171	11
8172	13
8173	12
8174	5
8175	5
8176	2
8177	5
8178	12
8179	3
8180	3
8181	7
8182	19
8183	19
8184	14
8185	8
8186	4
8187	3
8188	20
8189	8
8190	9
8191	8
8192	12
8193	18
8194	4
8195	4
8196	14
8197	13
8198	19
8199	1
8200	2
8201	11
8202	17
8203	17
8204	1
8205	8
8206	10
8207	17
8208	5
8209	18
8210	8
8211	17
8212	5
8213	8
8214	15
8215	12
8216	9
8217	12
8218	15
8219	10
8220	5
8221	2
8222	5
8223	18
8224	6
8225	19
8226	18
8227	2
8228	19
8229	5
8230	14
8231	15
8232	11
8233	20
8234	15
8235	9
8236	13
8237	4
8238	14
8239	6
8240	5
8241	7
8242	16
8243	11
8244	8
8245	12
8246	6
8247	2
8248	5
8249	7
8250	2
8251	8
8252	16
8253	9
8254	6
8255	8
8256	14
8257	7
8258	14
8259	2
8260	4
8261	7
8262	11
8263	8
8264	10
8265	4
8266	17
8267	14
8268	16
8269	14
8270	11
8271	16
8272	16
8273	10
8274	15
8275	16
8276	10
8277	5
8278	7
8279	5
8280	9
8281	7
8282	14
8283	17
8284	3
8285	17
8286	13
8287	7
8288	4
8289	14
8290	1
8291	10
8292	17
8293	20
8294	18
8295	1
8296	5
8297	3
8298	17
8299	19
8300	14
8301	3
8302	5
8303	7
8304	6
8305	12
8306	18
8307	1
8308	6
8309	2
8310	17
8311	10
8312	18
8313	6
8314	7
8315	4
8316	15
8317	19
8318	9
8319	14
8320	20
8321	17
8322	14
8323	12
8324	9
8325	4
8326	5
8327	13
8328	8
8329	6
8330	18
8331	10
8332	19
8333	6
8334	17
8335	6
8336	6
8337	2
8338	19
8339	12
8340	12
8341	20
8342	8
8343	19
8344	17
8345	6
8346	6
8347	1
8348	4
8349	13
8350	1
8351	2
8352	5
8353	17
8354	1
8355	6
8356	9
8357	19
8358	11
8359	5
8360	20
8361	19
8362	4
8363	19
8364	8
8365	10
8366	6
8367	17
8368	7
8369	6
8370	9
8371	11
8372	6
8373	16
8374	11
8375	6
8376	16
8377	20
8378	11
8379	19
8380	6
8381	8
8382	2
8383	4
8384	18
8385	6
8386	7
8387	11
8388	9
8389	19
8390	2
8391	8
8392	20
8393	8
8394	13
8395	16
8396	5
8397	11
8398	6
8399	2
8400	19
8401	17
8402	17
8403	12
8404	11
8405	10
8406	16
8407	9
8408	6
8409	4
8410	16
8411	17
8412	12
8413	12
8414	5
8415	16
8416	12
8417	14
8418	10
8419	13
8420	15
8421	7
8422	11
8423	17
8424	8
8425	1
8426	13
8427	5
8428	17
8429	14
8430	19
8431	10
8432	6
8433	1
8434	13
8435	10
8436	3
8437	12
8438	6
8439	19
8440	15
8441	3
8442	15
8443	11
8444	13
8445	3
8446	7
8447	9
8448	10
8449	6
8450	15
8451	12
8452	11
8453	4
8454	13
8455	11
8456	12
8457	10
8458	11
8459	3
8460	2
8461	5
8462	1
8463	17
8464	18
8465	3
8466	20
8467	12
8468	13
8469	17
8470	7
8471	12
8472	3
8473	16
8474	1
8475	14
8476	11
8477	3
8478	18
8479	14
8480	4
8481	19
8482	8
8483	12
8484	5
8485	19
8486	16
8487	7
8488	10
8489	3
8490	4
8491	7
8492	13
8493	11
8494	12
8495	5
8496	6
8497	14
8498	10
8499	13
8500	19
8501	15
8502	16
8503	17
8504	6
8505	2
8506	7
8507	6
8508	18
8509	15
8510	12
8511	16
8512	5
8513	4
8514	11
8515	13
8516	11
8517	8
8518	5
8519	13
8520	12
8521	11
8522	3
8523	3
8524	9
8525	4
8526	1
8527	3
8528	12
8529	15
8530	16
8531	16
8532	8
8533	19
8534	17
8535	2
8536	15
8537	15
8538	10
8539	11
8540	12
8541	8
8542	14
8543	16
8544	8
8545	11
8546	18
8547	7
8548	14
8549	20
8550	2
8551	18
8552	7
8553	9
8554	9
8555	5
8556	4
8557	19
8558	10
8559	8
8560	17
8561	18
8562	18
8563	5
8564	14
8565	4
8566	20
8567	17
8568	13
8569	8
8570	13
8571	1
8572	9
8573	17
8574	4
8575	14
8576	7
8577	18
8578	9
8579	13
8580	14
8581	6
8582	12
8583	16
8584	5
8585	2
8586	12
8587	1
8588	15
8589	12
8590	15
8591	2
8592	2
8593	15
8594	1
8595	10
8596	18
8597	5
8598	17
8599	11
8600	1
8601	9
8602	18
8603	4
8604	9
8605	16
8606	9
8607	16
8608	17
8609	10
8610	16
8611	15
8612	4
8613	1
8614	18
8615	3
8616	16
8617	1
8618	5
8619	9
8620	8
8621	19
8622	6
8623	6
8624	2
8625	14
8626	7
8627	8
8628	5
8629	12
8630	7
8631	3
8632	15
8633	2
8634	11
8635	6
8636	16
8637	4
8638	19
8639	3
8640	7
8641	16
8642	13
8643	5
8644	9
8645	16
8646	7
8647	18
8648	15
8649	8
8650	15
8651	3
8652	13
8653	1
8654	16
8655	16
8656	17
8657	13
8658	5
8659	17
8660	3
8661	18
8662	1
8663	18
8664	15
8665	7
8666	12
8667	11
8668	14
8669	17
8670	15
8671	10
8672	13
8673	11
8674	8
8675	11
8676	11
8677	2
8678	14
8679	5
8680	15
8681	11
8682	11
8683	7
8684	18
8685	15
8686	14
8687	19
8688	2
8689	1
8690	11
8691	15
8692	7
8693	8
8694	12
8695	19
8696	12
8697	3
8698	4
8699	15
8700	6
8701	4
8702	9
8703	10
8704	18
8705	8
8706	9
8707	19
8708	2
8709	6
8710	15
8711	2
8712	4
8713	15
8714	9
8715	9
8716	15
8717	12
8718	6
8719	2
8720	7
8721	19
8722	19
8723	6
8724	12
8725	4
8726	20
8727	4
8728	3
8729	6
8730	20
8731	20
8732	9
8733	18
8734	9
8735	17
8736	5
8737	9
8738	13
8739	7
8740	7
8741	9
8742	12
8743	5
8744	7
8745	3
8746	1
8747	7
8748	12
8749	9
8750	14
8751	10
8752	8
8753	3
8754	17
8755	5
8756	16
8757	8
8758	5
8759	2
8760	15
8761	3
8762	11
8763	8
8764	15
8765	16
8766	9
8767	7
8768	19
8769	10
8770	1
8771	7
8772	4
8773	17
8774	17
8775	8
8776	7
8777	12
8778	1
8779	17
8780	4
8781	14
8782	15
8783	19
8784	6
8785	13
8786	13
8787	14
8788	5
8789	2
8790	19
8791	12
8792	12
8793	13
8794	10
8795	4
8796	1
8797	8
8798	16
8799	1
8800	17
8801	12
8802	12
8803	6
8804	8
8805	20
8806	5
8807	4
8808	15
8809	16
8810	17
8811	14
8812	18
8813	11
8814	14
8815	18
8816	18
8817	13
8818	4
8819	9
8820	9
8821	19
8822	18
8823	12
8824	9
8825	12
8826	3
8827	3
8828	9
8829	2
8830	11
8831	20
8832	9
8833	2
8834	16
8835	17
8836	13
8837	4
8838	16
8839	13
8840	5
8841	18
8842	13
8843	16
8844	16
8845	7
8846	14
8847	18
8848	8
8849	2
8850	10
8851	11
8852	17
8853	16
8854	8
8855	20
8856	15
8857	2
8858	12
8859	1
8860	17
8861	11
8862	14
8863	3
8864	16
8865	3
8866	7
8867	12
8868	3
8869	19
8870	4
8871	19
8872	10
8873	11
8874	9
8875	18
8876	5
8877	8
8878	1
8879	4
8880	19
8881	18
8882	3
8883	15
8884	8
8885	10
8886	3
8887	17
8888	7
8889	8
8890	12
8891	2
8892	11
8893	7
8894	18
8895	20
8896	1
8897	7
8898	11
8899	16
8900	2
8901	8
8902	17
8903	9
8904	3
8905	1
8906	18
8907	4
8908	9
8909	4
8910	19
8911	2
8912	16
8913	8
8914	15
8915	5
8916	4
8917	1
8918	7
8919	4
8920	8
8921	2
8922	15
8923	10
8924	12
8925	5
8926	19
8927	18
8928	17
8929	10
8930	7
8931	9
8932	14
8933	6
8934	3
8935	12
8936	15
8937	4
8938	16
8939	12
8940	15
8941	11
8942	16
8943	20
8944	10
8945	5
8946	9
8947	11
8948	5
8949	3
8950	11
8951	13
8952	13
8953	2
8954	13
8955	8
8956	14
8957	2
8958	7
8959	19
8960	15
8961	13
8962	15
8963	3
8964	11
8965	13
8966	9
8967	11
8968	15
8969	5
8970	7
8971	2
8972	4
8973	10
8974	4
8975	14
8976	17
8977	8
8978	15
8979	15
8980	9
8981	13
8982	4
8983	15
8984	14
8985	8
8986	6
8987	15
8988	16
8989	10
8990	15
8991	1
8992	18
8993	18
8994	14
8995	6
8996	6
8997	16
8998	1
8999	5
9000	20
9001	9
9002	18
9003	10
9004	7
9005	19
9006	3
9007	8
9008	15
9009	13
9010	11
9011	15
9012	9
9013	6
9014	5
9015	18
9016	14
9017	11
9018	19
9019	10
9020	1
9021	3
9022	14
9023	10
9024	3
9025	5
9026	7
9027	17
9028	14
9029	19
9030	6
9031	9
9032	16
9033	2
9034	4
9035	3
9036	15
9037	18
9038	16
9039	19
9040	12
9041	8
9042	2
9043	3
9044	1
9045	14
9046	9
9047	19
9048	13
9049	4
9050	19
9051	9
9052	16
9053	11
9054	9
9055	16
9056	4
9057	4
9058	16
9059	17
9060	20
9061	16
9062	12
9063	5
9064	19
9065	12
9066	7
9067	18
9068	18
9069	6
9070	10
9071	13
9072	15
9073	19
9074	3
9075	3
9076	11
9077	6
9078	15
9079	9
9080	6
9081	18
9082	7
9083	18
9084	10
9085	18
9086	4
9087	4
9088	14
9089	14
9090	17
9091	5
9092	2
9093	13
9094	2
9095	3
9096	9
9097	19
9098	16
9099	6
9100	11
9101	18
9102	5
9103	8
9104	19
9105	18
9106	2
9107	19
9108	16
9109	10
9110	12
9111	19
9112	9
9113	16
9114	3
9115	15
9116	8
9117	19
9118	1
9119	4
9120	9
9121	16
9122	13
9123	4
9124	1
9125	7
9126	7
9127	11
9128	5
9129	13
9130	17
9131	3
9132	12
9133	1
9134	10
9135	18
9136	11
9137	14
9138	5
9139	15
9140	18
9141	2
9142	13
9143	10
9144	16
9145	3
9146	12
9147	10
9148	2
9149	14
9150	1
9151	8
9152	5
9153	18
9154	9
9155	13
9156	6
9157	10
9158	14
9159	3
9160	15
9161	1
9162	16
9163	17
9164	3
9165	2
9166	10
9167	10
9168	17
9169	15
9170	12
9171	1
9172	18
9173	10
9174	9
9175	12
9176	3
9177	12
9178	12
9179	14
9180	7
9181	7
9182	9
9183	5
9184	19
9185	1
9186	7
9187	19
9188	16
9189	2
9190	17
9191	10
9192	14
9193	18
9194	8
9195	15
9196	9
9197	18
9198	17
9199	15
9200	20
9201	10
9202	7
9203	7
9204	15
9205	20
9206	2
9207	6
9208	6
9209	13
9210	14
9211	7
9212	4
9213	19
9214	18
9215	3
9216	1
9217	13
9218	9
9219	12
9220	8
9221	18
9222	11
9223	2
9224	7
9225	3
9226	10
9227	16
9228	13
9229	3
9230	4
9231	9
9232	6
9233	1
9234	10
9235	14
9236	6
9237	4
9238	8
9239	17
9240	14
9241	15
9242	12
9243	15
9244	1
9245	5
9246	7
9247	3
9248	12
9249	20
9250	17
9251	4
9252	3
9253	12
9254	16
9255	12
9256	15
9257	16
9258	12
9259	14
9260	11
9261	8
9262	20
9263	10
9264	5
9265	9
9266	18
9267	2
9268	12
9269	7
9270	2
9271	15
9272	13
9273	13
9274	9
9275	12
9276	12
9277	13
9278	8
9279	3
9280	6
9281	15
9282	2
9283	17
9284	17
9285	5
9286	7
9287	14
9288	2
9289	14
9290	2
9291	11
9292	9
9293	15
9294	10
9295	17
9296	16
9297	7
9298	17
9299	20
9300	4
9301	11
9302	4
9303	13
9304	2
9305	12
9306	8
9307	6
9308	12
9309	3
9310	19
9311	18
9312	13
9313	3
9314	4
9315	20
9316	19
9317	2
9318	13
9319	14
9320	16
9321	4
9322	9
9323	16
9324	6
9325	5
9326	19
9327	7
9328	17
9329	4
9330	18
9331	2
9332	4
9333	16
9334	7
9335	15
9336	7
9337	19
9338	8
9339	2
9340	16
9341	9
9342	3
9343	16
9344	16
9345	19
9346	6
9347	7
9348	12
9349	17
9350	14
9351	10
9352	16
9353	9
9354	14
9355	6
9356	7
9357	16
9358	5
9359	20
9360	5
9361	9
9362	16
9363	17
9364	19
9365	13
9366	19
9367	11
9368	16
9369	16
9370	9
9371	18
9372	8
9373	3
9374	4
9375	10
9376	16
9377	4
9378	8
9379	4
9380	5
9381	4
9382	14
9383	17
9384	17
9385	4
9386	7
9387	7
9388	16
9389	2
9390	14
9391	5
9392	17
9393	12
9394	7
9395	4
9396	18
9397	3
9398	15
9399	9
9400	7
9401	5
9402	6
9403	12
9404	20
9405	14
9406	16
9407	17
9408	9
9409	4
9410	9
9411	17
9412	12
9413	20
9414	18
9415	4
9416	6
9417	2
9418	4
9419	15
9420	12
9421	20
9422	9
9423	6
9424	15
9425	9
9426	18
9427	7
9428	7
9429	4
9430	9
9431	6
9432	7
9433	10
9434	19
9435	16
9436	15
9437	8
9438	12
9439	12
9440	5
9441	19
9442	15
9443	4
9444	3
9445	19
9446	7
9447	13
9448	15
9449	17
9450	8
9451	4
9452	4
9453	18
9454	9
9455	19
9456	19
9457	4
9458	1
9459	19
9460	13
9461	1
9462	10
9463	17
9464	6
9465	7
9466	14
9467	20
9468	9
9469	6
9470	17
9471	20
9472	10
9473	9
9474	11
9475	9
9476	19
9477	14
9478	5
9479	14
9480	12
9481	15
9482	16
9483	5
9484	10
9485	5
9486	12
9487	16
9488	4
9489	7
9490	2
9491	5
9492	20
9493	18
9494	19
9495	18
9496	20
9497	2
9498	9
9499	8
9500	7
9501	5
9502	10
9503	18
9504	14
9505	16
9506	3
9507	7
9508	9
9509	1
9510	17
9511	1
9512	4
9513	5
9514	8
9515	18
9516	9
9517	15
9518	7
9519	3
9520	17
9521	18
9522	10
9523	14
9524	19
9525	15
9526	16
9527	9
9528	4
9529	9
9530	14
9531	15
9532	9
9533	7
9534	2
9535	6
9536	18
9537	14
9538	19
9539	4
9540	12
9541	3
9542	2
9543	6
9544	17
9545	4
9546	8
9547	14
9548	7
9549	16
9550	8
9551	14
9552	10
9553	15
9554	5
9555	13
9556	19
9557	3
9558	17
9559	19
9560	9
9561	17
9562	6
9563	16
9564	12
9565	16
9566	9
9567	9
9568	3
9569	8
9570	8
9571	12
9572	7
9573	3
9574	7
9575	18
9576	15
9577	8
9578	9
9579	8
9580	17
9581	2
9582	7
9583	7
9584	12
9585	13
9586	3
9587	14
9588	14
9589	19
9590	5
9591	14
9592	12
9593	19
9594	20
9595	9
9596	11
9597	12
9598	2
9599	10
9600	9
9601	2
9602	16
9603	15
9604	4
9605	13
9606	2
9607	1
9608	8
9609	4
9610	4
9611	4
9612	4
9613	18
9614	15
9615	16
9616	5
9617	1
9618	10
9619	5
9620	2
9621	10
9622	19
9623	13
9624	4
9625	19
9626	4
9627	16
9628	14
9629	4
9630	4
9631	6
9632	2
9633	15
9634	15
9635	5
9636	3
9637	2
9638	16
9639	6
9640	10
9641	15
9642	13
9643	14
9644	16
9645	20
9646	8
9647	4
9648	16
9649	17
9650	15
9651	12
9652	17
9653	18
9654	10
9655	10
9656	15
9657	17
9658	6
9659	9
9660	13
9661	7
9662	11
9663	6
9664	7
9665	17
9666	18
9667	16
9668	18
9669	19
9670	6
9671	16
9672	11
9673	17
9674	3
9675	1
9676	15
9677	14
9678	7
9679	17
9680	14
9681	12
9682	11
9683	12
9684	20
9685	19
9686	8
9687	9
9688	9
9689	18
9690	12
9691	3
9692	12
9693	4
9694	14
9695	2
9696	7
9697	5
9698	10
9699	13
9700	3
9701	8
9702	11
9703	8
9704	19
9705	9
9706	8
9707	20
9708	4
9709	20
9710	16
9711	18
9712	7
9713	19
9714	5
9715	12
9716	9
9717	1
9718	5
9719	5
9720	15
9721	1
9722	16
9723	6
9724	16
9725	19
9726	12
9727	17
9728	18
9729	7
9730	3
9731	7
9732	11
9733	15
9734	5
9735	18
9736	1
9737	1
9738	17
9739	17
9740	4
9741	14
9742	6
9743	7
9744	5
9745	9
9746	2
9747	19
9748	5
9749	11
9750	1
9751	14
9752	19
9753	18
9754	12
9755	18
9756	17
9757	10
9758	6
9759	1
9760	12
9761	16
9762	10
9763	9
9764	14
9765	2
9766	3
9767	14
9768	18
9769	18
9770	20
9771	19
9772	15
9773	8
9774	11
9775	5
9776	10
9777	1
9778	19
9779	7
9780	16
9781	12
9782	6
9783	6
9784	3
9785	19
9786	16
9787	19
9788	15
9789	11
9790	7
9791	17
9792	10
9793	11
9794	5
9795	19
9796	14
9797	7
9798	12
9799	11
9800	2
9801	12
9802	5
9803	7
9804	7
9805	15
9806	2
9807	16
9808	10
9809	10
9810	10
9811	4
9812	11
9813	8
9814	12
9815	4
9816	8
9817	3
9818	8
9819	2
9820	17
9821	10
9822	6
9823	20
9824	20
9825	6
9826	18
9827	17
9828	15
9829	18
9830	13
9831	2
9832	2
9833	4
9834	8
9835	13
9836	13
9837	5
9838	13
9839	10
9840	14
9841	19
9842	6
9843	19
9844	9
9845	15
9846	1
9847	15
9848	2
9849	7
9850	17
9851	19
9852	2
9853	6
9854	4
9855	2
9856	12
9857	11
9858	11
9859	8
9860	19
9861	13
9862	9
9863	9
9864	2
9865	13
9866	14
9867	15
9868	7
9869	12
9870	11
9871	11
9872	19
9873	14
9874	12
9875	16
9876	12
9877	14
9878	6
9879	10
9880	5
9881	4
9882	3
9883	15
9884	8
9885	7
9886	9
9887	6
9888	17
9889	2
9890	3
9891	13
9892	7
9893	8
9894	3
9895	10
9896	6
9897	17
9898	8
9899	8
9900	7
9901	6
9902	6
9903	19
9904	1
9905	14
9906	8
9907	2
9908	9
9909	19
9910	7
9911	5
9912	8
9913	11
9914	3
9915	9
9916	1
9917	17
9918	10
9919	6
9920	6
9921	16
9922	10
9923	1
9924	17
9925	8
9926	5
9927	15
9928	6
9929	12
9930	14
9931	10
9932	3
9933	18
9934	10
9935	4
9936	18
9937	10
9938	12
9939	1
9940	13
9941	1
9942	13
9943	11
9944	3
9945	8
9946	18
9947	8
9948	1
9949	2
9950	15
9951	18
9952	6
9953	2
9954	6
9955	5
9956	11
9957	17
9958	19
9959	9
9960	10
9961	13
9962	14
9963	7
9964	3
9965	6
9966	3
9967	16
9968	19
9969	7
9970	8
9971	13
9972	17
9973	17
9974	8
9975	9
9976	11
9977	3
9978	19
9979	13
9980	8
9981	1
9982	15
9983	3
9984	14
9985	20
9986	13
9987	4
9988	17
9989	8
9990	5
9991	8
9992	10
9993	7
9994	13
9995	11
9996	13
9997	1
9998	4
9999	3
10000	10
\.


--
-- TOC entry 5012 (class 0 OID 17545)
-- Dependencies: 234
-- Data for Name: detail_pembelian; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.detail_pembelian (id_detail, id_pembelian, id_buku, jumlah, harga_satuan) FROM stdin;
\.


--
-- TOC entry 5014 (class 0 OID 17581)
-- Dependencies: 236
-- Data for Name: detail_peminjaman; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.detail_peminjaman (id_detail, id_peminjaman, id_buku) FROM stdin;
1	32001	702
2	32002	2218
3	32003	6274
4	32004	9320
5	32005	2756
6	32006	9620
7	32007	8131
8	32008	8386
9	32009	9019
10	32010	2382
11	32011	8205
12	32012	4729
13	32013	8289
14	32014	1837
15	32015	9283
16	32016	983
17	32017	2695
18	32018	498
19	32019	7382
20	32020	2308
21	32021	2523
22	32022	9820
23	32023	5427
24	32024	5851
25	32025	8772
26	32026	3629
27	32027	448
28	32028	9114
29	32029	3561
30	32030	9662
31	32031	8887
32	32032	3108
33	32033	4679
34	32034	2849
35	32035	6655
36	32036	8250
37	32037	7693
38	32038	6998
39	32039	8317
40	32040	2727
41	32041	1981
42	32042	3638
43	32043	8502
44	32044	8067
45	32045	6970
46	32046	9243
47	32047	14
48	32048	6970
49	32049	4248
50	32050	4271
51	32051	5068
52	32052	7300
53	32053	4361
54	32054	3777
55	32055	4803
56	32056	4249
57	32057	5929
58	32058	9183
59	32059	7967
60	32060	8851
61	32061	7181
62	32062	2141
63	32063	4302
64	32064	2811
65	32065	7801
66	32066	3386
67	32067	8477
68	32068	4189
69	32069	1655
70	32070	1721
71	32071	8547
72	32072	5650
73	32073	8740
74	32074	2471
75	32075	4474
76	32076	9055
77	32077	5143
78	32078	1588
79	32079	9867
80	32080	9155
81	32081	994
82	32082	8056
83	32083	7724
84	32084	8123
85	32085	4929
86	32086	8546
87	32087	9022
88	32088	2372
89	32089	5216
90	32090	3961
91	32091	938
92	32092	7466
93	32093	5824
94	32094	4970
95	32095	6676
96	32096	8891
97	32097	5859
98	32098	6833
99	32099	5963
100	32100	4207
101	32101	2202
102	32102	4652
103	32103	4942
104	32104	2077
105	32105	4563
106	32106	847
107	32107	6341
108	32108	7926
109	32109	8452
110	32110	7470
111	32111	1716
112	32112	4218
113	32113	2882
114	32114	2113
115	32115	2411
116	32116	4171
117	32117	4280
118	32118	6181
119	32119	7265
120	32120	9646
121	32121	5266
122	32122	7439
123	32123	9499
124	32124	5271
125	32125	696
126	32126	2334
127	32127	1804
128	32128	2216
129	32129	1152
130	32130	6793
131	32131	1250
132	32132	2832
133	32133	5347
134	32134	9068
135	32135	308
136	32136	1250
137	32137	4321
138	32138	4538
139	32139	487
140	32140	7353
141	32141	4615
142	32142	5694
143	32143	2468
144	32144	2200
145	32145	3456
146	32146	2286
147	32147	3301
148	32148	1647
149	32149	6839
150	32150	3256
151	32151	5272
152	32152	1061
153	32153	999
154	32154	2118
155	32155	6247
156	32156	6163
157	32157	1176
158	32158	279
159	32159	3170
160	32160	7539
161	32161	999
162	32162	1901
163	32163	9718
164	32164	3805
165	32165	102
166	32166	7813
167	32167	5818
168	32168	7638
169	32169	6527
170	32170	5708
171	32171	6844
172	32172	7699
173	32173	6426
174	32174	5146
175	32175	9975
176	32176	2237
177	32177	391
178	32178	7794
179	32179	398
180	32180	20
181	32181	4213
182	32182	8700
183	32183	7653
184	32184	5721
185	32185	1486
186	32186	5285
187	32187	6477
188	32188	4437
189	32189	1378
190	32190	7841
191	32191	4609
192	32192	2114
193	32193	8523
194	32194	8581
195	32195	3653
196	32196	242
197	32197	3575
198	32198	3769
199	32199	1863
200	32200	4085
201	32201	2962
202	32202	1720
203	32203	3312
204	32204	8694
205	32205	6583
206	32206	8142
207	32207	3492
208	32208	8717
209	32209	7795
210	32210	7819
211	32211	3360
212	32212	4913
213	32213	1825
214	32214	3807
215	32215	8026
216	32216	7796
217	32217	2688
218	32218	3378
219	32219	5056
220	32220	4526
221	32221	8204
222	32222	4137
223	32223	471
224	32224	1893
225	32225	6642
226	32226	105
227	32227	3631
228	32228	3027
229	32229	9602
230	32230	7371
231	32231	4297
232	32232	9273
233	32233	4747
234	32234	2492
235	32235	8172
236	32236	4468
237	32237	4207
238	32238	8585
239	32239	1089
240	32240	8713
241	32241	3088
242	32242	6351
243	32243	9054
244	32244	3724
245	32245	248
246	32246	1192
247	32247	4947
248	32248	3154
249	32249	2914
250	32250	7400
251	32251	2196
252	32252	3544
253	32253	8819
254	32254	9295
255	32255	1549
256	32256	250
257	32257	7468
258	32258	5989
259	32259	5027
260	32260	2213
261	32261	2554
262	32262	6946
263	32263	5307
264	32264	7096
265	32265	1957
266	32266	9610
267	32267	9408
268	32268	2697
269	32269	6285
270	32270	4675
271	32271	3375
272	32272	8433
273	32273	1771
274	32274	8564
275	32275	6653
276	32276	5996
277	32277	9128
278	32278	2700
279	32279	8496
280	32280	8282
281	32281	369
282	32282	7778
283	32283	7378
284	32284	2388
285	32285	7472
286	32286	4954
287	32287	9147
288	32288	6438
289	32289	5843
290	32290	767
291	32291	1173
292	32292	6854
293	32293	9669
294	32294	999
295	32295	1961
296	32296	7065
297	32297	9441
298	32298	3048
299	32299	985
300	32300	7074
301	32301	5431
302	32302	2390
303	32303	9115
304	32304	1649
305	32305	4189
306	32306	8568
307	32307	9411
308	32308	3090
309	32309	5161
310	32310	4380
311	32311	7172
312	32312	7355
313	32313	685
314	32314	6501
315	32315	1295
316	32316	2120
317	32317	1040
318	32318	6182
319	32319	3869
320	32320	6512
321	32321	7389
322	32322	7893
323	32323	5723
324	32324	8446
325	32325	9949
326	32326	4060
327	32327	8101
328	32328	2586
329	32329	5667
330	32330	5684
331	32331	7803
332	32332	5381
333	32333	201
334	32334	6889
335	32335	2364
336	32336	6521
337	32337	6746
338	32338	9315
339	32339	6163
340	32340	8566
341	32341	7607
342	32342	9656
343	32343	4588
344	32344	2370
345	32345	5119
346	32346	7385
347	32347	3565
348	32348	1063
349	32349	4348
350	32350	3209
351	32351	2295
352	32352	5419
353	32353	7940
354	32354	133
355	32355	307
356	32356	2520
357	32357	3629
358	32358	1415
359	32359	5083
360	32360	6933
361	32361	7256
362	32362	9318
363	32363	6664
364	32364	1524
365	32365	1018
366	32366	401
367	32367	5868
368	32368	5144
369	32369	9836
370	32370	8915
371	32371	7160
372	32372	9586
373	32373	4597
374	32374	2228
375	32375	3831
376	32376	9726
377	32377	6280
378	32378	6812
379	32379	5713
380	32380	2558
381	32381	2810
382	32382	2714
383	32383	4275
384	32384	4358
385	32385	5887
386	32386	3322
387	32387	6189
388	32388	5193
389	32389	7659
390	32390	5664
391	32391	5789
392	32392	4121
393	32393	8411
394	32394	6594
395	32395	1338
396	32396	905
397	32397	4826
398	32398	1115
399	32399	8373
400	32400	9227
401	32401	9116
402	32402	6164
403	32403	7700
404	32404	4641
405	32405	9069
406	32406	6009
407	32407	7997
408	32408	3924
409	32409	9960
410	32410	2738
411	32411	4144
412	32412	1685
413	32413	3852
414	32414	3335
415	32415	1278
416	32416	3925
417	32417	4464
418	32418	5158
419	32419	2307
420	32420	7332
421	32421	5519
422	32422	7587
423	32423	1862
424	32424	3021
425	32425	6178
426	32426	9021
427	32427	7339
428	32428	9638
429	32429	7837
430	32430	8809
431	32431	1241
432	32432	356
433	32433	1043
434	32434	8569
435	32435	8096
436	32436	8259
437	32437	6581
438	32438	6906
439	32439	9438
440	32440	5583
441	32441	663
442	32442	5427
443	32443	1337
444	32444	7250
445	32445	7960
446	32446	9080
447	32447	4106
448	32448	8995
449	32449	8601
450	32450	3414
451	32451	3149
452	32452	5890
453	32453	3504
454	32454	3561
455	32455	2515
456	32456	3775
457	32457	6275
458	32458	2408
459	32459	7844
460	32460	4504
461	32461	4547
462	32462	7541
463	32463	1776
464	32464	7080
465	32465	9483
466	32466	9726
467	32467	7249
468	32468	3019
469	32469	3851
470	32470	4936
471	32471	8212
472	32472	6319
473	32473	3876
474	32474	3281
475	32475	2515
476	32476	5220
477	32477	2653
478	32478	3368
479	32479	8879
480	32480	3336
481	32481	3365
482	32482	2828
483	32483	407
484	32484	821
485	32485	519
486	32486	908
487	32487	7793
488	32488	4746
489	32489	9062
490	32490	2714
491	32491	1743
492	32492	481
493	32493	2474
494	32494	6316
495	32495	9918
496	32496	6296
497	32497	2232
498	32498	3964
499	32499	1613
500	32500	5836
501	32501	7132
502	32502	3328
503	32503	1661
504	32504	9510
505	32505	6206
506	32506	5838
507	32507	6279
508	32508	2460
509	32509	1076
510	32510	7235
511	32511	9546
512	32512	2460
513	32513	4480
514	32514	7852
515	32515	1039
516	32516	7293
517	32517	2995
518	32518	2982
519	32519	2493
520	32520	5695
521	32521	2456
522	32522	2921
523	32523	8727
524	32524	4273
525	32525	8249
526	32526	5257
527	32527	3297
528	32528	3089
529	32529	1608
530	32530	670
531	32531	5221
532	32532	72
533	32533	7789
534	32534	9005
535	32535	5017
536	32536	9021
537	32537	5241
538	32538	9368
539	32539	4194
540	32540	7456
541	32541	3775
542	32542	9651
543	32543	3137
544	32544	3368
545	32545	9331
546	32546	617
547	32547	5202
548	32548	322
549	32549	8760
550	32550	8417
551	32551	7804
552	32552	4053
553	32553	5934
554	32554	5605
555	32555	2955
556	32556	4812
557	32557	2410
558	32558	526
559	32559	5435
560	32560	2459
561	32561	3159
562	32562	525
563	32563	828
564	32564	2481
565	32565	6042
566	32566	4792
567	32567	7221
568	32568	6589
569	32569	3689
570	32570	9137
571	32571	8281
572	32572	7140
573	32573	6026
574	32574	1998
575	32575	1807
576	32576	7216
577	32577	758
578	32578	1109
579	32579	8661
580	32580	2762
581	32581	3030
582	32582	2830
583	32583	556
584	32584	543
585	32585	832
586	32586	2088
587	32587	1028
588	32588	2863
589	32589	1532
590	32590	7795
591	32591	766
592	32592	9403
593	32593	4187
594	32594	585
595	32595	8787
596	32596	1919
597	32597	4360
598	32598	8157
599	32599	6904
600	32600	9993
601	32601	3777
602	32602	3693
603	32603	8790
604	32604	9931
605	32605	5486
606	32606	7706
607	32607	6029
608	32608	3972
609	32609	9365
610	32610	2987
611	32611	2786
612	32612	499
613	32613	6534
614	32614	7331
615	32615	8086
616	32616	2509
617	32617	7686
618	32618	2090
619	32619	2272
620	32620	1511
621	32621	6756
622	32622	3302
623	32623	8289
624	32624	3180
625	32625	5330
626	32626	529
627	32627	8514
628	32628	3615
629	32629	88
630	32630	7102
631	32631	1876
632	32632	5693
633	32633	4430
634	32634	5123
635	32635	3705
636	32636	4913
637	32637	1376
638	32638	4203
639	32639	2494
640	32640	6618
641	32641	8754
642	32642	1290
643	32643	5512
644	32644	7844
645	32645	3851
646	32646	5366
647	32647	7756
648	32648	8937
649	32649	2607
650	32650	9406
651	32651	7339
652	32652	3160
653	32653	7197
654	32654	91
655	32655	5937
656	32656	6750
657	32657	126
658	32658	5414
659	32659	9577
660	32660	9809
661	32661	5125
662	32662	4366
663	32663	739
664	32664	1770
665	32665	6211
666	32666	7511
667	32667	6722
668	32668	5697
669	32669	6767
670	32670	5361
671	32671	2309
672	32672	6742
673	32673	4603
674	32674	9514
675	32675	3526
676	32676	9046
677	32677	9144
678	32678	4319
679	32679	566
680	32680	4693
681	32681	9638
682	32682	296
683	32683	3836
684	32684	2616
685	32685	1644
686	32686	2850
687	32687	1643
688	32688	2919
689	32689	6639
690	32690	9771
691	32691	721
692	32692	1249
693	32693	3707
694	32694	263
695	32695	2503
696	32696	3830
697	32697	2429
698	32698	9824
699	32699	9188
700	32700	3724
701	32701	2444
702	32702	105
703	32703	1109
704	32704	4784
705	32705	2347
706	32706	9534
707	32707	5677
708	32708	4303
709	32709	1575
710	32710	3805
711	32711	5784
712	32712	8664
713	32713	6754
714	32714	2303
715	32715	5923
716	32716	5744
717	32717	6675
718	32718	5851
719	32719	7391
720	32720	4881
721	32721	9937
722	32722	9979
723	32723	5502
724	32724	8700
725	32725	4018
726	32726	8115
727	32727	3927
728	32728	5429
729	32729	2159
730	32730	5381
731	32731	235
732	32732	7306
733	32733	7500
734	32734	6284
735	32735	8831
736	32736	8699
737	32737	2876
738	32738	4579
739	32739	4837
740	32740	1695
741	32741	8790
742	32742	3009
743	32743	522
744	32744	9497
745	32745	400
746	32746	7854
747	32747	8625
748	32748	8157
749	32749	3915
750	32750	8138
751	32751	1320
752	32752	4393
753	32753	6361
754	32754	1683
755	32755	6023
756	32756	4087
757	32757	1548
758	32758	3689
759	32759	2766
760	32760	9162
761	32761	3787
762	32762	467
763	32763	3540
764	32764	4883
765	32765	2116
766	32766	5156
767	32767	8188
768	32768	9125
769	32769	455
770	32770	4684
771	32771	9743
772	32772	3015
773	32773	2079
774	32774	1963
775	32775	1548
776	32776	9181
777	32777	1441
778	32778	1941
779	32779	7167
780	32780	5913
781	32781	545
782	32782	5512
783	32783	9487
784	32784	9410
785	32785	9196
786	32786	5319
787	32787	554
788	32788	6870
789	32789	3000
790	32790	4941
791	32791	4332
792	32792	1083
793	32793	26
794	32794	4205
795	32795	50
796	32796	8864
797	32797	2672
798	32798	658
799	32799	1430
800	32800	5360
801	32801	6490
802	32802	3353
803	32803	7861
804	32804	3973
805	32805	3020
806	32806	6354
807	32807	4285
808	32808	8597
809	32809	2228
810	32810	1666
811	32811	8792
812	32812	9692
813	32813	6741
814	32814	6834
815	32815	8558
816	32816	4547
817	32817	5292
818	32818	9690
819	32819	7535
820	32820	2363
821	32821	1689
822	32822	625
823	32823	4995
824	32824	2935
825	32825	8794
826	32826	1983
827	32827	5175
828	32828	4505
829	32829	7676
830	32830	9167
831	32831	1198
832	32832	8098
833	32833	6544
834	32834	3321
835	32835	2151
836	32836	472
837	32837	1566
838	32838	3138
839	32839	9846
840	32840	9316
841	32841	9190
842	32842	189
843	32843	6953
844	32844	7079
845	32845	8096
846	32846	2135
847	32847	89
848	32848	24
849	32849	6648
850	32850	2551
851	32851	8561
852	32852	1716
853	32853	9272
854	32854	3022
855	32855	6660
856	32856	4138
857	32857	8750
858	32858	83
859	32859	5432
860	32860	196
861	32861	4908
862	32862	3125
863	32863	935
864	32864	354
865	32865	404
866	32866	1509
867	32867	5236
868	32868	1043
869	32869	4965
870	32870	2271
871	32871	4151
872	32872	2462
873	32873	8932
874	32874	5523
875	32875	9881
876	32876	4829
877	32877	517
878	32878	9281
879	32879	5789
880	32880	5665
881	32881	166
882	32882	2305
883	32883	5107
884	32884	7955
885	32885	1541
886	32886	2245
887	32887	4428
888	32888	1137
889	32889	6434
890	32890	1438
891	32891	7440
892	32892	6279
893	32893	7991
894	32894	9422
895	32895	5791
896	32896	9186
897	32897	6390
898	32898	636
899	32899	4583
900	32900	7604
901	32901	732
902	32902	9305
903	32903	27
904	32904	5958
905	32905	9024
906	32906	3161
907	32907	877
908	32908	4854
909	32909	668
910	32910	5003
911	32911	7325
912	32912	8906
913	32913	2793
914	32914	656
915	32915	1814
916	32916	3537
917	32917	8123
918	32918	3779
919	32919	3013
920	32920	5904
921	32921	7991
922	32922	6586
923	32923	499
924	32924	6282
925	32925	5885
926	32926	6503
927	32927	8664
928	32928	405
929	32929	4735
930	32930	9241
931	32931	9376
932	32932	5881
933	32933	3642
934	32934	461
935	32935	4994
936	32936	4960
937	32937	6444
938	32938	7277
939	32939	1002
940	32940	4333
941	32941	9395
942	32942	174
943	32943	6640
944	32944	3754
945	32945	5527
946	32946	5114
947	32947	4750
948	32948	9389
949	32949	6480
950	32950	2671
951	32951	6247
952	32952	749
953	32953	6605
954	32954	3818
955	32955	5899
956	32956	9151
957	32957	5068
958	32958	477
959	32959	9046
960	32960	5441
961	32961	8205
962	32962	3433
963	32963	779
964	32964	6758
965	32965	8137
966	32966	7170
967	32967	6245
968	32968	7809
969	32969	8215
970	32970	7836
971	32971	9078
972	32972	2920
973	32973	2056
974	32974	6250
975	32975	3688
976	32976	6011
977	32977	9045
978	32978	1820
979	32979	7187
980	32980	4404
981	32981	3536
982	32982	3504
983	32983	8914
984	32984	1013
985	32985	9817
986	32986	7940
987	32987	5216
988	32988	2517
989	32989	5598
990	32990	5128
991	32991	6964
992	32992	364
993	32993	7536
994	32994	212
995	32995	9018
996	32996	8552
997	32997	9389
998	32998	4577
999	32999	9813
1000	33000	3796
1001	33001	2588
1002	33002	2178
1003	33003	9028
1004	33004	2341
1005	33005	140
1006	33006	3379
1007	33007	1647
1008	33008	4747
1009	33009	6332
1010	33010	9079
1011	33011	4403
1012	33012	2138
1013	33013	279
1014	33014	2846
1015	33015	6681
1016	33016	2130
1017	33017	7900
1018	33018	2352
1019	33019	8784
1020	33020	5719
1021	33021	8579
1022	33022	1349
1023	33023	4107
1024	33024	2122
1025	33025	7332
1026	33026	9675
1027	33027	3624
1028	33028	1995
1029	33029	8781
1030	33030	5504
1031	33031	285
1032	33032	4547
1033	33033	1511
1034	33034	2166
1035	33035	4676
1036	33036	5263
1037	33037	4210
1038	33038	4811
1039	33039	9543
1040	33040	1103
1041	33041	6518
1042	33042	5616
1043	33043	5589
1044	33044	2268
1045	33045	5333
1046	33046	7555
1047	33047	546
1048	33048	8641
1049	33049	3583
1050	33050	7695
1051	33051	4593
1052	33052	6125
1053	33053	2249
1054	33054	658
1055	33055	3540
1056	33056	9037
1057	33057	3742
1058	33058	2615
1059	33059	4884
1060	33060	3905
1061	33061	7180
1062	33062	4436
1063	33063	8117
1064	33064	8567
1065	33065	5337
1066	33066	3305
1067	33067	3426
1068	33068	9267
1069	33069	5263
1070	33070	8775
1071	33071	3392
1072	33072	3297
1073	33073	1422
1074	33074	7593
1075	33075	8254
1076	33076	716
1077	33077	2980
1078	33078	2472
1079	33079	9901
1080	33080	9196
1081	33081	4097
1082	33082	4313
1083	33083	8069
1084	33084	335
1085	33085	7665
1086	33086	374
1087	33087	4704
1088	33088	2166
1089	33089	9823
1090	33090	5949
1091	33091	6927
1092	33092	2866
1093	33093	3362
1094	33094	9637
1095	33095	4726
1096	33096	9911
1097	33097	2079
1098	33098	3723
1099	33099	9436
1100	33100	995
1101	33101	8725
1102	33102	4695
1103	33103	8247
1104	33104	6864
1105	33105	4408
1106	33106	6814
1107	33107	6006
1108	33108	336
1109	33109	6493
1110	33110	2815
1111	33111	2780
1112	33112	5657
1113	33113	165
1114	33114	151
1115	33115	9225
1116	33116	4136
1117	33117	5236
1118	33118	9849
1119	33119	9780
1120	33120	8460
1121	33121	4070
1122	33122	3453
1123	33123	3858
1124	33124	7855
1125	33125	2431
1126	33126	5953
1127	33127	7242
1128	33128	9587
1129	33129	4455
1130	33130	2062
1131	33131	9466
1132	33132	5565
1133	33133	9382
1134	33134	3204
1135	33135	6214
1136	33136	6266
1137	33137	4699
1138	33138	602
1139	33139	2480
1140	33140	6481
1141	33141	9769
1142	33142	8938
1143	33143	7054
1144	33144	4614
1145	33145	1762
1146	33146	2892
1147	33147	7167
1148	33148	182
1149	33149	7959
1150	33150	9384
1151	33151	5533
1152	33152	256
1153	33153	2684
1154	33154	6489
1155	33155	9328
1156	33156	9975
1157	33157	8894
1158	33158	2922
1159	33159	9767
1160	33160	9562
1161	33161	3597
1162	33162	4490
1163	33163	8357
1164	33164	1449
1165	33165	8215
1166	33166	1840
1167	33167	6807
1168	33168	6415
1169	33169	7650
1170	33170	8800
1171	33171	8252
1172	33172	4147
1173	33173	1590
1174	33174	1078
1175	33175	4656
1176	33176	454
1177	33177	8644
1178	33178	9107
1179	33179	8842
1180	33180	8622
1181	33181	6299
1182	33182	9315
1183	33183	4972
1184	33184	6692
1185	33185	7358
1186	33186	1781
1187	33187	1790
1188	33188	1329
1189	33189	1237
1190	33190	3878
1191	33191	8001
1192	33192	3314
1193	33193	3297
1194	33194	2075
1195	33195	340
1196	33196	3302
1197	33197	240
1198	33198	3569
1199	33199	6421
1200	33200	5801
1201	33201	6781
1202	33202	3509
1203	33203	4534
1204	33204	191
1205	33205	7847
1206	33206	1042
1207	33207	9251
1208	33208	430
1209	33209	5202
1210	33210	7497
1211	33211	7017
1212	33212	3768
1213	33213	5828
1214	33214	9535
1215	33215	2513
1216	33216	8177
1217	33217	2439
1218	33218	5831
1219	33219	202
1220	33220	4073
1221	33221	7134
1222	33222	3620
1223	33223	9183
1224	33224	4686
1225	33225	5952
1226	33226	9183
1227	33227	5606
1228	33228	3159
1229	33229	2876
1230	33230	2890
1231	33231	7074
1232	33232	6491
1233	33233	5818
1234	33234	6614
1235	33235	6122
1236	33236	3044
1237	33237	922
1238	33238	2080
1239	33239	8374
1240	33240	319
1241	33241	6243
1242	33242	8013
1243	33243	4580
1244	33244	9772
1245	33245	4699
1246	33246	8860
1247	33247	8241
1248	33248	6392
1249	33249	2940
1250	33250	5917
1251	33251	9776
1252	33252	9934
1253	33253	3096
1254	33254	7205
1255	33255	4233
1256	33256	4138
1257	33257	228
1258	33258	3844
1259	33259	8173
1260	33260	8691
1261	33261	3409
1262	33262	1736
1263	33263	6969
1264	33264	3755
1265	33265	5687
1266	33266	3707
1267	33267	3464
1268	33268	7384
1269	33269	2037
1270	33270	9824
1271	33271	4064
1272	33272	4916
1273	33273	3308
1274	33274	5502
1275	33275	2138
1276	33276	4500
1277	33277	5401
1278	33278	8733
1279	33279	2631
1280	33280	6693
1281	33281	2338
1282	33282	303
1283	33283	5814
1284	33284	2300
1285	33285	7768
1286	33286	2389
1287	33287	6108
1288	33288	5198
1289	33289	2661
1290	33290	6457
1291	33291	238
1292	33292	8028
1293	33293	8712
1294	33294	2054
1295	33295	5500
1296	33296	674
1297	33297	5202
1298	33298	7434
1299	33299	2858
1300	33300	3798
1301	33301	6633
1302	33302	2857
1303	33303	8634
1304	33304	740
1305	33305	2624
1306	33306	8516
1307	33307	4948
1308	33308	9833
1309	33309	7940
1310	33310	1301
1311	33311	5986
1312	33312	3358
1313	33313	5766
1314	33314	4128
1315	33315	3950
1316	33316	5061
1317	33317	3328
1318	33318	4790
1319	33319	7078
1320	33320	9443
1321	33321	930
1322	33322	7390
1323	33323	7565
1324	33324	4883
1325	33325	4370
1326	33326	7006
1327	33327	7389
1328	33328	6717
1329	33329	4140
1330	33330	6432
1331	33331	2044
1332	33332	9260
1333	33333	8681
1334	33334	7160
1335	33335	1309
1336	33336	5087
1337	33337	4042
1338	33338	713
1339	33339	1011
1340	33340	9418
1341	33341	926
1342	33342	596
1343	33343	888
1344	33344	9291
1345	33345	8408
1346	33346	5352
1347	33347	3068
1348	33348	5201
1349	33349	7911
1350	33350	6797
1351	33351	4289
1352	33352	5471
1353	33353	701
1354	33354	4612
1355	33355	8408
1356	33356	1432
1357	33357	6843
1358	33358	3998
1359	33359	9874
1360	33360	3974
1361	33361	6266
1362	33362	6997
1363	33363	1198
1364	33364	5220
1365	33365	3077
1366	33366	3356
1367	33367	5154
1368	33368	5729
1369	33369	7322
1370	33370	6783
1371	33371	4803
1372	33372	344
1373	33373	3970
1374	33374	5399
1375	33375	6576
1376	33376	446
1377	33377	7786
1378	33378	4659
1379	33379	4864
1380	33380	2805
1381	33381	4048
1382	33382	6512
1383	33383	8206
1384	33384	6347
1385	33385	1271
1386	33386	7035
1387	33387	422
1388	33388	9354
1389	33389	9173
1390	33390	476
1391	33391	7777
1392	33392	348
1393	33393	9907
1394	33394	8986
1395	33395	7451
1396	33396	4387
1397	33397	8450
1398	33398	7991
1399	33399	2948
1400	33400	2497
1401	33401	1399
1402	33402	6546
1403	33403	4095
1404	33404	3045
1405	33405	4373
1406	33406	9145
1407	33407	3527
1408	33408	8242
1409	33409	7954
1410	33410	2928
1411	33411	6907
1412	33412	3108
1413	33413	5394
1414	33414	7514
1415	33415	8336
1416	33416	5615
1417	33417	9586
1418	33418	4286
1419	33419	2680
1420	33420	8789
1421	33421	3970
1422	33422	1973
1423	33423	3805
1424	33424	2678
1425	33425	1701
1426	33426	9759
1427	33427	1057
1428	33428	2728
1429	33429	5639
1430	33430	5169
1431	33431	2618
1432	33432	442
1433	33433	1139
1434	33434	6965
1435	33435	7391
1436	33436	4580
1437	33437	876
1438	33438	3870
1439	33439	8327
1440	33440	7248
1441	33441	8745
1442	33442	3151
1443	33443	7139
1444	33444	7442
1445	33445	1600
1446	33446	7497
1447	33447	3503
1448	33448	1644
1449	33449	294
1450	33450	6880
1451	33451	4411
1452	33452	1835
1453	33453	4932
1454	33454	7538
1455	33455	6091
1456	33456	4701
1457	33457	8423
1458	33458	3706
1459	33459	2201
1460	33460	6715
1461	33461	3925
1462	33462	9814
1463	33463	3278
1464	33464	4864
1465	33465	5119
1466	33466	8311
1467	33467	2992
1468	33468	5938
1469	33469	668
1470	33470	6098
1471	33471	3954
1472	33472	9137
1473	33473	4159
1474	33474	5670
1475	33475	9914
1476	33476	1304
1477	33477	1105
1478	33478	68
1479	33479	6206
1480	33480	6662
1481	33481	3676
1482	33482	33
1483	33483	6143
1484	33484	560
1485	33485	9355
1486	33486	3664
1487	33487	8076
1488	33488	8839
1489	33489	5220
1490	33490	2135
1491	33491	1952
1492	33492	9053
1493	33493	6160
1494	33494	223
1495	33495	4836
1496	33496	514
1497	33497	9494
1498	33498	6453
1499	33499	4769
1500	33500	5347
1501	33501	9672
1502	33502	7444
1503	33503	8642
1504	33504	255
1505	33505	2895
1506	33506	4639
1507	33507	439
1508	33508	7259
1509	33509	6957
1510	33510	5692
1511	33511	2003
1512	33512	1804
1513	33513	9531
1514	33514	3439
1515	33515	7054
1516	33516	1509
1517	33517	5428
1518	33518	3508
1519	33519	2193
1520	33520	7920
1521	33521	6266
1522	33522	3368
1523	33523	2450
1524	33524	9317
1525	33525	2649
1526	33526	4220
1527	33527	9183
1528	33528	7108
1529	33529	2017
1530	33530	9590
1531	33531	621
1532	33532	8303
1533	33533	9030
1534	33534	9453
1535	33535	8051
1536	33536	8326
1537	33537	6617
1538	33538	380
1539	33539	5138
1540	33540	2331
1541	33541	3055
1542	33542	865
1543	33543	3198
1544	33544	2890
1545	33545	74
1546	33546	5647
1547	33547	6957
1548	33548	3562
1549	33549	9555
1550	33550	2334
1551	33551	6838
1552	33552	9876
1553	33553	5880
1554	33554	8265
1555	33555	899
1556	33556	3230
1557	33557	544
1558	33558	4436
1559	33559	2804
1560	33560	8030
1561	33561	6027
1562	33562	7228
1563	33563	1267
1564	33564	4746
1565	33565	3166
1566	33566	3924
1567	33567	7485
1568	33568	2246
1569	33569	3774
1570	33570	5168
1571	33571	9937
1572	33572	6342
1573	33573	7780
1574	33574	7325
1575	33575	2827
1576	33576	2345
1577	33577	2525
1578	33578	5902
1579	33579	8538
1580	33580	5962
1581	33581	1829
1582	33582	7135
1583	33583	1836
1584	33584	1833
1585	33585	1996
1586	33586	1633
1587	33587	1629
1588	33588	3099
1589	33589	3150
1590	33590	3780
1591	33591	935
1592	33592	8212
1593	33593	2818
1594	33594	8515
1595	33595	5321
1596	33596	9294
1597	33597	9581
1598	33598	5200
1599	33599	8452
1600	33600	4873
1601	33601	9453
1602	33602	6882
1603	33603	512
1604	33604	4766
1605	33605	1697
1606	33606	2389
1607	33607	647
1608	33608	5322
1609	33609	4462
1610	33610	5228
1611	33611	1030
1612	33612	3148
1613	33613	2151
1614	33614	6435
1615	33615	6727
1616	33616	5815
1617	33617	8344
1618	33618	182
1619	33619	2273
1620	33620	5485
1621	33621	8625
1622	33622	275
1623	33623	4361
1624	33624	4125
1625	33625	5145
1626	33626	7983
1627	33627	3959
1628	33628	7378
1629	33629	7817
1630	33630	2166
1631	33631	8868
1632	33632	856
1633	33633	7402
1634	33634	112
1635	33635	7855
1636	33636	690
1637	33637	1005
1638	33638	6529
1639	33639	274
1640	33640	882
1641	33641	2159
1642	33642	1789
1643	33643	7140
1644	33644	7520
1645	33645	3007
1646	33646	5545
1647	33647	7676
1648	33648	1532
1649	33649	9325
1650	33650	3722
1651	33651	5142
1652	33652	3374
1653	33653	1100
1654	33654	6359
1655	33655	5694
1656	33656	5548
1657	33657	5284
1658	33658	89
1659	33659	1350
1660	33660	9008
1661	33661	4920
1662	33662	1613
1663	33663	8993
1664	33664	6811
1665	33665	4214
1666	33666	4081
1667	33667	9789
1668	33668	1763
1669	33669	7570
1670	33670	5011
1671	33671	5257
1672	33672	8469
1673	33673	8951
1674	33674	7981
1675	33675	8049
1676	33676	2919
1677	33677	6375
1678	33678	8058
1679	33679	7454
1680	33680	2331
1681	33681	3589
1682	33682	7431
1683	33683	4646
1684	33684	1327
1685	33685	1409
1686	33686	2151
1687	33687	9588
1688	33688	9032
1689	33689	9745
1690	33690	5014
1691	33691	3963
1692	33692	3173
1693	33693	1107
1694	33694	4379
1695	33695	5692
1696	33696	2146
1697	33697	6197
1698	33698	2010
1699	33699	9525
1700	33700	5419
1701	33701	2122
1702	33702	9208
1703	33703	5182
1704	33704	5536
1705	33705	7164
1706	33706	6896
1707	33707	6046
1708	33708	5155
1709	33709	606
1710	33710	8459
1711	33711	6152
1712	33712	1214
1713	33713	589
1714	33714	4528
1715	33715	1874
1716	33716	7285
1717	33717	8176
1718	33718	8965
1719	33719	9701
1720	33720	2552
1721	33721	5538
1722	33722	7050
1723	33723	9818
1724	33724	5498
1725	33725	6991
1726	33726	6239
1727	33727	472
1728	33728	2682
1729	33729	1619
1730	33730	2105
1731	33731	3482
1732	33732	7035
1733	33733	5694
1734	33734	4053
1735	33735	7064
1736	33736	2489
1737	33737	6079
1738	33738	3633
1739	33739	503
1740	33740	5949
1741	33741	9775
1742	33742	6596
1743	33743	8038
1744	33744	67
1745	33745	6279
1746	33746	2088
1747	33747	2513
1748	33748	8027
1749	33749	4941
1750	33750	9048
1751	33751	5664
1752	33752	1856
1753	33753	1752
1754	33754	89
1755	33755	4728
1756	33756	4979
1757	33757	1638
1758	33758	4211
1759	33759	106
1760	33760	2297
1761	33761	3422
1762	33762	7402
1763	33763	6204
1764	33764	7059
1765	33765	5626
1766	33766	6867
1767	33767	8437
1768	33768	8473
1769	33769	3591
1770	33770	8078
1771	33771	7001
1772	33772	3022
1773	33773	1069
1774	33774	2604
1775	33775	9019
1776	33776	8059
1777	33777	2876
1778	33778	5763
1779	33779	5888
1780	33780	9098
1781	33781	8610
1782	33782	5804
1783	33783	549
1784	33784	4330
1785	33785	2754
1786	33786	3301
1787	33787	6395
1788	33788	4883
1789	33789	7751
1790	33790	926
1791	33791	9512
1792	33792	4549
1793	33793	6095
1794	33794	5913
1795	33795	4557
1796	33796	3412
1797	33797	3142
1798	33798	9190
1799	33799	6577
1800	33800	3331
1801	33801	5746
1802	33802	5583
1803	33803	9886
1804	33804	5586
1805	33805	6359
1806	33806	7595
1807	33807	9366
1808	33808	9015
1809	33809	6292
1810	33810	9263
1811	33811	3303
1812	33812	3811
1813	33813	35
1814	33814	3889
1815	33815	8168
1816	33816	5844
1817	33817	7701
1818	33818	3325
1819	33819	162
1820	33820	960
1821	33821	3277
1822	33822	1376
1823	33823	3595
1824	33824	5388
1825	33825	6175
1826	33826	6802
1827	33827	1044
1828	33828	2463
1829	33829	6995
1830	33830	3535
1831	33831	9190
1832	33832	4461
1833	33833	5002
1834	33834	4090
1835	33835	2027
1836	33836	248
1837	33837	2975
1838	33838	1863
1839	33839	338
1840	33840	372
1841	33841	2773
1842	33842	8886
1843	33843	4934
1844	33844	8681
1845	33845	2593
1846	33846	7255
1847	33847	7247
1848	33848	7017
1849	33849	3538
1850	33850	2395
1851	33851	8221
1852	33852	8930
1853	33853	9133
1854	33854	6906
1855	33855	5016
1856	33856	8170
1857	33857	9964
1858	33858	8627
1859	33859	7117
1860	33860	5236
1861	33861	4433
1862	33862	992
1863	33863	279
1864	33864	9061
1865	33865	4405
1866	33866	6218
1867	33867	8224
1868	33868	7141
1869	33869	838
1870	33870	7689
1871	33871	8768
1872	33872	405
1873	33873	4910
1874	33874	9675
1875	33875	6355
1876	33876	3635
1877	33877	2424
1878	33878	7997
1879	33879	1645
1880	33880	5233
1881	33881	6451
1882	33882	5202
1883	33883	5537
1884	33884	6259
1885	33885	9532
1886	33886	7591
1887	33887	643
1888	33888	7182
1889	33889	8363
1890	33890	7674
1891	33891	9514
1892	33892	8404
1893	33893	5541
1894	33894	6422
1895	33895	4436
1896	33896	4042
1897	33897	2456
1898	33898	7639
1899	33899	4435
1900	33900	5700
1901	33901	2432
1902	33902	371
1903	33903	1568
1904	33904	4239
1905	33905	2307
1906	33906	6046
1907	33907	6348
1908	33908	3042
1909	33909	6693
1910	33910	3264
1911	33911	9944
1912	33912	1457
1913	33913	6874
1914	33914	7573
1915	33915	9905
1916	33916	8396
1917	33917	4712
1918	33918	701
1919	33919	7982
1920	33920	5877
1921	33921	4059
1922	33922	5566
1923	33923	7467
1924	33924	7165
1925	33925	6775
1926	33926	5686
1927	33927	7908
1928	33928	7428
1929	33929	956
1930	33930	1642
1931	33931	6527
1932	33932	6345
1933	33933	1748
1934	33934	1160
1935	33935	6458
1936	33936	9142
1937	33937	5550
1938	33938	8972
1939	33939	1881
1940	33940	3181
1941	33941	7138
1942	33942	8846
1943	33943	8169
1944	33944	3955
1945	33945	6558
1946	33946	2892
1947	33947	4139
1948	33948	3425
1949	33949	4739
1950	33950	7759
1951	33951	8731
1952	33952	3666
1953	33953	6934
1954	33954	3111
1955	33955	2531
1956	33956	225
1957	33957	6090
1958	33958	7388
1959	33959	5544
1960	33960	411
1961	33961	8597
1962	33962	9305
1963	33963	9114
1964	33964	1713
1965	33965	1890
1966	33966	9542
1967	33967	5496
1968	33968	7907
1969	33969	2890
1970	33970	1281
1971	33971	7823
1972	33972	2925
1973	33973	7554
1974	33974	2019
1975	33975	5318
1976	33976	5152
1977	33977	5493
1978	33978	5205
1979	33979	9033
1980	33980	7033
1981	33981	5265
1982	33982	4134
1983	33983	1938
1984	33984	1561
1985	33985	2983
1986	33986	9432
1987	33987	4091
1988	33988	1066
1989	33989	3032
1990	33990	4684
1991	33991	8644
1992	33992	418
1993	33993	8499
1994	33994	9891
1995	33995	423
1996	33996	8251
1997	33997	9520
1998	33998	7372
1999	33999	1717
2000	34000	2516
2001	32001	5615
2002	32002	2916
2003	32003	7180
2004	32004	8944
2005	32005	7657
2006	32006	1292
2007	32007	1873
2008	32008	6574
2009	32009	8263
2010	32010	2493
2011	32011	7422
2012	32012	7291
2013	32013	2614
2014	32014	2489
2015	32015	9673
2016	32016	5382
2017	32017	3674
2018	32018	8174
2019	32019	931
2020	32020	5
2021	32021	1921
2022	32022	5934
2023	32023	564
2024	32024	8219
2025	32025	2953
2026	32026	5522
2027	32027	2261
2028	32028	3421
2029	32029	4043
2030	32030	4534
2031	32031	709
2032	32032	9319
2033	32033	1781
2034	32034	2625
2035	32035	7094
2036	32036	2556
2037	32037	9266
2038	32038	9868
2039	32039	902
2040	32040	9083
2041	32041	5995
2042	32042	9712
2043	32043	8618
2044	32044	954
2045	32045	3219
2046	32046	8169
2047	32047	1550
2048	32048	2455
2049	32049	8873
2050	32050	6927
2051	32051	8613
2052	32052	1397
2053	32053	5550
2054	32054	3149
2055	32055	5996
2056	32056	7554
2057	32057	3700
2058	32058	6035
2059	32059	3820
2060	32060	8028
2061	32061	1447
2062	32062	3999
2063	32063	1524
2064	32064	1460
2065	32065	1194
2066	32066	6655
2067	32067	4550
2068	32068	6657
2069	32069	9047
2070	32070	6743
2071	32071	7976
2072	32072	4457
2073	32073	5430
2074	32074	2351
2075	32075	3161
2076	32076	1982
2077	32077	9955
2078	32078	4724
2079	32079	547
2080	32080	7216
2081	32081	3905
2082	32082	572
2083	32083	1312
2084	32084	2552
2085	32085	2115
2086	32086	1428
2087	32087	3979
2088	32088	8868
2089	32089	9583
2090	32090	8223
2091	32091	3796
2092	32092	4271
2093	32093	379
2094	32094	2278
2095	32095	3001
2096	32096	283
2097	32097	3635
2098	32098	7091
2099	32099	9539
2100	32100	2510
2101	32101	9875
2102	32102	2342
2103	32103	3115
2104	32104	9276
2105	32105	8172
2106	32106	8495
2107	32107	6772
2108	32108	2230
2109	32109	5533
2110	32110	3753
2111	32111	1643
2112	32112	8906
2113	32113	4661
2114	32114	644
2115	32115	8740
2116	32116	3480
2117	32117	863
2118	32118	3580
2119	32119	4242
2120	32120	3032
2121	32121	8019
2122	32122	6347
2123	32123	8323
2124	32124	2508
2125	32125	3249
2126	32126	887
2127	32127	9131
2128	32128	1844
2129	32129	3345
2130	32130	2237
2131	32131	7844
2132	32132	8072
2133	32133	9419
2134	32134	8369
2135	32135	3843
2136	32136	9966
2137	32137	7801
2138	32138	4944
2139	32139	9720
2140	32140	9350
2141	32141	7506
2142	32142	8069
2143	32143	4308
2144	32144	1902
2145	32145	3489
2146	32146	454
2147	32147	6350
2148	32148	7504
2149	32149	8351
2150	32150	5401
2151	32151	6328
2152	32152	3094
2153	32153	3890
2154	32154	4126
2155	32155	7175
2156	32156	6873
2157	32157	2403
2158	32158	7048
2159	32159	7711
2160	32160	211
2161	32161	9855
2162	32162	4193
2163	32163	5695
2164	32164	6236
2165	32165	9318
2166	32166	5199
2167	32167	4810
2168	32168	8203
2169	32169	4820
2170	32170	3792
2171	32171	2390
2172	32172	8158
2173	32173	7885
2174	32174	1319
2175	32175	6800
2176	32176	8615
2177	32177	508
2178	32178	5110
2179	32179	8371
2180	32180	3564
2181	32181	3811
2182	32182	1712
2183	32183	3834
2184	32184	1081
2185	32185	8653
2186	32186	7480
2187	32187	1529
2188	32188	4574
2189	32189	7312
2190	32190	8154
2191	32191	4743
2192	32192	2081
2193	32193	8798
2194	32194	4485
2195	32195	7139
2196	32196	9828
2197	32197	5192
2198	32198	7794
2199	32199	7337
2200	32200	4905
2201	32201	6518
2202	32202	1205
2203	32203	6372
2204	32204	7404
2205	32205	5407
2206	32206	9402
2207	32207	9255
2208	32208	348
2209	32209	2464
2210	32210	195
2211	32211	1621
2212	32212	4334
2213	32213	4885
2214	32214	3660
2215	32215	8590
2216	32216	1356
2217	32217	7602
2218	32218	634
2219	32219	7721
2220	32220	6082
2221	32221	3894
2222	32222	867
2223	32223	6252
2224	32224	9559
2225	32225	1167
2226	32226	4329
2227	32227	4285
2228	32228	5222
2229	32229	7476
2230	32230	2665
2231	32231	9156
2232	32232	2441
2233	32233	3730
2234	32234	8530
2235	32235	7497
2236	32236	8848
2237	32237	8189
2238	32238	6636
2239	32239	3050
2240	32240	9298
2241	32241	7402
2242	32242	7670
2243	32243	1655
2244	32244	8548
2245	32245	5460
2246	32246	8110
2247	32247	1790
2248	32248	3771
2249	32249	6941
2250	32250	437
2251	32251	682
2252	32252	5962
2253	32253	3401
2254	32254	981
2255	32255	8911
2256	32256	7348
2257	32257	6364
2258	32258	3098
2259	32259	8163
2260	32260	8239
2261	32261	493
2262	32262	704
2263	32263	6490
2264	32264	8129
2265	32265	5858
2266	32266	8504
2267	32267	4399
2268	32268	4220
2269	32269	2520
2270	32270	2696
2271	32271	7868
2272	32272	6175
2273	32273	3029
2274	32274	7330
2275	32275	3151
2276	32276	2247
2277	32277	3026
2278	32278	5743
2279	32279	3968
2280	32280	6662
2281	32281	1758
2282	32282	8717
2283	32283	5803
2284	32284	6331
2285	32285	6486
2286	32286	7906
2287	32287	3523
2288	32288	7866
2289	32289	2339
2290	32290	6530
2291	32291	1681
2292	32292	1234
2293	32293	810
2294	32294	5493
2295	32295	7752
2296	32296	6376
2297	32297	4949
2298	32298	2759
2299	32299	8815
2300	32300	2862
2301	32301	7128
2302	32302	6396
2303	32303	5067
2304	32304	5365
2305	32305	8149
2306	32306	1979
2307	32307	2031
2308	32308	1231
2309	32309	2159
2310	32310	688
2311	32311	2905
2312	32312	5126
2313	32313	1643
2314	32314	1511
2315	32315	2969
2316	32316	2824
2317	32317	2110
2318	32318	6300
2319	32319	7602
2320	32320	713
2321	32321	165
2322	32322	6370
2323	32323	4898
2324	32324	7426
2325	32325	3513
2326	32326	997
2327	32327	7244
2328	32328	3684
2329	32329	1802
2330	32330	3688
2331	32331	251
2332	32332	9978
2333	32333	5510
2334	32334	9800
2335	32335	7872
2336	32336	9801
2337	32337	8017
2338	32338	7654
2339	32339	5793
2340	32340	5027
2341	32341	3805
2342	32342	389
2343	32343	4062
2344	32344	5564
2345	32345	6190
2346	32346	9029
2347	32347	6348
2348	32348	216
2349	32349	5580
2350	32350	3049
2351	32351	1665
2352	32352	4135
2353	32353	1070
2354	32354	7131
2355	32355	1578
2356	32356	408
2357	32357	6625
2358	32358	3606
2359	32359	5109
2360	32360	5922
2361	32361	2372
2362	32362	7516
2363	32363	3873
2364	32364	6064
2365	32365	6695
2366	32366	8584
2367	32367	4024
2368	32368	6959
2369	32369	4560
2370	32370	7572
2371	32371	7028
2372	32372	200
2373	32373	8190
2374	32374	4799
2375	32375	4669
2376	32376	2217
2377	32377	624
2378	32378	3808
2379	32379	2140
2380	32380	6690
2381	32381	1836
2382	32382	2783
2383	32383	6376
2384	32384	1910
2385	32385	6899
2386	32386	5656
2387	32387	5331
2388	32388	5717
2389	32389	7175
2390	32390	5234
2391	32391	4063
2392	32392	7544
2393	32393	9779
2394	32394	3313
2395	32395	458
2396	32396	278
2397	32397	1647
2398	32398	1790
2399	32399	5234
2400	32400	9866
2401	32401	8931
2402	32402	9733
2403	32403	7156
2404	32404	8347
2405	32405	3999
2406	32406	8617
2407	32407	1652
2408	32408	9769
2409	32409	6026
2410	32410	3606
2411	32411	9688
2412	32412	8360
2413	32413	3771
2414	32414	9324
2415	32415	3876
2416	32416	9197
2417	32417	765
2418	32418	9708
2419	32419	7455
2420	32420	5378
2421	32421	5699
2422	32422	1153
2423	32423	2868
2424	32424	5557
2425	32425	6212
2426	32426	1259
2427	32427	9776
2428	32428	9663
2429	32429	5733
2430	32430	4429
2431	32431	9958
2432	32432	8279
2433	32433	8754
2434	32434	6720
2435	32435	2454
2436	32436	4376
2437	32437	2654
2438	32438	1288
2439	32439	7507
2440	32440	1009
2441	32441	1820
2442	32442	7143
2443	32443	1349
2444	32444	2549
2445	32445	6394
2446	32446	2318
2447	32447	7035
2448	32448	3633
2449	32449	3826
2450	32450	5559
2451	32451	6423
2452	32452	9021
2453	32453	1278
2454	32454	5083
2455	32455	4708
2456	32456	9474
2457	32457	1569
2458	32458	6335
2459	32459	6518
2460	32460	6002
2461	32461	9245
2462	32462	1932
2463	32463	7688
2464	32464	4437
2465	32465	6034
2466	32466	9296
2467	32467	5910
2468	32468	2336
2469	32469	3609
2470	32470	5025
2471	32471	5692
2472	32472	9434
2473	32473	9097
2474	32474	5915
2475	32475	2860
2476	32476	612
2477	32477	7498
2478	32478	6194
2479	32479	7202
2480	32480	8350
2481	32481	8909
2482	32482	8384
2483	32483	3492
2484	32484	4224
2485	32485	1022
2486	32486	3817
2487	32487	7845
2488	32488	8189
2489	32489	8057
2490	32490	4183
2491	32491	7152
2492	32492	1712
2493	32493	3179
2494	32494	6747
2495	32495	4855
2496	32496	6350
2497	32497	4846
2498	32498	9268
2499	32499	4527
2500	32500	3875
2501	32501	1949
2502	32502	3473
2503	32503	160
2504	32504	4555
2505	32505	6260
2506	32506	7913
2507	32507	7923
2508	32508	3964
2509	32509	6358
2510	32510	1498
2511	32511	7560
2512	32512	8778
2513	32513	2876
2514	32514	6691
2515	32515	888
2516	32516	536
2517	32517	3835
2518	32518	8974
2519	32519	672
2520	32520	5533
2521	32521	903
2522	32522	3300
2523	32523	4765
2524	32524	5663
2525	32525	9712
2526	32526	9759
2527	32527	90
2528	32528	1777
2529	32529	4609
2530	32530	3727
2531	32531	1883
2532	32532	9732
2533	32533	8549
2534	32534	5033
2535	32535	110
2536	32536	2327
2537	32537	215
2538	32538	6188
2539	32539	1493
2540	32540	655
2541	32541	7610
2542	32542	1615
2543	32543	1566
2544	32544	1780
2545	32545	7568
2546	32546	6297
2547	32547	8408
2548	32548	1616
2549	32549	8899
2550	32550	3046
2551	32551	6989
2552	32552	8974
2553	32553	4610
2554	32554	7569
2555	32555	9348
2556	32556	9114
2557	32557	1918
2558	32558	6537
2559	32559	6594
2560	32560	8883
2561	32561	2205
2562	32562	5074
2563	32563	4280
2564	32564	1513
2565	32565	2158
2566	32566	4194
2567	32567	7302
2568	32568	4074
2569	32569	6907
2570	32570	9573
2571	32571	871
2572	32572	2124
2573	32573	1398
2574	32574	5978
2575	32575	5407
2576	32576	5141
2577	32577	8268
2578	32578	1255
2579	32579	6228
2580	32580	146
2581	32581	942
2582	32582	2789
2583	32583	403
2584	32584	4724
2585	32585	1576
2586	32586	822
2587	32587	1604
2588	32588	3330
2589	32589	4484
2590	32590	6189
2591	32591	3171
2592	32592	7491
2593	32593	7999
2594	32594	4225
2595	32595	1950
2596	32596	9549
2597	32597	3904
2598	32598	4626
2599	32599	2228
2600	32600	6513
2601	32601	8393
2602	32602	944
2603	32603	9393
2604	32604	4574
2605	32605	7131
2606	32606	1493
2607	32607	2575
2608	32608	4574
2609	32609	5463
2610	32610	9649
2611	32611	8949
2612	32612	4211
2613	32613	6827
2614	32614	5581
2615	32615	5135
2616	32616	4175
2617	32617	7537
2618	32618	9209
2619	32619	5963
2620	32620	4235
2621	32621	5065
2622	32622	9107
2623	32623	6058
2624	32624	7361
2625	32625	8291
2626	32626	7031
2627	32627	1508
2628	32628	4392
2629	32629	3426
2630	32630	4111
2631	32631	9817
2632	32632	7258
2633	32633	2484
2634	32634	5737
2635	32635	7708
2636	32636	1649
2637	32637	6949
2638	32638	8851
2639	32639	8478
2640	32640	666
2641	32641	1684
2642	32642	9968
2643	32643	1004
2644	32644	5986
2645	32645	880
2646	32646	9839
2647	32647	2600
2648	32648	9816
2649	32649	4206
2650	32650	5170
2651	32651	3161
2652	32652	5932
2653	32653	1283
2654	32654	7666
2655	32655	8404
2656	32656	9410
2657	32657	1992
2658	32658	6375
2659	32659	2735
2660	32660	3190
2661	32661	8623
2662	32662	3748
2663	32663	6506
2664	32664	5406
2665	32665	6420
2666	32666	4025
2667	32667	4191
2668	32668	1300
2669	32669	5084
2670	32670	4441
2671	32671	4445
2672	32672	1482
2673	32673	2589
2674	32674	9201
2675	32675	6339
2676	32676	9847
2677	32677	4875
2678	32678	8481
2679	32679	2952
2680	32680	6820
2681	32681	7537
2682	32682	5531
2683	32683	6019
2684	32684	1570
2685	32685	1143
2686	32686	3041
2687	32687	1290
2688	32688	5854
2689	32689	4937
2690	32690	5054
2691	32691	1492
2692	32692	912
2693	32693	3655
2694	32694	8642
2695	32695	3597
2696	32696	589
2697	32697	3682
2698	32698	9575
2699	32699	8898
2700	32700	4038
2701	32701	8113
2702	32702	7012
2703	32703	2095
2704	32704	4560
2705	32705	506
2706	32706	2082
2707	32707	1453
2708	32708	4000
2709	32709	6637
2710	32710	2374
2711	32711	121
2712	32712	3067
2713	32713	7784
2714	32714	746
2715	32715	8109
2716	32716	9597
2717	32717	1014
2718	32718	4030
2719	32719	7618
2720	32720	6935
2721	32721	3000
2722	32722	3636
2723	32723	8778
2724	32724	2612
2725	32725	2099
2726	32726	221
2727	32727	17
2728	32728	8832
2729	32729	1881
2730	32730	4263
2731	32731	5550
2732	32732	9851
2733	32733	6991
2734	32734	4088
2735	32735	3345
2736	32736	1199
2737	32737	6766
2738	32738	5619
2739	32739	2046
2740	32740	6449
2741	32741	7171
2742	32742	5048
2743	32743	9134
2744	32744	9676
2745	32745	4187
2746	32746	6853
2747	32747	1600
2748	32748	5032
2749	32749	5229
2750	32750	3694
2751	32751	4196
2752	32752	2682
2753	32753	8397
2754	32754	8652
2755	32755	4279
2756	32756	1254
2757	32757	6292
2758	32758	5632
2759	32759	7549
2760	32760	2700
2761	32761	4896
2762	32762	9819
2763	32763	8888
2764	32764	2355
2765	32765	5434
2766	32766	5885
2767	32767	1589
2768	32768	3842
2769	32769	4889
2770	32770	2493
2771	32771	3762
2772	32772	9284
2773	32773	9558
2774	32774	7992
2775	32775	3266
2776	32776	4520
2777	32777	3995
2778	32778	7368
2779	32779	8502
2780	32780	6169
2781	32781	9017
2782	32782	3064
2783	32783	6328
2784	32784	258
2785	32785	5934
2786	32786	4098
2787	32787	8010
2788	32788	748
2789	32789	2889
2790	32790	1871
2791	32791	4736
2792	32792	471
2793	32793	19
2794	32794	6648
2795	32795	6049
2796	32796	97
2797	32797	5988
2798	32798	2976
2799	32799	8784
2800	32800	9382
2801	32801	4940
2802	32802	3703
2803	32803	8302
2804	32804	4322
2805	32805	5791
2806	32806	3354
2807	32807	836
2808	32808	6165
2809	32809	7743
2810	32810	8721
2811	32811	364
2812	32812	9892
2813	32813	127
2814	32814	7429
2815	32815	3397
2816	32816	1078
2817	32817	5126
2818	32818	349
2819	32819	5531
2820	32820	5365
2821	32821	3910
2822	32822	132
2823	32823	444
2824	32824	1793
2825	32825	5398
2826	32826	4832
2827	32827	1779
2828	32828	3990
2829	32829	5761
2830	32830	7510
2831	32831	6747
2832	32832	2573
2833	32833	6168
2834	32834	9617
2835	32835	471
2836	32836	2683
2837	32837	9651
2838	32838	1098
2839	32839	715
2840	32840	9048
2841	32841	9667
2842	32842	455
2843	32843	334
2844	32844	6244
2845	32845	4852
2846	32846	5264
2847	32847	5653
2848	32848	9636
2849	32849	7044
2850	32850	9009
2851	32851	4836
2852	32852	4251
2853	32853	5832
2854	32854	929
2855	32855	4508
2856	32856	8546
2857	32857	5109
2858	32858	7960
2859	32859	9795
2860	32860	9906
2861	32861	4650
2862	32862	4347
2863	32863	501
2864	32864	1719
2865	32865	7882
2866	32866	359
2867	32867	8111
2868	32868	6593
2869	32869	3671
2870	32870	5706
2871	32871	4629
2872	32872	2709
2873	32873	4709
2874	32874	3552
2875	32875	7843
2876	32876	7537
2877	32877	7011
2878	32878	401
2879	32879	4696
2880	32880	6612
2881	32881	9452
2882	32882	7996
2883	32883	426
2884	32884	9941
2885	32885	6401
2886	32886	2336
2887	32887	3082
2888	32888	3073
2889	32889	337
2890	32890	9044
2891	32891	9737
2892	32892	6893
2893	32893	1450
2894	32894	6484
2895	32895	1126
2896	32896	6547
2897	32897	92
2898	32898	5560
2899	32899	7249
2900	32900	4875
2901	32901	5907
2902	32902	9684
2903	32903	8885
2904	32904	9988
2905	32905	6990
2906	32906	1905
2907	32907	6797
2908	32908	3252
2909	32909	5936
2910	32910	3920
2911	32911	5931
2912	32912	8562
2913	32913	7432
2914	32914	3870
2915	32915	2011
2916	32916	6096
2917	32917	9752
2918	32918	8094
2919	32919	7600
2920	32920	5778
2921	32921	7739
2922	32922	6926
2923	32923	7254
2924	32924	4615
2925	32925	5330
2926	32926	5833
2927	32927	2134
2928	32928	1726
2929	32929	6734
2930	32930	7501
2931	32931	8698
2932	32932	8479
2933	32933	1126
2934	32934	7060
2935	32935	2756
2936	32936	2072
2937	32937	4918
2938	32938	7376
2939	32939	737
2940	32940	8868
2941	32941	8609
2942	32942	3421
2943	32943	3010
2944	32944	2081
2945	32945	5432
2946	32946	9084
2947	32947	4592
2948	32948	8793
2949	32949	2367
2950	32950	1717
2951	32951	5434
2952	32952	8131
2953	32953	7350
2954	32954	9038
2955	32955	6641
2956	32956	9924
2957	32957	214
2958	32958	6166
2959	32959	5990
2960	32960	1107
2961	32961	5634
2962	32962	4861
2963	32963	3889
2964	32964	4065
2965	32965	407
2966	32966	9011
2967	32967	6957
2968	32968	8309
2969	32969	5949
2970	32970	1448
2971	32971	9400
2972	32972	3572
2973	32973	1139
2974	32974	3135
2975	32975	7844
2976	32976	6036
2977	32977	101
2978	32978	1138
2979	32979	6856
2980	32980	6252
2981	32981	7923
2982	32982	1540
2983	32983	526
2984	32984	6791
2985	32985	4252
2986	32986	4510
2987	32987	2290
2988	32988	9088
2989	32989	7465
2990	32990	1060
2991	32991	480
2992	32992	9935
2993	32993	9085
2994	32994	1622
2995	32995	7999
2996	32996	6784
2997	32997	576
2998	32998	5971
2999	32999	2868
3000	33000	8187
3001	33001	8868
3002	33002	7673
3003	33003	1158
3004	33004	1907
3005	33005	2483
3006	33006	6280
3007	33007	6754
3008	33008	9386
3009	33009	7866
3010	33010	7617
3011	33011	4496
3012	33012	39
3013	33013	3398
3014	33014	3173
3015	33015	9194
3016	33016	5165
3017	33017	5206
3018	33018	3136
3019	33019	2648
3020	33020	2155
3021	33021	7398
3022	33022	8658
3023	33023	51
3024	33024	9764
3025	33025	5562
3026	33026	3394
3027	33027	5340
3028	33028	2278
3029	33029	1037
3030	33030	4240
3031	33031	5748
3032	33032	8186
3033	33033	5434
3034	33034	5121
3035	33035	6447
3036	33036	8992
3037	33037	4825
3038	33038	5374
3039	33039	5643
3040	33040	9705
3041	33041	7621
3042	33042	4477
3043	33043	681
3044	33044	5524
3045	33045	4979
3046	33046	4180
3047	33047	1710
3048	33048	9039
3049	33049	6117
3050	33050	7937
3051	33051	4126
3052	33052	5221
3053	33053	5021
3054	33054	9476
3055	33055	6389
3056	33056	4303
3057	33057	9540
3058	33058	1386
3059	33059	9830
3060	33060	5351
3061	33061	2858
3062	33062	8918
3063	33063	7553
3064	33064	6550
3065	33065	3198
3066	33066	3809
3067	33067	1841
3068	33068	390
3069	33069	972
3070	33070	2937
3071	33071	500
3072	33072	7238
3073	33073	1376
3074	33074	6708
3075	33075	1309
3076	33076	455
3077	33077	1508
3078	33078	7330
3079	33079	4660
3080	33080	4761
3081	33081	9060
3082	33082	3802
3083	33083	4073
3084	33084	9483
3085	33085	157
3086	33086	9931
3087	33087	5441
3088	33088	1173
3089	33089	8810
3090	33090	7300
3091	33091	7593
3092	33092	4427
3093	33093	8225
3094	33094	7251
3095	33095	5445
3096	33096	3778
3097	33097	1663
3098	33098	1851
3099	33099	8433
3100	33100	6004
3101	33101	1012
3102	33102	8482
3103	33103	786
3104	33104	7631
3105	33105	6815
3106	33106	45
3107	33107	3985
3108	33108	9542
3109	33109	2650
3110	33110	5925
3111	33111	1498
3112	33112	1964
3113	33113	9069
3114	33114	7922
3115	33115	9040
3116	33116	8126
3117	33117	7816
3118	33118	6174
3119	33119	9576
3120	33120	2503
3121	33121	9723
3122	33122	223
3123	33123	9831
3124	33124	4526
3125	33125	1504
3126	33126	8873
3127	33127	2470
3128	33128	4593
3129	33129	4467
3130	33130	2447
3131	33131	9559
3132	33132	5249
3133	33133	5567
3134	33134	2912
3135	33135	1446
3136	33136	2743
3137	33137	1389
3138	33138	1174
3139	33139	5196
3140	33140	8424
3141	33141	7487
3142	33142	6557
3143	33143	3018
3144	33144	7864
3145	33145	3626
3146	33146	1793
3147	33147	9316
3148	33148	9180
3149	33149	7640
3150	33150	9127
3151	33151	7790
3152	33152	749
3153	33153	2503
3154	33154	4408
3155	33155	4057
3156	33156	3891
3157	33157	2721
3158	33158	2819
3159	33159	5982
3160	33160	5744
3161	33161	7275
3162	33162	3987
3163	33163	7732
3164	33164	7775
3165	33165	2067
3166	33166	8148
3167	33167	4332
3168	33168	8180
3169	33169	626
3170	33170	404
3171	33171	3400
3172	33172	5830
3173	33173	8107
3174	33174	1608
3175	33175	2467
3176	33176	437
3177	33177	548
3178	33178	5132
3179	33179	801
3180	33180	1784
3181	33181	6120
3182	33182	6826
3183	33183	5939
3184	33184	5032
3185	33185	7875
3186	33186	9364
3187	33187	7615
3188	33188	4769
3189	33189	5164
3190	33190	2927
3191	33191	8290
3192	33192	850
3193	33193	7203
3194	33194	9219
3195	33195	547
3196	33196	8120
3197	33197	8776
3198	33198	2132
3199	33199	9982
3200	33200	2990
3201	33201	563
3202	33202	5744
3203	33203	2681
3204	33204	1237
3205	33205	6032
3206	33206	9705
3207	33207	3190
3208	33208	879
3209	33209	8138
3210	33210	7084
3211	33211	8198
3212	33212	2557
3213	33213	8391
3214	33214	5615
3215	33215	5251
3216	33216	9942
3217	33217	8095
3218	33218	748
3219	33219	3123
3220	33220	9695
3221	33221	2212
3222	33222	3786
3223	33223	5587
3224	33224	5362
3225	33225	3799
3226	33226	8038
3227	33227	6974
3228	33228	4800
3229	33229	5941
3230	33230	9585
3231	33231	4474
3232	33232	2806
3233	33233	7841
3234	33234	6168
3235	33235	8179
3236	33236	2546
3237	33237	1950
3238	33238	1229
3239	33239	7997
3240	33240	5560
3241	33241	2820
3242	33242	2006
3243	33243	5661
3244	33244	1460
3245	33245	4529
3246	33246	686
3247	33247	2773
3248	33248	7829
3249	33249	8010
3250	33250	7325
3251	33251	4155
3252	33252	1068
3253	33253	3720
3254	33254	4278
3255	33255	5608
3256	33256	2863
3257	33257	3176
3258	33258	3399
3259	33259	6172
3260	33260	7818
3261	33261	1900
3262	33262	1382
3263	33263	8274
3264	33264	3989
3265	33265	7276
3266	33266	9076
3267	33267	959
3268	33268	7810
3269	33269	3438
3270	33270	2087
3271	33271	5107
3272	33272	9065
3273	33273	9823
3274	33274	705
3275	33275	1284
3276	33276	3955
3277	33277	1326
3278	33278	2269
3279	33279	7018
3280	33280	7848
3281	33281	5861
3282	33282	1134
3283	33283	1040
3284	33284	3268
3285	33285	5557
3286	33286	1110
3287	33287	2143
3288	33288	7747
3289	33289	1717
3290	33290	1160
3291	33291	7626
3292	33292	9537
3293	33293	6694
3294	33294	1191
3295	33295	6312
3296	33296	1267
3297	33297	9440
3298	33298	2695
3299	33299	707
3300	33300	376
3301	33301	4487
3302	33302	9674
3303	33303	1845
3304	33304	481
3305	33305	8102
3306	33306	3265
3307	33307	7057
3308	33308	7935
3309	33309	8319
3310	33310	7084
3311	33311	6549
3312	33312	206
3313	33313	1858
3314	33314	3651
3315	33315	6873
3316	33316	4895
3317	33317	7581
3318	33318	6256
3319	33319	6423
3320	33320	7513
3321	33321	3099
3322	33322	211
3323	33323	4276
3324	33324	1244
3325	33325	8853
3326	33326	2780
3327	33327	3608
3328	33328	9838
3329	33329	1029
3330	33330	3017
3331	33331	6279
3332	33332	4240
3333	33333	7143
3334	33334	72
3335	33335	5735
3336	33336	3237
3337	33337	9081
3338	33338	4351
3339	33339	4585
3340	33340	3130
3341	33341	8113
3342	33342	3903
3343	33343	3832
3344	33344	2401
3345	33345	1738
3346	33346	5778
3347	33347	2979
3348	33348	4740
3349	33349	3758
3350	33350	9090
3351	33351	8450
3352	33352	4685
3353	33353	1269
3354	33354	7785
3355	33355	6323
3356	33356	9840
3357	33357	8197
3358	33358	4577
3359	33359	8167
3360	33360	6321
3361	33361	4949
3362	33362	7050
3363	33363	6233
3364	33364	6900
3365	33365	3690
3366	33366	6481
3367	33367	5
3368	33368	5837
3369	33369	3491
3370	33370	6653
3371	33371	7235
3372	33372	1423
3373	33373	284
3374	33374	8268
3375	33375	2819
3376	33376	591
3377	33377	5405
3378	33378	955
3379	33379	8430
3380	33380	8875
3381	33381	1541
3382	33382	5414
3383	33383	4492
3384	33384	7197
3385	33385	6829
3386	33386	2235
3387	33387	4289
3388	33388	1398
3389	33389	6863
3390	33390	7791
3391	33391	4601
3392	33392	2
3393	33393	6835
3394	33394	5254
3395	33395	804
3396	33396	2077
3397	33397	1427
3398	33398	1858
3399	33399	9172
3400	33400	8756
3401	33401	2438
3402	33402	6305
3403	33403	3198
3404	33404	3160
3405	33405	6530
3406	33406	6982
3407	33407	8450
3408	33408	4704
3409	33409	6645
3410	33410	9251
3411	33411	224
3412	33412	9330
3413	33413	9041
3414	33414	5159
3415	33415	1978
3416	33416	3343
3417	33417	8045
3418	33418	3295
3419	33419	304
3420	33420	9179
3421	33421	7586
3422	33422	7098
3423	33423	6710
3424	33424	7931
3425	33425	7538
3426	33426	7941
3427	33427	1279
3428	33428	2835
3429	33429	4509
3430	33430	8543
3431	33431	1433
3432	33432	7298
3433	33433	5995
3434	33434	556
3435	33435	6577
3436	33436	1146
3437	33437	4751
3438	33438	2949
3439	33439	6492
3440	33440	9844
3441	33441	6949
3442	33442	3864
3443	33443	4829
3444	33444	2036
3445	33445	182
3446	33446	8923
3447	33447	5181
3448	33448	3924
3449	33449	7622
3450	33450	7464
3451	33451	6198
3452	33452	1524
3453	33453	5454
3454	33454	2470
3455	33455	76
3456	33456	7650
3457	33457	8187
3458	33458	3305
3459	33459	7761
3460	33460	1861
3461	33461	4017
3462	33462	9656
3463	33463	8485
3464	33464	2988
3465	33465	4444
3466	33466	3014
3467	33467	4407
3468	33468	1064
3469	33469	6025
3470	33470	833
3471	33471	6414
3472	33472	6837
3473	33473	8837
3474	33474	635
3475	33475	9214
3476	33476	8044
3477	33477	7579
3478	33478	5374
3479	33479	7559
3480	33480	2692
3481	33481	2184
3482	33482	1782
3483	33483	1851
3484	33484	9434
3485	33485	7591
3486	33486	3253
3487	33487	9323
3488	33488	7417
3489	33489	9942
3490	33490	6161
3491	33491	7682
3492	33492	8206
3493	33493	8565
3494	33494	1230
3495	33495	4244
3496	33496	7294
3497	33497	2773
3498	33498	4070
3499	33499	794
3500	33500	9380
3501	33501	6713
3502	33502	7615
3503	33503	7232
3504	33504	2609
3505	33505	5526
3506	33506	2331
3507	33507	2086
3508	33508	4408
3509	33509	7678
3510	33510	7577
3511	33511	4084
3512	33512	5699
3513	33513	9783
3514	33514	6124
3515	33515	2779
3516	33516	1418
3517	33517	157
3518	33518	5065
3519	33519	2
3520	33520	8761
3521	33521	230
3522	33522	3365
3523	33523	9111
3524	33524	6469
3525	33525	3513
3526	33526	8522
3527	33527	1433
3528	33528	969
3529	33529	6548
3530	33530	5414
3531	33531	6319
3532	33532	1547
3533	33533	3250
3534	33534	2303
3535	33535	1864
3536	33536	474
3537	33537	7549
3538	33538	2793
3539	33539	1153
3540	33540	5959
3541	33541	3141
3542	33542	5352
3543	33543	1272
3544	33544	2767
3545	33545	613
3546	33546	9807
3547	33547	2428
3548	33548	2795
3549	33549	7560
3550	33550	5604
3551	33551	4142
3552	33552	3401
3553	33553	4211
3554	33554	3484
3555	33555	3389
3556	33556	4156
3557	33557	5338
3558	33558	4685
3559	33559	9383
3560	33560	3248
3561	33561	7844
3562	33562	4812
3563	33563	4204
3564	33564	1661
3565	33565	3709
3566	33566	4436
3567	33567	6359
3568	33568	3341
3569	33569	8702
3570	33570	8810
3571	33571	7465
3572	33572	5749
3573	33573	5690
3574	33574	4866
3575	33575	6662
3576	33576	6786
3577	33577	6462
3578	33578	319
3579	33579	2068
3580	33580	5942
3581	33581	9790
3582	33582	6607
3583	33583	2002
3584	33584	6742
3585	33585	4238
3586	33586	4405
3587	33587	8465
3588	33588	3152
3589	33589	2535
3590	33590	8189
3591	33591	413
3592	33592	4162
3593	33593	3915
3594	33594	7699
3595	33595	4849
3596	33596	5566
3597	33597	1405
3598	33598	597
3599	33599	7834
3600	33600	3593
3601	33601	14
3602	33602	8790
3603	33603	6692
3604	33604	7285
3605	33605	3823
3606	33606	6193
3607	33607	2936
3608	33608	5731
3609	33609	7073
3610	33610	4330
3611	33611	8312
3612	33612	8437
3613	33613	9510
3614	33614	2410
3615	33615	5645
3616	33616	9585
3617	33617	3242
3618	33618	9998
3619	33619	363
3620	33620	7498
3621	33621	3228
3622	33622	241
3623	33623	2886
3624	33624	8282
3625	33625	7485
3626	33626	2333
3627	33627	7838
3628	33628	7119
3629	33629	3575
3630	33630	7349
3631	33631	7104
3632	33632	7041
3633	33633	5874
3634	33634	8628
3635	33635	3540
3636	33636	5669
3637	33637	9490
3638	33638	1564
3639	33639	2363
3640	33640	3103
3641	33641	6792
3642	33642	9444
3643	33643	451
3644	33644	1768
3645	33645	2184
3646	33646	291
3647	33647	4751
3648	33648	4580
3649	33649	7717
3650	33650	2120
3651	33651	7256
3652	33652	6094
3653	33653	4866
3654	33654	4982
3655	33655	1966
3656	33656	666
3657	33657	4177
3658	33658	7725
3659	33659	3225
3660	33660	9322
3661	33661	5324
3662	33662	3920
3663	33663	4584
3664	33664	6361
3665	33665	4574
3666	33666	9879
3667	33667	3462
3668	33668	8986
3669	33669	1282
3670	33670	9100
3671	33671	371
3672	33672	1876
3673	33673	9379
3674	33674	4051
3675	33675	1323
3676	33676	5520
3677	33677	2298
3678	33678	2128
3679	33679	9045
3680	33680	440
3681	33681	4351
3682	33682	3880
3683	33683	1943
3684	33684	4616
3685	33685	5150
3686	33686	5207
3687	33687	6681
3688	33688	6903
3689	33689	7731
3690	33690	2227
3691	33691	9819
3692	33692	1147
3693	33693	9294
3694	33694	9634
3695	33695	2627
3696	33696	1509
3697	33697	2671
3698	33698	706
3699	33699	144
3700	33700	8434
3701	33701	6090
3702	33702	5016
3703	33703	5578
3704	33704	510
3705	33705	8131
3706	33706	2854
3707	33707	2882
3708	33708	368
3709	33709	4775
3710	33710	2718
3711	33711	281
3712	33712	7291
3713	33713	9846
3714	33714	1021
3715	33715	2036
3716	33716	1814
3717	33717	624
3718	33718	8093
3719	33719	8053
3720	33720	5848
3721	33721	9586
3722	33722	769
3723	33723	8050
3724	33724	5669
3725	33725	7233
3726	33726	9650
3727	33727	5109
3728	33728	7845
3729	33729	2608
3730	33730	4810
3731	33731	1647
3732	33732	5745
3733	33733	7155
3734	33734	8050
3735	33735	2319
3736	33736	6066
3737	33737	7003
3738	33738	4869
3739	33739	2434
3740	33740	739
3741	33741	6196
3742	33742	5769
3743	33743	4926
3744	33744	1020
3745	33745	9762
3746	33746	224
3747	33747	4774
3748	33748	7573
3749	33749	1155
3750	33750	8544
3751	33751	2115
3752	33752	3926
3753	33753	9932
3754	33754	3501
3755	33755	1730
3756	33756	7042
3757	33757	2445
3758	33758	4949
3759	33759	609
3760	33760	8438
3761	33761	5000
3762	33762	2930
3763	33763	7351
3764	33764	5013
3765	33765	6381
3766	33766	6274
3767	33767	8867
3768	33768	5177
3769	33769	4633
3770	33770	5957
3771	33771	7533
3772	33772	2546
3773	33773	519
3774	33774	4020
3775	33775	9240
3776	33776	6982
3777	33777	2712
3778	33778	5793
3779	33779	5241
3780	33780	2963
3781	33781	534
3782	33782	247
3783	33783	5051
3784	33784	1864
3785	33785	9972
3786	33786	87
3787	33787	2613
3788	33788	5873
3789	33789	3192
3790	33790	5574
3791	33791	4010
3792	33792	3077
3793	33793	9832
3794	33794	5911
3795	33795	254
3796	33796	5350
3797	33797	2155
3798	33798	3061
3799	33799	9451
3800	33800	4116
3801	33801	3888
3802	33802	8226
3803	33803	2095
3804	33804	2024
3805	33805	8227
3806	33806	2264
3807	33807	1411
3808	33808	9249
3809	33809	8069
3810	33810	3107
3811	33811	6264
3812	33812	2717
3813	33813	6121
3814	33814	8160
3815	33815	3939
3816	33816	823
3817	33817	1334
3818	33818	5221
3819	33819	2482
3820	33820	5123
3821	33821	4716
3822	33822	1595
3823	33823	3049
3824	33824	7143
3825	33825	9117
3826	33826	777
3827	33827	9293
3828	33828	8051
3829	33829	4175
3830	33830	1823
3831	33831	7377
3832	33832	7497
3833	33833	4030
3834	33834	7668
3835	33835	5422
3836	33836	7758
3837	33837	2174
3838	33838	7565
3839	33839	1576
3840	33840	8209
3841	33841	7036
3842	33842	9416
3843	33843	369
3844	33844	3136
3845	33845	7467
3846	33846	4161
3847	33847	8088
3848	33848	8358
3849	33849	7597
3850	33850	2013
3851	33851	3133
3852	33852	3114
3853	33853	1135
3854	33854	9942
3855	33855	4002
3856	33856	3680
3857	33857	4241
3858	33858	4267
3859	33859	979
3860	33860	8954
3861	33861	2171
3862	33862	2182
3863	33863	2520
3864	33864	9416
3865	33865	1098
3866	33866	2284
3867	33867	3228
3868	33868	7509
3869	33869	2732
3870	33870	732
3871	33871	890
3872	33872	7352
3873	33873	9398
3874	33874	3249
3875	33875	679
3876	33876	7911
3877	33877	5786
3878	33878	1819
3879	33879	9888
3880	33880	3547
3881	33881	4154
3882	33882	8214
3883	33883	4497
3884	33884	9768
3885	33885	7190
3886	33886	3787
3887	33887	7306
3888	33888	5683
3889	33889	230
3890	33890	1837
3891	33891	6545
3892	33892	5415
3893	33893	4563
3894	33894	4809
3895	33895	1575
3896	33896	7199
3897	33897	4891
3898	33898	8822
3899	33899	4594
3900	33900	9616
3901	33901	7688
3902	33902	2545
3903	33903	5649
3904	33904	8528
3905	33905	9659
3906	33906	5423
3907	33907	4335
3908	33908	4460
3909	33909	9493
3910	33910	5278
3911	33911	1625
3912	33912	7642
3913	33913	1029
3914	33914	5175
3915	33915	3441
3916	33916	7203
3917	33917	3893
3918	33918	5532
3919	33919	7446
3920	33920	8172
3921	33921	6897
3922	33922	8106
3923	33923	5994
3924	33924	6047
3925	33925	6603
3926	33926	1011
3927	33927	2280
3928	33928	3511
3929	33929	2383
3930	33930	891
3931	33931	5382
3932	33932	2102
3933	33933	4905
3934	33934	4943
3935	33935	3145
3936	33936	7064
3937	33937	4720
3938	33938	7290
3939	33939	2923
3940	33940	3660
3941	33941	1169
3942	33942	8423
3943	33943	8037
3944	33944	3925
3945	33945	2451
3946	33946	3507
3947	33947	3672
3948	33948	9720
3949	33949	9599
3950	33950	9941
3951	33951	2616
3952	33952	6124
3953	33953	8524
3954	33954	1355
3955	33955	363
3956	33956	5784
3957	33957	1266
3958	33958	2942
3959	33959	2914
3960	33960	2512
3961	33961	3721
3962	33962	555
3963	33963	9286
3964	33964	3952
3965	33965	3745
3966	33966	6845
3967	33967	9569
3968	33968	2468
3969	33969	6093
3970	33970	7260
3971	33971	9670
3972	33972	4531
3973	33973	9754
3974	33974	3346
3975	33975	6988
3976	33976	7031
3977	33977	477
3978	33978	9012
3979	33979	7324
3980	33980	9916
3981	33981	2200
3982	33982	7186
3983	33983	7975
3984	33984	4562
3985	33985	4955
3986	33986	3369
3987	33987	3868
3988	33988	8339
3989	33989	4457
3990	33990	2865
3991	33991	7525
3992	33992	211
3993	33993	7801
3994	33994	5696
3995	33995	619
3996	33996	472
3997	33997	8492
3998	33998	6886
3999	33999	9924
4000	34000	3424
4001	32001	5369
4002	32002	1088
4003	32003	5322
4004	32004	8642
4005	32005	6737
4006	32006	7916
4007	32007	3021
4008	32008	3576
4009	32009	902
4010	32010	7402
4011	32011	1753
4012	32012	8750
4013	32013	4847
4014	32014	1447
4015	32015	7776
4016	32016	8886
4017	32017	2695
4018	32018	5587
4019	32019	6769
4020	32020	1727
4021	32021	7186
4022	32022	2754
4023	32023	1859
4024	32024	7669
4025	32025	6027
4026	32026	2062
4027	32027	8022
4028	32028	3579
4029	32029	5501
4030	32030	4144
4031	32031	6873
4032	32032	293
4033	32033	3494
4034	32034	8275
4035	32035	6931
4036	32036	3111
4037	32037	339
4038	32038	8270
4039	32039	2795
4040	32040	8420
4041	32041	9456
4042	32042	4028
4043	32043	2251
4044	32044	5789
4045	32045	9164
4046	32046	739
4047	32047	1950
4048	32048	7771
4049	32049	6653
4050	32050	4850
4051	32051	6071
4052	32052	3029
4053	32053	8845
4054	32054	6721
4055	32055	9398
4056	32056	5298
4057	32057	6911
4058	32058	3525
4059	32059	8047
4060	32060	8634
4061	32061	4546
4062	32062	3484
4063	32063	583
4064	32064	9135
4065	32065	3187
4066	32066	1527
4067	32067	5484
4068	32068	4813
4069	32069	1327
4070	32070	5036
4071	32071	9683
4072	32072	7025
4073	32073	9106
4074	32074	534
4075	32075	4933
4076	32076	7659
4077	32077	7391
4078	32078	1822
4079	32079	1871
4080	32080	8033
4081	32081	5638
4082	32082	9117
4083	32083	6286
4084	32084	6389
4085	32085	2510
4086	32086	5868
4087	32087	393
4088	32088	7132
4089	32089	1809
4090	32090	1642
4091	32091	9884
4092	32092	3772
4093	32093	1203
4094	32094	8601
4095	32095	4917
4096	32096	2648
4097	32097	871
4098	32098	8276
4099	32099	2761
4100	32100	5011
4101	32101	6640
4102	32102	9860
4103	32103	6144
4104	32104	1837
4105	32105	1608
4106	32106	2622
4107	32107	5176
4108	32108	2512
4109	32109	3610
4110	32110	3029
4111	32111	73
4112	32112	2697
4113	32113	6870
4114	32114	9831
4115	32115	3785
4116	32116	330
4117	32117	9084
4118	32118	6254
4119	32119	9305
4120	32120	4652
4121	32121	3756
4122	32122	6805
4123	32123	9228
4124	32124	7194
4125	32125	5222
4126	32126	4770
4127	32127	4755
4128	32128	6079
4129	32129	8956
4130	32130	8102
4131	32131	9243
4132	32132	7273
4133	32133	4091
4134	32134	9147
4135	32135	9094
4136	32136	7017
4137	32137	2493
4138	32138	9689
4139	32139	6202
4140	32140	2409
4141	32141	372
4142	32142	2428
4143	32143	3486
4144	32144	3599
4145	32145	6001
4146	32146	4760
4147	32147	6126
4148	32148	8368
4149	32149	9766
4150	32150	65
4151	32151	4286
4152	32152	5837
4153	32153	3328
4154	32154	771
4155	32155	7736
4156	32156	9263
4157	32157	6512
4158	32158	5589
4159	32159	3335
4160	32160	5574
4161	32161	7079
4162	32162	7184
4163	32163	5842
4164	32164	2643
4165	32165	1278
4166	32166	5588
4167	32167	473
4168	32168	4092
4169	32169	54
4170	32170	5503
4171	32171	8506
4172	32172	6861
4173	32173	9005
4174	32174	7527
4175	32175	4398
4176	32176	5516
4177	32177	7277
4178	32178	9265
4179	32179	9569
4180	32180	1163
4181	32181	1433
4182	32182	4235
4183	32183	7889
4184	32184	6759
4185	32185	5215
4186	32186	8767
4187	32187	5893
4188	32188	5668
4189	32189	1238
4190	32190	7660
4191	32191	1743
4192	32192	6110
4193	32193	7917
4194	32194	182
4195	32195	688
4196	32196	3126
4197	32197	7129
4198	32198	4548
4199	32199	2082
4200	32200	8878
4201	32201	1049
4202	32202	560
4203	32203	1670
4204	32204	8794
4205	32205	4887
4206	32206	5488
4207	32207	8541
4208	32208	9104
4209	32209	9367
4210	32210	1382
4211	32211	9312
4212	32212	708
4213	32213	1967
4214	32214	979
4215	32215	9722
4216	32216	3767
4217	32217	5628
4218	32218	9765
4219	32219	7905
4220	32220	4671
4221	32221	5196
4222	32222	4259
4223	32223	8086
4224	32224	3586
4225	32225	8221
4226	32226	2110
4227	32227	9269
4228	32228	1464
4229	32229	1084
4230	32230	6680
4231	32231	5100
4232	32232	1770
4233	32233	2693
4234	32234	6970
4235	32235	7724
4236	32236	4669
4237	32237	6841
4238	32238	5983
4239	32239	4091
4240	32240	7029
4241	32241	354
4242	32242	864
4243	32243	4138
4244	32244	4495
4245	32245	865
4246	32246	5882
4247	32247	1955
4248	32248	2292
4249	32249	403
4250	32250	6826
4251	32251	6306
4252	32252	202
4253	32253	8046
4254	32254	1544
4255	32255	322
4256	32256	3584
4257	32257	5300
4258	32258	4145
4259	32259	4700
4260	32260	1625
4261	32261	8034
4262	32262	616
4263	32263	1188
4264	32264	9136
4265	32265	274
4266	32266	8884
4267	32267	9128
4268	32268	2851
4269	32269	2994
4270	32270	7537
4271	32271	6575
4272	32272	9587
4273	32273	5926
4274	32274	5732
4275	32275	2119
4276	32276	7886
4277	32277	5575
4278	32278	1374
4279	32279	6832
4280	32280	9718
4281	32281	5782
4282	32282	3731
4283	32283	3200
4284	32284	7805
4285	32285	531
4286	32286	8390
4287	32287	964
4288	32288	1368
4289	32289	2164
4290	32290	1144
4291	32291	2963
4292	32292	1352
4293	32293	5339
4294	32294	1356
4295	32295	1018
4296	32296	2485
4297	32297	4052
4298	32298	8713
4299	32299	1762
4300	32300	2844
4301	32301	8200
4302	32302	5231
4303	32303	124
4304	32304	8689
4305	32305	7401
4306	32306	8796
4307	32307	8840
4308	32308	1534
4309	32309	9388
4310	32310	6514
4311	32311	3620
4312	32312	812
4313	32313	3168
4314	32314	9148
4315	32315	9744
4316	32316	6919
4317	32317	5593
4318	32318	1830
4319	32319	5645
4320	32320	2742
4321	32321	3691
4322	32322	4017
4323	32323	3321
4324	32324	2934
4325	32325	1593
4326	32326	5732
4327	32327	2948
4328	32328	9110
4329	32329	7579
4330	32330	4481
4331	32331	1871
4332	32332	5504
4333	32333	8189
4334	32334	4253
4335	32335	4433
4336	32336	4508
4337	32337	9878
4338	32338	8971
4339	32339	8911
4340	32340	3353
4341	32341	1713
4342	32342	3775
4343	32343	1349
4344	32344	9848
4345	32345	925
4346	32346	6029
4347	32347	6786
4348	32348	6065
4349	32349	790
4350	32350	6895
4351	32351	4368
4352	32352	1442
4353	32353	8054
4354	32354	8649
4355	32355	8301
4356	32356	9419
4357	32357	2398
4358	32358	5588
4359	32359	5357
4360	32360	1597
4361	32361	1401
4362	32362	2542
4363	32363	3608
4364	32364	8533
4365	32365	1722
4366	32366	8170
4367	32367	2530
4368	32368	3863
4369	32369	6048
4370	32370	6245
4371	32371	3317
4372	32372	5704
4373	32373	2659
4374	32374	3183
4375	32375	1556
4376	32376	529
4377	32377	2712
4378	32378	8094
4379	32379	1560
4380	32380	1234
4381	32381	6145
4382	32382	1259
4383	32383	7870
4384	32384	8506
4385	32385	2754
4386	32386	6304
4387	32387	4058
4388	32388	3028
4389	32389	590
4390	32390	4158
4391	32391	7271
4392	32392	461
4393	32393	3217
4394	32394	3575
4395	32395	9017
4396	32396	6929
4397	32397	8755
4398	32398	3795
4399	32399	2245
4400	32400	7910
4401	32401	8117
4402	32402	9008
4403	32403	5940
4404	32404	9853
4405	32405	3615
4406	32406	3188
4407	32407	7090
4408	32408	5569
4409	32409	6306
4410	32410	4869
4411	32411	8838
4412	32412	5991
4413	32413	9577
4414	32414	6438
4415	32415	6964
4416	32416	3229
4417	32417	2426
4418	32418	2515
4419	32419	3824
4420	32420	5510
4421	32421	2108
4422	32422	2681
4423	32423	3680
4424	32424	2536
4425	32425	6673
4426	32426	4970
4427	32427	5900
4428	32428	4549
4429	32429	4423
4430	32430	6142
4431	32431	8844
4432	32432	2027
4433	32433	6509
4434	32434	3613
4435	32435	9286
4436	32436	7848
4437	32437	3125
4438	32438	5701
4439	32439	3433
4440	32440	8965
4441	32441	6318
4442	32442	3949
4443	32443	4805
4444	32444	4627
4445	32445	6986
4446	32446	119
4447	32447	8566
4448	32448	6341
4449	32449	1730
4450	32450	9637
4451	32451	6603
4452	32452	9839
4453	32453	8344
4454	32454	9992
4455	32455	1444
4456	32456	8329
4457	32457	8560
4458	32458	2388
4459	32459	747
4460	32460	1213
4461	32461	9187
4462	32462	8252
4463	32463	4494
4464	32464	3314
4465	32465	7002
4466	32466	3555
4467	32467	602
4468	32468	4714
4469	32469	9857
4470	32470	1280
4471	32471	8272
4472	32472	74
4473	32473	8661
4474	32474	5561
4475	32475	6771
4476	32476	8477
4477	32477	4868
4478	32478	2451
4479	32479	4523
4480	32480	4919
4481	32481	5487
4482	32482	7709
4483	32483	8762
4484	32484	8752
4485	32485	1481
4486	32486	7929
4487	32487	7158
4488	32488	2562
4489	32489	5182
4490	32490	9619
4491	32491	5811
4492	32492	2252
4493	32493	601
4494	32494	7053
4495	32495	8131
4496	32496	1661
4497	32497	1742
4498	32498	106
4499	32499	775
4500	32500	6696
4501	32501	1451
4502	32502	8341
4503	32503	8304
4504	32504	7744
4505	32505	2348
4506	32506	121
4507	32507	8196
4508	32508	4431
4509	32509	8917
4510	32510	4564
4511	32511	9767
4512	32512	2244
4513	32513	6448
4514	32514	8520
4515	32515	3225
4516	32516	3007
4517	32517	5330
4518	32518	6571
4519	32519	2823
4520	32520	3629
4521	32521	8120
4522	32522	9253
4523	32523	74
4524	32524	8968
4525	32525	7356
4526	32526	5796
4527	32527	3221
4528	32528	4256
4529	32529	5344
4530	32530	5580
4531	32531	6470
4532	32532	1545
4533	32533	1910
4534	32534	2489
4535	32535	7350
4536	32536	4452
4537	32537	9145
4538	32538	1663
4539	32539	6995
4540	32540	4319
4541	32541	2823
4542	32542	4013
4543	32543	3997
4544	32544	2104
4545	32545	8372
4546	32546	721
4547	32547	679
4548	32548	7855
4549	32549	4662
4550	32550	6076
4551	32551	6641
4552	32552	29
4553	32553	5434
4554	32554	7556
4555	32555	1789
4556	32556	244
4557	32557	3340
4558	32558	3654
4559	32559	818
4560	32560	2468
4561	32561	4729
4562	32562	3382
4563	32563	1178
4564	32564	2739
4565	32565	3383
4566	32566	7986
4567	32567	9161
4568	32568	6787
4569	32569	9503
4570	32570	105
4571	32571	5911
4572	32572	7448
4573	32573	2058
4574	32574	5182
4575	32575	2967
4576	32576	7282
4577	32577	7753
4578	32578	3360
4579	32579	2803
4580	32580	3869
4581	32581	868
4582	32582	1746
4583	32583	3134
4584	32584	4065
4585	32585	3440
4586	32586	468
4587	32587	2190
4588	32588	9843
4589	32589	541
4590	32590	5967
4591	32591	3079
4592	32592	4022
4593	32593	7767
4594	32594	2791
4595	32595	9118
4596	32596	6874
4597	32597	1675
4598	32598	8651
4599	32599	6923
4600	32600	6489
4601	32601	9424
4602	32602	7052
4603	32603	4064
4604	32604	1477
4605	32605	1101
4606	32606	3093
4607	32607	9625
4608	32608	4506
4609	32609	3855
4610	32610	3925
4611	32611	1319
4612	32612	8042
4613	32613	851
4614	32614	6895
4615	32615	6102
4616	32616	4189
4617	32617	9886
4618	32618	9611
4619	32619	7639
4620	32620	2598
4621	32621	5077
4622	32622	5162
4623	32623	1573
4624	32624	4836
4625	32625	5300
4626	32626	8990
4627	32627	2061
4628	32628	6235
4629	32629	1934
4630	32630	7608
4631	32631	8599
4632	32632	4059
4633	32633	4850
4634	32634	5784
4635	32635	6576
4636	32636	1075
4637	32637	9237
4638	32638	6540
4639	32639	8627
4640	32640	8543
4641	32641	8241
4642	32642	2130
4643	32643	6471
4644	32644	7968
4645	32645	5228
4646	32646	6808
4647	32647	1403
4648	32648	2256
4649	32649	7
4650	32650	1406
4651	32651	8554
4652	32652	8047
4653	32653	3592
4654	32654	6842
4655	32655	6063
4656	32656	1046
4657	32657	3891
4658	32658	3811
4659	32659	6535
4660	32660	3596
4661	32661	98
4662	32662	4103
4663	32663	6813
4664	32664	1761
4665	32665	8858
4666	32666	4075
4667	32667	7854
4668	32668	9106
4669	32669	8938
4670	32670	1309
4671	32671	2874
4672	32672	1331
4673	32673	9030
4674	32674	5464
4675	32675	2094
4676	32676	4691
4677	32677	326
4678	32678	983
4679	32679	9442
4680	32680	3756
4681	32681	2941
4682	32682	5941
4683	32683	1387
4684	32684	563
4685	32685	3347
4686	32686	8094
4687	32687	2030
4688	32688	6883
4689	32689	5409
4690	32690	175
4691	32691	5389
4692	32692	774
4693	32693	2419
4694	32694	6315
4695	32695	3626
4696	32696	9345
4697	32697	4043
4698	32698	3941
4699	32699	8937
4700	32700	4233
4701	32701	4076
4702	32702	1735
4703	32703	7246
4704	32704	7779
4705	32705	1679
4706	32706	5247
4707	32707	6419
4708	32708	6674
4709	32709	6801
4710	32710	1071
4711	32711	668
4712	32712	3597
4713	32713	9082
4714	32714	1428
4715	32715	538
4716	32716	1041
4717	32717	6100
4718	32718	6887
4719	32719	4855
4720	32720	2515
4721	32721	3740
4722	32722	8202
4723	32723	7915
4724	32724	1758
4725	32725	321
4726	32726	2787
4727	32727	7839
4728	32728	4180
4729	32729	3398
4730	32730	3674
4731	32731	9313
4732	32732	4379
4733	32733	9551
4734	32734	7508
4735	32735	6392
4736	32736	326
4737	32737	2066
4738	32738	8578
4739	32739	1081
4740	32740	9056
4741	32741	686
4742	32742	4668
4743	32743	7752
4744	32744	4071
4745	32745	2674
4746	32746	4144
4747	32747	7518
4748	32748	9637
4749	32749	3783
4750	32750	3270
4751	32751	2323
4752	32752	5283
4753	32753	1856
4754	32754	3126
4755	32755	4765
4756	32756	3891
4757	32757	4536
4758	32758	2695
4759	32759	7516
4760	32760	1898
4761	32761	7942
4762	32762	1412
4763	32763	1208
4764	32764	5699
4765	32765	7965
4766	32766	8219
4767	32767	5880
4768	32768	295
4769	32769	8255
4770	32770	744
4771	32771	7224
4772	32772	4759
4773	32773	2661
4774	32774	2290
4775	32775	5882
4776	32776	563
4777	32777	453
4778	32778	7143
4779	32779	6315
4780	32780	3052
4781	32781	851
4782	32782	6448
4783	32783	3062
4784	32784	919
4785	32785	6210
4786	32786	5759
4787	32787	5208
4788	32788	6495
4789	32789	2207
4790	32790	7116
4791	32791	2352
4792	32792	3922
4793	32793	4664
4794	32794	3637
4795	32795	4910
4796	32796	7285
4797	32797	5274
4798	32798	4509
4799	32799	1840
4800	32800	8335
4801	32801	5772
4802	32802	5806
4803	32803	6176
4804	32804	1040
4805	32805	5926
4806	32806	8611
4807	32807	3221
4808	32808	7787
4809	32809	6958
4810	32810	3013
4811	32811	100
4812	32812	9223
4813	32813	2258
4814	32814	5578
4815	32815	4441
4816	32816	1902
4817	32817	9837
4818	32818	8501
4819	32819	7835
4820	32820	3628
4821	32821	6659
4822	32822	3589
4823	32823	2482
4824	32824	5497
4825	32825	3831
4826	32826	360
4827	32827	3148
4828	32828	5067
4829	32829	3619
4830	32830	3733
4831	32831	7332
4832	32832	4266
4833	32833	4087
4834	32834	2436
4835	32835	9639
4836	32836	3855
4837	32837	4344
4838	32838	2287
4839	32839	1871
4840	32840	6822
4841	32841	8974
4842	32842	6112
4843	32843	9610
4844	32844	3972
4845	32845	791
4846	32846	7638
4847	32847	9131
4848	32848	7448
4849	32849	3973
4850	32850	3160
4851	32851	4923
4852	32852	6009
4853	32853	8302
4854	32854	465
4855	32855	9190
4856	32856	229
4857	32857	8971
4858	32858	2054
4859	32859	8414
4860	32860	9610
4861	32861	3006
4862	32862	188
4863	32863	1398
4864	32864	8409
4865	32865	2406
4866	32866	4893
4867	32867	1236
4868	32868	2418
4869	32869	767
4870	32870	5562
4871	32871	12
4872	32872	3234
4873	32873	4123
4874	32874	1983
4875	32875	720
4876	32876	8224
4877	32877	2276
4878	32878	6770
4879	32879	6050
4880	32880	5454
4881	32881	2667
4882	32882	2021
4883	32883	9474
4884	32884	8391
4885	32885	7393
4886	32886	4361
4887	32887	6133
4888	32888	2705
4889	32889	5267
4890	32890	8068
4891	32891	9612
4892	32892	1900
4893	32893	8696
4894	32894	4990
4895	32895	7152
4896	32896	3838
4897	32897	2676
4898	32898	1419
4899	32899	5001
4900	32900	4098
4901	32901	3337
4902	32902	9384
4903	32903	1355
4904	32904	1024
4905	32905	5749
4906	32906	3740
4907	32907	9623
4908	32908	5267
4909	32909	666
4910	32910	9861
4911	32911	6231
4912	32912	1694
4913	32913	3494
4914	32914	9645
4915	32915	5951
4916	32916	7769
4917	32917	9801
4918	32918	6504
4919	32919	9617
4920	32920	6182
4921	32921	4255
4922	32922	2358
4923	32923	7285
4924	32924	2164
4925	32925	2640
4926	32926	6520
4927	32927	8785
4928	32928	7943
4929	32929	6430
4930	32930	3141
4931	32931	2171
4932	32932	3851
4933	32933	4447
4934	32934	3709
4935	32935	3906
4936	32936	3625
4937	32937	5438
4938	32938	6565
4939	32939	8015
4940	32940	7424
4941	32941	1134
4942	32942	7907
4943	32943	3782
4944	32944	6065
4945	32945	4910
4946	32946	6043
4947	32947	2895
4948	32948	5661
4949	32949	1782
4950	32950	5136
4951	32951	5122
4952	32952	2333
4953	32953	6761
4954	32954	8058
4955	32955	7537
4956	32956	4579
4957	32957	5058
4958	32958	382
4959	32959	7176
4960	32960	8638
4961	32961	9455
4962	32962	6640
4963	32963	3884
4964	32964	9471
4965	32965	8778
4966	32966	8841
4967	32967	1662
4968	32968	3075
4969	32969	3729
4970	32970	3592
4971	32971	7432
4972	32972	2899
4973	32973	7102
4974	32974	2381
4975	32975	853
4976	32976	9840
4977	32977	9049
4978	32978	2237
4979	32979	9675
4980	32980	5852
4981	32981	578
4982	32982	3468
4983	32983	7294
4984	32984	6749
4985	32985	3175
4986	32986	3901
4987	32987	1921
4988	32988	8639
4989	32989	7087
4990	32990	1074
4991	32991	471
4992	32992	838
4993	32993	8402
4994	32994	4859
4995	32995	6357
4996	32996	8518
4997	32997	6821
4998	32998	6728
4999	32999	7106
5000	33000	5030
5001	33001	1293
5002	33002	5898
5003	33003	105
5004	33004	4708
5005	33005	3932
5006	33006	158
5007	33007	7018
5008	33008	832
5009	33009	7716
5010	33010	9396
5011	33011	3294
5012	33012	8369
5013	33013	54
5014	33014	1302
5015	33015	2821
5016	33016	1563
5017	33017	8928
5018	33018	7222
5019	33019	5387
5020	33020	4080
5021	33021	3272
5022	33022	210
5023	33023	8072
5024	33024	2480
5025	33025	3650
5026	33026	8549
5027	33027	7518
5028	33028	2512
5029	33029	3754
5030	33030	2118
5031	33031	6802
5032	33032	850
5033	33033	334
5034	33034	7251
5035	33035	4666
5036	33036	6807
5037	33037	6985
5038	33038	3435
5039	33039	6212
5040	33040	821
5041	33041	7017
5042	33042	8637
5043	33043	5266
5044	33044	7955
5045	33045	3615
5046	33046	6159
5047	33047	7719
5048	33048	3743
5049	33049	5769
5050	33050	3296
5051	33051	6970
5052	33052	272
5053	33053	4340
5054	33054	2972
5055	33055	6351
5056	33056	3677
5057	33057	7921
5058	33058	7580
5059	33059	7662
5060	33060	8018
5061	33061	5818
5062	33062	2939
5063	33063	5726
5064	33064	6907
5065	33065	8274
5066	33066	938
5067	33067	3919
5068	33068	3434
5069	33069	6593
5070	33070	3204
5071	33071	5773
5072	33072	3273
5073	33073	8841
5074	33074	8122
5075	33075	2654
5076	33076	9202
5077	33077	4959
5078	33078	1702
5079	33079	379
5080	33080	8162
5081	33081	7127
5082	33082	5070
5083	33083	3969
5084	33084	1403
5085	33085	2112
5086	33086	623
5087	33087	9235
5088	33088	8047
5089	33089	9165
5090	33090	8144
5091	33091	5583
5092	33092	7044
5093	33093	5984
5094	33094	2793
5095	33095	6998
5096	33096	6667
5097	33097	911
5098	33098	727
5099	33099	9560
5100	33100	9249
5101	33101	8571
5102	33102	624
5103	33103	2343
5104	33104	6966
5105	33105	7645
5106	33106	5610
5107	33107	4116
5108	33108	1105
5109	33109	6273
5110	33110	1208
5111	33111	6428
5112	33112	4757
5113	33113	5370
5114	33114	3138
5115	33115	912
5116	33116	9343
5117	33117	1563
5118	33118	2755
5119	33119	1993
5120	33120	7593
5121	33121	2355
5122	33122	8229
5123	33123	8543
5124	33124	1847
5125	33125	8891
5126	33126	4865
5127	33127	6348
5128	33128	5012
5129	33129	2271
5130	33130	3445
5131	33131	5126
5132	33132	1280
5133	33133	92
5134	33134	1972
5135	33135	4381
5136	33136	6822
5137	33137	7810
5138	33138	6224
5139	33139	3363
5140	33140	977
5141	33141	4355
5142	33142	3981
5143	33143	2050
5144	33144	4186
5145	33145	7321
5146	33146	6200
5147	33147	9959
5148	33148	5023
5149	33149	1732
5150	33150	2561
5151	33151	7750
5152	33152	2079
5153	33153	2825
5154	33154	2040
5155	33155	6811
5156	33156	751
5157	33157	7686
5158	33158	4765
5159	33159	3686
5160	33160	9229
5161	33161	4113
5162	33162	3785
5163	33163	6152
5164	33164	7247
5165	33165	278
5166	33166	6602
5167	33167	1691
5168	33168	8178
5169	33169	4005
5170	33170	5938
5171	33171	9732
5172	33172	5796
5173	33173	5979
5174	33174	990
5175	33175	7954
5176	33176	1640
5177	33177	6498
5178	33178	7100
5179	33179	5204
5180	33180	7239
5181	33181	2582
5182	33182	3596
5183	33183	1194
5184	33184	9285
5185	33185	5312
5186	33186	1548
5187	33187	1973
5188	33188	9821
5189	33189	8004
5190	33190	9670
5191	33191	7579
5192	33192	2874
5193	33193	9392
5194	33194	8234
5195	33195	5004
5196	33196	1524
5197	33197	8942
5198	33198	2465
5199	33199	8919
5200	33200	2542
5201	33201	8702
5202	33202	8598
5203	33203	4125
5204	33204	4432
5205	33205	6819
5206	33206	8974
5207	33207	1612
5208	33208	9939
5209	33209	4257
5210	33210	2376
5211	33211	728
5212	33212	6979
5213	33213	7491
5214	33214	1164
5215	33215	2895
5216	33216	4340
5217	33217	1276
5218	33218	6721
5219	33219	482
5220	33220	4508
5221	33221	6828
5222	33222	4266
5223	33223	6026
5224	33224	1533
5225	33225	1596
5226	33226	501
5227	33227	449
5228	33228	3331
5229	33229	625
5230	33230	1736
5231	33231	8821
5232	33232	1197
5233	33233	9420
5234	33234	8970
5235	33235	404
5236	33236	3425
5237	33237	318
5238	33238	3129
5239	33239	3190
5240	33240	7665
5241	33241	5032
5242	33242	5197
5243	33243	7459
5244	33244	9480
5245	33245	1457
5246	33246	1273
5247	33247	3131
5248	33248	4845
5249	33249	365
5250	33250	1399
5251	33251	4151
5252	33252	9274
5253	33253	6526
5254	33254	6017
5255	33255	6766
5256	33256	2518
5257	33257	1686
5258	33258	6822
5259	33259	6034
5260	33260	8877
5261	33261	7880
5262	33262	4415
5263	33263	7578
5264	33264	9898
5265	33265	154
5266	33266	5429
5267	33267	1922
5268	33268	2930
5269	33269	2998
5270	33270	6913
5271	33271	8090
5272	33272	1605
5273	33273	559
5274	33274	5908
5275	33275	9231
5276	33276	866
5277	33277	6014
5278	33278	553
5279	33279	1047
5280	33280	1865
5281	33281	6747
5282	33282	3854
5283	33283	1460
5284	33284	5384
5285	33285	4715
5286	33286	1938
5287	33287	1450
5288	33288	7177
5289	33289	3992
5290	33290	7465
5291	33291	5455
5292	33292	5456
5293	33293	410
5294	33294	2817
5295	33295	6219
5296	33296	3553
5297	33297	1360
5298	33298	1263
5299	33299	2269
5300	33300	6328
5301	33301	8575
5302	33302	6254
5303	33303	1470
5304	33304	4032
5305	33305	3562
5306	33306	700
5307	33307	8039
5308	33308	2665
5309	33309	7605
5310	33310	3612
5311	33311	9864
5312	33312	809
5313	33313	1811
5314	33314	1967
5315	33315	2615
5316	33316	6782
5317	33317	5689
5318	33318	2020
5319	33319	1804
5320	33320	3939
5321	33321	5563
5322	33322	7770
5323	33323	825
5324	33324	1871
5325	33325	1302
5326	33326	1965
5327	33327	9268
5328	33328	6165
5329	33329	3217
5330	33330	4201
5331	33331	4950
5332	33332	5319
5333	33333	1882
5334	33334	3349
5335	33335	2209
5336	33336	9697
5337	33337	5656
5338	33338	1604
5339	33339	9012
5340	33340	2539
5341	33341	1236
5342	33342	9369
5343	33343	3263
5344	33344	1225
5345	33345	5473
5346	33346	2812
5347	33347	3338
5348	33348	1205
5349	33349	5751
5350	33350	9026
5351	33351	9116
5352	33352	5943
5353	33353	5604
5354	33354	7869
5355	33355	4581
5356	33356	2309
5357	33357	1051
5358	33358	607
5359	33359	8012
5360	33360	8299
5361	33361	4108
5362	33362	2015
5363	33363	5783
5364	33364	4138
5365	33365	3950
5366	33366	739
5367	33367	2261
5368	33368	2702
5369	33369	285
5370	33370	2713
5371	33371	9828
5372	33372	2414
5373	33373	7677
5374	33374	278
5375	33375	7384
5376	33376	8263
5377	33377	1453
5378	33378	1423
5379	33379	1134
5380	33380	4761
5381	33381	9679
5382	33382	1589
5383	33383	3449
5384	33384	588
5385	33385	9741
5386	33386	3034
5387	33387	8836
5388	33388	1555
5389	33389	6549
5390	33390	7492
5391	33391	5771
5392	33392	8646
5393	33393	8147
5394	33394	4963
5395	33395	6285
5396	33396	2490
5397	33397	4437
5398	33398	7574
5399	33399	3419
5400	33400	2458
5401	33401	1042
5402	33402	6851
5403	33403	2478
5404	33404	3604
5405	33405	6490
5406	33406	6596
5407	33407	9200
5408	33408	4657
5409	33409	4978
5410	33410	3377
5411	33411	6219
5412	33412	5705
5413	33413	2203
5414	33414	1037
5415	33415	5037
5416	33416	9576
5417	33417	7552
5418	33418	3757
5419	33419	621
5420	33420	1845
5421	33421	7987
5422	33422	4997
5423	33423	5207
5424	33424	6448
5425	33425	1279
5426	33426	9880
5427	33427	9316
5428	33428	2416
5429	33429	6805
5430	33430	7968
5431	33431	5650
5432	33432	7580
5433	33433	1006
5434	33434	3345
5435	33435	9231
5436	33436	9865
5437	33437	2572
5438	33438	7800
5439	33439	4779
5440	33440	9543
5441	33441	5129
5442	33442	984
5443	33443	673
5444	33444	2860
5445	33445	874
5446	33446	7678
5447	33447	5486
5448	33448	1462
5449	33449	2230
5450	33450	609
5451	33451	9118
5452	33452	5503
5453	33453	9379
5454	33454	4104
5455	33455	6612
5456	33456	915
5457	33457	8308
5458	33458	6908
5459	33459	5414
5460	33460	2959
5461	33461	1269
5462	33462	2734
5463	33463	5915
5464	33464	9169
5465	33465	6472
5466	33466	875
5467	33467	1434
5468	33468	7343
5469	33469	2217
5470	33470	5855
5471	33471	695
5472	33472	4375
5473	33473	2255
5474	33474	3224
5475	33475	3589
5476	33476	9140
5477	33477	4396
5478	33478	2414
5479	33479	2856
5480	33480	2671
5481	33481	1724
5482	33482	6766
5483	33483	6189
5484	33484	9789
5485	33485	4199
5486	33486	9974
5487	33487	2984
5488	33488	1559
5489	33489	5783
5490	33490	8162
5491	33491	3539
5492	33492	3544
5493	33493	1291
5494	33494	7242
5495	33495	6067
5496	33496	1591
5497	33497	8084
5498	33498	3836
5499	33499	9782
5500	33500	5916
5501	33501	7490
5502	33502	5267
5503	33503	9164
5504	33504	9837
5505	33505	2276
5506	33506	5079
5507	33507	6971
5508	33508	6311
5509	33509	6247
5510	33510	2770
5511	33511	3240
5512	33512	4148
5513	33513	7411
5514	33514	6154
5515	33515	8574
5516	33516	3079
5517	33517	5451
5518	33518	4500
5519	33519	3644
5520	33520	7186
5521	33521	4131
5522	33522	8184
5523	33523	4671
5524	33524	1827
5525	33525	3019
5526	33526	3392
5527	33527	6023
5528	33528	5842
5529	33529	3576
5530	33530	2538
5531	33531	3492
5532	33532	3364
5533	33533	6822
5534	33534	9719
5535	33535	5884
5536	33536	2602
5537	33537	6516
5538	33538	8957
5539	33539	5975
5540	33540	200
5541	33541	8565
5542	33542	2816
5543	33543	585
5544	33544	9595
5545	33545	8717
5546	33546	4538
5547	33547	360
5548	33548	4514
5549	33549	5467
5550	33550	5816
5551	33551	3094
5552	33552	3296
5553	33553	244
5554	33554	7412
5555	33555	8157
5556	33556	4920
5557	33557	1487
5558	33558	7057
5559	33559	6501
5560	33560	4790
5561	33561	9177
5562	33562	2463
5563	33563	7597
5564	33564	769
5565	33565	330
5566	33566	3451
5567	33567	3299
5568	33568	3394
5569	33569	4758
5570	33570	5593
5571	33571	7444
5572	33572	1595
5573	33573	2592
5574	33574	1139
5575	33575	9682
5576	33576	3979
5577	33577	9181
5578	33578	6714
5579	33579	8187
5580	33580	4114
5581	33581	1766
5582	33582	8914
5583	33583	3668
5584	33584	1822
5585	33585	2565
5586	33586	7496
5587	33587	2150
5588	33588	6710
5589	33589	1838
5590	33590	7569
5591	33591	9223
5592	33592	9218
5593	33593	6594
5594	33594	8157
5595	33595	984
5596	33596	3568
5597	33597	2211
5598	33598	8509
5599	33599	1397
5600	33600	1793
5601	33601	1563
5602	33602	6307
5603	33603	439
5604	33604	1387
5605	33605	7342
5606	33606	4555
5607	33607	8721
5608	33608	5591
5609	33609	5499
5610	33610	3754
5611	33611	1327
5612	33612	9598
5613	33613	5999
5614	33614	3514
5615	33615	810
5616	33616	7513
5617	33617	9909
5618	33618	8779
5619	33619	6766
5620	33620	7098
5621	33621	1215
5622	33622	9038
5623	33623	9305
5624	33624	4280
5625	33625	1389
5626	33626	7245
5627	33627	9081
5628	33628	3667
5629	33629	2662
5630	33630	1289
5631	33631	6814
5632	33632	5912
5633	33633	3096
5634	33634	8780
5635	33635	1592
5636	33636	6140
5637	33637	2798
5638	33638	3134
5639	33639	4365
5640	33640	2778
5641	33641	7460
5642	33642	4214
5643	33643	3891
5644	33644	3269
5645	33645	2530
5646	33646	7350
5647	33647	6755
5648	33648	807
5649	33649	1728
5650	33650	4653
5651	33651	9804
5652	33652	9674
5653	33653	3711
5654	33654	4959
5655	33655	1724
5656	33656	3318
5657	33657	2118
5658	33658	2604
5659	33659	2008
5660	33660	7592
5661	33661	5188
5662	33662	1589
5663	33663	1723
5664	33664	3361
5665	33665	729
5666	33666	5659
5667	33667	2551
5668	33668	3366
5669	33669	5799
5670	33670	8323
5671	33671	4072
5672	33672	6582
5673	33673	3365
5674	33674	1266
5675	33675	6017
5676	33676	1208
5677	33677	7409
5678	33678	1771
5679	33679	5703
5680	33680	2864
5681	33681	5151
5682	33682	4033
5683	33683	6791
5684	33684	3775
5685	33685	8399
5686	33686	4652
5687	33687	2657
5688	33688	2185
5689	33689	384
5690	33690	6429
5691	33691	2232
5692	33692	4227
5693	33693	590
5694	33694	3689
5695	33695	4236
5696	33696	6496
5697	33697	5055
5698	33698	2254
5699	33699	8211
5700	33700	5126
5701	33701	5497
5702	33702	4477
5703	33703	8326
5704	33704	3686
5705	33705	1097
5706	33706	4938
5707	33707	6221
5708	33708	9096
5709	33709	3062
5710	33710	5791
5711	33711	3301
5712	33712	1024
5713	33713	299
5714	33714	4506
5715	33715	4298
5716	33716	6713
5717	33717	1258
5718	33718	5728
5719	33719	4888
5720	33720	3632
5721	33721	2447
5722	33722	8756
5723	33723	9029
5724	33724	542
5725	33725	2370
5726	33726	2432
5727	33727	2924
5728	33728	8167
5729	33729	8273
5730	33730	1338
5731	33731	2687
5732	33732	1693
5733	33733	409
5734	33734	1798
5735	33735	8656
5736	33736	688
5737	33737	6021
5738	33738	2796
5739	33739	9925
5740	33740	7906
5741	33741	3862
5742	33742	1883
5743	33743	7830
5744	33744	2279
5745	33745	4847
5746	33746	9637
5747	33747	4790
5748	33748	6187
5749	33749	5934
5750	33750	7177
5751	33751	3817
5752	33752	5887
5753	33753	210
5754	33754	9455
5755	33755	808
5756	33756	7592
5757	33757	4720
5758	33758	8168
5759	33759	5771
5760	33760	2621
5761	33761	6533
5762	33762	8961
5763	33763	6455
5764	33764	4878
5765	33765	7262
5766	33766	7608
5767	33767	9618
5768	33768	2432
5769	33769	9968
5770	33770	7109
5771	33771	4146
5772	33772	6552
5773	33773	7483
5774	33774	5747
5775	33775	7561
5776	33776	3969
5777	33777	7972
5778	33778	7919
5779	33779	8641
5780	33780	8823
5781	33781	5177
5782	33782	8714
5783	33783	2498
5784	33784	2345
5785	33785	4755
5786	33786	3807
5787	33787	885
5788	33788	1294
5789	33789	4633
5790	33790	6740
5791	33791	1081
5792	33792	5409
5793	33793	5203
5794	33794	7133
5795	33795	9301
5796	33796	9413
5797	33797	1984
5798	33798	3149
5799	33799	7529
5800	33800	980
5801	33801	609
5802	33802	9885
5803	33803	4652
5804	33804	7070
5805	33805	6856
5806	33806	8495
5807	33807	679
5808	33808	4361
5809	33809	4823
5810	33810	3659
5811	33811	7089
5812	33812	1367
5813	33813	8474
5814	33814	246
5815	33815	7137
5816	33816	2372
5817	33817	1232
5818	33818	9756
5819	33819	8872
5820	33820	1011
5821	33821	6555
5822	33822	162
5823	33823	2547
5824	33824	5623
5825	33825	5173
5826	33826	902
5827	33827	9640
5828	33828	3831
5829	33829	8029
5830	33830	7200
5831	33831	505
5832	33832	2575
5833	33833	2530
5834	33834	1422
5835	33835	2427
5836	33836	3116
5837	33837	1833
5838	33838	7636
5839	33839	9318
5840	33840	5371
5841	33841	6174
5842	33842	3428
5843	33843	1560
5844	33844	2118
5845	33845	3777
5846	33846	433
5847	33847	6087
5848	33848	2703
5849	33849	5692
5850	33850	3254
5851	33851	2448
5852	33852	9896
5853	33853	8175
5854	33854	9457
5855	33855	5017
5856	33856	4414
5857	33857	5835
5858	33858	8781
5859	33859	5239
5860	33860	7152
5861	33861	7766
5862	33862	6561
5863	33863	7859
5864	33864	2312
5865	33865	8810
5866	33866	3932
5867	33867	5572
5868	33868	9100
5869	33869	4577
5870	33870	4378
5871	33871	4345
5872	33872	7294
5873	33873	1805
5874	33874	4695
5875	33875	1789
5876	33876	2263
5877	33877	7335
5878	33878	6380
5879	33879	3436
5880	33880	6667
5881	33881	2045
5882	33882	6765
5883	33883	5210
5884	33884	6770
5885	33885	3765
5886	33886	6440
5887	33887	4495
5888	33888	3366
5889	33889	518
5890	33890	9701
5891	33891	1636
5892	33892	2569
5893	33893	5289
5894	33894	9893
5895	33895	1977
5896	33896	4975
5897	33897	9346
5898	33898	578
5899	33899	304
5900	33900	6203
5901	33901	1199
5902	33902	1582
5903	33903	6049
5904	33904	6517
5905	33905	1922
5906	33906	4255
5907	33907	7229
5908	33908	5433
5909	33909	2457
5910	33910	5383
5911	33911	4830
5912	33912	9220
5913	33913	2019
5914	33914	2406
5915	33915	1470
5916	33916	7715
5917	33917	9055
5918	33918	3469
5919	33919	7828
5920	33920	4306
5921	33921	3504
5922	33922	1542
5923	33923	9017
5924	33924	8826
5925	33925	7830
5926	33926	7326
5927	33927	4373
5928	33928	7752
5929	33929	7672
5930	33930	605
5931	33931	6609
5932	33932	1712
5933	33933	245
5934	33934	8172
5935	33935	5691
5936	33936	3633
5937	33937	7047
5938	33938	4241
5939	33939	598
5940	33940	303
5941	33941	4686
5942	33942	6875
5943	33943	79
5944	33944	8278
5945	33945	8278
5946	33946	4761
5947	33947	8227
5948	33948	9950
5949	33949	1756
5950	33950	2629
5951	33951	4349
5952	33952	1910
5953	33953	8034
5954	33954	3201
5955	33955	8840
5956	33956	1692
5957	33957	7937
5958	33958	6320
5959	33959	4734
5960	33960	1434
5961	33961	5694
5962	33962	3404
5963	33963	5946
5964	33964	8364
5965	33965	9327
5966	33966	3106
5967	33967	6378
5968	33968	149
5969	33969	4025
5970	33970	2958
5971	33971	4841
5972	33972	9399
5973	33973	8790
5974	33974	9324
5975	33975	3978
5976	33976	5686
5977	33977	6037
5978	33978	6634
5979	33979	1434
5980	33980	5503
5981	33981	8060
5982	33982	1000
5983	33983	4095
5984	33984	3089
5985	33985	7200
5986	33986	6248
5987	33987	7976
5988	33988	9393
5989	33989	8012
5990	33990	9747
5991	33991	5029
5992	33992	311
5993	33993	9479
5994	33994	1262
5995	33995	8757
5996	33996	9721
5997	33997	7919
5998	33998	874
5999	33999	3046
6000	34000	6113
6001	32001	9448
6002	32002	4485
6003	32003	514
6004	32004	6723
6005	32005	9929
6006	32006	967
6007	32007	5794
6008	32008	9533
6009	32009	7662
6010	32010	369
6011	32011	7592
6012	32012	9313
6013	32013	9246
6014	32014	2389
6015	32015	6771
6016	32016	4798
6017	32017	9580
6018	32018	6237
6019	32019	259
6020	32020	347
6021	32021	3987
6022	32022	2044
6023	32023	9825
6024	32024	1657
6025	32025	1177
6026	32026	3988
6027	32027	2791
6028	32028	3364
6029	32029	7900
6030	32030	1398
6031	32031	8908
6032	32032	4808
6033	32033	752
6034	32034	1544
6035	32035	7770
6036	32036	5633
6037	32037	151
6038	32038	7015
6039	32039	4019
6040	32040	3927
6041	32041	7561
6042	32042	4855
6043	32043	6758
6044	32044	1570
6045	32045	8071
6046	32046	3679
6047	32047	1427
6048	32048	2279
6049	32049	3930
6050	32050	8474
6051	32051	5099
6052	32052	384
6053	32053	8963
6054	32054	3142
6055	32055	8427
6056	32056	3141
6057	32057	5714
6058	32058	6326
6059	32059	4753
6060	32060	8322
6061	32061	2618
6062	32062	7897
6063	32063	967
6064	32064	9935
6065	32065	6665
6066	32066	7600
6067	32067	6062
6068	32068	3078
6069	32069	7833
6070	32070	5234
6071	32071	2956
6072	32072	6640
6073	32073	2265
6074	32074	9318
6075	32075	6755
6076	32076	7231
6077	32077	1397
6078	32078	2515
6079	32079	8473
6080	32080	5936
6081	32081	7962
6082	32082	453
6083	32083	8744
6084	32084	6552
6085	32085	7177
6086	32086	9188
6087	32087	219
6088	32088	5441
6089	32089	7721
6090	32090	8952
6091	32091	1636
6092	32092	5977
6093	32093	7605
6094	32094	2941
6095	32095	8963
6096	32096	4915
6097	32097	1365
6098	32098	5972
6099	32099	9049
6100	32100	1967
6101	32101	3144
6102	32102	713
6103	32103	709
6104	32104	7631
6105	32105	9194
6106	32106	8561
6107	32107	5442
6108	32108	6050
6109	32109	6942
6110	32110	5104
6111	32111	8629
6112	32112	2942
6113	32113	6208
6114	32114	113
6115	32115	3229
6116	32116	4163
6117	32117	7666
6118	32118	1144
6119	32119	6031
6120	32120	8431
6121	32121	9879
6122	32122	6342
6123	32123	4893
6124	32124	9332
6125	32125	3933
6126	32126	2055
6127	32127	2668
6128	32128	2666
6129	32129	1448
6130	32130	1690
6131	32131	5234
6132	32132	9302
6133	32133	9221
6134	32134	5310
6135	32135	8172
6136	32136	3936
6137	32137	2485
6138	32138	9060
6139	32139	5986
6140	32140	3131
6141	32141	7518
6142	32142	1839
6143	32143	4147
6144	32144	1613
6145	32145	4517
6146	32146	7325
6147	32147	2386
6148	32148	22
6149	32149	5939
6150	32150	4569
6151	32151	6654
6152	32152	3139
6153	32153	7442
6154	32154	6135
6155	32155	3041
6156	32156	9471
6157	32157	8062
6158	32158	5547
6159	32159	4721
6160	32160	5272
6161	32161	6692
6162	32162	3958
6163	32163	4177
6164	32164	5088
6165	32165	1686
6166	32166	929
6167	32167	4484
6168	32168	5442
6169	32169	5515
6170	32170	4976
6171	32171	5149
6172	32172	2042
6173	32173	2222
6174	32174	6407
6175	32175	4084
6176	32176	1237
6177	32177	5419
6178	32178	9846
6179	32179	1640
6180	32180	2646
6181	32181	3695
6182	32182	3670
6183	32183	8757
6184	32184	6864
6185	32185	9453
6186	32186	8202
6187	32187	784
6188	32188	7610
6189	32189	7265
6190	32190	5789
6191	32191	3712
6192	32192	6071
6193	32193	6380
6194	32194	2596
6195	32195	7397
6196	32196	5225
6197	32197	9220
6198	32198	7464
6199	32199	3279
6200	32200	8454
6201	32201	7564
6202	32202	8746
6203	32203	4449
6204	32204	6923
6205	32205	7805
6206	32206	9965
6207	32207	2427
6208	32208	6857
6209	32209	1425
6210	32210	6006
6211	32211	5168
6212	32212	6572
6213	32213	3635
6214	32214	7165
6215	32215	4829
6216	32216	6510
6217	32217	6717
6218	32218	8089
6219	32219	6490
6220	32220	3492
6221	32221	4892
6222	32222	7831
6223	32223	9751
6224	32224	6215
6225	32225	5374
6226	32226	393
6227	32227	1593
6228	32228	2497
6229	32229	9763
6230	32230	3566
6231	32231	7402
6232	32232	7543
6233	32233	4933
6234	32234	5003
6235	32235	8722
6236	32236	8789
6237	32237	8641
6238	32238	2981
6239	32239	5568
6240	32240	1061
6241	32241	5003
6242	32242	2018
6243	32243	7300
6244	32244	2932
6245	32245	296
6246	32246	792
6247	32247	6233
6248	32248	3126
6249	32249	2583
6250	32250	7541
6251	32251	1874
6252	32252	4470
6253	32253	1740
6254	32254	2599
6255	32255	1117
6256	32256	6789
6257	32257	6052
6258	32258	489
6259	32259	4592
6260	32260	9907
6261	32261	7211
6262	32262	3642
6263	32263	1539
6264	32264	8674
6265	32265	1860
6266	32266	2181
6267	32267	4376
6268	32268	4424
6269	32269	6711
6270	32270	6946
6271	32271	5543
6272	32272	6568
6273	32273	428
6274	32274	8056
6275	32275	627
6276	32276	2417
6277	32277	3303
6278	32278	2646
6279	32279	9087
6280	32280	7514
6281	32281	4013
6282	32282	6011
6283	32283	3909
6284	32284	6725
6285	32285	4975
6286	32286	1472
6287	32287	2220
6288	32288	8973
6289	32289	7624
6290	32290	1324
6291	32291	6784
6292	32292	7529
6293	32293	3165
6294	32294	2914
6295	32295	9986
6296	32296	8502
6297	32297	2581
6298	32298	3550
6299	32299	6902
6300	32300	6275
6301	32301	1743
6302	32302	1370
6303	32303	7244
6304	32304	4420
6305	32305	8038
6306	32306	8056
6307	32307	8847
6308	32308	3595
6309	32309	3419
6310	32310	2381
6311	32311	6788
6312	32312	3191
6313	32313	7822
6314	32314	8879
6315	32315	749
6316	32316	2848
6317	32317	4808
6318	32318	6989
6319	32319	4189
6320	32320	3959
6321	32321	8949
6322	32322	2644
6323	32323	9867
6324	32324	431
6325	32325	495
6326	32326	3617
6327	32327	9264
6328	32328	4326
6329	32329	4125
6330	32330	8593
6331	32331	6632
6332	32332	8968
6333	32333	6875
6334	32334	8740
6335	32335	6055
6336	32336	7205
6337	32337	3595
6338	32338	6393
6339	32339	2549
6340	32340	3441
6341	32341	8479
6342	32342	3800
6343	32343	7889
6344	32344	8226
6345	32345	8194
6346	32346	4754
6347	32347	9980
6348	32348	4978
6349	32349	6063
6350	32350	3682
6351	32351	2250
6352	32352	1356
6353	32353	2423
6354	32354	8284
6355	32355	126
6356	32356	9345
6357	32357	910
6358	32358	7819
6359	32359	82
6360	32360	8222
6361	32361	6964
6362	32362	5694
6363	32363	5947
6364	32364	3911
6365	32365	7378
6366	32366	7933
6367	32367	8798
6368	32368	3298
6369	32369	4414
6370	32370	1243
6371	32371	5966
6372	32372	1181
6373	32373	3246
6374	32374	5204
6375	32375	694
6376	32376	9729
6377	32377	6192
6378	32378	2650
6379	32379	6817
6380	32380	1741
6381	32381	5258
6382	32382	4579
6383	32383	1560
6384	32384	4450
6385	32385	1120
6386	32386	1719
6387	32387	9132
6388	32388	6989
6389	32389	8716
6390	32390	8376
6391	32391	4467
6392	32392	7911
6393	32393	9346
6394	32394	160
6395	32395	3978
6396	32396	8417
6397	32397	3762
6398	32398	1199
6399	32399	5993
6400	32400	9081
6401	32401	2230
6402	32402	932
6403	32403	3420
6404	32404	7208
6405	32405	9968
6406	32406	5709
6407	32407	2300
6408	32408	471
6409	32409	890
6410	32410	7998
6411	32411	211
6412	32412	6062
6413	32413	8519
6414	32414	9972
6415	32415	8376
6416	32416	5735
6417	32417	3571
6418	32418	5230
6419	32419	373
6420	32420	5857
6421	32421	4651
6422	32422	83
6423	32423	5185
6424	32424	5663
6425	32425	5284
6426	32426	5279
6427	32427	8004
6428	32428	4338
6429	32429	2300
6430	32430	3774
6431	32431	468
6432	32432	3894
6433	32433	3575
6434	32434	6215
6435	32435	9024
6436	32436	7550
6437	32437	536
6438	32438	8908
6439	32439	7238
6440	32440	8332
6441	32441	4410
6442	32442	8856
6443	32443	6409
6444	32444	6550
6445	32445	2712
6446	32446	6313
6447	32447	7208
6448	32448	7636
6449	32449	8326
6450	32450	8667
6451	32451	2070
6452	32452	8963
6453	32453	9600
6454	32454	3604
6455	32455	9676
6456	32456	8474
6457	32457	5017
6458	32458	4342
6459	32459	2499
6460	32460	6076
6461	32461	1166
6462	32462	3826
6463	32463	3675
6464	32464	6285
6465	32465	4311
6466	32466	6834
6467	32467	5540
6468	32468	6578
6469	32469	3828
6470	32470	6043
6471	32471	3473
6472	32472	6371
6473	32473	9764
6474	32474	3213
6475	32475	8156
6476	32476	9540
6477	32477	3062
6478	32478	1035
6479	32479	4049
6480	32480	1667
6481	32481	9933
6482	32482	4857
6483	32483	277
6484	32484	3094
6485	32485	7495
6486	32486	4759
6487	32487	1389
6488	32488	7147
6489	32489	6122
6490	32490	3988
6491	32491	2816
6492	32492	7278
6493	32493	4575
6494	32494	1089
6495	32495	3081
6496	32496	1476
6497	32497	4922
6498	32498	5505
6499	32499	1065
6500	32500	3791
6501	32501	4670
6502	32502	1264
6503	32503	7816
6504	32504	3715
6505	32505	4114
6506	32506	8693
6507	32507	4809
6508	32508	5193
6509	32509	2920
6510	32510	1215
6511	32511	180
6512	32512	3299
6513	32513	8819
6514	32514	9933
6515	32515	40
6516	32516	2968
6517	32517	8892
6518	32518	763
6519	32519	6923
6520	32520	6325
6521	32521	8575
6522	32522	4044
6523	32523	4351
6524	32524	6896
6525	32525	212
6526	32526	3096
6527	32527	3044
6528	32528	2541
6529	32529	1307
6530	32530	6126
6531	32531	9129
6532	32532	5373
6533	32533	9095
6534	32534	6908
6535	32535	4838
6536	32536	7980
6537	32537	150
6538	32538	3087
6539	32539	4632
6540	32540	8885
6541	32541	2312
6542	32542	1917
6543	32543	3689
6544	32544	2104
6545	32545	7680
6546	32546	7078
6547	32547	6436
6548	32548	9971
6549	32549	732
6550	32550	9169
6551	32551	9501
6552	32552	8555
6553	32553	672
6554	32554	2547
6555	32555	2548
6556	32556	3476
6557	32557	9681
6558	32558	3007
6559	32559	580
6560	32560	696
6561	32561	6870
6562	32562	4995
6563	32563	3967
6564	32564	897
6565	32565	4901
6566	32566	1820
6567	32567	9324
6568	32568	3698
6569	32569	3536
6570	32570	7689
6571	32571	4319
6572	32572	3448
6573	32573	7997
6574	32574	415
6575	32575	7199
6576	32576	1255
6577	32577	4621
6578	32578	9796
6579	32579	4457
6580	32580	8832
6581	32581	3748
6582	32582	9245
6583	32583	229
6584	32584	6796
6585	32585	7194
6586	32586	4294
6587	32587	3663
6588	32588	8425
6589	32589	9452
6590	32590	5150
6591	32591	1411
6592	32592	9742
6593	32593	3234
6594	32594	7938
6595	32595	7716
6596	32596	1809
6597	32597	9820
6598	32598	4492
6599	32599	9436
6600	32600	7223
6601	32601	8686
6602	32602	1077
6603	32603	3878
6604	32604	3457
6605	32605	9651
6606	32606	8613
6607	32607	7698
6608	32608	3720
6609	32609	3397
6610	32610	7485
6611	32611	5387
6612	32612	7769
6613	32613	4541
6614	32614	4082
6615	32615	93
6616	32616	6132
6617	32617	3870
6618	32618	8521
6619	32619	5080
6620	32620	1930
6621	32621	9788
6622	32622	4403
6623	32623	2934
6624	32624	46
6625	32625	3169
6626	32626	3924
6627	32627	1017
6628	32628	3329
6629	32629	6878
6630	32630	4253
6631	32631	64
6632	32632	6540
6633	32633	7069
6634	32634	1080
6635	32635	1337
6636	32636	9049
6637	32637	5014
6638	32638	9661
6639	32639	1716
6640	32640	8922
6641	32641	5751
6642	32642	2383
6643	32643	2301
6644	32644	3983
6645	32645	9190
6646	32646	4687
6647	32647	5002
6648	32648	8522
6649	32649	6595
6650	32650	132
6651	32651	4165
6652	32652	3546
6653	32653	2330
6654	32654	3535
6655	32655	3031
6656	32656	4024
6657	32657	8978
6658	32658	2035
6659	32659	264
6660	32660	3917
6661	32661	9772
6662	32662	6077
6663	32663	5910
6664	32664	1218
6665	32665	9707
6666	32666	5321
6667	32667	9399
6668	32668	8026
6669	32669	8150
6670	32670	8822
6671	32671	5280
6672	32672	5666
6673	32673	6975
6674	32674	8525
6675	32675	331
6676	32676	3257
6677	32677	6648
6678	32678	8789
6679	32679	9701
6680	32680	1985
6681	32681	4935
6682	32682	2229
6683	32683	6442
6684	32684	7475
6685	32685	5193
6686	32686	7402
6687	32687	8136
6688	32688	4439
6689	32689	9483
6690	32690	3491
6691	32691	8393
6692	32692	8862
6693	32693	5029
6694	32694	2860
6695	32695	359
6696	32696	3478
6697	32697	3624
6698	32698	9326
6699	32699	855
6700	32700	696
6701	32701	3248
6702	32702	5100
6703	32703	2155
6704	32704	8597
6705	32705	5464
6706	32706	6712
6707	32707	942
6708	32708	7863
6709	32709	7107
6710	32710	7098
6711	32711	3746
6712	32712	3409
6713	32713	3519
6714	32714	5727
6715	32715	5359
6716	32716	2302
6717	32717	6185
6718	32718	5279
6719	32719	2774
6720	32720	4053
6721	32721	5819
6722	32722	5137
6723	32723	8849
6724	32724	6786
6725	32725	6868
6726	32726	6595
6727	32727	5404
6728	32728	6213
6729	32729	2931
6730	32730	4864
6731	32731	5637
6732	32732	6108
6733	32733	6670
6734	32734	4304
6735	32735	503
6736	32736	5483
6737	32737	7324
6738	32738	3522
6739	32739	4029
6740	32740	7518
6741	32741	8883
6742	32742	694
6743	32743	8996
6744	32744	1387
6745	32745	3971
6746	32746	2334
6747	32747	6400
6748	32748	4816
6749	32749	8223
6750	32750	3918
6751	32751	6366
6752	32752	2984
6753	32753	1190
6754	32754	7815
6755	32755	4907
6756	32756	6054
6757	32757	9759
6758	32758	4727
6759	32759	4565
6760	32760	927
6761	32761	2915
6762	32762	9495
6763	32763	4599
6764	32764	6570
6765	32765	4847
6766	32766	7445
6767	32767	9628
6768	32768	908
6769	32769	8556
6770	32770	2363
6771	32771	5264
6772	32772	2183
6773	32773	2036
6774	32774	346
6775	32775	9375
6776	32776	1944
6777	32777	701
6778	32778	1852
6779	32779	9283
6780	32780	3401
6781	32781	1876
6782	32782	7054
6783	32783	5947
6784	32784	5812
6785	32785	4289
6786	32786	272
6787	32787	9212
6788	32788	175
6789	32789	7093
6790	32790	5086
6791	32791	4622
6792	32792	4004
6793	32793	7059
6794	32794	8206
6795	32795	5825
6796	32796	9465
6797	32797	1623
6798	32798	8225
6799	32799	4083
6800	32800	6696
6801	32801	4173
6802	32802	133
6803	32803	7412
6804	32804	5873
6805	32805	8484
6806	32806	4175
6807	32807	7552
6808	32808	3130
6809	32809	7312
6810	32810	1159
6811	32811	1984
6812	32812	9316
6813	32813	3323
6814	32814	3492
6815	32815	4828
6816	32816	1154
6817	32817	741
6818	32818	908
6819	32819	109
6820	32820	3685
6821	32821	7737
6822	32822	9708
6823	32823	144
6824	32824	418
6825	32825	9678
6826	32826	8123
6827	32827	2519
6828	32828	5786
6829	32829	8236
6830	32830	8902
6831	32831	9029
6832	32832	5285
6833	32833	8500
6834	32834	4001
6835	32835	696
6836	32836	4913
6837	32837	3542
6838	32838	7445
6839	32839	1871
6840	32840	7272
6841	32841	1594
6842	32842	2135
6843	32843	7397
6844	32844	4061
6845	32845	7795
6846	32846	7772
6847	32847	655
6848	32848	2201
6849	32849	3782
6850	32850	7931
6851	32851	9254
6852	32852	6513
6853	32853	8734
6854	32854	5126
6855	32855	989
6856	32856	9891
6857	32857	1251
6858	32858	2559
6859	32859	1277
6860	32860	4971
6861	32861	9326
6862	32862	9898
6863	32863	9355
6864	32864	6502
6865	32865	4940
6866	32866	488
6867	32867	2547
6868	32868	6259
6869	32869	59
6870	32870	8426
6871	32871	9077
6872	32872	7893
6873	32873	463
6874	32874	5376
6875	32875	2211
6876	32876	5382
6877	32877	886
6878	32878	7989
6879	32879	3670
6880	32880	8250
6881	32881	3017
6882	32882	5185
6883	32883	7141
6884	32884	5366
6885	32885	2167
6886	32886	5138
6887	32887	7522
6888	32888	3509
6889	32889	6996
6890	32890	359
6891	32891	505
6892	32892	6334
6893	32893	3705
6894	32894	9641
6895	32895	3161
6896	32896	7179
6897	32897	4376
6898	32898	7845
6899	32899	5931
6900	32900	8993
6901	32901	3281
6902	32902	3055
6903	32903	4391
6904	32904	8744
6905	32905	9277
6906	32906	2092
6907	32907	3137
6908	32908	843
6909	32909	3701
6910	32910	6501
6911	32911	9093
6912	32912	1122
6913	32913	5943
6914	32914	9836
6915	32915	2170
6916	32916	1488
6917	32917	6805
6918	32918	3669
6919	32919	2299
6920	32920	90
6921	32921	6839
6922	32922	2708
6923	32923	4919
6924	32924	7789
6925	32925	8072
6926	32926	300
6927	32927	7801
6928	32928	6505
6929	32929	5808
6930	32930	3079
6931	32931	9258
6932	32932	137
6933	32933	8959
6934	32934	7957
6935	32935	2430
6936	32936	4114
6937	32937	1034
6938	32938	7137
6939	32939	2782
6940	32940	5222
6941	32941	3344
6942	32942	293
6943	32943	7707
6944	32944	6728
6945	32945	7135
6946	32946	9384
6947	32947	6172
6948	32948	8866
6949	32949	2924
6950	32950	1911
6951	32951	7472
6952	32952	320
6953	32953	3879
6954	32954	8112
6955	32955	3193
6956	32956	9045
6957	32957	7534
6958	32958	6133
6959	32959	9905
6960	32960	5117
6961	32961	5481
6962	32962	3756
6963	32963	2675
6964	32964	3192
6965	32965	5964
6966	32966	795
6967	32967	520
6968	32968	716
6969	32969	6138
6970	32970	7320
6971	32971	1435
6972	32972	6265
6973	32973	5089
6974	32974	7144
6975	32975	732
6976	32976	6670
6977	32977	1362
6978	32978	986
6979	32979	2526
6980	32980	4983
6981	32981	7969
6982	32982	863
6983	32983	4017
6984	32984	2311
6985	32985	6926
6986	32986	8148
6987	32987	491
6988	32988	1847
6989	32989	5358
6990	32990	1172
6991	32991	9406
6992	32992	7452
6993	32993	3626
6994	32994	7008
6995	32995	5162
6996	32996	3717
6997	32997	9685
6998	32998	5625
6999	32999	2037
7000	33000	8055
7001	33001	1238
7002	33002	3217
7003	33003	7264
7004	33004	1999
7005	33005	9977
7006	33006	6465
7007	33007	3657
7008	33008	5122
7009	33009	8766
7010	33010	5935
7011	33011	9369
7012	33012	3553
7013	33013	7093
7014	33014	7159
7015	33015	4017
7016	33016	3060
7017	33017	9224
7018	33018	9041
7019	33019	117
7020	33020	3092
7021	33021	1788
7022	33022	4445
7023	33023	4208
7024	33024	206
7025	33025	9188
7026	33026	4511
7027	33027	4294
7028	33028	7273
7029	33029	9678
7030	33030	8022
7031	33031	4989
7032	33032	8615
7033	33033	2536
7034	33034	6022
7035	33035	8010
7036	33036	4587
7037	33037	1402
7038	33038	4715
7039	33039	376
7040	33040	3587
7041	33041	5141
7042	33042	3042
7043	33043	9478
7044	33044	296
7045	33045	6169
7046	33046	3930
7047	33047	8033
7048	33048	5004
7049	33049	4546
7050	33050	693
7051	33051	3514
7052	33052	742
7053	33053	5038
7054	33054	8414
7055	33055	805
7056	33056	1505
7057	33057	1557
7058	33058	9105
7059	33059	9334
7060	33060	9090
7061	33061	9801
7062	33062	8822
7063	33063	1230
7064	33064	7760
7065	33065	2956
7066	33066	2874
7067	33067	5045
7068	33068	1264
7069	33069	6391
7070	33070	4968
7071	33071	1317
7072	33072	1862
7073	33073	9206
7074	33074	3804
7075	33075	8256
7076	33076	7150
7077	33077	3436
7078	33078	8231
7079	33079	5279
7080	33080	6715
7081	33081	1007
7082	33082	4693
7083	33083	5842
7084	33084	8441
7085	33085	6597
7086	33086	4056
7087	33087	4782
7088	33088	5806
7089	33089	110
7090	33090	4746
7091	33091	4237
7092	33092	7507
7093	33093	5498
7094	33094	8972
7095	33095	7069
7096	33096	3198
7097	33097	7995
7098	33098	4602
7099	33099	6019
7100	33100	2487
7101	33101	505
7102	33102	304
7103	33103	929
7104	33104	4586
7105	33105	8573
7106	33106	6777
7107	33107	2492
7108	33108	4677
7109	33109	9634
7110	33110	9693
7111	33111	8741
7112	33112	8687
7113	33113	8822
7114	33114	1360
7115	33115	3905
7116	33116	5372
7117	33117	6432
7118	33118	6810
7119	33119	9870
7120	33120	121
7121	33121	578
7122	33122	1809
7123	33123	2737
7124	33124	409
7125	33125	2788
7126	33126	3584
7127	33127	1583
7128	33128	5452
7129	33129	7760
7130	33130	2430
7131	33131	1444
7132	33132	3684
7133	33133	1665
7134	33134	4286
7135	33135	2742
7136	33136	2511
7137	33137	2700
7138	33138	4348
7139	33139	3458
7140	33140	4936
7141	33141	2518
7142	33142	8126
7143	33143	1551
7144	33144	5218
7145	33145	5005
7146	33146	4928
7147	33147	5103
7148	33148	6617
7149	33149	330
7150	33150	1622
7151	33151	2242
7152	33152	251
7153	33153	6538
7154	33154	294
7155	33155	9057
7156	33156	3880
7157	33157	5930
7158	33158	4898
7159	33159	9738
7160	33160	7237
7161	33161	3997
7162	33162	4348
7163	33163	2273
7164	33164	8939
7165	33165	9560
7166	33166	4823
7167	33167	1018
7168	33168	3752
7169	33169	365
7170	33170	4651
7171	33171	9440
7172	33172	6975
7173	33173	7944
7174	33174	5372
7175	33175	6798
7176	33176	429
7177	33177	2078
7178	33178	4876
7179	33179	9601
7180	33180	2236
7181	33181	6944
7182	33182	7625
7183	33183	3025
7184	33184	5421
7185	33185	3317
7186	33186	8752
7187	33187	9001
7188	33188	1943
7189	33189	9078
7190	33190	9419
7191	33191	1562
7192	33192	6849
7193	33193	7755
7194	33194	3673
7195	33195	756
7196	33196	7690
7197	33197	2000
7198	33198	9124
7199	33199	8009
7200	33200	8714
7201	33201	3509
7202	33202	5100
7203	33203	1588
7204	33204	7561
7205	33205	3878
7206	33206	5015
7207	33207	2544
7208	33208	4301
7209	33209	3153
7210	33210	7280
7211	33211	3269
7212	33212	8514
7213	33213	5053
7214	33214	34
7215	33215	6473
7216	33216	4518
7217	33217	9456
7218	33218	7445
7219	33219	7383
7220	33220	952
7221	33221	2623
7222	33222	6909
7223	33223	1313
7224	33224	1456
7225	33225	42
7226	33226	6879
7227	33227	8782
7228	33228	9917
7229	33229	458
7230	33230	532
7231	33231	765
7232	33232	6172
7233	33233	746
7234	33234	4492
7235	33235	8687
7236	33236	1802
7237	33237	3293
7238	33238	6723
7239	33239	4297
7240	33240	73
7241	33241	8863
7242	33242	5892
7243	33243	3438
7244	33244	8015
7245	33245	3460
7246	33246	1621
7247	33247	2481
7248	33248	332
7249	33249	3724
7250	33250	62
7251	33251	5844
7252	33252	2572
7253	33253	8998
7254	33254	3267
7255	33255	3680
7256	33256	3822
7257	33257	4420
7258	33258	2735
7259	33259	8703
7260	33260	8723
7261	33261	7879
7262	33262	2003
7263	33263	5333
7264	33264	9274
7265	33265	6412
7266	33266	2192
7267	33267	877
7268	33268	7787
7269	33269	3603
7270	33270	2576
7271	33271	7948
7272	33272	3847
7273	33273	2599
7274	33274	5036
7275	33275	8917
7276	33276	3034
7277	33277	6097
7278	33278	6134
7279	33279	54
7280	33280	7969
7281	33281	7797
7282	33282	5393
7283	33283	876
7284	33284	7709
7285	33285	1266
7286	33286	7102
7287	33287	4583
7288	33288	4416
7289	33289	7378
7290	33290	5519
7291	33291	6877
7292	33292	3289
7293	33293	4075
7294	33294	3214
7295	33295	2568
7296	33296	498
7297	33297	8210
7298	33298	7398
7299	33299	6867
7300	33300	9643
7301	33301	5450
7302	33302	3293
7303	33303	8147
7304	33304	9769
7305	33305	2881
7306	33306	5634
7307	33307	4627
7308	33308	4070
7309	33309	970
7310	33310	175
7311	33311	4806
7312	33312	3581
7313	33313	4164
7314	33314	6864
7315	33315	9313
7316	33316	8244
7317	33317	1520
7318	33318	2357
7319	33319	5284
7320	33320	2713
7321	33321	4866
7322	33322	9895
7323	33323	3593
7324	33324	1439
7325	33325	7529
7326	33326	6738
7327	33327	9207
7328	33328	8208
7329	33329	817
7330	33330	6244
7331	33331	5238
7332	33332	4800
7333	33333	8390
7334	33334	4676
7335	33335	2918
7336	33336	7512
7337	33337	6166
7338	33338	5694
7339	33339	2737
7340	33340	46
7341	33341	1466
7342	33342	8106
7343	33343	5348
7344	33344	3118
7345	33345	1676
7346	33346	9925
7347	33347	2237
7348	33348	1474
7349	33349	6369
7350	33350	6647
7351	33351	2655
7352	33352	3151
7353	33353	7803
7354	33354	990
7355	33355	8176
7356	33356	5726
7357	33357	7226
7358	33358	8220
7359	33359	9673
7360	33360	5328
7361	33361	4306
7362	33362	6151
7363	33363	7895
7364	33364	8628
7365	33365	9898
7366	33366	9089
7367	33367	7896
7368	33368	1983
7369	33369	552
7370	33370	82
7371	33371	7299
7372	33372	803
7373	33373	5870
7374	33374	9778
7375	33375	2848
7376	33376	7729
7377	33377	4137
7378	33378	9062
7379	33379	4622
7380	33380	5444
7381	33381	2156
7382	33382	6836
7383	33383	4055
7384	33384	2600
7385	33385	9209
7386	33386	5866
7387	33387	7646
7388	33388	137
7389	33389	6485
7390	33390	3577
7391	33391	6681
7392	33392	3587
7393	33393	770
7394	33394	5832
7395	33395	570
7396	33396	7800
7397	33397	2522
7398	33398	5195
7399	33399	3226
7400	33400	6866
7401	33401	1365
7402	33402	408
7403	33403	1828
7404	33404	5584
7405	33405	135
7406	33406	5148
7407	33407	8958
7408	33408	3677
7409	33409	4608
7410	33410	8264
7411	33411	9653
7412	33412	1116
7413	33413	3139
7414	33414	5628
7415	33415	9588
7416	33416	6640
7417	33417	3525
7418	33418	3845
7419	33419	5927
7420	33420	6809
7421	33421	4196
7422	33422	2645
7423	33423	84
7424	33424	5542
7425	33425	2332
7426	33426	1207
7427	33427	390
7428	33428	3376
7429	33429	1457
7430	33430	175
7431	33431	8961
7432	33432	3471
7433	33433	8226
7434	33434	2492
7435	33435	2006
7436	33436	7569
7437	33437	3401
7438	33438	2752
7439	33439	6570
7440	33440	6953
7441	33441	8895
7442	33442	4422
7443	33443	7910
7444	33444	6936
7445	33445	4792
7446	33446	8362
7447	33447	3472
7448	33448	5032
7449	33449	7257
7450	33450	9183
7451	33451	4675
7452	33452	4577
7453	33453	4039
7454	33454	7308
7455	33455	5592
7456	33456	8685
7457	33457	5575
7458	33458	3013
7459	33459	5861
7460	33460	3100
7461	33461	4772
7462	33462	26
7463	33463	9406
7464	33464	4018
7465	33465	2936
7466	33466	2066
7467	33467	336
7468	33468	2517
7469	33469	1534
7470	33470	8517
7471	33471	3055
7472	33472	9671
7473	33473	9111
7474	33474	1045
7475	33475	2012
7476	33476	8742
7477	33477	6940
7478	33478	6503
7479	33479	9404
7480	33480	7313
7481	33481	1817
7482	33482	8364
7483	33483	5463
7484	33484	1841
7485	33485	8359
7486	33486	4138
7487	33487	7902
7488	33488	5582
7489	33489	6147
7490	33490	6318
7491	33491	4565
7492	33492	1206
7493	33493	7477
7494	33494	4824
7495	33495	1509
7496	33496	2619
7497	33497	8824
7498	33498	9202
7499	33499	8593
7500	33500	3106
7501	33501	9517
7502	33502	1694
7503	33503	5699
7504	33504	2590
7505	33505	9058
7506	33506	7430
7507	33507	5661
7508	33508	4073
7509	33509	6667
7510	33510	5146
7511	33511	449
7512	33512	4460
7513	33513	3913
7514	33514	1548
7515	33515	2640
7516	33516	8290
7517	33517	8737
7518	33518	5394
7519	33519	1876
7520	33520	8127
7521	33521	829
7522	33522	359
7523	33523	8847
7524	33524	6318
7525	33525	9317
7526	33526	7846
7527	33527	2997
7528	33528	8923
7529	33529	7933
7530	33530	5808
7531	33531	8689
7532	33532	2860
7533	33533	5037
7534	33534	6377
7535	33535	7112
7536	33536	8312
7537	33537	2723
7538	33538	3389
7539	33539	9054
7540	33540	3270
7541	33541	710
7542	33542	5040
7543	33543	8290
7544	33544	9863
7545	33545	4396
7546	33546	5723
7547	33547	5019
7548	33548	7161
7549	33549	1396
7550	33550	7707
7551	33551	8874
7552	33552	2428
7553	33553	6259
7554	33554	7179
7555	33555	7040
7556	33556	4622
7557	33557	8740
7558	33558	5842
7559	33559	9379
7560	33560	5961
7561	33561	1253
7562	33562	5275
7563	33563	8202
7564	33564	8428
7565	33565	1895
7566	33566	3179
7567	33567	4431
7568	33568	5150
7569	33569	6128
7570	33570	2999
7571	33571	8844
7572	33572	3025
7573	33573	9150
7574	33574	7058
7575	33575	9631
7576	33576	593
7577	33577	9432
7578	33578	1033
7579	33579	8175
7580	33580	562
7581	33581	66
7582	33582	4097
7583	33583	8660
7584	33584	7280
7585	33585	5385
7586	33586	3937
7587	33587	4287
7588	33588	9929
7589	33589	945
7590	33590	4152
7591	33591	6753
7592	33592	2008
7593	33593	390
7594	33594	2602
7595	33595	5547
7596	33596	6834
7597	33597	7551
7598	33598	4983
7599	33599	5766
7600	33600	7018
7601	33601	7262
7602	33602	5862
7603	33603	1726
7604	33604	9623
7605	33605	2
7606	33606	1708
7607	33607	6190
7608	33608	8291
7609	33609	3066
7610	33610	8970
7611	33611	6344
7612	33612	1357
7613	33613	7957
7614	33614	5140
7615	33615	2203
7616	33616	3946
7617	33617	5047
7618	33618	3107
7619	33619	7991
7620	33620	2741
7621	33621	1666
7622	33622	6466
7623	33623	785
7624	33624	9554
7625	33625	9538
7626	33626	5544
7627	33627	1894
7628	33628	6298
7629	33629	8271
7630	33630	8254
7631	33631	6470
7632	33632	5147
7633	33633	1929
7634	33634	8936
7635	33635	4329
7636	33636	2967
7637	33637	7653
7638	33638	1165
7639	33639	7783
7640	33640	6990
7641	33641	903
7642	33642	7743
7643	33643	5942
7644	33644	7205
7645	33645	9582
7646	33646	4354
7647	33647	3923
7648	33648	4652
7649	33649	1102
7650	33650	8778
7651	33651	1569
7652	33652	8369
7653	33653	5265
7654	33654	9722
7655	33655	757
7656	33656	734
7657	33657	2750
7658	33658	819
7659	33659	5171
7660	33660	2789
7661	33661	5956
7662	33662	2782
7663	33663	7798
7664	33664	853
7665	33665	5861
7666	33666	3580
7667	33667	9219
7668	33668	1964
7669	33669	3368
7670	33670	9744
7671	33671	1091
7672	33672	9139
7673	33673	3142
7674	33674	9692
7675	33675	2905
7676	33676	7112
7677	33677	1136
7678	33678	5049
7679	33679	5688
7680	33680	7989
7681	33681	8175
7682	33682	7862
7683	33683	2230
7684	33684	1337
7685	33685	8775
7686	33686	4642
7687	33687	8341
7688	33688	3140
7689	33689	1507
7690	33690	9687
7691	33691	3186
7692	33692	3130
7693	33693	8406
7694	33694	7928
7695	33695	7658
7696	33696	872
7697	33697	1721
7698	33698	124
7699	33699	3577
7700	33700	5042
7701	33701	1327
7702	33702	3255
7703	33703	2848
7704	33704	2105
7705	33705	2543
7706	33706	5597
7707	33707	5493
7708	33708	3009
7709	33709	571
7710	33710	7274
7711	33711	9293
7712	33712	2537
7713	33713	1325
7714	33714	9736
7715	33715	6536
7716	33716	7613
7717	33717	2490
7718	33718	6737
7719	33719	471
7720	33720	2018
7721	33721	3565
7722	33722	773
7723	33723	5503
7724	33724	7165
7725	33725	5150
7726	33726	8988
7727	33727	7072
7728	33728	4271
7729	33729	768
7730	33730	5052
7731	33731	5286
7732	33732	2669
7733	33733	5581
7734	33734	1263
7735	33735	5989
7736	33736	2303
7737	33737	4979
7738	33738	1976
7739	33739	983
7740	33740	304
7741	33741	997
7742	33742	5094
7743	33743	5357
7744	33744	3047
7745	33745	6219
7746	33746	1407
7747	33747	1848
7748	33748	7252
7749	33749	4662
7750	33750	8618
7751	33751	7453
7752	33752	7472
7753	33753	2431
7754	33754	787
7755	33755	4320
7756	33756	4071
7757	33757	6361
7758	33758	1702
7759	33759	6953
7760	33760	4549
7761	33761	3337
7762	33762	5939
7763	33763	7043
7764	33764	3644
7765	33765	6919
7766	33766	2809
7767	33767	9392
7768	33768	4743
7769	33769	3071
7770	33770	6226
7771	33771	3158
7772	33772	3705
7773	33773	7250
7774	33774	7507
7775	33775	3670
7776	33776	456
7777	33777	8041
7778	33778	7876
7779	33779	3401
7780	33780	1782
7781	33781	340
7782	33782	4503
7783	33783	4539
7784	33784	8883
7785	33785	306
7786	33786	2286
7787	33787	6095
7788	33788	8970
7789	33789	6517
7790	33790	549
7791	33791	689
7792	33792	1305
7793	33793	1474
7794	33794	5745
7795	33795	3826
7796	33796	894
7797	33797	5917
7798	33798	8701
7799	33799	2688
7800	33800	3228
7801	33801	3122
7802	33802	9011
7803	33803	9746
7804	33804	2790
7805	33805	2609
7806	33806	6200
7807	33807	5697
7808	33808	2842
7809	33809	9486
7810	33810	8490
7811	33811	185
7812	33812	8608
7813	33813	9428
7814	33814	9156
7815	33815	3229
7816	33816	6609
7817	33817	650
7818	33818	8036
7819	33819	1421
7820	33820	8517
7821	33821	1170
7822	33822	6344
7823	33823	4082
7824	33824	7345
7825	33825	5019
7826	33826	149
7827	33827	8904
7828	33828	5502
7829	33829	7413
7830	33830	3665
7831	33831	5525
7832	33832	8991
7833	33833	4924
7834	33834	7081
7835	33835	2778
7836	33836	22
7837	33837	9754
7838	33838	4299
7839	33839	7657
7840	33840	3149
7841	33841	234
7842	33842	5301
7843	33843	763
7844	33844	8831
7845	33845	5340
7846	33846	7213
7847	33847	9668
7848	33848	5342
7849	33849	6212
7850	33850	3447
7851	33851	9894
7852	33852	1825
7853	33853	3548
7854	33854	517
7855	33855	6507
7856	33856	8555
7857	33857	38
7858	33858	2479
7859	33859	5532
7860	33860	5339
7861	33861	7128
7862	33862	1957
7863	33863	764
7864	33864	6171
7865	33865	9271
7866	33866	67
7867	33867	1135
7868	33868	5632
7869	33869	2863
7870	33870	778
7871	33871	5720
7872	33872	5838
7873	33873	9387
7874	33874	5245
7875	33875	3228
7876	33876	9107
7877	33877	3731
7878	33878	3208
7879	33879	2401
7880	33880	2039
7881	33881	7985
7882	33882	4016
7883	33883	6411
7884	33884	5524
7885	33885	8329
7886	33886	7356
7887	33887	6100
7888	33888	8495
7889	33889	7781
7890	33890	8910
7891	33891	7405
7892	33892	9598
7893	33893	3525
7894	33894	7890
7895	33895	3452
7896	33896	2610
7897	33897	9950
7898	33898	3808
7899	33899	790
7900	33900	205
7901	33901	7874
7902	33902	3573
7903	33903	9252
7904	33904	9786
7905	33905	5902
7906	33906	1601
7907	33907	6131
7908	33908	5608
7909	33909	8123
7910	33910	5934
7911	33911	2673
7912	33912	5232
7913	33913	382
7914	33914	5560
7915	33915	5189
7916	33916	6175
7917	33917	8410
7918	33918	6497
7919	33919	3552
7920	33920	8426
7921	33921	7974
7922	33922	76
7923	33923	2166
7924	33924	2808
7925	33925	6821
7926	33926	8628
7927	33927	6827
7928	33928	5771
7929	33929	6407
7930	33930	981
7931	33931	3359
7932	33932	5329
7933	33933	6518
7934	33934	1582
7935	33935	989
7936	33936	8853
7937	33937	220
7938	33938	4129
7939	33939	3347
7940	33940	4794
7941	33941	5337
7942	33942	2560
7943	33943	7752
7944	33944	5754
7945	33945	4869
7946	33946	8857
7947	33947	3185
7948	33948	6675
7949	33949	1453
7950	33950	7465
7951	33951	6514
7952	33952	3906
7953	33953	9101
7954	33954	3908
7955	33955	8309
7956	33956	2982
7957	33957	8385
7958	33958	1413
7959	33959	7289
7960	33960	525
7961	33961	4211
7962	33962	4544
7963	33963	2185
7964	33964	9791
7965	33965	9642
7966	33966	6219
7967	33967	3287
7968	33968	2666
7969	33969	9308
7970	33970	5755
7971	33971	6510
7972	33972	5942
7973	33973	1660
7974	33974	2153
7975	33975	6048
7976	33976	8333
7977	33977	4744
7978	33978	4501
7979	33979	162
7980	33980	5137
7981	33981	4365
7982	33982	9046
7983	33983	5117
7984	33984	2344
7985	33985	3492
7986	33986	8806
7987	33987	406
7988	33988	9980
7989	33989	5386
7990	33990	3707
7991	33991	7082
7992	33992	9377
7993	33993	7482
7994	33994	1731
7995	33995	4855
7996	33996	3584
7997	33997	6524
7998	33998	9491
7999	33999	9795
8000	34000	5773
\.


--
-- TOC entry 5007 (class 0 OID 17493)
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
-- TOC entry 5006 (class 0 OID 17485)
-- Dependencies: 228
-- Data for Name: pegawai; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.pegawai (id_pegawai, nama_pegawai, alamat_pegawai, posisi) FROM stdin;
1	Pegawai 1	Alamat Pegawai 1	Admin
2	Pegawai 2	Alamat Pegawai 2	Frontdesk
3	Pegawai 3	Alamat Pegawai 3	Admin
4	Pegawai 4	Alamat Pegawai 4	Frontdesk
5	Pegawai 5	Alamat Pegawai 5	Admin
6	Pegawai 6	Alamat Pegawai 6	Frontdesk
7	Pegawai 7	Alamat Pegawai 7	Admin
8	Pegawai 8	Alamat Pegawai 8	Frontdesk
9	Pegawai 9	Alamat Pegawai 9	Admin
10	Pegawai 10	Alamat Pegawai 10	Frontdesk
11	Pegawai 11	Alamat Pegawai 11	Admin
12	Pegawai 12	Alamat Pegawai 12	Frontdesk
13	Pegawai 13	Alamat Pegawai 13	Admin
14	Pegawai 14	Alamat Pegawai 14	Frontdesk
15	Pegawai 15	Alamat Pegawai 15	Admin
16	Pegawai 16	Alamat Pegawai 16	Frontdesk
17	Pegawai 17	Alamat Pegawai 17	Admin
18	Pegawai 18	Alamat Pegawai 18	Frontdesk
19	Pegawai 19	Alamat Pegawai 19	Admin
20	Pegawai 20	Alamat Pegawai 20	Frontdesk
21	Pegawai 21	Alamat Pegawai 21	Admin
22	Pegawai 22	Alamat Pegawai 22	Frontdesk
23	Pegawai 23	Alamat Pegawai 23	Admin
24	Pegawai 24	Alamat Pegawai 24	Frontdesk
25	Pegawai 25	Alamat Pegawai 25	Admin
26	Pegawai 26	Alamat Pegawai 26	Frontdesk
27	Pegawai 27	Alamat Pegawai 27	Admin
28	Pegawai 28	Alamat Pegawai 28	Frontdesk
29	Pegawai 29	Alamat Pegawai 29	Admin
30	Pegawai 30	Alamat Pegawai 30	Frontdesk
31	Pegawai 31	Alamat Pegawai 31	Admin
32	Pegawai 32	Alamat Pegawai 32	Frontdesk
33	Pegawai 33	Alamat Pegawai 33	Admin
34	Pegawai 34	Alamat Pegawai 34	Frontdesk
35	Pegawai 35	Alamat Pegawai 35	Admin
36	Pegawai 36	Alamat Pegawai 36	Frontdesk
37	Pegawai 37	Alamat Pegawai 37	Admin
38	Pegawai 38	Alamat Pegawai 38	Frontdesk
39	Pegawai 39	Alamat Pegawai 39	Admin
40	Pegawai 40	Alamat Pegawai 40	Frontdesk
41	Pegawai 41	Alamat Pegawai 41	Admin
42	Pegawai 42	Alamat Pegawai 42	Frontdesk
43	Pegawai 43	Alamat Pegawai 43	Admin
44	Pegawai 44	Alamat Pegawai 44	Frontdesk
45	Pegawai 45	Alamat Pegawai 45	Admin
46	Pegawai 46	Alamat Pegawai 46	Frontdesk
47	Pegawai 47	Alamat Pegawai 47	Admin
48	Pegawai 48	Alamat Pegawai 48	Frontdesk
49	Pegawai 49	Alamat Pegawai 49	Admin
50	Pegawai 50	Alamat Pegawai 50	Frontdesk
51	Pegawai 51	Alamat Pegawai 51	Admin
52	Pegawai 52	Alamat Pegawai 52	Frontdesk
53	Pegawai 53	Alamat Pegawai 53	Admin
54	Pegawai 54	Alamat Pegawai 54	Frontdesk
55	Pegawai 55	Alamat Pegawai 55	Admin
56	Pegawai 56	Alamat Pegawai 56	Frontdesk
57	Pegawai 57	Alamat Pegawai 57	Admin
58	Pegawai 58	Alamat Pegawai 58	Frontdesk
59	Pegawai 59	Alamat Pegawai 59	Admin
60	Pegawai 60	Alamat Pegawai 60	Frontdesk
61	Pegawai 61	Alamat Pegawai 61	Admin
62	Pegawai 62	Alamat Pegawai 62	Frontdesk
63	Pegawai 63	Alamat Pegawai 63	Admin
64	Pegawai 64	Alamat Pegawai 64	Frontdesk
65	Pegawai 65	Alamat Pegawai 65	Admin
66	Pegawai 66	Alamat Pegawai 66	Frontdesk
67	Pegawai 67	Alamat Pegawai 67	Admin
68	Pegawai 68	Alamat Pegawai 68	Frontdesk
69	Pegawai 69	Alamat Pegawai 69	Admin
70	Pegawai 70	Alamat Pegawai 70	Frontdesk
71	Pegawai 71	Alamat Pegawai 71	Admin
72	Pegawai 72	Alamat Pegawai 72	Frontdesk
73	Pegawai 73	Alamat Pegawai 73	Admin
74	Pegawai 74	Alamat Pegawai 74	Frontdesk
75	Pegawai 75	Alamat Pegawai 75	Admin
76	Pegawai 76	Alamat Pegawai 76	Frontdesk
77	Pegawai 77	Alamat Pegawai 77	Admin
78	Pegawai 78	Alamat Pegawai 78	Frontdesk
79	Pegawai 79	Alamat Pegawai 79	Admin
80	Pegawai 80	Alamat Pegawai 80	Frontdesk
81	Pegawai 81	Alamat Pegawai 81	Admin
82	Pegawai 82	Alamat Pegawai 82	Frontdesk
83	Pegawai 83	Alamat Pegawai 83	Admin
84	Pegawai 84	Alamat Pegawai 84	Frontdesk
85	Pegawai 85	Alamat Pegawai 85	Admin
86	Pegawai 86	Alamat Pegawai 86	Frontdesk
87	Pegawai 87	Alamat Pegawai 87	Admin
88	Pegawai 88	Alamat Pegawai 88	Frontdesk
89	Pegawai 89	Alamat Pegawai 89	Admin
90	Pegawai 90	Alamat Pegawai 90	Frontdesk
91	Pegawai 91	Alamat Pegawai 91	Admin
92	Pegawai 92	Alamat Pegawai 92	Frontdesk
93	Pegawai 93	Alamat Pegawai 93	Admin
94	Pegawai 94	Alamat Pegawai 94	Frontdesk
95	Pegawai 95	Alamat Pegawai 95	Admin
96	Pegawai 96	Alamat Pegawai 96	Frontdesk
97	Pegawai 97	Alamat Pegawai 97	Admin
98	Pegawai 98	Alamat Pegawai 98	Frontdesk
99	Pegawai 99	Alamat Pegawai 99	Admin
100	Pegawai 100	Alamat Pegawai 100	Frontdesk
101	Pegawai 101	Alamat Pegawai 101	Admin
102	Pegawai 102	Alamat Pegawai 102	Frontdesk
103	Pegawai 103	Alamat Pegawai 103	Admin
104	Pegawai 104	Alamat Pegawai 104	Frontdesk
105	Pegawai 105	Alamat Pegawai 105	Admin
106	Pegawai 106	Alamat Pegawai 106	Frontdesk
107	Pegawai 107	Alamat Pegawai 107	Admin
108	Pegawai 108	Alamat Pegawai 108	Frontdesk
109	Pegawai 109	Alamat Pegawai 109	Admin
110	Pegawai 110	Alamat Pegawai 110	Frontdesk
111	Pegawai 111	Alamat Pegawai 111	Admin
112	Pegawai 112	Alamat Pegawai 112	Frontdesk
113	Pegawai 113	Alamat Pegawai 113	Admin
114	Pegawai 114	Alamat Pegawai 114	Frontdesk
115	Pegawai 115	Alamat Pegawai 115	Admin
116	Pegawai 116	Alamat Pegawai 116	Frontdesk
117	Pegawai 117	Alamat Pegawai 117	Admin
118	Pegawai 118	Alamat Pegawai 118	Frontdesk
119	Pegawai 119	Alamat Pegawai 119	Admin
120	Pegawai 120	Alamat Pegawai 120	Frontdesk
121	Pegawai 121	Alamat Pegawai 121	Admin
122	Pegawai 122	Alamat Pegawai 122	Frontdesk
123	Pegawai 123	Alamat Pegawai 123	Admin
124	Pegawai 124	Alamat Pegawai 124	Frontdesk
125	Pegawai 125	Alamat Pegawai 125	Admin
126	Pegawai 126	Alamat Pegawai 126	Frontdesk
127	Pegawai 127	Alamat Pegawai 127	Admin
128	Pegawai 128	Alamat Pegawai 128	Frontdesk
129	Pegawai 129	Alamat Pegawai 129	Admin
130	Pegawai 130	Alamat Pegawai 130	Frontdesk
131	Pegawai 131	Alamat Pegawai 131	Admin
132	Pegawai 132	Alamat Pegawai 132	Frontdesk
133	Pegawai 133	Alamat Pegawai 133	Admin
134	Pegawai 134	Alamat Pegawai 134	Frontdesk
135	Pegawai 135	Alamat Pegawai 135	Admin
136	Pegawai 136	Alamat Pegawai 136	Frontdesk
137	Pegawai 137	Alamat Pegawai 137	Admin
138	Pegawai 138	Alamat Pegawai 138	Frontdesk
139	Pegawai 139	Alamat Pegawai 139	Admin
140	Pegawai 140	Alamat Pegawai 140	Frontdesk
141	Pegawai 141	Alamat Pegawai 141	Admin
142	Pegawai 142	Alamat Pegawai 142	Frontdesk
143	Pegawai 143	Alamat Pegawai 143	Admin
144	Pegawai 144	Alamat Pegawai 144	Frontdesk
145	Pegawai 145	Alamat Pegawai 145	Admin
146	Pegawai 146	Alamat Pegawai 146	Frontdesk
147	Pegawai 147	Alamat Pegawai 147	Admin
148	Pegawai 148	Alamat Pegawai 148	Frontdesk
149	Pegawai 149	Alamat Pegawai 149	Admin
150	Pegawai 150	Alamat Pegawai 150	Frontdesk
151	Pegawai 151	Alamat Pegawai 151	Admin
152	Pegawai 152	Alamat Pegawai 152	Frontdesk
153	Pegawai 153	Alamat Pegawai 153	Admin
154	Pegawai 154	Alamat Pegawai 154	Frontdesk
155	Pegawai 155	Alamat Pegawai 155	Admin
156	Pegawai 156	Alamat Pegawai 156	Frontdesk
157	Pegawai 157	Alamat Pegawai 157	Admin
158	Pegawai 158	Alamat Pegawai 158	Frontdesk
159	Pegawai 159	Alamat Pegawai 159	Admin
160	Pegawai 160	Alamat Pegawai 160	Frontdesk
161	Pegawai 161	Alamat Pegawai 161	Admin
162	Pegawai 162	Alamat Pegawai 162	Frontdesk
163	Pegawai 163	Alamat Pegawai 163	Admin
164	Pegawai 164	Alamat Pegawai 164	Frontdesk
165	Pegawai 165	Alamat Pegawai 165	Admin
166	Pegawai 166	Alamat Pegawai 166	Frontdesk
167	Pegawai 167	Alamat Pegawai 167	Admin
168	Pegawai 168	Alamat Pegawai 168	Frontdesk
169	Pegawai 169	Alamat Pegawai 169	Admin
170	Pegawai 170	Alamat Pegawai 170	Frontdesk
171	Pegawai 171	Alamat Pegawai 171	Admin
172	Pegawai 172	Alamat Pegawai 172	Frontdesk
173	Pegawai 173	Alamat Pegawai 173	Admin
174	Pegawai 174	Alamat Pegawai 174	Frontdesk
175	Pegawai 175	Alamat Pegawai 175	Admin
176	Pegawai 176	Alamat Pegawai 176	Frontdesk
177	Pegawai 177	Alamat Pegawai 177	Admin
178	Pegawai 178	Alamat Pegawai 178	Frontdesk
179	Pegawai 179	Alamat Pegawai 179	Admin
180	Pegawai 180	Alamat Pegawai 180	Frontdesk
181	Pegawai 181	Alamat Pegawai 181	Admin
182	Pegawai 182	Alamat Pegawai 182	Frontdesk
183	Pegawai 183	Alamat Pegawai 183	Admin
184	Pegawai 184	Alamat Pegawai 184	Frontdesk
185	Pegawai 185	Alamat Pegawai 185	Admin
186	Pegawai 186	Alamat Pegawai 186	Frontdesk
187	Pegawai 187	Alamat Pegawai 187	Admin
188	Pegawai 188	Alamat Pegawai 188	Frontdesk
189	Pegawai 189	Alamat Pegawai 189	Admin
190	Pegawai 190	Alamat Pegawai 190	Frontdesk
191	Pegawai 191	Alamat Pegawai 191	Admin
192	Pegawai 192	Alamat Pegawai 192	Frontdesk
193	Pegawai 193	Alamat Pegawai 193	Admin
194	Pegawai 194	Alamat Pegawai 194	Frontdesk
195	Pegawai 195	Alamat Pegawai 195	Admin
196	Pegawai 196	Alamat Pegawai 196	Frontdesk
197	Pegawai 197	Alamat Pegawai 197	Admin
198	Pegawai 198	Alamat Pegawai 198	Frontdesk
199	Pegawai 199	Alamat Pegawai 199	Admin
200	Pegawai 200	Alamat Pegawai 200	Frontdesk
201	Pegawai 201	Alamat Pegawai 201	Admin
202	Pegawai 202	Alamat Pegawai 202	Frontdesk
203	Pegawai 203	Alamat Pegawai 203	Admin
204	Pegawai 204	Alamat Pegawai 204	Frontdesk
205	Pegawai 205	Alamat Pegawai 205	Admin
206	Pegawai 206	Alamat Pegawai 206	Frontdesk
207	Pegawai 207	Alamat Pegawai 207	Admin
208	Pegawai 208	Alamat Pegawai 208	Frontdesk
209	Pegawai 209	Alamat Pegawai 209	Admin
210	Pegawai 210	Alamat Pegawai 210	Frontdesk
211	Pegawai 211	Alamat Pegawai 211	Admin
212	Pegawai 212	Alamat Pegawai 212	Frontdesk
213	Pegawai 213	Alamat Pegawai 213	Admin
214	Pegawai 214	Alamat Pegawai 214	Frontdesk
215	Pegawai 215	Alamat Pegawai 215	Admin
216	Pegawai 216	Alamat Pegawai 216	Frontdesk
217	Pegawai 217	Alamat Pegawai 217	Admin
218	Pegawai 218	Alamat Pegawai 218	Frontdesk
219	Pegawai 219	Alamat Pegawai 219	Admin
220	Pegawai 220	Alamat Pegawai 220	Frontdesk
221	Pegawai 221	Alamat Pegawai 221	Admin
222	Pegawai 222	Alamat Pegawai 222	Frontdesk
223	Pegawai 223	Alamat Pegawai 223	Admin
224	Pegawai 224	Alamat Pegawai 224	Frontdesk
225	Pegawai 225	Alamat Pegawai 225	Admin
226	Pegawai 226	Alamat Pegawai 226	Frontdesk
227	Pegawai 227	Alamat Pegawai 227	Admin
228	Pegawai 228	Alamat Pegawai 228	Frontdesk
229	Pegawai 229	Alamat Pegawai 229	Admin
230	Pegawai 230	Alamat Pegawai 230	Frontdesk
231	Pegawai 231	Alamat Pegawai 231	Admin
232	Pegawai 232	Alamat Pegawai 232	Frontdesk
233	Pegawai 233	Alamat Pegawai 233	Admin
234	Pegawai 234	Alamat Pegawai 234	Frontdesk
235	Pegawai 235	Alamat Pegawai 235	Admin
236	Pegawai 236	Alamat Pegawai 236	Frontdesk
237	Pegawai 237	Alamat Pegawai 237	Admin
238	Pegawai 238	Alamat Pegawai 238	Frontdesk
239	Pegawai 239	Alamat Pegawai 239	Admin
240	Pegawai 240	Alamat Pegawai 240	Frontdesk
241	Pegawai 241	Alamat Pegawai 241	Admin
242	Pegawai 242	Alamat Pegawai 242	Frontdesk
243	Pegawai 243	Alamat Pegawai 243	Admin
244	Pegawai 244	Alamat Pegawai 244	Frontdesk
245	Pegawai 245	Alamat Pegawai 245	Admin
246	Pegawai 246	Alamat Pegawai 246	Frontdesk
247	Pegawai 247	Alamat Pegawai 247	Admin
248	Pegawai 248	Alamat Pegawai 248	Frontdesk
249	Pegawai 249	Alamat Pegawai 249	Admin
250	Pegawai 250	Alamat Pegawai 250	Frontdesk
251	Pegawai 251	Alamat Pegawai 251	Admin
252	Pegawai 252	Alamat Pegawai 252	Frontdesk
253	Pegawai 253	Alamat Pegawai 253	Admin
254	Pegawai 254	Alamat Pegawai 254	Frontdesk
255	Pegawai 255	Alamat Pegawai 255	Admin
256	Pegawai 256	Alamat Pegawai 256	Frontdesk
257	Pegawai 257	Alamat Pegawai 257	Admin
258	Pegawai 258	Alamat Pegawai 258	Frontdesk
259	Pegawai 259	Alamat Pegawai 259	Admin
260	Pegawai 260	Alamat Pegawai 260	Frontdesk
261	Pegawai 261	Alamat Pegawai 261	Admin
262	Pegawai 262	Alamat Pegawai 262	Frontdesk
263	Pegawai 263	Alamat Pegawai 263	Admin
264	Pegawai 264	Alamat Pegawai 264	Frontdesk
265	Pegawai 265	Alamat Pegawai 265	Admin
266	Pegawai 266	Alamat Pegawai 266	Frontdesk
267	Pegawai 267	Alamat Pegawai 267	Admin
268	Pegawai 268	Alamat Pegawai 268	Frontdesk
269	Pegawai 269	Alamat Pegawai 269	Admin
270	Pegawai 270	Alamat Pegawai 270	Frontdesk
271	Pegawai 271	Alamat Pegawai 271	Admin
272	Pegawai 272	Alamat Pegawai 272	Frontdesk
273	Pegawai 273	Alamat Pegawai 273	Admin
274	Pegawai 274	Alamat Pegawai 274	Frontdesk
275	Pegawai 275	Alamat Pegawai 275	Admin
276	Pegawai 276	Alamat Pegawai 276	Frontdesk
277	Pegawai 277	Alamat Pegawai 277	Admin
278	Pegawai 278	Alamat Pegawai 278	Frontdesk
279	Pegawai 279	Alamat Pegawai 279	Admin
280	Pegawai 280	Alamat Pegawai 280	Frontdesk
281	Pegawai 281	Alamat Pegawai 281	Admin
282	Pegawai 282	Alamat Pegawai 282	Frontdesk
283	Pegawai 283	Alamat Pegawai 283	Admin
284	Pegawai 284	Alamat Pegawai 284	Frontdesk
285	Pegawai 285	Alamat Pegawai 285	Admin
286	Pegawai 286	Alamat Pegawai 286	Frontdesk
287	Pegawai 287	Alamat Pegawai 287	Admin
288	Pegawai 288	Alamat Pegawai 288	Frontdesk
289	Pegawai 289	Alamat Pegawai 289	Admin
290	Pegawai 290	Alamat Pegawai 290	Frontdesk
291	Pegawai 291	Alamat Pegawai 291	Admin
292	Pegawai 292	Alamat Pegawai 292	Frontdesk
293	Pegawai 293	Alamat Pegawai 293	Admin
294	Pegawai 294	Alamat Pegawai 294	Frontdesk
295	Pegawai 295	Alamat Pegawai 295	Admin
296	Pegawai 296	Alamat Pegawai 296	Frontdesk
297	Pegawai 297	Alamat Pegawai 297	Admin
298	Pegawai 298	Alamat Pegawai 298	Frontdesk
299	Pegawai 299	Alamat Pegawai 299	Admin
300	Pegawai 300	Alamat Pegawai 300	Frontdesk
301	Pegawai 301	Alamat Pegawai 301	Admin
302	Pegawai 302	Alamat Pegawai 302	Frontdesk
303	Pegawai 303	Alamat Pegawai 303	Admin
304	Pegawai 304	Alamat Pegawai 304	Frontdesk
305	Pegawai 305	Alamat Pegawai 305	Admin
306	Pegawai 306	Alamat Pegawai 306	Frontdesk
307	Pegawai 307	Alamat Pegawai 307	Admin
308	Pegawai 308	Alamat Pegawai 308	Frontdesk
309	Pegawai 309	Alamat Pegawai 309	Admin
310	Pegawai 310	Alamat Pegawai 310	Frontdesk
311	Pegawai 311	Alamat Pegawai 311	Admin
312	Pegawai 312	Alamat Pegawai 312	Frontdesk
313	Pegawai 313	Alamat Pegawai 313	Admin
314	Pegawai 314	Alamat Pegawai 314	Frontdesk
315	Pegawai 315	Alamat Pegawai 315	Admin
316	Pegawai 316	Alamat Pegawai 316	Frontdesk
317	Pegawai 317	Alamat Pegawai 317	Admin
318	Pegawai 318	Alamat Pegawai 318	Frontdesk
319	Pegawai 319	Alamat Pegawai 319	Admin
320	Pegawai 320	Alamat Pegawai 320	Frontdesk
321	Pegawai 321	Alamat Pegawai 321	Admin
322	Pegawai 322	Alamat Pegawai 322	Frontdesk
323	Pegawai 323	Alamat Pegawai 323	Admin
324	Pegawai 324	Alamat Pegawai 324	Frontdesk
325	Pegawai 325	Alamat Pegawai 325	Admin
326	Pegawai 326	Alamat Pegawai 326	Frontdesk
327	Pegawai 327	Alamat Pegawai 327	Admin
328	Pegawai 328	Alamat Pegawai 328	Frontdesk
329	Pegawai 329	Alamat Pegawai 329	Admin
330	Pegawai 330	Alamat Pegawai 330	Frontdesk
331	Pegawai 331	Alamat Pegawai 331	Admin
332	Pegawai 332	Alamat Pegawai 332	Frontdesk
333	Pegawai 333	Alamat Pegawai 333	Admin
334	Pegawai 334	Alamat Pegawai 334	Frontdesk
335	Pegawai 335	Alamat Pegawai 335	Admin
336	Pegawai 336	Alamat Pegawai 336	Frontdesk
337	Pegawai 337	Alamat Pegawai 337	Admin
338	Pegawai 338	Alamat Pegawai 338	Frontdesk
339	Pegawai 339	Alamat Pegawai 339	Admin
340	Pegawai 340	Alamat Pegawai 340	Frontdesk
341	Pegawai 341	Alamat Pegawai 341	Admin
342	Pegawai 342	Alamat Pegawai 342	Frontdesk
343	Pegawai 343	Alamat Pegawai 343	Admin
344	Pegawai 344	Alamat Pegawai 344	Frontdesk
345	Pegawai 345	Alamat Pegawai 345	Admin
346	Pegawai 346	Alamat Pegawai 346	Frontdesk
347	Pegawai 347	Alamat Pegawai 347	Admin
348	Pegawai 348	Alamat Pegawai 348	Frontdesk
349	Pegawai 349	Alamat Pegawai 349	Admin
350	Pegawai 350	Alamat Pegawai 350	Frontdesk
351	Pegawai 351	Alamat Pegawai 351	Admin
352	Pegawai 352	Alamat Pegawai 352	Frontdesk
353	Pegawai 353	Alamat Pegawai 353	Admin
354	Pegawai 354	Alamat Pegawai 354	Frontdesk
355	Pegawai 355	Alamat Pegawai 355	Admin
356	Pegawai 356	Alamat Pegawai 356	Frontdesk
357	Pegawai 357	Alamat Pegawai 357	Admin
358	Pegawai 358	Alamat Pegawai 358	Frontdesk
359	Pegawai 359	Alamat Pegawai 359	Admin
360	Pegawai 360	Alamat Pegawai 360	Frontdesk
361	Pegawai 361	Alamat Pegawai 361	Admin
362	Pegawai 362	Alamat Pegawai 362	Frontdesk
363	Pegawai 363	Alamat Pegawai 363	Admin
364	Pegawai 364	Alamat Pegawai 364	Frontdesk
365	Pegawai 365	Alamat Pegawai 365	Admin
366	Pegawai 366	Alamat Pegawai 366	Frontdesk
367	Pegawai 367	Alamat Pegawai 367	Admin
368	Pegawai 368	Alamat Pegawai 368	Frontdesk
369	Pegawai 369	Alamat Pegawai 369	Admin
370	Pegawai 370	Alamat Pegawai 370	Frontdesk
371	Pegawai 371	Alamat Pegawai 371	Admin
372	Pegawai 372	Alamat Pegawai 372	Frontdesk
373	Pegawai 373	Alamat Pegawai 373	Admin
374	Pegawai 374	Alamat Pegawai 374	Frontdesk
375	Pegawai 375	Alamat Pegawai 375	Admin
376	Pegawai 376	Alamat Pegawai 376	Frontdesk
377	Pegawai 377	Alamat Pegawai 377	Admin
378	Pegawai 378	Alamat Pegawai 378	Frontdesk
379	Pegawai 379	Alamat Pegawai 379	Admin
380	Pegawai 380	Alamat Pegawai 380	Frontdesk
381	Pegawai 381	Alamat Pegawai 381	Admin
382	Pegawai 382	Alamat Pegawai 382	Frontdesk
383	Pegawai 383	Alamat Pegawai 383	Admin
384	Pegawai 384	Alamat Pegawai 384	Frontdesk
385	Pegawai 385	Alamat Pegawai 385	Admin
386	Pegawai 386	Alamat Pegawai 386	Frontdesk
387	Pegawai 387	Alamat Pegawai 387	Admin
388	Pegawai 388	Alamat Pegawai 388	Frontdesk
389	Pegawai 389	Alamat Pegawai 389	Admin
390	Pegawai 390	Alamat Pegawai 390	Frontdesk
391	Pegawai 391	Alamat Pegawai 391	Admin
392	Pegawai 392	Alamat Pegawai 392	Frontdesk
393	Pegawai 393	Alamat Pegawai 393	Admin
394	Pegawai 394	Alamat Pegawai 394	Frontdesk
395	Pegawai 395	Alamat Pegawai 395	Admin
396	Pegawai 396	Alamat Pegawai 396	Frontdesk
397	Pegawai 397	Alamat Pegawai 397	Admin
398	Pegawai 398	Alamat Pegawai 398	Frontdesk
399	Pegawai 399	Alamat Pegawai 399	Admin
400	Pegawai 400	Alamat Pegawai 400	Frontdesk
401	Pegawai 401	Alamat Pegawai 401	Admin
402	Pegawai 402	Alamat Pegawai 402	Frontdesk
403	Pegawai 403	Alamat Pegawai 403	Admin
404	Pegawai 404	Alamat Pegawai 404	Frontdesk
405	Pegawai 405	Alamat Pegawai 405	Admin
406	Pegawai 406	Alamat Pegawai 406	Frontdesk
407	Pegawai 407	Alamat Pegawai 407	Admin
408	Pegawai 408	Alamat Pegawai 408	Frontdesk
409	Pegawai 409	Alamat Pegawai 409	Admin
410	Pegawai 410	Alamat Pegawai 410	Frontdesk
411	Pegawai 411	Alamat Pegawai 411	Admin
412	Pegawai 412	Alamat Pegawai 412	Frontdesk
413	Pegawai 413	Alamat Pegawai 413	Admin
414	Pegawai 414	Alamat Pegawai 414	Frontdesk
415	Pegawai 415	Alamat Pegawai 415	Admin
416	Pegawai 416	Alamat Pegawai 416	Frontdesk
417	Pegawai 417	Alamat Pegawai 417	Admin
418	Pegawai 418	Alamat Pegawai 418	Frontdesk
419	Pegawai 419	Alamat Pegawai 419	Admin
420	Pegawai 420	Alamat Pegawai 420	Frontdesk
421	Pegawai 421	Alamat Pegawai 421	Admin
422	Pegawai 422	Alamat Pegawai 422	Frontdesk
423	Pegawai 423	Alamat Pegawai 423	Admin
424	Pegawai 424	Alamat Pegawai 424	Frontdesk
425	Pegawai 425	Alamat Pegawai 425	Admin
426	Pegawai 426	Alamat Pegawai 426	Frontdesk
427	Pegawai 427	Alamat Pegawai 427	Admin
428	Pegawai 428	Alamat Pegawai 428	Frontdesk
429	Pegawai 429	Alamat Pegawai 429	Admin
430	Pegawai 430	Alamat Pegawai 430	Frontdesk
431	Pegawai 431	Alamat Pegawai 431	Admin
432	Pegawai 432	Alamat Pegawai 432	Frontdesk
433	Pegawai 433	Alamat Pegawai 433	Admin
434	Pegawai 434	Alamat Pegawai 434	Frontdesk
435	Pegawai 435	Alamat Pegawai 435	Admin
436	Pegawai 436	Alamat Pegawai 436	Frontdesk
437	Pegawai 437	Alamat Pegawai 437	Admin
438	Pegawai 438	Alamat Pegawai 438	Frontdesk
439	Pegawai 439	Alamat Pegawai 439	Admin
440	Pegawai 440	Alamat Pegawai 440	Frontdesk
441	Pegawai 441	Alamat Pegawai 441	Admin
442	Pegawai 442	Alamat Pegawai 442	Frontdesk
443	Pegawai 443	Alamat Pegawai 443	Admin
444	Pegawai 444	Alamat Pegawai 444	Frontdesk
445	Pegawai 445	Alamat Pegawai 445	Admin
446	Pegawai 446	Alamat Pegawai 446	Frontdesk
447	Pegawai 447	Alamat Pegawai 447	Admin
448	Pegawai 448	Alamat Pegawai 448	Frontdesk
449	Pegawai 449	Alamat Pegawai 449	Admin
450	Pegawai 450	Alamat Pegawai 450	Frontdesk
451	Pegawai 451	Alamat Pegawai 451	Admin
452	Pegawai 452	Alamat Pegawai 452	Frontdesk
453	Pegawai 453	Alamat Pegawai 453	Admin
454	Pegawai 454	Alamat Pegawai 454	Frontdesk
455	Pegawai 455	Alamat Pegawai 455	Admin
456	Pegawai 456	Alamat Pegawai 456	Frontdesk
457	Pegawai 457	Alamat Pegawai 457	Admin
458	Pegawai 458	Alamat Pegawai 458	Frontdesk
459	Pegawai 459	Alamat Pegawai 459	Admin
460	Pegawai 460	Alamat Pegawai 460	Frontdesk
461	Pegawai 461	Alamat Pegawai 461	Admin
462	Pegawai 462	Alamat Pegawai 462	Frontdesk
463	Pegawai 463	Alamat Pegawai 463	Admin
464	Pegawai 464	Alamat Pegawai 464	Frontdesk
465	Pegawai 465	Alamat Pegawai 465	Admin
466	Pegawai 466	Alamat Pegawai 466	Frontdesk
467	Pegawai 467	Alamat Pegawai 467	Admin
468	Pegawai 468	Alamat Pegawai 468	Frontdesk
469	Pegawai 469	Alamat Pegawai 469	Admin
470	Pegawai 470	Alamat Pegawai 470	Frontdesk
471	Pegawai 471	Alamat Pegawai 471	Admin
472	Pegawai 472	Alamat Pegawai 472	Frontdesk
473	Pegawai 473	Alamat Pegawai 473	Admin
474	Pegawai 474	Alamat Pegawai 474	Frontdesk
475	Pegawai 475	Alamat Pegawai 475	Admin
476	Pegawai 476	Alamat Pegawai 476	Frontdesk
477	Pegawai 477	Alamat Pegawai 477	Admin
478	Pegawai 478	Alamat Pegawai 478	Frontdesk
479	Pegawai 479	Alamat Pegawai 479	Admin
480	Pegawai 480	Alamat Pegawai 480	Frontdesk
481	Pegawai 481	Alamat Pegawai 481	Admin
482	Pegawai 482	Alamat Pegawai 482	Frontdesk
483	Pegawai 483	Alamat Pegawai 483	Admin
484	Pegawai 484	Alamat Pegawai 484	Frontdesk
485	Pegawai 485	Alamat Pegawai 485	Admin
486	Pegawai 486	Alamat Pegawai 486	Frontdesk
487	Pegawai 487	Alamat Pegawai 487	Admin
488	Pegawai 488	Alamat Pegawai 488	Frontdesk
489	Pegawai 489	Alamat Pegawai 489	Admin
490	Pegawai 490	Alamat Pegawai 490	Frontdesk
491	Pegawai 491	Alamat Pegawai 491	Admin
492	Pegawai 492	Alamat Pegawai 492	Frontdesk
493	Pegawai 493	Alamat Pegawai 493	Admin
494	Pegawai 494	Alamat Pegawai 494	Frontdesk
495	Pegawai 495	Alamat Pegawai 495	Admin
496	Pegawai 496	Alamat Pegawai 496	Frontdesk
497	Pegawai 497	Alamat Pegawai 497	Admin
498	Pegawai 498	Alamat Pegawai 498	Frontdesk
499	Pegawai 499	Alamat Pegawai 499	Admin
500	Pegawai 500	Alamat Pegawai 500	Frontdesk
\.


--
-- TOC entry 5011 (class 0 OID 17533)
-- Dependencies: 233
-- Data for Name: pembelian; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.pembelian (id_pembelian, id_supplier, tanggal_pembelian) FROM stdin;
\.


--
-- TOC entry 5013 (class 0 OID 17564)
-- Dependencies: 235
-- Data for Name: peminjaman; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.peminjaman (id_peminjaman, id_anggota, id_pegawai, tanggal_pinjam, tenggat_waktu) FROM stdin;
32001	822	374	2025-08-11	2025-11-03
32002	556	367	2025-07-04	2025-11-03
32003	1450	497	2025-08-07	2025-10-30
32004	331	146	2025-08-24	2025-10-29
32005	1662	435	2024-11-21	2025-10-23
32006	978	453	2025-04-21	2025-10-25
32007	1391	5	2024-11-07	2025-10-21
32008	192	148	2025-01-25	2025-11-04
32009	1477	166	2025-05-23	2025-11-02
32010	982	97	2025-10-11	2025-10-23
32011	1850	212	2025-06-27	2025-11-02
32012	1074	160	2025-02-28	2025-10-24
32013	275	31	2024-11-05	2025-11-07
32014	1091	130	2025-02-24	2025-10-29
32015	1157	50	2024-11-30	2025-10-24
32016	1549	293	2025-07-18	2025-10-27
32017	1342	9	2025-08-12	2025-10-26
32018	1351	383	2024-11-29	2025-10-29
32019	1773	197	2025-05-09	2025-10-22
32020	1925	422	2025-01-12	2025-10-30
32021	1351	459	2025-02-10	2025-10-30
32022	165	56	2024-12-06	2025-10-23
32023	869	207	2025-01-23	2025-10-28
32024	586	443	2025-03-17	2025-11-01
32025	1375	424	2024-11-04	2025-11-02
32026	1720	55	2024-12-11	2025-11-01
32027	1355	228	2025-03-15	2025-10-23
32028	1397	282	2025-05-14	2025-11-09
32029	761	22	2025-09-02	2025-11-08
32030	420	353	2024-11-14	2025-11-03
32031	245	457	2024-10-31	2025-11-04
32032	974	195	2024-10-26	2025-11-02
32033	299	231	2024-12-03	2025-10-22
32034	1405	162	2024-10-26	2025-10-30
32035	828	383	2025-08-08	2025-10-29
32036	1473	186	2024-10-29	2025-10-29
32037	1422	236	2024-11-26	2025-10-27
32038	107	417	2025-02-13	2025-11-01
32039	493	376	2025-03-12	2025-10-25
32040	1123	280	2025-01-23	2025-11-10
32041	956	311	2025-04-03	2025-10-21
32042	1658	14	2025-03-16	2025-10-29
32043	718	135	2025-03-17	2025-10-26
32044	196	411	2025-08-29	2025-11-03
32045	512	211	2025-02-07	2025-10-28
32046	807	232	2025-09-19	2025-11-04
32047	1114	329	2025-09-04	2025-11-02
32048	1216	260	2025-08-01	2025-10-29
32049	983	62	2025-01-31	2025-10-26
32050	279	104	2025-08-31	2025-11-09
32051	1403	217	2025-03-02	2025-10-30
32052	1678	452	2025-05-27	2025-10-27
32053	477	87	2025-08-06	2025-10-22
32054	558	473	2024-11-14	2025-10-27
32055	210	398	2024-12-21	2025-10-31
32056	1160	471	2025-01-01	2025-10-28
32057	525	168	2025-10-03	2025-11-06
32058	804	169	2025-04-21	2025-11-05
32059	1816	197	2025-05-11	2025-10-25
32060	787	101	2024-12-05	2025-11-01
32061	93	131	2025-07-04	2025-11-02
32062	291	133	2025-02-05	2025-11-08
32063	1276	114	2024-10-22	2025-10-28
32064	942	288	2025-09-30	2025-11-06
32065	1205	309	2024-12-15	2025-11-01
32066	1941	348	2024-11-05	2025-10-24
32067	1323	394	2025-02-06	2025-11-07
32068	843	424	2025-05-27	2025-10-26
32069	1640	279	2025-10-19	2025-11-01
32070	902	338	2025-10-08	2025-10-25
32071	1045	132	2025-05-15	2025-10-22
32072	1132	117	2025-07-18	2025-10-28
32073	1783	470	2024-12-09	2025-10-30
32074	126	389	2025-01-05	2025-11-08
32075	269	250	2025-07-06	2025-10-24
32076	699	81	2025-10-01	2025-11-07
32077	1367	167	2025-09-21	2025-10-26
32078	402	391	2025-10-08	2025-10-27
32079	608	157	2025-06-19	2025-11-01
32080	228	409	2025-06-13	2025-10-23
32081	1835	50	2024-11-29	2025-11-04
32082	1858	132	2025-10-06	2025-11-07
32083	45	168	2025-07-12	2025-11-01
32084	887	321	2025-01-15	2025-10-29
32085	1998	180	2025-01-15	2025-11-07
32086	1550	150	2025-05-31	2025-11-01
32087	235	85	2025-02-07	2025-11-02
32088	1782	148	2025-06-27	2025-11-08
32089	1235	15	2025-08-07	2025-11-02
32090	1790	453	2025-02-21	2025-11-06
32091	570	383	2025-05-15	2025-10-27
32092	1610	333	2025-03-30	2025-11-02
32093	1078	434	2024-10-25	2025-11-04
32094	995	382	2025-09-28	2025-11-08
32095	646	59	2025-06-16	2025-11-03
32096	1569	99	2025-06-10	2025-10-28
32097	899	147	2025-06-13	2025-11-02
32098	1940	427	2025-10-04	2025-10-23
32099	1215	190	2025-09-16	2025-10-24
32100	1244	287	2024-12-20	2025-10-26
32101	1589	168	2025-02-12	2025-10-26
32102	1914	402	2025-03-12	2025-10-31
32103	523	485	2025-08-17	2025-11-03
32104	667	19	2025-05-02	2025-10-21
32105	1431	322	2025-08-26	2025-11-10
32106	555	205	2025-05-03	2025-11-04
32107	1843	79	2025-04-27	2025-10-24
32108	675	384	2025-08-08	2025-10-22
32109	140	287	2024-12-29	2025-10-23
32110	1153	369	2024-12-11	2025-11-05
32111	1369	385	2025-07-05	2025-10-23
32112	920	240	2025-05-20	2025-11-02
32113	1155	138	2025-03-05	2025-11-06
32114	1534	384	2025-08-18	2025-10-24
32115	1849	152	2025-06-11	2025-11-02
32116	1535	407	2024-11-11	2025-11-09
32117	737	220	2024-12-10	2025-11-10
32118	1553	405	2025-10-13	2025-11-06
32119	1886	288	2025-07-13	2025-10-23
32120	1087	465	2025-10-14	2025-11-08
32121	176	154	2025-03-15	2025-10-23
32122	361	163	2025-02-21	2025-10-31
32123	1363	102	2024-11-07	2025-10-28
32124	1626	28	2025-05-01	2025-10-23
32125	237	68	2024-11-09	2025-11-02
32126	1195	21	2025-07-25	2025-10-25
32127	1747	423	2025-08-09	2025-10-23
32128	1091	215	2025-08-20	2025-11-06
32129	250	237	2025-10-06	2025-10-23
32130	1618	454	2024-10-30	2025-10-24
32131	261	216	2024-11-03	2025-10-27
32132	938	99	2025-07-06	2025-11-05
32133	472	320	2025-01-05	2025-11-07
32134	1582	267	2025-04-01	2025-10-25
32135	1610	372	2025-06-05	2025-11-04
32136	957	48	2025-05-05	2025-10-26
32137	161	128	2025-05-24	2025-11-08
32138	1783	485	2025-09-22	2025-11-03
32139	1906	30	2025-02-01	2025-10-28
32140	1180	159	2025-02-17	2025-10-24
32141	1415	493	2025-01-14	2025-10-22
32142	1769	309	2025-10-01	2025-11-08
32143	741	486	2025-10-15	2025-10-30
32144	573	57	2025-09-27	2025-11-08
32145	1554	420	2025-06-01	2025-10-24
32146	1980	26	2025-05-08	2025-10-27
32147	1418	270	2025-08-09	2025-10-30
32148	464	335	2025-08-31	2025-10-21
32149	1914	262	2025-08-29	2025-10-28
32150	321	242	2024-12-26	2025-10-28
32151	1511	319	2025-08-13	2025-11-01
32152	1024	181	2024-11-16	2025-11-03
32153	1140	463	2025-01-18	2025-11-04
32154	312	150	2025-06-13	2025-10-31
32155	1680	454	2025-03-08	2025-11-04
32156	83	159	2025-10-18	2025-10-29
32157	991	387	2025-05-12	2025-11-09
32158	438	120	2025-07-11	2025-10-24
32159	232	480	2025-08-06	2025-10-25
32160	308	283	2024-11-12	2025-10-28
32161	79	243	2025-03-25	2025-11-03
32162	1051	457	2025-01-27	2025-10-28
32163	1080	356	2025-05-24	2025-10-30
32164	627	291	2025-04-16	2025-11-08
32165	613	439	2024-11-17	2025-11-06
32166	1864	66	2024-12-22	2025-10-27
32167	249	347	2024-11-19	2025-11-04
32168	149	61	2025-06-20	2025-10-22
32169	1641	31	2024-11-15	2025-10-25
32170	1006	8	2025-06-22	2025-10-24
32171	1693	442	2025-03-29	2025-10-28
32172	281	284	2025-01-26	2025-10-29
32173	1141	262	2025-09-26	2025-10-27
32174	1423	43	2025-09-13	2025-11-08
32175	230	283	2025-08-15	2025-10-26
32176	234	99	2025-08-13	2025-11-10
32177	1555	431	2025-03-28	2025-11-07
32178	1792	422	2025-08-21	2025-11-02
32179	981	162	2025-03-14	2025-10-21
32180	1935	146	2025-04-29	2025-11-06
32181	625	353	2025-04-14	2025-10-24
32182	1763	388	2025-06-30	2025-11-08
32183	645	216	2025-07-21	2025-10-21
32184	1627	38	2025-06-12	2025-10-31
32185	1278	127	2025-01-09	2025-11-06
32186	1588	51	2025-03-12	2025-10-24
32187	1004	318	2025-05-19	2025-10-26
32188	1179	296	2025-07-03	2025-10-27
32189	1191	77	2025-04-27	2025-10-28
32190	616	279	2025-04-24	2025-10-28
32191	728	103	2025-09-07	2025-11-01
32192	714	192	2025-09-01	2025-11-08
32193	18	153	2025-05-10	2025-11-03
32194	1620	123	2025-07-28	2025-10-28
32195	1413	355	2024-10-26	2025-10-29
32196	300	5	2025-02-06	2025-10-25
32197	952	499	2025-04-01	2025-11-01
32198	753	149	2025-07-04	2025-11-03
32199	153	269	2025-06-11	2025-11-02
32200	692	400	2025-07-31	2025-10-29
32201	2000	468	2024-11-02	2025-11-06
32202	564	377	2025-06-19	2025-10-25
32203	304	365	2024-12-23	2025-10-27
32204	191	402	2024-11-08	2025-11-02
32205	1795	421	2025-02-11	2025-10-23
32206	1701	452	2025-09-05	2025-10-27
32207	276	138	2024-11-12	2025-11-04
32208	500	417	2025-10-20	2025-11-03
32209	814	11	2025-06-11	2025-10-22
32210	1946	243	2025-07-09	2025-10-28
32211	1142	10	2025-07-14	2025-10-30
32212	1381	274	2025-08-31	2025-11-04
32213	833	336	2025-09-21	2025-10-28
32214	892	107	2025-09-01	2025-11-05
32215	1078	138	2024-11-09	2025-11-03
32216	1154	364	2025-04-29	2025-11-05
32217	1328	151	2025-08-28	2025-10-22
32218	836	350	2025-04-24	2025-10-26
32219	629	401	2025-05-09	2025-11-02
32220	1047	379	2025-05-02	2025-11-10
32221	1490	231	2025-04-14	2025-10-24
32222	833	498	2024-11-21	2025-10-28
32223	173	197	2025-01-03	2025-11-07
32224	528	120	2025-08-11	2025-10-24
32225	664	201	2025-07-18	2025-11-05
32226	230	301	2025-04-05	2025-11-08
32227	899	196	2025-03-07	2025-11-01
32228	600	364	2024-10-31	2025-11-02
32229	520	321	2025-02-10	2025-11-10
32230	1792	428	2025-09-24	2025-11-07
32231	121	7	2025-05-29	2025-11-02
32232	1954	82	2025-05-30	2025-11-04
32233	811	494	2025-06-05	2025-10-31
32234	855	437	2025-10-02	2025-10-30
32235	285	46	2025-09-12	2025-10-25
32236	871	365	2025-07-29	2025-11-10
32237	399	346	2024-12-23	2025-11-07
32238	1008	304	2025-06-14	2025-10-28
32239	1700	245	2025-05-09	2025-11-04
32240	1407	186	2025-09-30	2025-11-09
32241	653	194	2025-08-25	2025-11-03
32242	620	280	2025-05-03	2025-11-08
32243	516	265	2025-09-27	2025-11-07
32244	552	18	2025-08-31	2025-10-25
32245	1257	158	2025-08-31	2025-10-23
32246	840	293	2024-11-16	2025-10-27
32247	1811	393	2025-01-02	2025-11-04
32248	1498	43	2025-05-02	2025-10-23
32249	1756	154	2025-02-17	2025-10-30
32250	1189	467	2024-11-24	2025-11-01
32251	1739	39	2024-12-30	2025-10-24
32252	1019	215	2025-01-27	2025-11-05
32253	322	331	2025-01-15	2025-10-30
32254	1086	11	2025-09-20	2025-10-28
32255	276	308	2024-12-16	2025-10-28
32256	923	272	2025-04-16	2025-11-02
32257	1024	98	2025-09-18	2025-10-28
32258	1008	193	2025-02-13	2025-10-22
32259	555	37	2025-09-20	2025-11-06
32260	1858	230	2025-06-15	2025-10-29
32261	1984	233	2025-03-07	2025-10-23
32262	927	438	2025-06-16	2025-10-29
32263	360	189	2025-07-20	2025-11-01
32264	467	418	2025-07-23	2025-11-09
32265	541	354	2025-01-03	2025-11-04
32266	16	290	2025-02-02	2025-10-24
32267	517	293	2024-12-11	2025-10-25
32268	1254	248	2025-08-10	2025-10-28
32269	1256	122	2024-10-30	2025-11-01
32270	1281	116	2025-05-11	2025-10-24
32271	480	172	2025-01-16	2025-10-25
32272	1722	77	2025-08-12	2025-11-10
32273	497	427	2025-10-09	2025-11-05
32274	1059	383	2025-04-22	2025-11-08
32275	783	105	2025-05-20	2025-10-29
32276	191	44	2025-03-30	2025-11-07
32277	304	448	2025-07-19	2025-10-28
32278	1293	149	2024-10-23	2025-10-24
32279	806	465	2025-01-19	2025-10-30
32280	1252	458	2024-12-29	2025-10-31
32281	1690	74	2025-03-09	2025-10-25
32282	241	429	2025-08-24	2025-10-25
32283	260	207	2025-04-16	2025-10-28
32284	700	16	2025-08-20	2025-10-22
32285	1460	152	2025-02-18	2025-10-31
32286	1887	281	2025-04-06	2025-11-08
32287	1011	151	2024-10-30	2025-10-27
32288	1925	418	2025-05-12	2025-10-31
32289	1716	72	2025-08-25	2025-11-07
32290	1257	433	2025-06-01	2025-10-23
32291	42	444	2025-02-14	2025-10-24
32292	266	123	2025-02-12	2025-11-08
32293	1271	175	2025-09-21	2025-11-01
32294	24	225	2025-10-13	2025-11-08
32295	686	329	2024-12-27	2025-10-24
32296	1006	301	2025-03-21	2025-10-23
32297	1129	468	2025-09-30	2025-10-25
32298	1861	110	2025-03-05	2025-11-07
32299	1214	79	2024-11-21	2025-11-07
32300	790	275	2025-07-26	2025-11-08
32301	850	191	2025-02-10	2025-10-27
32302	1892	482	2024-11-27	2025-10-23
32303	202	115	2025-07-19	2025-10-27
32304	790	298	2025-09-25	2025-10-22
32305	456	442	2025-09-24	2025-10-31
32306	1512	283	2025-09-29	2025-10-31
32307	184	21	2025-06-07	2025-11-10
32308	1950	263	2025-06-27	2025-10-30
32309	311	457	2025-06-14	2025-10-28
32310	1897	270	2025-02-27	2025-11-04
32311	812	229	2025-08-30	2025-11-08
32312	668	410	2024-11-29	2025-10-23
32313	5	454	2025-06-16	2025-10-22
32314	849	244	2025-04-17	2025-11-02
32315	1606	473	2025-05-08	2025-11-06
32316	434	159	2024-11-13	2025-11-05
32317	1074	90	2025-01-22	2025-11-01
32318	1018	6	2025-03-25	2025-10-30
32319	1221	64	2024-11-03	2025-10-29
32320	313	167	2025-04-13	2025-10-30
32321	1297	181	2025-03-03	2025-10-26
32322	1904	204	2025-01-23	2025-10-29
32323	183	248	2025-04-29	2025-10-27
32324	540	338	2025-07-13	2025-11-01
32325	1617	84	2025-03-30	2025-10-24
32326	1332	200	2025-08-17	2025-11-01
32327	171	337	2025-07-21	2025-10-31
32328	1036	328	2025-05-03	2025-10-23
32329	268	17	2024-12-24	2025-11-09
32330	956	85	2025-08-08	2025-11-09
32331	1153	134	2025-03-02	2025-11-05
32332	1836	132	2025-04-05	2025-11-09
32333	1241	138	2025-01-05	2025-11-05
32334	1210	21	2025-10-18	2025-11-04
32335	1328	450	2025-06-30	2025-10-29
32336	108	166	2025-05-01	2025-10-21
32337	39	321	2025-07-29	2025-10-31
32338	949	234	2024-10-29	2025-10-23
32339	319	150	2025-08-02	2025-11-05
32340	1006	266	2025-05-03	2025-10-29
32341	1594	463	2025-08-21	2025-11-01
32342	276	360	2025-06-24	2025-10-26
32343	1278	116	2025-08-30	2025-10-28
32344	1384	27	2025-08-20	2025-10-31
32345	956	189	2025-07-20	2025-11-06
32346	77	186	2024-11-02	2025-11-03
32347	641	275	2025-06-15	2025-11-07
32348	1502	469	2025-01-01	2025-10-28
32349	917	408	2025-04-04	2025-10-23
32350	1560	93	2025-01-20	2025-10-27
32351	299	10	2024-11-07	2025-10-27
32352	217	407	2025-08-14	2025-11-06
32353	885	391	2025-01-02	2025-11-09
32354	1039	290	2025-06-24	2025-11-07
32355	1567	479	2024-10-27	2025-10-26
32356	256	178	2025-06-17	2025-11-02
32357	1940	296	2025-07-22	2025-10-25
32358	1089	185	2025-10-02	2025-10-31
32359	672	186	2024-11-28	2025-10-27
32360	1944	17	2024-12-01	2025-10-25
32361	965	120	2025-03-11	2025-11-01
32362	1901	147	2025-07-03	2025-10-22
32363	18	182	2025-01-10	2025-11-01
32364	1657	445	2024-12-23	2025-10-25
32365	341	191	2025-01-21	2025-11-01
32366	1607	437	2025-06-10	2025-10-29
32367	525	128	2025-02-22	2025-10-28
32368	656	24	2025-09-02	2025-10-24
32369	1449	138	2025-06-06	2025-10-28
32370	1898	450	2025-04-12	2025-11-04
32371	449	302	2025-06-03	2025-11-06
32372	1112	203	2025-09-23	2025-10-22
32373	29	242	2024-12-30	2025-11-05
32374	1209	111	2025-08-26	2025-11-07
32375	770	107	2024-11-29	2025-11-09
32376	477	116	2025-05-10	2025-11-03
32377	122	188	2025-10-04	2025-10-22
32378	1159	41	2025-03-13	2025-10-22
32379	395	72	2025-05-01	2025-11-01
32380	1437	365	2025-07-01	2025-11-04
32381	421	344	2025-07-03	2025-11-03
32382	1756	320	2025-03-12	2025-11-05
32383	474	478	2024-12-12	2025-11-05
32384	1620	234	2025-04-28	2025-11-02
32385	253	487	2025-02-15	2025-10-28
32386	1388	173	2024-11-15	2025-10-28
32387	139	224	2025-02-23	2025-11-07
32388	1134	187	2025-03-07	2025-10-28
32389	1281	135	2024-12-21	2025-11-06
32390	337	278	2025-08-04	2025-10-26
32391	740	94	2025-02-26	2025-10-24
32392	898	388	2025-09-21	2025-11-05
32393	414	375	2025-05-29	2025-10-26
32394	1164	397	2025-06-22	2025-11-01
32395	685	166	2025-01-01	2025-11-08
32396	1070	144	2024-12-14	2025-11-01
32397	855	343	2025-08-16	2025-11-07
32398	1157	122	2025-10-14	2025-10-30
32399	1510	171	2024-12-30	2025-10-23
32400	1783	272	2024-11-20	2025-11-03
32401	1366	143	2025-08-26	2025-10-24
32402	1947	316	2025-05-15	2025-10-25
32403	18	114	2025-05-27	2025-10-31
32404	750	220	2025-07-16	2025-11-09
32405	1994	136	2025-01-31	2025-10-29
32406	32	186	2025-01-18	2025-10-28
32407	1939	95	2025-04-23	2025-11-06
32408	1959	36	2024-12-28	2025-10-27
32409	1494	92	2025-04-02	2025-11-02
32410	1280	462	2025-05-12	2025-11-08
32411	739	421	2025-06-26	2025-11-01
32412	1205	308	2025-10-05	2025-10-26
32413	1696	268	2024-11-27	2025-11-03
32414	909	348	2025-07-23	2025-10-28
32415	934	32	2025-06-24	2025-10-26
32416	1820	173	2025-08-30	2025-11-04
32417	664	81	2025-01-21	2025-11-06
32418	6	282	2025-10-11	2025-10-26
32419	450	232	2025-04-20	2025-11-01
32420	333	469	2025-09-13	2025-10-24
32421	172	203	2025-10-16	2025-10-26
32422	939	202	2025-01-23	2025-10-22
32423	1927	15	2025-03-03	2025-10-29
32424	1463	239	2024-12-14	2025-10-26
32425	569	436	2025-03-17	2025-11-06
32426	1111	428	2025-04-18	2025-11-01
32427	313	222	2025-10-21	2025-10-27
32428	204	369	2025-03-19	2025-11-02
32429	521	318	2025-08-26	2025-11-04
32430	1903	354	2025-02-15	2025-11-02
32431	10	384	2024-10-25	2025-10-25
32432	872	100	2024-12-11	2025-10-28
32433	486	488	2025-06-08	2025-11-05
32434	1105	298	2025-04-20	2025-11-06
32435	1438	388	2025-05-07	2025-10-22
32436	755	112	2025-08-16	2025-10-24
32437	1328	287	2025-05-31	2025-10-31
32438	1543	328	2025-07-17	2025-10-22
32439	445	334	2025-06-03	2025-11-05
32440	730	1	2025-08-15	2025-10-28
32441	1884	413	2025-03-04	2025-11-01
32442	235	216	2025-03-07	2025-11-01
32443	1413	109	2025-01-07	2025-10-23
32444	1345	465	2025-06-13	2025-10-27
32445	746	70	2025-02-06	2025-10-21
32446	598	422	2024-10-23	2025-10-26
32447	612	197	2025-05-29	2025-11-04
32448	946	480	2025-10-14	2025-10-26
32449	1674	57	2025-07-21	2025-10-24
32450	366	313	2025-07-19	2025-11-02
32451	549	339	2025-04-22	2025-10-22
32452	476	427	2024-12-04	2025-11-05
32453	1395	394	2024-12-24	2025-10-22
32454	129	172	2025-01-15	2025-11-04
32455	1596	34	2025-02-13	2025-10-23
32456	1579	17	2025-08-31	2025-10-28
32457	1671	498	2024-11-17	2025-11-08
32458	25	91	2025-09-08	2025-10-29
32459	5	411	2025-09-05	2025-11-03
32460	1485	370	2025-01-03	2025-11-02
32461	1526	60	2024-11-30	2025-11-05
32462	682	323	2025-05-03	2025-10-26
32463	1400	372	2025-03-21	2025-11-02
32464	536	128	2025-02-09	2025-11-08
32465	923	346	2025-02-07	2025-11-09
32466	751	140	2025-02-21	2025-10-28
32467	1215	421	2025-04-22	2025-10-24
32468	47	434	2025-09-03	2025-10-29
32469	990	4	2024-10-31	2025-11-01
32470	531	478	2025-01-07	2025-11-06
32471	544	43	2024-10-21	2025-10-24
32472	203	150	2025-02-01	2025-10-27
32473	956	172	2025-04-13	2025-11-04
32474	29	452	2025-03-02	2025-10-21
32475	1750	67	2025-07-18	2025-10-31
32476	596	204	2025-02-27	2025-10-26
32477	1873	479	2024-11-19	2025-10-29
32478	1501	382	2025-01-08	2025-10-29
32479	1632	405	2025-09-05	2025-11-06
32480	1298	162	2024-12-07	2025-10-26
32481	249	410	2025-06-17	2025-11-10
32482	1721	81	2024-10-29	2025-10-29
32483	1740	45	2025-08-10	2025-10-27
32484	1849	344	2025-02-11	2025-11-10
32485	829	371	2025-08-23	2025-11-02
32486	1501	152	2024-12-23	2025-11-06
32487	152	443	2025-04-16	2025-11-05
32488	1199	177	2025-03-29	2025-10-27
32489	1246	299	2025-06-20	2025-10-22
32490	1524	480	2025-03-01	2025-10-21
32491	1983	71	2024-12-16	2025-10-23
32492	821	395	2025-09-29	2025-10-23
32493	268	12	2025-05-26	2025-11-07
32494	348	210	2025-07-31	2025-11-07
32495	1827	496	2024-12-20	2025-11-02
32496	1422	49	2025-08-10	2025-11-06
32497	977	152	2025-02-18	2025-10-30
32498	1013	249	2025-07-10	2025-11-02
32499	751	335	2024-12-21	2025-10-27
32500	1365	490	2025-01-16	2025-11-09
32501	65	299	2025-05-20	2025-10-25
32502	1022	252	2025-03-19	2025-10-24
32503	54	355	2025-01-24	2025-11-08
32504	1579	133	2025-04-17	2025-11-10
32505	814	292	2025-07-16	2025-11-04
32506	1876	124	2025-02-13	2025-10-25
32507	494	305	2025-09-14	2025-10-22
32508	267	405	2024-12-24	2025-11-06
32509	1396	132	2025-05-04	2025-10-25
32510	1883	258	2025-09-15	2025-11-03
32511	370	355	2025-07-20	2025-11-05
32512	1213	127	2025-01-22	2025-11-06
32513	1773	256	2025-10-04	2025-11-02
32514	1936	91	2024-11-18	2025-11-05
32515	630	113	2025-02-27	2025-10-27
32516	988	113	2025-01-31	2025-11-06
32517	93	273	2025-04-26	2025-10-29
32518	110	156	2025-03-03	2025-11-02
32519	680	213	2024-12-13	2025-11-07
32520	1042	451	2025-04-20	2025-10-31
32521	1558	5	2025-05-06	2025-10-25
32522	1683	109	2025-01-31	2025-10-30
32523	1219	230	2025-06-05	2025-11-03
32524	1783	105	2025-09-01	2025-11-09
32525	202	445	2025-04-14	2025-11-06
32526	1502	300	2025-10-13	2025-10-31
32527	1760	57	2024-11-10	2025-11-06
32528	824	319	2024-12-23	2025-11-02
32529	1726	214	2024-11-11	2025-11-02
32530	1976	374	2024-11-17	2025-11-03
32531	1598	359	2025-05-04	2025-10-30
32532	164	328	2024-12-21	2025-11-03
32533	1074	241	2025-05-22	2025-11-03
32534	1096	450	2024-11-15	2025-11-02
32535	5	248	2025-03-15	2025-10-29
32536	1094	320	2024-10-25	2025-11-07
32537	848	431	2025-02-27	2025-11-08
32538	375	81	2025-03-09	2025-11-09
32539	625	181	2025-05-17	2025-11-06
32540	1637	357	2025-07-24	2025-11-02
32541	1936	88	2025-02-26	2025-10-22
32542	1622	300	2025-07-02	2025-10-23
32543	160	411	2025-03-08	2025-11-03
32544	1658	101	2025-08-28	2025-10-31
32545	841	84	2024-12-29	2025-10-21
32546	1207	497	2024-12-11	2025-11-04
32547	39	197	2025-01-08	2025-10-23
32548	513	97	2025-08-04	2025-10-23
32549	1562	130	2024-12-02	2025-11-03
32550	1722	64	2025-06-08	2025-11-03
32551	406	68	2024-10-30	2025-10-26
32552	297	62	2025-07-23	2025-10-24
32553	1616	69	2024-12-12	2025-10-24
32554	532	425	2024-12-02	2025-11-08
32555	72	448	2025-09-03	2025-11-09
32556	1671	270	2025-03-07	2025-10-24
32557	1102	145	2025-04-27	2025-10-28
32558	1013	38	2025-04-07	2025-10-31
32559	1931	257	2025-03-09	2025-10-26
32560	406	127	2025-05-31	2025-11-10
32561	1044	269	2025-03-29	2025-11-03
32562	1275	299	2024-11-03	2025-11-02
32563	1494	17	2025-09-08	2025-10-28
32564	1345	446	2024-10-25	2025-11-04
32565	1324	107	2025-02-15	2025-10-30
32566	489	173	2025-01-04	2025-10-22
32567	1088	122	2025-06-01	2025-11-05
32568	688	231	2025-10-12	2025-10-27
32569	1168	436	2025-06-04	2025-10-23
32570	1976	47	2024-12-08	2025-11-03
32571	1482	466	2025-04-10	2025-11-02
32572	1061	11	2024-10-29	2025-10-27
32573	258	54	2025-04-25	2025-10-24
32574	516	381	2025-10-03	2025-10-28
32575	1084	440	2024-12-19	2025-10-24
32576	420	116	2025-01-12	2025-10-27
32577	75	379	2025-05-07	2025-11-07
32578	369	195	2025-03-20	2025-11-03
32579	324	281	2025-09-14	2025-11-03
32580	1638	99	2024-10-25	2025-11-07
32581	397	399	2025-01-22	2025-10-22
32582	1977	179	2025-05-31	2025-10-22
32583	881	482	2025-08-01	2025-10-23
32584	1252	307	2025-03-19	2025-10-27
32585	1320	207	2025-05-24	2025-11-02
32586	643	279	2025-05-12	2025-11-07
32587	1361	380	2024-12-11	2025-11-01
32588	228	390	2024-11-14	2025-11-08
32589	172	166	2025-06-21	2025-11-01
32590	371	426	2025-02-05	2025-10-28
32591	1780	133	2024-12-05	2025-10-29
32592	1802	262	2025-03-16	2025-11-03
32593	693	452	2025-07-30	2025-10-29
32594	377	456	2025-03-18	2025-11-06
32595	41	169	2024-11-23	2025-10-29
32596	813	152	2025-01-22	2025-10-21
32597	1712	39	2025-08-15	2025-10-31
32598	1087	128	2025-10-01	2025-11-09
32599	688	308	2025-09-19	2025-10-26
32600	9	237	2025-09-23	2025-11-02
32601	51	417	2025-09-05	2025-10-27
32602	1493	204	2025-06-07	2025-10-28
32603	1107	170	2025-10-06	2025-10-23
32604	1906	446	2025-02-05	2025-10-23
32605	538	443	2025-05-24	2025-10-28
32606	1474	228	2025-04-03	2025-10-21
32607	1532	387	2025-07-20	2025-11-07
32608	628	275	2025-05-19	2025-10-28
32609	1381	152	2025-08-06	2025-10-25
32610	334	340	2025-07-16	2025-11-01
32611	591	309	2025-02-26	2025-10-24
32612	1341	429	2025-05-31	2025-10-25
32613	1951	486	2025-09-22	2025-10-23
32614	1818	134	2025-05-26	2025-11-10
32615	1613	133	2024-12-28	2025-11-03
32616	637	383	2025-10-01	2025-11-08
32617	769	298	2025-04-25	2025-10-27
32618	443	188	2025-04-22	2025-11-02
32619	539	401	2025-04-24	2025-11-10
32620	1131	60	2025-06-12	2025-11-09
32621	115	342	2024-10-29	2025-11-02
32622	1801	230	2025-04-12	2025-11-02
32623	794	131	2025-07-22	2025-10-31
32624	479	499	2024-12-07	2025-11-02
32625	1703	45	2024-11-14	2025-11-05
32626	1494	192	2025-01-07	2025-11-02
32627	1319	88	2025-09-12	2025-11-01
32628	15	171	2025-06-19	2025-11-02
32629	1898	187	2025-03-21	2025-10-24
32630	1157	102	2025-07-28	2025-10-22
32631	747	22	2025-04-11	2025-10-31
32632	1236	272	2025-09-11	2025-10-30
32633	492	495	2025-04-18	2025-11-03
32634	1517	179	2025-07-06	2025-10-30
32635	779	91	2025-05-24	2025-11-06
32636	644	344	2025-03-28	2025-10-28
32637	712	43	2025-07-03	2025-10-27
32638	602	215	2024-10-30	2025-11-02
32639	1016	184	2025-05-07	2025-11-09
32640	15	8	2025-05-28	2025-11-05
32641	725	335	2024-10-22	2025-10-26
32642	69	134	2025-03-19	2025-10-27
32643	1832	233	2024-10-23	2025-10-29
32644	91	409	2024-11-10	2025-10-30
32645	456	229	2025-04-22	2025-10-29
32646	378	171	2025-07-05	2025-10-27
32647	1492	317	2025-04-13	2025-11-05
32648	338	176	2025-02-21	2025-10-28
32649	1488	223	2025-01-04	2025-11-10
32650	1617	142	2025-05-08	2025-11-07
32651	1776	492	2024-11-16	2025-10-30
32652	1598	360	2025-09-03	2025-11-05
32653	363	286	2024-11-11	2025-11-08
32654	364	118	2024-10-31	2025-11-01
32655	470	282	2024-12-04	2025-11-06
32656	1787	487	2025-05-03	2025-11-09
32657	923	487	2024-11-27	2025-11-03
32658	296	172	2025-06-10	2025-10-30
32659	1352	109	2025-07-03	2025-10-30
32660	1502	385	2025-07-14	2025-11-08
32661	1414	4	2025-05-24	2025-10-30
32662	137	59	2025-07-08	2025-10-26
32663	1206	477	2025-03-22	2025-11-10
32664	1673	429	2025-06-28	2025-10-29
32665	316	326	2025-10-18	2025-11-05
32666	510	374	2025-01-06	2025-10-23
32667	1077	108	2025-09-15	2025-11-04
32668	253	51	2024-10-27	2025-11-05
32669	1903	454	2025-08-24	2025-10-25
32670	592	334	2024-12-06	2025-10-22
32671	1391	470	2025-09-13	2025-11-06
32672	93	316	2025-06-01	2025-11-04
32673	1614	476	2025-04-15	2025-10-23
32674	402	221	2024-10-23	2025-10-31
32675	1827	221	2025-08-14	2025-10-28
32676	1065	80	2025-10-09	2025-10-25
32677	12	103	2024-11-08	2025-11-04
32678	1237	90	2025-07-28	2025-10-23
32679	637	333	2025-04-12	2025-10-28
32680	500	291	2025-08-22	2025-10-28
32681	784	316	2025-09-04	2025-10-27
32682	607	372	2025-01-05	2025-10-26
32683	1424	108	2024-10-28	2025-11-10
32684	1736	124	2025-01-31	2025-11-08
32685	1029	232	2025-01-21	2025-10-27
32686	1360	73	2024-11-02	2025-11-05
32687	962	53	2024-12-08	2025-10-23
32688	664	169	2024-12-24	2025-10-21
32689	1884	462	2024-12-31	2025-11-07
32690	1275	340	2025-07-16	2025-10-29
32691	427	361	2024-10-25	2025-10-31
32692	231	326	2025-06-07	2025-10-24
32693	558	330	2025-06-22	2025-10-26
32694	14	353	2025-09-08	2025-10-31
32695	1260	218	2025-08-26	2025-11-08
32696	1203	114	2024-11-08	2025-11-05
32697	1245	137	2025-03-05	2025-10-27
32698	998	20	2025-04-26	2025-11-03
32699	903	289	2025-01-22	2025-10-31
32700	259	47	2024-10-25	2025-10-23
32701	1149	283	2025-02-24	2025-10-23
32702	1723	112	2025-02-05	2025-10-28
32703	617	39	2025-07-26	2025-11-04
32704	1694	26	2025-04-21	2025-10-29
32705	1394	103	2025-10-01	2025-11-01
32706	652	468	2025-04-20	2025-10-25
32707	1569	205	2025-07-24	2025-10-30
32708	1239	448	2024-11-25	2025-10-28
32709	1678	199	2024-11-29	2025-11-05
32710	1400	200	2025-08-04	2025-11-05
32711	1508	467	2025-10-20	2025-11-05
32712	1486	458	2025-07-23	2025-10-29
32713	1542	361	2025-02-18	2025-10-30
32714	1082	213	2025-01-30	2025-10-28
32715	1603	496	2025-05-13	2025-11-03
32716	1230	420	2025-04-18	2025-11-10
32717	489	62	2025-01-06	2025-10-22
32718	30	340	2025-07-27	2025-10-27
32719	1044	354	2025-02-20	2025-10-21
32720	673	498	2025-04-10	2025-11-09
32721	1787	153	2025-06-15	2025-10-25
32722	1593	188	2025-06-08	2025-11-07
32723	1309	115	2024-12-16	2025-10-29
32724	696	71	2025-08-05	2025-10-22
32725	590	177	2025-02-08	2025-11-03
32726	1917	5	2025-05-08	2025-10-29
32727	115	331	2025-08-01	2025-10-30
32728	917	186	2025-08-30	2025-10-23
32729	1314	399	2025-03-07	2025-11-02
32730	605	153	2025-04-11	2025-10-31
32731	1738	61	2025-03-14	2025-10-30
32732	1538	481	2025-01-12	2025-11-09
32733	212	254	2025-05-12	2025-10-30
32734	32	242	2025-01-15	2025-10-27
32735	1639	76	2025-10-17	2025-10-26
32736	205	459	2025-09-07	2025-11-05
32737	1785	471	2025-06-17	2025-11-09
32738	568	51	2025-08-07	2025-11-06
32739	1665	228	2025-07-27	2025-11-02
32740	265	66	2025-10-16	2025-11-02
32741	268	252	2025-04-29	2025-10-29
32742	847	104	2024-12-19	2025-11-02
32743	352	276	2025-01-15	2025-11-06
32744	966	98	2025-01-27	2025-11-06
32745	586	8	2024-11-01	2025-11-01
32746	1319	218	2025-06-17	2025-10-21
32747	1517	404	2025-07-30	2025-10-24
32748	1958	493	2024-10-26	2025-10-30
32749	651	107	2025-01-14	2025-11-02
32750	1380	177	2025-04-17	2025-11-10
32751	1638	111	2024-10-22	2025-10-25
32752	555	487	2025-09-27	2025-10-31
32753	1380	331	2025-06-09	2025-10-22
32754	526	41	2025-09-08	2025-10-22
32755	1996	443	2025-08-06	2025-10-29
32756	1031	48	2025-08-02	2025-10-28
32757	1624	45	2025-08-08	2025-11-03
32758	76	48	2024-12-01	2025-10-24
32759	851	157	2025-02-27	2025-10-25
32760	973	108	2025-08-15	2025-10-23
32761	638	82	2025-03-23	2025-11-09
32762	926	25	2025-05-08	2025-11-06
32763	700	257	2025-08-30	2025-10-27
32764	791	75	2025-02-16	2025-11-04
32765	1895	390	2024-12-31	2025-10-23
32766	785	424	2024-11-29	2025-10-31
32767	913	86	2025-08-08	2025-11-01
32768	207	90	2024-10-24	2025-11-07
32769	1465	428	2024-11-26	2025-10-25
32770	123	300	2025-05-04	2025-11-04
32771	11	427	2025-02-02	2025-10-30
32772	1693	256	2025-04-15	2025-10-22
32773	1805	86	2025-04-21	2025-11-02
32774	1325	416	2025-08-18	2025-10-22
32775	109	172	2025-02-26	2025-10-21
32776	641	379	2025-09-24	2025-10-27
32777	124	120	2025-08-12	2025-10-28
32778	271	12	2025-09-01	2025-11-06
32779	806	229	2025-10-12	2025-11-03
32780	1294	80	2025-09-27	2025-10-30
32781	752	342	2025-07-16	2025-10-28
32782	1947	52	2025-03-03	2025-11-04
32783	609	126	2025-07-17	2025-10-21
32784	1724	339	2025-01-09	2025-10-24
32785	1225	352	2025-01-31	2025-10-27
32786	1700	24	2025-09-09	2025-11-08
32787	1595	403	2024-12-15	2025-10-23
32788	1190	115	2025-04-08	2025-11-02
32789	1568	220	2025-03-23	2025-10-31
32790	938	332	2025-09-30	2025-10-30
32791	441	329	2025-03-08	2025-11-09
32792	864	331	2025-02-28	2025-11-08
32793	514	370	2025-08-23	2025-11-01
32794	660	33	2025-06-23	2025-11-04
32795	1139	8	2024-11-13	2025-11-08
32796	911	105	2025-06-08	2025-10-31
32797	705	132	2025-08-10	2025-11-05
32798	466	453	2025-02-02	2025-10-25
32799	475	184	2025-01-01	2025-10-31
32800	1460	339	2024-12-18	2025-10-25
32801	1299	63	2025-09-23	2025-10-30
32802	6	89	2024-12-24	2025-11-07
32803	1871	147	2025-09-20	2025-10-22
32804	1122	202	2025-05-19	2025-11-06
32805	499	62	2025-01-17	2025-10-23
32806	303	204	2025-08-04	2025-10-21
32807	1176	204	2024-11-19	2025-10-25
32808	76	67	2025-03-28	2025-11-07
32809	8	448	2024-11-21	2025-10-24
32810	1862	400	2025-02-19	2025-10-27
32811	1267	123	2025-06-13	2025-11-08
32812	707	308	2025-04-07	2025-10-27
32813	981	133	2025-02-24	2025-10-27
32814	965	473	2025-07-26	2025-11-04
32815	1549	308	2025-03-01	2025-10-28
32816	366	61	2025-07-04	2025-10-27
32817	463	41	2025-02-27	2025-10-30
32818	1071	347	2025-05-16	2025-11-03
32819	1884	211	2025-04-22	2025-11-04
32820	1707	117	2025-02-19	2025-11-01
32821	1858	224	2025-09-14	2025-10-29
32822	652	417	2025-06-02	2025-11-08
32823	158	262	2024-11-12	2025-10-25
32824	1377	455	2025-01-03	2025-10-22
32825	1002	365	2025-07-10	2025-10-22
32826	904	415	2024-12-31	2025-11-09
32827	1497	382	2025-03-28	2025-10-25
32828	1212	246	2025-05-19	2025-11-10
32829	1497	119	2025-05-23	2025-10-23
32830	470	383	2024-11-11	2025-10-24
32831	408	336	2025-04-27	2025-11-09
32832	838	144	2025-10-06	2025-11-08
32833	51	243	2024-12-02	2025-10-30
32834	1015	218	2025-05-09	2025-10-28
32835	551	184	2025-01-15	2025-11-05
32836	261	298	2025-05-04	2025-10-31
32837	1245	390	2025-03-16	2025-10-29
32838	1175	70	2025-02-20	2025-11-04
32839	1540	82	2025-05-10	2025-11-06
32840	1641	357	2025-08-07	2025-10-23
32841	771	43	2025-08-26	2025-11-04
32842	596	251	2024-10-31	2025-11-07
32843	1676	118	2024-12-16	2025-11-10
32844	1784	203	2025-09-12	2025-10-30
32845	1325	213	2025-09-01	2025-11-07
32846	1487	230	2024-11-16	2025-11-01
32847	879	380	2025-09-29	2025-11-08
32848	1514	345	2025-07-01	2025-11-06
32849	1022	288	2025-05-25	2025-10-31
32850	588	304	2025-06-17	2025-10-24
32851	1985	460	2024-11-14	2025-10-22
32852	909	156	2025-08-22	2025-11-10
32853	1134	388	2024-11-30	2025-10-21
32854	891	205	2024-11-13	2025-10-24
32855	1046	261	2024-10-30	2025-11-01
32856	1296	495	2024-12-01	2025-10-27
32857	1984	378	2025-02-16	2025-11-03
32858	1334	215	2024-11-30	2025-11-07
32859	1033	299	2024-11-20	2025-11-02
32860	934	456	2025-05-05	2025-10-29
32861	1550	104	2025-07-24	2025-10-21
32862	695	488	2025-02-05	2025-11-03
32863	1401	178	2025-04-27	2025-10-23
32864	457	75	2025-07-20	2025-11-02
32865	1862	156	2025-10-07	2025-10-25
32866	1540	338	2025-08-23	2025-11-10
32867	1918	368	2025-10-11	2025-11-05
32868	150	465	2025-08-20	2025-10-30
32869	1305	249	2024-11-15	2025-10-23
32870	1069	374	2025-03-23	2025-11-10
32871	964	242	2025-07-11	2025-10-26
32872	1021	289	2024-10-25	2025-10-28
32873	1950	378	2025-09-06	2025-10-29
32874	813	368	2025-01-18	2025-11-07
32875	1806	102	2025-07-17	2025-10-30
32876	1690	39	2025-01-06	2025-10-30
32877	197	25	2025-03-20	2025-11-09
32878	1186	401	2025-05-07	2025-11-05
32879	1618	279	2025-01-12	2025-10-30
32880	1362	481	2025-06-09	2025-11-04
32881	703	354	2025-09-27	2025-10-26
32882	1502	343	2025-10-13	2025-10-22
32883	1227	407	2025-05-30	2025-11-03
32884	438	479	2025-07-19	2025-10-31
32885	146	370	2025-04-12	2025-11-06
32886	1859	173	2025-06-20	2025-11-05
32887	1215	399	2025-06-18	2025-11-06
32888	1000	49	2025-04-04	2025-10-23
32889	10	202	2025-05-12	2025-10-27
32890	585	69	2025-08-30	2025-10-28
32891	1080	126	2025-01-03	2025-10-23
32892	212	317	2025-01-17	2025-10-23
32893	1849	454	2024-11-05	2025-10-28
32894	390	476	2025-01-15	2025-11-03
32895	1404	72	2025-04-26	2025-10-29
32896	166	316	2024-12-15	2025-10-23
32897	781	175	2025-08-28	2025-11-02
32898	515	489	2025-04-16	2025-11-04
32899	548	86	2025-03-02	2025-10-24
32900	1421	224	2025-04-05	2025-11-08
32901	1895	101	2025-02-06	2025-10-29
32902	1240	56	2024-12-22	2025-11-03
32903	660	10	2025-02-14	2025-10-31
32904	329	264	2025-01-31	2025-11-02
32905	1287	447	2025-07-10	2025-11-10
32906	77	300	2025-01-17	2025-11-08
32907	1478	149	2025-10-12	2025-11-04
32908	1584	85	2024-11-09	2025-11-08
32909	1829	229	2025-09-30	2025-11-01
32910	1964	421	2025-06-07	2025-11-07
32911	157	484	2024-12-03	2025-11-07
32912	1678	15	2025-04-15	2025-10-23
32913	73	202	2025-01-15	2025-10-25
32914	1765	173	2025-04-24	2025-10-22
32915	1960	311	2025-08-17	2025-11-01
32916	1752	485	2025-06-19	2025-10-30
32917	1347	491	2025-07-08	2025-11-09
32918	1117	487	2024-10-27	2025-11-06
32919	1216	293	2025-06-07	2025-11-05
32920	1464	138	2025-05-12	2025-11-09
32921	1191	126	2025-05-12	2025-10-23
32922	373	409	2025-06-20	2025-11-07
32923	876	55	2025-05-03	2025-11-03
32924	1551	252	2025-02-09	2025-11-01
32925	681	169	2025-05-30	2025-10-30
32926	478	260	2025-01-20	2025-11-03
32927	1672	351	2025-04-08	2025-10-23
32928	1251	377	2025-02-03	2025-10-24
32929	153	349	2025-03-30	2025-10-30
32930	1138	257	2025-09-15	2025-11-02
32931	1740	274	2025-02-20	2025-11-08
32932	250	462	2025-09-17	2025-10-28
32933	154	36	2025-10-14	2025-11-02
32934	840	362	2025-04-21	2025-11-02
32935	264	152	2025-01-16	2025-11-08
32936	988	40	2025-07-04	2025-11-09
32937	667	251	2025-05-24	2025-11-06
32938	521	326	2025-04-01	2025-10-24
32939	1569	278	2025-01-23	2025-11-02
32940	1995	402	2025-10-07	2025-10-29
32941	192	219	2025-08-21	2025-10-27
32942	1596	215	2024-12-09	2025-11-05
32943	1863	261	2025-01-22	2025-10-21
32944	772	392	2025-07-30	2025-11-07
32945	396	96	2025-01-19	2025-11-10
32946	1830	1	2025-08-28	2025-10-30
32947	1742	20	2024-10-21	2025-11-03
32948	981	420	2024-12-23	2025-10-24
32949	1062	74	2025-06-04	2025-11-06
32950	1130	170	2024-12-26	2025-10-22
32951	1143	147	2024-11-06	2025-10-24
32952	1956	313	2025-01-06	2025-10-23
32953	1172	267	2024-11-27	2025-11-09
32954	1603	217	2025-04-11	2025-10-30
32955	825	197	2025-07-21	2025-10-23
32956	343	463	2025-07-06	2025-10-26
32957	1536	298	2025-04-11	2025-11-09
32958	839	244	2025-01-05	2025-10-27
32959	1773	236	2025-02-01	2025-11-04
32960	1706	172	2025-02-22	2025-11-01
32961	1494	208	2024-12-22	2025-10-31
32962	1288	317	2025-04-12	2025-11-06
32963	392	171	2025-09-22	2025-11-04
32964	1794	274	2024-12-26	2025-11-08
32965	1201	401	2025-01-01	2025-11-07
32966	278	98	2025-09-16	2025-11-03
32967	1180	85	2025-02-26	2025-11-06
32968	1497	458	2025-09-21	2025-11-09
32969	141	192	2025-03-19	2025-10-24
32970	35	91	2025-06-07	2025-11-06
32971	980	301	2025-02-02	2025-10-28
32972	1376	274	2024-10-26	2025-10-27
32973	1834	453	2025-02-20	2025-10-26
32974	1068	457	2025-03-02	2025-10-27
32975	599	51	2025-05-14	2025-10-27
32976	561	468	2025-04-22	2025-10-25
32977	779	90	2025-09-27	2025-10-26
32978	1958	284	2025-10-19	2025-10-25
32979	146	405	2025-01-14	2025-10-21
32980	293	184	2024-12-24	2025-10-24
32981	1286	198	2025-02-14	2025-11-06
32982	1106	315	2024-10-21	2025-10-26
32983	194	495	2025-02-12	2025-10-27
32984	909	346	2025-01-19	2025-10-22
32985	666	194	2024-11-15	2025-10-24
32986	1136	393	2025-04-08	2025-10-21
32987	433	132	2025-03-30	2025-11-06
32988	142	442	2025-07-04	2025-11-09
32989	419	443	2025-10-10	2025-10-26
32990	676	211	2025-03-31	2025-11-06
32991	159	216	2025-04-13	2025-10-22
32992	491	138	2024-10-28	2025-10-31
32993	1678	200	2025-07-06	2025-11-05
32994	53	325	2025-01-22	2025-10-22
32995	1095	118	2024-12-03	2025-11-04
32996	470	20	2025-02-14	2025-10-24
32997	1920	16	2024-11-27	2025-11-07
32998	1988	298	2024-12-03	2025-10-24
32999	331	252	2025-02-02	2025-10-28
33000	1377	294	2025-09-23	2025-10-29
33001	1045	344	2025-05-21	2025-10-24
33002	363	304	2024-10-24	2025-10-26
33003	1405	91	2025-10-05	2025-11-08
33004	1830	105	2025-01-21	2025-11-05
33005	265	391	2025-02-18	2025-11-07
33006	787	4	2024-11-27	2025-11-02
33007	355	74	2024-12-17	2025-11-10
33008	210	140	2025-08-21	2025-10-26
33009	571	326	2025-01-20	2025-10-25
33010	544	166	2025-09-30	2025-11-06
33011	1163	275	2025-09-27	2025-11-08
33012	747	7	2025-07-26	2025-10-26
33013	724	368	2024-10-30	2025-11-02
33014	1195	485	2025-10-04	2025-11-03
33015	1728	363	2025-06-05	2025-10-26
33016	462	422	2025-07-25	2025-11-09
33017	147	259	2024-11-17	2025-10-24
33018	97	475	2025-10-17	2025-10-24
33019	1948	156	2025-06-06	2025-11-04
33020	671	309	2024-11-10	2025-11-01
33021	1779	146	2025-01-15	2025-10-27
33022	1589	482	2025-01-22	2025-11-08
33023	28	397	2025-09-27	2025-11-09
33024	447	253	2025-08-15	2025-11-08
33025	691	264	2025-04-02	2025-10-28
33026	1741	229	2024-11-01	2025-11-09
33027	363	198	2025-06-24	2025-10-28
33028	1345	174	2025-08-14	2025-11-05
33029	515	114	2025-01-28	2025-11-01
33030	42	77	2025-07-13	2025-11-08
33031	1065	435	2025-04-08	2025-11-02
33032	1374	341	2025-01-23	2025-11-03
33033	528	210	2024-12-12	2025-11-06
33034	1558	216	2024-12-08	2025-10-28
33035	650	200	2025-03-18	2025-11-01
33036	1817	189	2025-07-04	2025-11-08
33037	1876	201	2025-09-22	2025-10-26
33038	1788	324	2025-09-12	2025-10-26
33039	6	16	2025-03-13	2025-11-05
33040	63	274	2025-04-22	2025-11-03
33041	948	231	2025-04-23	2025-10-31
33042	1581	143	2025-01-04	2025-11-01
33043	102	148	2025-01-08	2025-11-01
33044	1973	400	2025-08-07	2025-10-30
33045	754	441	2025-02-07	2025-10-21
33046	1961	188	2025-01-30	2025-10-21
33047	1529	177	2025-04-16	2025-11-04
33048	1528	36	2025-10-01	2025-10-31
33049	648	63	2024-11-02	2025-10-29
33050	852	209	2025-04-03	2025-11-08
33051	1079	118	2025-01-30	2025-11-01
33052	1868	182	2025-01-23	2025-10-30
33053	778	72	2025-05-10	2025-11-03
33054	1890	153	2025-07-07	2025-10-22
33055	1792	197	2024-11-02	2025-11-08
33056	503	31	2025-09-25	2025-11-06
33057	1946	345	2025-03-15	2025-10-23
33058	1464	109	2024-12-10	2025-11-05
33059	1177	160	2025-01-17	2025-10-26
33060	1256	47	2025-08-25	2025-11-07
33061	1007	277	2025-09-28	2025-11-02
33062	1108	22	2025-04-19	2025-10-29
33063	1929	213	2025-08-19	2025-11-02
33064	1038	323	2025-04-27	2025-10-30
33065	1206	61	2025-07-15	2025-10-22
33066	1671	281	2025-07-12	2025-10-27
33067	525	214	2025-04-11	2025-11-09
33068	457	257	2025-02-01	2025-10-31
33069	554	422	2025-08-21	2025-10-25
33070	947	24	2024-11-01	2025-11-09
33071	1533	82	2025-05-25	2025-10-23
33072	1540	128	2025-09-01	2025-10-31
33073	1782	94	2025-07-02	2025-10-27
33074	1354	37	2025-10-19	2025-10-28
33075	1031	114	2024-12-03	2025-11-01
33076	744	270	2025-03-29	2025-10-26
33077	1774	298	2025-04-29	2025-11-09
33078	407	407	2025-05-07	2025-10-24
33079	1600	258	2024-11-16	2025-11-07
33080	291	388	2025-07-28	2025-10-30
33081	1583	70	2025-06-24	2025-11-01
33082	733	85	2025-03-24	2025-10-25
33083	665	266	2025-06-07	2025-11-04
33084	1452	45	2025-06-04	2025-11-03
33085	209	395	2025-07-19	2025-10-28
33086	359	192	2024-12-20	2025-10-28
33087	522	267	2025-01-27	2025-11-06
33088	651	392	2025-01-20	2025-10-28
33089	870	317	2025-04-15	2025-10-26
33090	1453	274	2025-04-30	2025-11-02
33091	1770	4	2024-12-30	2025-10-25
33092	1247	491	2025-01-06	2025-10-27
33093	835	143	2025-05-27	2025-10-25
33094	540	451	2025-05-10	2025-11-03
33095	1563	106	2025-07-12	2025-10-21
33096	1258	279	2024-11-23	2025-10-28
33097	986	274	2025-02-03	2025-11-04
33098	319	133	2025-03-18	2025-11-04
33099	1749	269	2025-05-17	2025-10-30
33100	472	285	2024-11-18	2025-11-02
33101	1351	193	2025-09-30	2025-11-05
33102	417	440	2024-11-27	2025-11-01
33103	143	467	2025-03-05	2025-11-06
33104	313	351	2025-06-20	2025-11-09
33105	715	376	2025-04-25	2025-11-08
33106	267	326	2025-10-11	2025-11-07
33107	33	4	2025-06-16	2025-10-29
33108	1235	15	2025-08-18	2025-11-05
33109	492	372	2025-02-10	2025-11-02
33110	202	355	2025-07-07	2025-11-01
33111	1160	333	2025-03-26	2025-11-09
33112	1156	219	2025-05-24	2025-11-02
33113	1001	496	2025-04-01	2025-10-26
33114	726	488	2025-05-11	2025-11-08
33115	1377	18	2025-04-26	2025-11-08
33116	430	122	2024-11-10	2025-11-03
33117	713	420	2025-01-22	2025-11-09
33118	1311	326	2025-08-05	2025-10-29
33119	1745	133	2025-03-06	2025-10-25
33120	1582	351	2025-09-12	2025-11-06
33121	1799	487	2025-02-12	2025-11-04
33122	611	209	2025-08-16	2025-11-09
33123	1939	197	2024-11-27	2025-10-24
33124	943	81	2024-11-08	2025-11-09
33125	862	291	2025-07-17	2025-10-27
33126	614	221	2025-03-20	2025-11-04
33127	1111	113	2025-05-08	2025-10-23
33128	1944	27	2025-09-18	2025-11-01
33129	1981	174	2024-11-08	2025-11-03
33130	625	141	2024-10-23	2025-10-29
33131	1069	207	2025-07-05	2025-10-29
33132	652	298	2025-07-24	2025-10-26
33133	1064	91	2025-09-16	2025-10-29
33134	1066	82	2024-11-07	2025-11-09
33135	1656	395	2024-11-23	2025-10-21
33136	1790	135	2025-07-22	2025-11-07
33137	852	103	2025-02-11	2025-11-05
33138	1923	13	2024-10-23	2025-10-28
33139	190	102	2025-03-08	2025-10-23
33140	1782	44	2025-07-20	2025-11-04
33141	1284	424	2025-04-04	2025-11-02
33142	1981	298	2025-05-30	2025-11-09
33143	754	302	2024-12-26	2025-11-02
33144	852	191	2024-11-16	2025-11-03
33145	1257	473	2025-10-20	2025-11-04
33146	639	18	2025-01-21	2025-10-21
33147	1609	151	2024-12-14	2025-10-25
33148	204	96	2024-11-30	2025-11-10
33149	303	448	2025-01-08	2025-10-28
33150	251	99	2025-10-04	2025-10-27
33151	654	241	2024-12-29	2025-10-24
33152	610	362	2025-01-31	2025-10-22
33153	1999	434	2024-11-18	2025-11-07
33154	1312	149	2025-10-05	2025-11-04
33155	51	327	2024-12-19	2025-10-30
33156	891	354	2025-03-22	2025-10-29
33157	977	185	2024-11-12	2025-10-27
33158	1019	422	2025-07-05	2025-11-01
33159	191	89	2025-04-06	2025-10-22
33160	1649	293	2025-07-27	2025-10-23
33161	534	426	2025-01-27	2025-10-30
33162	1043	304	2025-09-23	2025-10-28
33163	1890	193	2025-04-14	2025-11-07
33164	540	224	2025-02-04	2025-11-07
33165	593	210	2025-09-02	2025-11-09
33166	1936	7	2025-02-19	2025-11-07
33167	1813	234	2025-01-28	2025-11-07
33168	1454	56	2025-09-07	2025-10-29
33169	1552	460	2025-08-19	2025-11-04
33170	722	464	2025-02-23	2025-11-02
33171	1835	150	2025-04-24	2025-10-28
33172	583	261	2024-11-09	2025-11-07
33173	71	155	2025-02-03	2025-11-09
33174	492	291	2025-10-11	2025-11-08
33175	348	493	2024-11-29	2025-11-10
33176	992	269	2025-10-07	2025-11-05
33177	180	259	2025-07-16	2025-11-07
33178	1180	40	2025-02-21	2025-11-09
33179	404	126	2025-09-20	2025-10-25
33180	863	128	2025-07-28	2025-10-24
33181	650	172	2025-09-17	2025-10-23
33182	1055	399	2025-10-20	2025-10-28
33183	454	427	2025-02-05	2025-11-04
33184	168	231	2025-03-29	2025-11-03
33185	1154	404	2024-11-24	2025-11-08
33186	199	497	2025-04-22	2025-11-09
33187	1181	373	2025-03-26	2025-11-02
33188	1999	45	2024-11-15	2025-10-31
33189	1578	199	2025-07-19	2025-10-29
33190	804	154	2025-04-07	2025-10-25
33191	1214	237	2024-11-24	2025-11-09
33192	1842	460	2025-04-16	2025-11-04
33193	245	238	2025-03-31	2025-10-25
33194	1210	78	2025-03-07	2025-11-06
33195	198	176	2025-07-12	2025-10-22
33196	430	173	2025-03-07	2025-11-02
33197	1451	226	2025-09-05	2025-11-06
33198	1037	283	2025-06-12	2025-10-27
33199	759	354	2025-04-19	2025-10-22
33200	1	433	2025-02-20	2025-10-28
33201	750	248	2025-04-30	2025-11-08
33202	1746	417	2025-07-25	2025-10-27
33203	1311	284	2024-12-26	2025-10-26
33204	83	121	2024-11-27	2025-10-24
33205	1334	286	2025-07-11	2025-11-10
33206	509	468	2025-07-07	2025-10-21
33207	766	49	2025-07-26	2025-11-05
33208	1951	81	2025-10-18	2025-11-01
33209	1238	342	2024-12-31	2025-11-02
33210	366	296	2025-07-19	2025-10-27
33211	369	176	2025-03-12	2025-10-22
33212	768	61	2025-02-21	2025-10-30
33213	545	102	2024-12-23	2025-10-29
33214	239	145	2025-08-30	2025-11-08
33215	1358	171	2025-05-03	2025-11-09
33216	1288	384	2024-11-18	2025-11-04
33217	1934	419	2025-08-19	2025-11-02
33218	1000	252	2025-09-23	2025-10-22
33219	1171	390	2025-03-23	2025-10-28
33220	812	305	2024-11-03	2025-11-09
33221	857	345	2025-05-22	2025-10-27
33222	488	292	2025-01-20	2025-10-24
33223	1621	403	2025-07-08	2025-11-06
33224	1540	25	2025-02-10	2025-11-03
33225	1653	341	2025-07-04	2025-11-06
33226	898	250	2024-12-05	2025-10-22
33227	598	204	2025-03-23	2025-11-02
33228	1962	321	2025-04-15	2025-10-22
33229	584	144	2025-06-12	2025-11-04
33230	1629	198	2025-02-06	2025-10-29
33231	908	251	2025-02-12	2025-11-07
33232	8	371	2025-02-24	2025-10-27
33233	120	370	2025-09-01	2025-10-25
33234	923	451	2025-08-04	2025-11-01
33235	1474	244	2025-02-15	2025-10-22
33236	1554	208	2025-09-04	2025-11-04
33237	658	93	2025-01-23	2025-11-05
33238	1016	334	2025-09-11	2025-10-29
33239	290	342	2025-04-04	2025-10-26
33240	1871	173	2025-08-04	2025-11-07
33241	1202	182	2025-07-30	2025-10-22
33242	1174	281	2024-12-28	2025-11-04
33243	1717	222	2025-08-03	2025-10-30
33244	170	456	2025-10-01	2025-11-04
33245	1183	375	2024-11-23	2025-10-22
33246	1810	362	2025-10-08	2025-10-25
33247	255	365	2024-11-29	2025-11-08
33248	1038	371	2025-10-15	2025-11-04
33249	1764	26	2025-03-25	2025-11-09
33250	555	117	2025-05-30	2025-11-10
33251	1547	309	2025-03-02	2025-11-07
33252	718	9	2025-02-24	2025-11-06
33253	1451	383	2025-08-26	2025-10-28
33254	738	354	2025-02-17	2025-11-02
33255	587	268	2025-02-04	2025-10-24
33256	1137	455	2025-10-04	2025-11-02
33257	88	78	2024-10-25	2025-10-30
33258	1271	496	2025-08-20	2025-11-04
33259	909	377	2025-10-14	2025-10-22
33260	372	1	2024-12-31	2025-10-29
33261	1567	351	2025-10-04	2025-10-30
33262	236	231	2025-08-15	2025-10-25
33263	345	255	2025-06-14	2025-11-08
33264	1393	161	2025-09-04	2025-10-22
33265	1758	315	2025-05-16	2025-11-09
33266	1250	78	2024-11-04	2025-10-29
33267	1451	20	2025-03-22	2025-10-23
33268	821	391	2025-05-15	2025-10-26
33269	402	65	2025-02-25	2025-11-01
33270	582	438	2024-10-29	2025-11-01
33271	888	15	2025-01-30	2025-10-28
33272	648	414	2025-01-01	2025-11-10
33273	1191	183	2025-02-28	2025-10-23
33274	1966	83	2025-08-28	2025-11-09
33275	1775	13	2025-10-21	2025-10-25
33276	1519	434	2025-01-12	2025-10-25
33277	688	15	2025-04-03	2025-11-06
33278	285	282	2025-01-18	2025-11-05
33279	1371	268	2025-05-16	2025-10-26
33280	991	327	2024-11-24	2025-10-27
33281	33	379	2025-09-21	2025-10-29
33282	190	305	2025-04-05	2025-11-05
33283	1471	13	2025-08-26	2025-10-31
33284	1675	400	2025-01-19	2025-11-01
33285	1551	287	2025-10-14	2025-10-24
33286	1397	275	2025-02-15	2025-11-04
33287	755	235	2025-04-05	2025-10-24
33288	341	493	2025-03-03	2025-10-27
33289	1415	319	2025-03-01	2025-11-04
33290	106	491	2025-03-06	2025-11-04
33291	1921	35	2025-05-24	2025-11-08
33292	829	124	2025-06-05	2025-10-26
33293	738	438	2025-08-19	2025-10-29
33294	1647	331	2025-02-12	2025-11-04
33295	384	152	2024-12-11	2025-10-31
33296	1779	413	2024-12-17	2025-10-22
33297	258	245	2025-03-20	2025-10-21
33298	1841	316	2025-01-30	2025-11-07
33299	680	441	2025-02-12	2025-11-09
33300	1074	419	2025-05-29	2025-11-03
33301	356	16	2025-03-27	2025-10-23
33302	37	324	2025-07-28	2025-10-31
33303	1088	120	2025-05-15	2025-11-08
33304	206	332	2025-10-06	2025-10-21
33305	1129	17	2025-05-29	2025-11-07
33306	1147	154	2025-05-17	2025-10-29
33307	767	497	2025-06-26	2025-11-05
33308	1218	196	2024-11-27	2025-11-02
33309	1148	475	2025-04-25	2025-11-02
33310	326	420	2025-10-10	2025-11-03
33311	1035	242	2024-12-05	2025-11-05
33312	1571	138	2024-10-25	2025-10-24
33313	1682	217	2025-05-18	2025-11-06
33314	1351	380	2025-04-30	2025-11-04
33315	396	320	2025-03-22	2025-10-24
33316	1909	421	2025-06-15	2025-10-22
33317	641	320	2025-05-19	2025-11-03
33318	636	453	2025-04-24	2025-10-24
33319	1895	371	2025-03-10	2025-10-30
33320	1225	295	2025-09-19	2025-10-31
33321	835	47	2025-10-15	2025-10-30
33322	1384	423	2025-02-17	2025-11-04
33323	261	444	2025-09-08	2025-10-29
33324	1782	147	2025-03-02	2025-10-31
33325	959	18	2025-05-19	2025-10-23
33326	1962	262	2025-05-02	2025-10-23
33327	955	286	2025-07-05	2025-11-03
33328	220	430	2025-06-05	2025-11-05
33329	614	128	2025-07-03	2025-11-03
33330	1120	257	2025-09-13	2025-11-01
33331	769	76	2025-07-28	2025-10-28
33332	1818	218	2024-11-12	2025-10-26
33333	325	403	2025-05-10	2025-11-05
33334	1426	490	2025-09-05	2025-10-26
33335	1758	369	2025-01-13	2025-11-07
33336	1917	351	2025-08-23	2025-10-24
33337	452	388	2024-12-02	2025-11-02
33338	1686	57	2025-01-21	2025-10-21
33339	1117	417	2025-08-01	2025-10-30
33340	1363	374	2025-06-01	2025-10-26
33341	332	345	2025-07-30	2025-11-09
33342	1305	241	2024-12-07	2025-11-02
33343	1641	4	2025-07-12	2025-11-08
33344	391	382	2025-04-06	2025-11-04
33345	1298	148	2024-12-04	2025-11-02
33346	1350	386	2024-12-29	2025-11-08
33347	623	252	2025-05-25	2025-10-31
33348	1181	491	2025-05-20	2025-11-04
33349	1936	376	2025-01-01	2025-10-30
33350	936	263	2025-06-22	2025-11-10
33351	199	479	2025-04-03	2025-10-25
33352	573	337	2025-02-09	2025-11-09
33353	554	99	2025-10-12	2025-10-27
33354	538	62	2025-10-19	2025-10-22
33355	1265	92	2025-10-05	2025-10-27
33356	823	275	2025-04-06	2025-11-06
33357	1947	417	2024-12-03	2025-10-22
33358	1196	27	2025-06-08	2025-11-08
33359	862	21	2024-11-29	2025-11-07
33360	1943	114	2025-08-23	2025-11-08
33361	490	289	2025-01-04	2025-10-29
33362	705	221	2024-11-13	2025-10-24
33363	1163	418	2025-04-06	2025-10-25
33364	1338	91	2025-09-14	2025-11-09
33365	1140	267	2025-02-13	2025-11-08
33366	715	63	2024-12-21	2025-10-31
33367	1528	373	2025-03-30	2025-10-26
33368	1398	125	2025-06-20	2025-11-04
33369	1779	394	2025-01-11	2025-11-02
33370	1208	346	2024-11-17	2025-10-31
33371	657	228	2025-09-10	2025-11-06
33372	1989	108	2024-12-29	2025-10-21
33373	527	24	2025-03-26	2025-10-25
33374	711	158	2025-04-22	2025-10-29
33375	1732	348	2024-12-25	2025-10-23
33376	1725	287	2025-03-29	2025-10-21
33377	1833	277	2024-10-31	2025-10-30
33378	1900	131	2025-08-02	2025-11-06
33379	275	270	2025-08-19	2025-11-01
33380	176	194	2024-12-15	2025-10-28
33381	977	233	2024-11-04	2025-10-25
33382	1275	161	2025-08-31	2025-11-04
33383	1801	417	2025-02-07	2025-10-24
33384	1361	226	2024-12-13	2025-10-21
33385	1437	48	2025-09-13	2025-10-31
33386	1610	44	2025-03-20	2025-11-03
33387	1655	287	2025-04-11	2025-10-23
33388	1819	459	2025-01-23	2025-10-30
33389	732	254	2025-06-14	2025-10-27
33390	1764	84	2025-08-02	2025-11-08
33391	101	228	2025-09-15	2025-10-30
33392	255	31	2024-10-27	2025-11-04
33393	822	165	2025-06-24	2025-10-25
33394	1218	269	2024-11-02	2025-10-31
33395	1916	496	2025-07-08	2025-11-06
33396	109	194	2025-02-23	2025-10-30
33397	730	260	2025-01-27	2025-11-01
33398	1447	218	2025-10-01	2025-11-02
33399	71	485	2025-07-15	2025-11-01
33400	815	160	2025-06-16	2025-10-29
33401	308	88	2025-03-28	2025-10-26
33402	1162	69	2024-11-22	2025-10-24
33403	481	480	2025-01-19	2025-10-25
33404	1359	118	2025-03-05	2025-11-04
33405	1990	19	2025-08-29	2025-11-01
33406	934	236	2025-09-11	2025-11-05
33407	109	221	2024-10-23	2025-11-05
33408	1284	263	2025-01-14	2025-10-26
33409	217	179	2025-06-02	2025-11-09
33410	1331	247	2025-09-22	2025-10-27
33411	143	431	2025-05-20	2025-11-07
33412	100	99	2025-03-02	2025-11-04
33413	1973	379	2025-10-01	2025-11-08
33414	1180	361	2025-05-23	2025-11-07
33415	1083	42	2024-11-03	2025-10-24
33416	1487	465	2024-11-14	2025-10-24
33417	1216	352	2025-05-11	2025-11-01
33418	1879	71	2025-08-27	2025-11-03
33419	120	147	2025-02-09	2025-11-05
33420	1339	382	2025-05-23	2025-10-24
33421	1120	325	2025-09-21	2025-10-25
33422	428	403	2025-03-17	2025-10-25
33423	1601	302	2025-07-13	2025-11-07
33424	1842	236	2025-01-09	2025-10-30
33425	1586	26	2025-01-24	2025-10-31
33426	62	370	2024-12-02	2025-10-24
33427	472	280	2025-10-05	2025-10-22
33428	1523	500	2025-10-06	2025-11-08
33429	1494	44	2025-09-28	2025-10-27
33430	835	80	2024-12-13	2025-11-07
33431	1740	62	2025-04-18	2025-11-01
33432	1514	499	2024-11-01	2025-10-21
33433	1552	119	2025-08-14	2025-10-27
33434	309	479	2025-07-24	2025-10-22
33435	1738	24	2024-12-02	2025-10-27
33436	924	192	2025-04-22	2025-11-05
33437	1140	113	2025-02-21	2025-11-04
33438	1367	1	2025-10-08	2025-10-29
33439	1397	281	2025-03-18	2025-11-06
33440	1330	201	2025-06-06	2025-10-29
33441	668	202	2025-07-29	2025-11-03
33442	1285	400	2025-03-13	2025-11-02
33443	647	42	2025-01-10	2025-11-06
33444	976	445	2025-08-11	2025-11-10
33445	67	83	2025-08-19	2025-11-09
33446	1018	91	2024-10-22	2025-10-29
33447	1357	375	2024-12-09	2025-11-04
33448	1326	166	2025-03-10	2025-10-31
33449	848	63	2025-02-28	2025-11-03
33450	853	105	2025-10-19	2025-10-24
33451	1460	167	2025-03-04	2025-10-27
33452	1699	213	2025-05-05	2025-11-01
33453	572	310	2025-03-07	2025-11-01
33454	130	486	2025-04-11	2025-11-04
33455	1943	263	2025-07-21	2025-11-06
33456	1333	426	2025-06-25	2025-11-01
33457	1427	454	2024-12-26	2025-10-28
33458	1798	105	2025-06-03	2025-10-22
33459	1812	260	2025-04-14	2025-10-31
33460	1969	12	2025-09-29	2025-10-23
33461	553	130	2025-08-11	2025-11-08
33462	1631	461	2025-01-09	2025-11-01
33463	1280	248	2024-10-25	2025-11-04
33464	862	143	2025-07-31	2025-10-27
33465	391	332	2025-05-10	2025-11-07
33466	87	105	2025-09-25	2025-10-21
33467	516	193	2024-11-24	2025-10-26
33468	536	66	2025-04-12	2025-11-05
33469	237	383	2025-01-19	2025-10-28
33470	1465	137	2025-01-10	2025-10-31
33471	1318	75	2025-09-14	2025-10-30
33472	1027	192	2025-05-01	2025-10-26
33473	828	483	2025-01-25	2025-11-04
33474	409	250	2025-02-17	2025-11-09
33475	939	471	2025-04-28	2025-11-05
33476	47	459	2025-03-23	2025-11-05
33477	529	440	2024-12-19	2025-11-10
33478	1765	37	2025-01-10	2025-10-24
33479	1237	352	2025-04-16	2025-10-31
33480	1526	290	2025-04-03	2025-10-29
33481	398	259	2025-08-05	2025-10-29
33482	602	256	2024-11-09	2025-10-27
33483	416	468	2024-12-03	2025-10-31
33484	200	337	2025-02-09	2025-11-01
33485	1942	325	2025-09-20	2025-10-23
33486	505	264	2025-07-29	2025-10-24
33487	1942	65	2025-06-11	2025-10-31
33488	322	350	2025-02-02	2025-11-09
33489	1694	90	2025-01-30	2025-11-08
33490	1027	356	2025-01-03	2025-11-01
33491	1175	500	2025-02-05	2025-11-08
33492	1786	258	2024-12-26	2025-10-27
33493	1697	344	2025-01-20	2025-11-06
33494	411	268	2025-03-31	2025-11-04
33495	1564	98	2025-10-14	2025-11-02
33496	269	309	2025-09-26	2025-10-27
33497	86	154	2025-03-16	2025-10-31
33498	1310	245	2025-08-03	2025-11-09
33499	157	115	2025-07-26	2025-10-28
33500	962	23	2025-07-26	2025-10-31
33501	1630	483	2025-08-07	2025-10-30
33502	168	113	2024-10-29	2025-11-09
33503	951	88	2025-01-27	2025-10-22
33504	1283	304	2025-05-21	2025-10-22
33505	1771	76	2025-02-22	2025-10-22
33506	755	387	2025-10-08	2025-10-28
33507	444	163	2024-12-05	2025-10-22
33508	1078	405	2024-11-13	2025-11-07
33509	1446	39	2025-05-18	2025-11-09
33510	544	122	2025-01-19	2025-11-03
33511	1557	116	2025-06-24	2025-10-27
33512	1032	195	2025-07-22	2025-10-24
33513	1846	425	2025-02-23	2025-10-22
33514	719	316	2025-03-10	2025-10-26
33515	1036	480	2025-03-14	2025-10-26
33516	1284	321	2025-02-19	2025-11-01
33517	679	468	2025-07-20	2025-11-03
33518	270	19	2025-01-30	2025-10-26
33519	256	124	2025-07-28	2025-11-02
33520	1760	156	2025-04-07	2025-11-04
33521	1543	94	2025-02-22	2025-11-09
33522	200	471	2025-07-16	2025-11-06
33523	1218	249	2025-01-11	2025-10-22
33524	1939	24	2025-08-08	2025-11-01
33525	1278	204	2025-07-20	2025-10-28
33526	142	196	2025-08-18	2025-10-30
33527	619	161	2024-12-31	2025-11-01
33528	778	146	2025-03-07	2025-11-09
33529	1428	111	2024-11-06	2025-10-31
33530	661	126	2025-02-19	2025-11-09
33531	1694	354	2025-04-17	2025-10-24
33532	510	253	2025-06-27	2025-11-03
33533	1153	412	2025-08-31	2025-10-23
33534	404	496	2025-06-29	2025-11-01
33535	73	137	2025-08-06	2025-10-25
33536	161	110	2024-10-30	2025-10-21
33537	206	169	2025-05-08	2025-10-28
33538	1096	416	2025-05-04	2025-11-03
33539	228	368	2025-03-22	2025-10-21
33540	952	269	2025-01-22	2025-11-02
33541	1739	390	2025-06-30	2025-11-05
33542	1944	337	2025-10-08	2025-10-28
33543	1904	59	2025-09-21	2025-11-04
33544	1025	255	2025-07-05	2025-11-02
33545	1674	443	2025-04-12	2025-10-29
33546	389	116	2024-12-08	2025-10-30
33547	427	42	2024-11-12	2025-10-31
33548	588	259	2025-02-12	2025-11-04
33549	1175	376	2024-12-15	2025-11-05
33550	1100	192	2025-02-01	2025-10-31
33551	361	60	2024-11-27	2025-10-26
33552	5	292	2025-05-29	2025-11-05
33553	962	111	2025-02-23	2025-10-22
33554	415	151	2025-04-21	2025-10-23
33555	1205	432	2025-10-07	2025-10-23
33556	1850	378	2024-10-28	2025-10-29
33557	1573	212	2025-04-15	2025-10-25
33558	985	14	2025-01-03	2025-10-30
33559	1690	156	2025-08-22	2025-10-25
33560	1583	310	2025-09-30	2025-10-21
33561	1890	129	2025-01-31	2025-10-21
33562	1779	132	2025-02-07	2025-11-07
33563	966	324	2025-07-16	2025-11-08
33564	159	24	2025-02-22	2025-10-27
33565	456	122	2025-03-10	2025-10-28
33566	1166	426	2025-06-21	2025-10-23
33567	1162	348	2025-04-12	2025-10-30
33568	609	341	2025-06-14	2025-10-26
33569	1721	404	2025-03-25	2025-10-30
33570	445	337	2024-12-02	2025-10-28
33571	751	100	2025-10-18	2025-10-28
33572	30	499	2024-12-11	2025-10-23
33573	307	25	2025-09-16	2025-10-30
33574	877	254	2025-03-18	2025-10-28
33575	275	101	2024-12-27	2025-11-01
33576	1274	75	2025-06-14	2025-11-04
33577	1627	365	2025-09-14	2025-10-26
33578	986	457	2025-08-12	2025-11-09
33579	1410	191	2024-12-10	2025-10-27
33580	1008	276	2024-11-10	2025-10-31
33581	301	230	2025-04-17	2025-10-23
33582	236	163	2025-07-03	2025-11-03
33583	1383	122	2025-03-09	2025-11-10
33584	1410	154	2025-10-14	2025-11-02
33585	1613	129	2025-05-30	2025-10-22
33586	554	178	2025-06-22	2025-10-25
33587	377	96	2025-07-25	2025-10-29
33588	1427	258	2025-08-03	2025-10-30
33589	1567	228	2025-07-09	2025-11-05
33590	836	28	2025-07-23	2025-10-21
33591	685	210	2025-09-06	2025-11-10
33592	747	82	2025-05-22	2025-10-28
33593	1310	262	2025-05-12	2025-10-31
33594	1988	8	2024-11-28	2025-11-03
33595	1023	136	2025-04-22	2025-11-05
33596	694	129	2024-11-16	2025-11-06
33597	622	378	2025-05-23	2025-10-24
33598	1605	47	2025-01-14	2025-10-29
33599	1997	291	2025-06-04	2025-10-31
33600	1828	368	2025-03-18	2025-10-28
33601	172	364	2025-03-07	2025-10-31
33602	1980	207	2024-12-11	2025-10-29
33603	1268	259	2025-07-14	2025-10-31
33604	852	412	2025-03-31	2025-10-24
33605	1877	97	2025-07-28	2025-11-07
33606	982	96	2024-12-16	2025-11-08
33607	59	32	2025-08-28	2025-10-30
33608	1816	352	2025-02-12	2025-10-28
33609	850	320	2025-07-06	2025-10-27
33610	1219	116	2025-01-23	2025-11-03
33611	505	299	2025-04-01	2025-11-03
33612	1951	469	2025-06-27	2025-10-27
33613	89	284	2025-03-14	2025-11-07
33614	1710	109	2024-12-25	2025-11-06
33615	83	430	2025-08-08	2025-11-01
33616	281	205	2025-09-10	2025-11-01
33617	1506	341	2025-03-20	2025-10-24
33618	779	320	2025-08-10	2025-10-26
33619	845	65	2025-04-14	2025-11-05
33620	837	340	2025-02-19	2025-10-23
33621	487	271	2025-06-30	2025-10-21
33622	1885	358	2025-10-02	2025-10-27
33623	1311	268	2025-06-05	2025-10-26
33624	401	40	2025-05-22	2025-11-03
33625	1912	130	2025-10-03	2025-11-09
33626	1844	38	2024-12-25	2025-11-02
33627	1997	302	2025-06-07	2025-11-05
33628	792	79	2025-08-27	2025-11-02
33629	304	495	2025-10-15	2025-11-09
33630	741	355	2025-01-31	2025-10-30
33631	135	268	2025-04-16	2025-10-28
33632	390	490	2025-08-15	2025-11-05
33633	1823	214	2025-03-03	2025-10-31
33634	1058	429	2025-06-29	2025-11-06
33635	1411	330	2025-09-22	2025-10-30
33636	537	177	2025-02-15	2025-11-01
33637	1127	462	2025-03-20	2025-11-05
33638	753	120	2025-01-23	2025-10-24
33639	142	251	2025-06-04	2025-10-23
33640	1617	302	2024-11-03	2025-11-05
33641	362	197	2025-08-02	2025-11-09
33642	769	88	2024-11-02	2025-11-06
33643	1507	466	2024-11-18	2025-11-06
33644	823	78	2025-04-29	2025-11-02
33645	145	233	2025-04-12	2025-11-07
33646	1411	358	2025-10-09	2025-11-10
33647	95	282	2025-06-04	2025-10-22
33648	121	207	2025-02-21	2025-11-03
33649	894	388	2025-01-27	2025-11-02
33650	1238	273	2025-05-25	2025-11-02
33651	1369	320	2025-04-13	2025-11-10
33652	338	462	2025-01-20	2025-10-26
33653	1863	303	2024-12-16	2025-10-25
33654	158	225	2025-07-27	2025-10-26
33655	1232	63	2025-06-26	2025-10-30
33656	1295	326	2025-05-07	2025-10-26
33657	510	455	2025-02-18	2025-10-26
33658	1277	367	2025-04-21	2025-10-31
33659	1318	422	2025-05-18	2025-11-08
33660	210	152	2025-10-20	2025-10-30
33661	726	425	2025-03-14	2025-10-29
33662	414	61	2025-06-29	2025-11-01
33663	1607	415	2024-11-04	2025-10-30
33664	1034	77	2025-03-27	2025-10-26
33665	238	96	2024-12-08	2025-10-24
33666	1672	100	2025-07-29	2025-11-08
33667	1933	259	2025-02-23	2025-10-27
33668	1715	198	2024-11-10	2025-11-06
33669	260	106	2025-01-10	2025-10-30
33670	1106	16	2025-06-03	2025-11-03
33671	83	147	2024-12-27	2025-11-07
33672	9	393	2025-05-13	2025-11-03
33673	275	305	2025-05-08	2025-10-24
33674	1913	242	2025-07-01	2025-11-06
33675	1050	383	2025-02-06	2025-10-25
33676	1320	353	2025-10-08	2025-11-02
33677	1450	484	2025-08-14	2025-11-10
33678	898	58	2025-10-04	2025-11-07
33679	1586	276	2025-05-18	2025-10-26
33680	902	21	2024-11-19	2025-10-30
33681	462	491	2025-06-08	2025-10-31
33682	205	179	2025-06-12	2025-11-06
33683	334	348	2024-11-15	2025-10-22
33684	1831	461	2024-11-30	2025-10-23
33685	817	430	2025-05-11	2025-11-02
33686	691	188	2025-10-04	2025-11-03
33687	1970	357	2025-09-29	2025-10-22
33688	1899	177	2024-12-28	2025-10-22
33689	1243	314	2025-06-21	2025-11-07
33690	1772	67	2025-09-09	2025-11-06
33691	505	237	2025-07-11	2025-11-04
33692	942	67	2025-06-30	2025-10-29
33693	612	472	2025-05-02	2025-10-31
33694	418	423	2025-08-12	2025-11-03
33695	349	171	2025-04-12	2025-10-26
33696	315	307	2025-03-29	2025-11-02
33697	1442	200	2024-11-05	2025-10-26
33698	1882	418	2025-02-22	2025-10-26
33699	1127	420	2025-06-11	2025-10-31
33700	281	400	2024-12-07	2025-10-24
33701	485	253	2025-01-23	2025-11-07
33702	1986	38	2025-09-06	2025-10-30
33703	741	320	2025-10-19	2025-11-01
33704	753	210	2025-01-29	2025-11-08
33705	1875	257	2025-07-21	2025-10-31
33706	1715	396	2025-08-02	2025-10-27
33707	1226	304	2025-08-11	2025-10-29
33708	1686	423	2025-08-20	2025-10-26
33709	160	416	2025-03-21	2025-10-30
33710	437	355	2024-11-05	2025-10-26
33711	956	181	2024-11-12	2025-10-22
33712	290	404	2025-05-16	2025-11-09
33713	1012	34	2025-06-19	2025-10-28
33714	1234	273	2025-06-05	2025-11-09
33715	1884	158	2025-05-11	2025-11-08
33716	114	479	2024-10-29	2025-11-05
33717	1270	397	2025-04-25	2025-10-25
33718	103	114	2025-04-05	2025-11-04
33719	493	86	2025-06-08	2025-10-23
33720	182	375	2025-03-26	2025-10-29
33721	1487	379	2025-07-25	2025-10-29
33722	104	264	2025-06-18	2025-11-03
33723	988	341	2025-04-08	2025-10-26
33724	182	197	2024-11-06	2025-10-22
33725	947	420	2025-04-27	2025-11-05
33726	1072	119	2024-11-28	2025-11-05
33727	857	42	2024-12-29	2025-10-29
33728	765	177	2025-06-09	2025-10-24
33729	474	39	2025-03-02	2025-10-23
33730	1557	431	2025-03-21	2025-11-01
33731	589	270	2025-06-15	2025-11-05
33732	472	347	2024-12-01	2025-10-31
33733	574	102	2025-07-25	2025-11-09
33734	512	113	2025-01-12	2025-10-22
33735	1855	27	2025-01-01	2025-10-22
33736	1999	208	2024-12-29	2025-11-01
33737	567	479	2024-12-28	2025-11-05
33738	175	113	2025-06-13	2025-11-01
33739	69	134	2025-02-01	2025-10-27
33740	833	337	2025-05-31	2025-11-05
33741	456	301	2025-02-12	2025-11-06
33742	589	92	2025-01-01	2025-10-26
33743	1167	289	2025-10-20	2025-10-22
33744	1817	328	2025-09-19	2025-10-25
33745	187	80	2025-10-01	2025-11-09
33746	632	244	2025-05-26	2025-10-24
33747	202	242	2025-03-02	2025-11-07
33748	1157	469	2025-03-26	2025-10-31
33749	1375	215	2024-12-01	2025-10-26
33750	1232	279	2025-09-06	2025-10-26
33751	940	190	2025-02-15	2025-10-24
33752	13	336	2025-03-01	2025-10-30
33753	839	135	2025-09-19	2025-11-06
33754	1798	288	2025-01-29	2025-10-29
33755	728	473	2025-08-03	2025-11-09
33756	1487	135	2025-05-17	2025-10-25
33757	300	223	2024-12-26	2025-11-09
33758	588	223	2025-03-05	2025-10-27
33759	1754	389	2024-10-22	2025-10-31
33760	1344	348	2025-08-05	2025-10-22
33761	1	94	2025-07-11	2025-11-05
33762	822	81	2024-11-11	2025-11-09
33763	72	242	2025-03-12	2025-11-09
33764	470	282	2025-07-12	2025-11-07
33765	565	123	2025-04-05	2025-10-23
33766	1358	104	2025-01-25	2025-11-09
33767	1257	273	2025-09-14	2025-10-30
33768	453	122	2025-06-13	2025-10-31
33769	1924	186	2025-07-30	2025-10-21
33770	1522	33	2025-02-06	2025-10-25
33771	772	101	2025-07-24	2025-11-02
33772	564	64	2025-06-30	2025-10-27
33773	627	298	2025-01-29	2025-11-08
33774	1729	357	2025-06-28	2025-11-05
33775	1893	66	2025-09-08	2025-11-04
33776	266	226	2024-11-14	2025-10-24
33777	1909	10	2025-04-15	2025-10-24
33778	719	307	2025-09-12	2025-10-31
33779	543	407	2025-01-10	2025-10-22
33780	592	383	2024-11-11	2025-11-05
33781	477	178	2025-03-16	2025-10-23
33782	454	363	2025-08-09	2025-11-07
33783	1426	480	2025-02-13	2025-10-26
33784	935	211	2025-02-19	2025-11-01
33785	1984	198	2024-12-16	2025-11-09
33786	1098	15	2025-01-11	2025-11-04
33787	945	405	2025-09-10	2025-11-10
33788	1331	348	2025-08-17	2025-10-27
33789	340	495	2025-06-03	2025-11-03
33790	1570	246	2025-02-13	2025-10-31
33791	1756	133	2025-04-28	2025-10-29
33792	1843	244	2025-04-22	2025-11-02
33793	778	385	2024-11-05	2025-11-06
33794	526	269	2025-06-17	2025-11-07
33795	449	276	2025-04-08	2025-11-09
33796	883	88	2025-09-05	2025-11-02
33797	1949	302	2025-02-18	2025-11-02
33798	1080	487	2024-11-05	2025-11-03
33799	1805	18	2025-04-16	2025-10-29
33800	887	230	2025-04-01	2025-11-06
33801	1872	370	2025-10-18	2025-11-04
33802	493	356	2025-06-20	2025-11-04
33803	325	302	2025-10-16	2025-10-25
33804	1637	188	2025-09-23	2025-11-06
33805	1138	302	2025-07-30	2025-11-05
33806	1473	371	2025-05-13	2025-11-08
33807	645	431	2025-07-25	2025-11-05
33808	1914	15	2025-05-23	2025-10-29
33809	456	189	2025-05-27	2025-10-24
33810	1019	53	2025-04-14	2025-11-01
33811	569	464	2024-12-15	2025-10-26
33812	1609	246	2025-08-31	2025-10-29
33813	1280	53	2025-06-06	2025-10-25
33814	1293	441	2025-04-17	2025-11-02
33815	698	201	2025-02-22	2025-11-05
33816	437	370	2025-01-10	2025-10-22
33817	1624	33	2025-06-13	2025-11-03
33818	1562	136	2025-07-19	2025-11-07
33819	184	395	2025-02-07	2025-10-27
33820	1082	381	2025-05-02	2025-11-02
33821	952	387	2024-11-21	2025-10-23
33822	1635	230	2025-08-28	2025-10-28
33823	566	110	2025-03-16	2025-10-24
33824	126	53	2025-02-12	2025-11-04
33825	1158	412	2024-12-30	2025-11-01
33826	1412	339	2025-01-23	2025-10-26
33827	823	302	2025-08-15	2025-11-10
33828	1209	143	2025-06-08	2025-10-29
33829	1820	487	2024-11-12	2025-10-31
33830	707	353	2025-02-27	2025-11-04
33831	1487	262	2025-05-30	2025-10-23
33832	900	494	2024-11-18	2025-11-04
33833	1479	81	2024-12-08	2025-10-22
33834	1069	280	2024-11-19	2025-10-28
33835	1759	250	2025-02-12	2025-10-31
33836	385	335	2025-01-12	2025-11-02
33837	1929	293	2025-08-05	2025-11-08
33838	1769	145	2025-06-04	2025-10-22
33839	1518	299	2024-10-28	2025-10-25
33840	1529	293	2024-12-29	2025-10-24
33841	1956	35	2025-02-13	2025-10-27
33842	1863	312	2025-08-19	2025-10-23
33843	1933	499	2025-04-21	2025-10-30
33844	315	5	2025-10-02	2025-10-24
33845	38	14	2025-02-24	2025-10-27
33846	309	474	2025-10-07	2025-11-04
33847	468	56	2025-04-21	2025-11-04
33848	1692	31	2025-03-28	2025-10-22
33849	690	478	2025-09-19	2025-11-02
33850	1847	267	2025-03-31	2025-10-23
33851	1056	162	2025-01-02	2025-10-23
33852	243	342	2024-11-28	2025-11-06
33853	886	346	2025-05-28	2025-11-04
33854	1688	435	2025-04-15	2025-11-07
33855	449	482	2024-12-10	2025-10-31
33856	503	79	2024-11-23	2025-11-05
33857	561	496	2025-10-19	2025-10-29
33858	659	321	2025-02-21	2025-10-22
33859	1621	381	2025-10-15	2025-10-31
33860	637	331	2024-12-30	2025-11-07
33861	843	122	2025-09-12	2025-11-05
33862	1181	172	2025-04-13	2025-11-03
33863	675	236	2025-05-29	2025-11-04
33864	482	119	2024-12-01	2025-11-01
33865	344	336	2025-07-23	2025-11-02
33866	879	370	2025-09-28	2025-10-25
33867	622	336	2025-10-01	2025-10-25
33868	1459	108	2025-04-03	2025-10-23
33869	65	287	2025-07-24	2025-11-01
33870	1010	121	2025-01-12	2025-10-22
33871	1092	38	2025-09-14	2025-10-24
33872	128	479	2025-06-29	2025-11-09
33873	1764	83	2025-02-15	2025-10-31
33874	233	104	2025-04-18	2025-10-27
33875	993	105	2024-12-21	2025-11-09
33876	1859	437	2025-01-16	2025-11-01
33877	1836	273	2025-05-27	2025-11-05
33878	755	228	2025-07-14	2025-11-09
33879	1376	76	2025-09-29	2025-10-21
33880	1373	251	2025-06-22	2025-10-27
33881	1939	399	2025-09-16	2025-11-01
33882	1793	179	2025-02-27	2025-11-06
33883	597	498	2025-09-09	2025-11-02
33884	1313	106	2024-11-02	2025-11-05
33885	1108	188	2025-01-19	2025-10-25
33886	1513	362	2024-11-24	2025-10-30
33887	35	495	2024-10-27	2025-11-03
33888	1615	417	2025-04-10	2025-11-05
33889	512	144	2025-04-04	2025-10-30
33890	1697	43	2024-11-12	2025-10-31
33891	188	237	2024-11-26	2025-10-29
33892	1972	302	2025-01-05	2025-11-06
33893	465	386	2025-01-17	2025-10-25
33894	413	36	2025-10-17	2025-11-08
33895	1299	41	2025-02-17	2025-11-05
33896	1094	332	2024-10-26	2025-11-06
33897	805	285	2025-10-09	2025-11-06
33898	309	170	2025-09-04	2025-10-26
33899	1576	156	2024-12-31	2025-11-02
33900	869	14	2024-12-30	2025-11-01
33901	1266	364	2025-03-12	2025-10-30
33902	1778	433	2024-10-26	2025-11-07
33903	1934	17	2025-02-05	2025-10-24
33904	1074	345	2025-03-30	2025-10-29
33905	1156	250	2025-04-08	2025-10-22
33906	241	496	2024-11-10	2025-10-30
33907	1097	346	2025-10-18	2025-11-03
33908	368	360	2025-06-06	2025-11-04
33909	1079	45	2025-06-11	2025-11-07
33910	1777	130	2025-03-22	2025-11-02
33911	781	170	2025-09-20	2025-11-02
33912	102	186	2025-05-29	2025-11-02
33913	582	24	2025-07-01	2025-11-06
33914	73	252	2025-10-15	2025-10-21
33915	1209	282	2025-01-01	2025-11-04
33916	331	53	2024-12-24	2025-11-07
33917	923	269	2025-08-22	2025-10-22
33918	570	118	2025-07-16	2025-10-31
33919	197	287	2025-01-02	2025-11-01
33920	778	355	2025-01-18	2025-10-30
33921	1799	177	2024-12-29	2025-10-23
33922	244	354	2025-02-18	2025-10-22
33923	641	174	2024-11-16	2025-10-26
33924	62	113	2025-02-17	2025-11-02
33925	670	477	2024-11-07	2025-10-30
33926	1951	403	2024-12-10	2025-11-03
33927	394	262	2024-11-20	2025-11-07
33928	1376	481	2025-05-27	2025-10-26
33929	224	479	2025-04-28	2025-11-01
33930	1385	27	2025-02-07	2025-11-03
33931	1725	78	2025-01-08	2025-10-28
33932	1935	266	2025-04-14	2025-11-07
33933	703	427	2025-06-26	2025-10-31
33934	108	500	2024-12-01	2025-11-07
33935	1911	35	2025-04-05	2025-10-24
33936	897	405	2025-04-22	2025-10-30
33937	765	274	2025-09-02	2025-11-02
33938	199	296	2024-12-24	2025-10-22
33939	1011	362	2024-10-22	2025-11-08
33940	1599	193	2024-12-14	2025-11-07
33941	259	107	2025-03-21	2025-11-02
33942	1244	2	2025-01-24	2025-11-04
33943	1817	451	2025-01-04	2025-10-25
33944	838	17	2025-06-01	2025-10-24
33945	1667	251	2024-12-04	2025-10-31
33946	499	323	2025-09-26	2025-11-04
33947	1076	351	2025-05-22	2025-10-31
33948	1440	8	2025-02-12	2025-11-06
33949	57	306	2025-09-29	2025-11-04
33950	1070	371	2025-06-14	2025-11-10
33951	1619	339	2025-02-05	2025-11-03
33952	92	391	2025-07-02	2025-10-29
33953	430	396	2025-07-12	2025-10-25
33954	1862	245	2025-05-13	2025-10-22
33955	665	212	2024-11-13	2025-11-08
33956	442	267	2025-03-29	2025-11-07
33957	1315	299	2025-08-26	2025-10-26
33958	1209	405	2025-01-29	2025-11-09
33959	114	8	2025-01-27	2025-11-03
33960	665	461	2024-11-17	2025-10-27
33961	1799	384	2024-11-11	2025-10-31
33962	1900	484	2025-05-28	2025-11-06
33963	1986	206	2025-05-21	2025-10-23
33964	26	41	2025-02-23	2025-11-02
33965	1351	23	2025-06-08	2025-10-29
33966	8	358	2025-03-18	2025-11-06
33967	724	417	2024-12-24	2025-10-22
33968	79	17	2025-07-22	2025-11-02
33969	928	465	2025-02-19	2025-11-01
33970	157	201	2025-10-15	2025-11-06
33971	1793	432	2025-01-28	2025-11-10
33972	1381	193	2025-07-26	2025-10-29
33973	291	226	2025-09-19	2025-10-29
33974	1408	150	2025-03-21	2025-11-08
33975	1343	100	2024-11-24	2025-11-06
33976	1033	211	2025-09-15	2025-11-09
33977	357	79	2025-06-10	2025-10-30
33978	1985	165	2025-10-07	2025-11-03
33979	303	476	2024-10-24	2025-10-22
33980	225	202	2025-02-03	2025-11-01
33981	227	103	2025-04-28	2025-11-09
33982	1187	78	2025-04-21	2025-11-07
33983	1613	216	2024-10-22	2025-11-10
33984	1809	22	2025-04-22	2025-10-27
33985	1648	328	2025-04-09	2025-10-28
33986	1051	486	2024-11-24	2025-10-23
33987	34	260	2025-08-10	2025-10-30
33988	1957	445	2025-06-11	2025-10-31
33989	1573	419	2024-11-29	2025-10-30
33990	647	451	2025-07-08	2025-11-10
33991	545	414	2025-01-06	2025-11-07
33992	977	384	2024-10-25	2025-10-25
33993	734	293	2025-03-17	2025-10-29
33994	1623	115	2025-07-13	2025-10-29
33995	1070	196	2025-03-17	2025-10-25
33996	1323	2	2025-06-25	2025-10-30
33997	898	271	2025-10-01	2025-10-25
33998	1173	142	2024-12-18	2025-10-27
33999	466	16	2025-09-30	2025-11-01
34000	760	129	2025-08-17	2025-11-01
\.


--
-- TOC entry 5015 (class 0 OID 17597)
-- Dependencies: 237
-- Data for Name: pengembalian; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.pengembalian (id_pengembalian, id_peminjaman, tanggal_pengembalian, keterlambatan_hari, denda) FROM stdin;
1	32002	2025-07-22	0	0.00
2	32003	2025-09-03	0	0.00
3	32004	2025-09-08	0	0.00
4	32005	2024-12-06	0	0.00
5	32006	2025-05-11	0	0.00
6	32007	2024-12-02	0	0.00
7	32008	2025-01-28	0	0.00
8	32010	2025-10-15	0	15000.00
9	32011	2025-07-14	0	0.00
10	32013	2024-11-26	0	0.00
11	32014	2025-02-26	0	0.00
12	32015	2024-12-19	0	0.00
13	32016	2025-07-27	0	0.00
14	32017	2025-08-24	0	0.00
15	32018	2024-12-27	0	0.00
16	32019	2025-05-24	0	0.00
17	32020	2025-01-22	0	0.00
18	32021	2025-03-11	0	0.00
19	32023	2025-02-10	0	0.00
20	32025	2024-11-19	0	0.00
21	32027	2025-03-31	0	0.00
22	32028	2025-05-28	0	0.00
23	32029	2025-09-19	0	0.00
24	32030	2024-12-07	0	0.00
25	32031	2024-11-20	0	0.00
26	32032	2024-11-01	0	0.00
27	32033	2024-12-17	0	0.00
28	32034	2024-11-08	0	0.00
29	32035	2025-09-06	0	0.00
30	32036	2024-11-24	0	0.00
31	32037	2024-12-26	0	0.00
32	32039	2025-04-10	0	0.00
33	32040	2025-02-05	0	0.00
34	32041	2025-04-25	0	0.00
35	32043	2025-04-03	0	0.00
36	32044	2025-09-27	0	0.00
37	32045	2025-02-26	0	0.00
38	32046	2025-09-22	0	0.00
39	32047	2025-09-08	0	0.00
40	32048	2025-08-24	0	0.00
41	32049	2025-02-18	0	0.00
42	32050	2025-09-02	0	0.00
43	32053	2025-08-27	0	0.00
44	32054	2024-11-24	0	0.00
45	32056	2025-01-09	0	0.00
46	32058	2025-05-07	0	0.00
47	32060	2024-12-30	0	0.00
48	32061	2025-08-02	0	0.00
49	32064	2025-10-10	0	0.00
50	32065	2025-01-08	0	0.00
51	32067	2025-02-28	0	0.00
52	32068	2025-06-24	0	0.00
53	32069	2025-11-15	0	0.00
54	32070	2025-10-27	3	35000.00
55	32071	2025-05-19	0	0.00
56	32072	2025-08-15	0	0.00
57	32073	2024-12-22	0	0.00
58	32074	2025-01-20	0	0.00
59	32075	2025-07-25	0	0.00
60	32076	2025-10-07	0	0.00
61	32078	2025-10-21	0	0.00
62	32079	2025-07-03	0	0.00
63	32080	2025-06-28	0	0.00
64	32082	2025-10-07	0	0.00
65	32083	2025-08-07	0	0.00
66	32084	2025-01-30	0	0.00
67	32086	2025-06-14	0	0.00
68	32087	2025-02-25	0	0.00
69	32089	2025-08-20	0	0.00
70	32092	2025-04-20	0	0.00
71	32093	2024-11-18	0	0.00
72	32095	2025-07-09	0	0.00
73	32096	2025-06-22	0	0.00
74	32098	2025-11-03	11	5000.00
75	32099	2025-10-05	0	0.00
76	32101	2025-03-01	0	0.00
77	32102	2025-03-16	0	0.00
78	32103	2025-09-06	0	0.00
79	32104	2025-05-26	0	0.00
80	32105	2025-09-05	0	0.00
81	32107	2025-05-21	0	0.00
82	32108	2025-08-21	0	0.00
83	32109	2025-01-15	0	0.00
84	32111	2025-08-02	0	0.00
85	32112	2025-06-02	0	0.00
86	32113	2025-03-23	0	0.00
87	32114	2025-09-05	0	0.00
88	32115	2025-06-14	0	0.00
89	32116	2024-12-08	0	0.00
90	32118	2025-10-26	0	0.00
91	32119	2025-07-19	0	0.00
92	32120	2025-10-28	0	0.00
93	32122	2025-02-22	0	0.00
94	32123	2024-11-27	0	0.00
95	32124	2025-05-02	0	0.00
96	32126	2025-08-04	0	0.00
97	32127	2025-08-14	0	0.00
98	32128	2025-09-01	0	0.00
99	32130	2024-11-20	0	0.00
100	32133	2025-01-21	0	0.00
101	32134	2025-05-01	0	0.00
102	32135	2025-06-20	0	0.00
103	32136	2025-05-26	0	0.00
104	32138	2025-10-20	0	0.00
105	32139	2025-02-23	0	0.00
106	32141	2025-01-23	0	0.00
107	32144	2025-10-08	0	0.00
108	32145	2025-06-29	0	0.00
109	32146	2025-05-16	0	0.00
110	32147	2025-09-01	0	0.00
111	32148	2025-09-14	0	0.00
112	32149	2025-09-01	0	0.00
113	32150	2025-01-02	0	0.00
114	32151	2025-08-20	0	0.00
115	32152	2024-11-18	0	0.00
116	32153	2025-01-28	0	0.00
117	32154	2025-07-04	0	0.00
118	32155	2025-03-19	0	0.00
119	32156	2025-11-17	11	0.00
120	32157	2025-05-19	0	0.00
121	32158	2025-07-29	0	0.00
122	32161	2025-04-24	0	0.00
123	32162	2025-02-25	0	0.00
124	32164	2025-05-02	0	0.00
125	32165	2024-11-25	0	0.00
126	32166	2024-12-30	0	0.00
127	32167	2024-12-02	0	0.00
128	32168	2025-07-16	0	0.00
129	32172	2025-02-19	0	0.00
130	32174	2025-10-03	0	0.00
131	32175	2025-09-08	0	0.00
132	32178	2025-09-20	0	0.00
133	32179	2025-04-07	0	0.00
134	32180	2025-05-03	0	0.00
135	32181	2025-04-21	0	0.00
136	32182	2025-07-02	0	0.00
137	32183	2025-08-16	0	0.00
138	32185	2025-01-16	0	0.00
139	32186	2025-03-31	0	0.00
140	32187	2025-06-14	0	0.00
141	32188	2025-07-07	0	0.00
142	32189	2025-05-19	0	0.00
143	32190	2025-05-19	0	0.00
144	32191	2025-09-15	0	0.00
145	32192	2025-09-23	0	0.00
146	32193	2025-05-22	0	0.00
147	32194	2025-08-15	0	0.00
148	32196	2025-02-26	0	0.00
149	32197	2025-04-29	0	0.00
150	32198	2025-07-29	0	0.00
151	32199	2025-07-03	0	0.00
152	32200	2025-08-26	0	0.00
153	32202	2025-07-17	0	0.00
154	32203	2025-01-08	0	0.00
155	32204	2024-11-26	0	0.00
156	32205	2025-03-11	0	0.00
157	32206	2025-09-19	0	0.00
158	32207	2024-12-12	0	0.00
159	32208	2025-11-05	8	0.00
160	32209	2025-06-27	0	0.00
161	32210	2025-07-31	0	0.00
162	32211	2025-07-24	0	0.00
163	32212	2025-09-30	0	0.00
164	32215	2024-11-22	0	0.00
165	32216	2025-05-15	0	0.00
166	32217	2025-09-05	0	0.00
167	32218	2025-05-11	0	0.00
168	32219	2025-05-15	0	0.00
169	32220	2025-05-28	0	0.00
170	32223	2025-01-15	0	0.00
171	32224	2025-09-01	0	0.00
172	32225	2025-08-03	0	0.00
173	32226	2025-04-18	0	0.00
174	32227	2025-03-31	0	0.00
175	32228	2024-11-02	0	0.00
176	32229	2025-02-17	0	0.00
177	32230	2025-10-05	0	0.00
178	32231	2025-06-03	0	0.00
179	32233	2025-06-13	0	0.00
180	32234	2025-10-30	0	0.00
181	32235	2025-09-23	0	0.00
182	32236	2025-08-05	0	0.00
183	32237	2025-01-17	0	0.00
184	32238	2025-06-24	0	0.00
185	32239	2025-05-23	0	0.00
186	32240	2025-10-16	0	0.00
187	32242	2025-05-15	0	0.00
188	32243	2025-10-05	0	0.00
189	32245	2025-09-23	0	0.00
190	32246	2024-11-30	0	0.00
191	32248	2025-05-08	0	0.00
192	32250	2024-12-17	0	0.00
193	32251	2025-01-07	0	0.00
194	32254	2025-09-23	0	0.00
195	32256	2025-05-10	0	0.00
196	32257	2025-09-24	0	0.00
197	32258	2025-03-13	0	0.00
198	32259	2025-10-14	0	0.00
199	32261	2025-03-12	0	0.00
200	32262	2025-07-14	0	0.00
201	32263	2025-08-17	0	0.00
202	32264	2025-08-04	0	0.00
203	32266	2025-02-10	0	0.00
204	32268	2025-09-07	0	0.00
205	32270	2025-05-17	0	0.00
206	32272	2025-08-21	0	0.00
207	32273	2025-10-19	0	0.00
208	32274	2025-05-14	0	0.00
209	32275	2025-06-05	0	0.00
210	32276	2025-04-06	0	0.00
211	32277	2025-08-08	0	0.00
212	32278	2024-11-07	0	0.00
213	32279	2025-01-31	0	0.00
214	32280	2025-01-23	0	0.00
215	32283	2025-05-09	0	0.00
216	32284	2025-08-24	0	0.00
217	32286	2025-04-24	0	0.00
218	32288	2025-05-16	0	0.00
219	32289	2025-09-09	0	0.00
220	32290	2025-07-02	0	0.00
221	32291	2025-02-18	0	0.00
222	32292	2025-02-17	0	0.00
223	32294	2025-10-22	0	0.00
224	32295	2025-01-25	0	0.00
225	32296	2025-04-06	0	0.00
226	32298	2025-03-21	0	0.00
227	32299	2024-12-04	0	0.00
228	32300	2025-08-03	0	0.00
229	32301	2025-02-26	0	0.00
230	32302	2024-12-07	0	0.00
231	32304	2025-09-30	3	0.00
232	32305	2025-10-03	0	0.00
233	32306	2025-10-05	0	0.00
234	32307	2025-07-01	0	0.00
235	32308	2025-07-12	0	0.00
236	32309	2025-07-11	0	0.00
237	32313	2025-07-16	0	0.00
238	32314	2025-04-30	0	0.00
239	32315	2025-05-21	0	0.00
240	32316	2024-11-15	0	0.00
241	32317	2025-02-18	0	0.00
242	32318	2025-04-23	0	0.00
243	32319	2024-11-17	0	0.00
244	32320	2025-04-23	0	0.00
245	32322	2025-01-28	0	0.00
246	32323	2025-05-04	0	0.00
247	32324	2025-08-02	0	0.00
248	32325	2025-04-16	0	0.00
249	32327	2025-07-30	0	0.00
250	32328	2025-05-11	0	0.00
251	32330	2025-09-07	0	0.00
252	32331	2025-03-19	0	0.00
253	32332	2025-04-12	0	0.00
254	32333	2025-01-21	0	0.00
255	32335	2025-07-26	0	0.00
256	32336	2025-05-22	0	0.00
257	32338	2024-11-24	0	0.00
258	32340	2025-05-25	0	0.00
259	32341	2025-09-19	0	0.00
260	32342	2025-07-23	0	0.00
261	32343	2025-09-12	0	0.00
262	32345	2025-08-04	0	0.00
263	32346	2024-11-29	0	0.00
264	32347	2025-07-15	0	0.00
265	32348	2025-01-03	0	0.00
266	32349	2025-05-03	0	0.00
267	32350	2025-02-15	0	0.00
268	32351	2024-12-02	0	0.00
269	32352	2025-09-11	0	0.00
270	32353	2025-01-29	0	0.00
271	32354	2025-07-25	0	0.00
272	32355	2024-10-31	0	0.00
273	32356	2025-07-14	0	0.00
274	32357	2025-08-21	0	0.00
275	32359	2024-12-02	0	0.00
276	32360	2024-12-30	0	0.00
277	32362	2025-07-09	0	0.00
278	32363	2025-01-17	0	0.00
279	32364	2025-01-07	0	0.00
280	32365	2025-02-06	0	0.00
281	32366	2025-06-27	0	0.00
282	32368	2025-09-04	0	0.00
283	32371	2025-06-24	0	0.00
284	32372	2025-09-25	0	0.00
285	32373	2025-01-29	0	0.00
286	32374	2025-09-16	0	0.00
287	32375	2024-12-11	0	0.00
288	32377	2025-10-11	9	60000.00
289	32378	2025-03-18	0	0.00
290	32379	2025-05-18	0	0.00
291	32380	2025-07-23	0	0.00
292	32381	2025-07-15	0	0.00
293	32382	2025-04-02	0	0.00
294	32383	2025-01-03	0	0.00
295	32384	2025-05-07	0	0.00
296	32385	2025-02-18	0	0.00
297	32387	2025-03-19	0	0.00
298	32388	2025-04-07	0	0.00
299	32389	2024-12-27	0	0.00
300	32390	2025-08-22	0	0.00
301	32391	2025-03-07	0	0.00
302	32392	2025-10-13	0	0.00
303	32395	2025-01-28	0	0.00
304	32396	2025-01-02	0	0.00
305	32397	2025-09-13	0	0.00
306	32398	2025-10-15	11	0.00
307	32399	2025-01-07	0	0.00
308	32400	2024-12-18	0	0.00
309	32402	2025-05-26	0	0.00
310	32403	2025-06-15	0	0.00
311	32406	2025-02-11	0	0.00
312	32407	2025-05-22	0	0.00
313	32410	2025-06-09	0	0.00
314	32411	2025-07-14	0	0.00
315	32412	2025-10-09	0	0.00
316	32414	2025-07-25	0	0.00
317	32415	2025-07-22	0	0.00
318	32416	2025-09-18	0	0.00
319	32419	2025-05-09	0	0.00
320	32420	2025-10-09	0	0.00
321	32421	2025-10-19	1	35000.00
322	32422	2025-02-06	0	0.00
323	32423	2025-03-12	0	0.00
324	32424	2024-12-25	0	0.00
325	32425	2025-03-30	0	0.00
326	32426	2025-05-10	0	0.00
327	32428	2025-04-05	0	0.00
328	32431	2024-11-09	0	0.00
329	32432	2025-01-01	0	0.00
330	32434	2025-04-23	0	0.00
331	32435	2025-05-25	0	0.00
332	32436	2025-09-09	0	0.00
333	32438	2025-08-11	0	0.00
334	32439	2025-06-26	0	0.00
335	32440	2025-08-29	0	0.00
336	32443	2025-01-29	0	0.00
337	32444	2025-07-12	0	0.00
338	32445	2025-02-08	0	0.00
339	32446	2024-11-20	0	0.00
340	32447	2025-06-18	0	0.00
341	32448	2025-11-01	9	65000.00
342	32449	2025-08-15	0	0.00
343	32450	2025-07-20	0	0.00
344	32452	2024-12-15	0	0.00
345	32453	2025-01-17	0	0.00
346	32454	2025-01-23	0	0.00
347	32455	2025-02-16	0	0.00
348	32456	2025-09-15	0	0.00
349	32459	2025-09-09	0	0.00
350	32460	2025-01-09	0	0.00
351	32461	2024-12-29	0	0.00
352	32462	2025-05-17	0	0.00
353	32463	2025-04-06	0	0.00
354	32464	2025-02-14	0	0.00
355	32465	2025-02-14	0	0.00
356	32466	2025-03-01	0	0.00
357	32467	2025-05-22	0	0.00
358	32468	2025-09-26	0	0.00
359	32470	2025-01-16	0	0.00
360	32471	2024-11-06	0	0.00
361	32472	2025-02-02	0	0.00
362	32475	2025-08-14	0	0.00
363	32476	2025-03-14	0	0.00
364	32477	2024-12-08	0	0.00
365	32479	2025-09-27	0	0.00
366	32480	2024-12-20	0	0.00
367	32481	2025-07-10	0	0.00
368	32482	2024-11-15	0	0.00
369	32483	2025-08-15	0	0.00
370	32484	2025-02-24	0	0.00
371	32485	2025-09-03	0	0.00
372	32487	2025-05-16	0	0.00
373	32488	2025-03-30	0	0.00
374	32489	2025-07-18	0	0.00
375	32490	2025-03-15	0	0.00
376	32491	2024-12-28	0	0.00
377	32492	2025-10-29	0	0.00
378	32493	2025-06-26	0	0.00
379	32495	2024-12-26	0	0.00
380	32496	2025-09-02	0	0.00
381	32497	2025-03-07	0	0.00
382	32498	2025-07-13	0	0.00
383	32499	2024-12-26	0	0.00
384	32500	2025-01-24	0	0.00
385	32501	2025-05-23	0	0.00
386	32503	2025-02-04	0	0.00
387	32504	2025-04-21	0	0.00
388	32505	2025-08-14	0	0.00
389	32507	2025-09-20	0	0.00
390	32509	2025-05-10	0	0.00
391	32510	2025-09-22	0	0.00
392	32511	2025-07-24	0	0.00
393	32512	2025-02-10	0	0.00
394	32513	2025-10-17	0	0.00
395	32514	2024-12-08	0	0.00
396	32515	2025-03-12	0	0.00
397	32516	2025-03-02	0	0.00
398	32517	2025-05-23	0	0.00
399	32518	2025-03-22	0	0.00
400	32519	2024-12-28	0	0.00
401	32520	2025-05-04	0	0.00
402	32521	2025-06-04	0	0.00
403	32523	2025-06-19	0	0.00
404	32524	2025-09-27	0	0.00
405	32525	2025-05-01	0	0.00
406	32526	2025-11-11	8	0.00
407	32528	2025-01-13	0	0.00
408	32529	2024-11-13	0	0.00
409	32530	2024-11-29	0	0.00
410	32531	2025-05-05	0	0.00
411	32532	2024-12-24	0	0.00
412	32533	2025-05-28	0	0.00
413	32535	2025-03-30	0	0.00
414	32537	2025-03-21	0	0.00
415	32540	2025-08-08	0	0.00
416	32542	2025-07-03	0	0.00
417	32545	2025-01-14	0	0.00
418	32546	2024-12-28	0	0.00
419	32547	2025-02-06	0	0.00
420	32548	2025-08-29	0	0.00
421	32549	2024-12-08	0	0.00
422	32552	2025-07-27	0	0.00
423	32553	2024-12-14	0	0.00
424	32554	2024-12-30	0	0.00
425	32555	2025-09-07	0	0.00
426	32556	2025-03-28	0	0.00
427	32557	2025-05-24	0	0.00
428	32558	2025-04-23	0	0.00
429	32559	2025-03-25	0	0.00
430	32563	2025-09-27	0	0.00
431	32564	2024-11-05	0	0.00
432	32565	2025-03-10	0	0.00
433	32566	2025-01-18	0	0.00
434	32568	2025-11-09	10	55000.00
435	32569	2025-06-28	0	0.00
436	32570	2024-12-11	0	0.00
437	32571	2025-04-15	0	0.00
438	32574	2025-10-26	0	0.00
439	32575	2025-01-14	0	0.00
440	32576	2025-02-05	0	0.00
441	32578	2025-03-31	0	0.00
442	32581	2025-02-17	0	0.00
443	32582	2025-06-21	0	0.00
444	32583	2025-08-24	0	0.00
445	32584	2025-03-28	0	0.00
446	32585	2025-06-07	0	0.00
447	32586	2025-05-29	0	0.00
448	32587	2024-12-23	0	0.00
449	32588	2024-11-28	0	0.00
450	32589	2025-07-18	0	0.00
451	32594	2025-03-30	0	0.00
452	32595	2024-12-19	0	0.00
453	32596	2025-01-25	0	0.00
454	32598	2025-10-22	0	0.00
455	32599	2025-09-26	0	0.00
456	32600	2025-10-21	0	0.00
457	32601	2025-09-24	0	0.00
458	32602	2025-06-18	0	0.00
459	32604	2025-02-10	0	0.00
460	32606	2025-04-08	0	0.00
461	32607	2025-08-04	0	0.00
462	32608	2025-06-18	0	0.00
463	32609	2025-08-13	0	0.00
464	32610	2025-07-30	0	0.00
465	32611	2025-03-16	0	0.00
466	32612	2025-06-05	0	0.00
467	32613	2025-10-02	0	0.00
468	32614	2025-06-07	0	0.00
469	32615	2025-01-18	0	0.00
470	32616	2025-10-16	0	0.00
471	32617	2025-05-16	0	0.00
472	32618	2025-04-29	0	0.00
473	32619	2025-04-29	0	0.00
474	32620	2025-07-03	0	0.00
475	32622	2025-05-12	0	0.00
476	32623	2025-07-28	0	0.00
477	32624	2025-01-02	0	0.00
478	32625	2024-11-27	0	0.00
479	32626	2025-01-31	0	0.00
480	32627	2025-10-11	0	0.00
481	32628	2025-07-02	0	0.00
482	32629	2025-04-01	0	0.00
483	32630	2025-08-11	0	0.00
484	32631	2025-04-19	0	0.00
485	32632	2025-09-30	0	0.00
486	32633	2025-04-22	0	0.00
487	32634	2025-07-31	0	0.00
488	32637	2025-07-27	0	0.00
489	32639	2025-05-20	0	0.00
490	32641	2024-11-18	0	0.00
491	32642	2025-03-29	0	0.00
492	32644	2024-12-06	0	0.00
493	32646	2025-07-06	0	0.00
494	32648	2025-03-09	0	0.00
495	32649	2025-02-03	0	0.00
496	32650	2025-05-12	0	0.00
497	32651	2024-12-08	0	0.00
498	32652	2025-09-14	0	0.00
499	32653	2024-12-06	0	0.00
500	32657	2024-12-06	0	0.00
501	32659	2025-07-28	0	0.00
502	32660	2025-08-07	0	0.00
503	32661	2025-06-23	0	0.00
504	32662	2025-07-25	0	0.00
505	32664	2025-07-25	0	0.00
506	32665	2025-10-19	0	0.00
507	32666	2025-01-18	0	0.00
508	32667	2025-10-06	0	0.00
509	32669	2025-09-03	0	0.00
510	32670	2024-12-26	0	0.00
511	32671	2025-10-08	0	0.00
512	32673	2025-04-26	0	0.00
513	32674	2024-10-31	0	0.00
514	32675	2025-08-18	0	0.00
515	32676	2025-10-30	15	70000.00
516	32677	2024-11-20	0	0.00
517	32678	2025-08-22	0	0.00
518	32679	2025-04-30	0	0.00
519	32680	2025-08-28	0	0.00
520	32681	2025-09-18	0	0.00
521	32682	2025-01-21	0	0.00
522	32683	2024-11-02	0	0.00
523	32684	2025-02-02	0	0.00
524	32685	2025-02-01	0	0.00
525	32686	2024-11-16	0	0.00
526	32688	2025-01-03	0	0.00
527	32689	2025-01-23	0	0.00
528	32690	2025-08-10	0	0.00
529	32691	2024-11-08	0	0.00
530	32692	2025-06-27	0	0.00
531	32693	2025-07-08	0	0.00
532	32694	2025-09-11	0	0.00
533	32695	2025-09-07	0	0.00
534	32696	2024-11-15	0	0.00
535	32697	2025-03-31	0	0.00
536	32698	2025-04-28	0	0.00
537	32700	2024-11-01	0	0.00
538	32701	2025-02-28	0	0.00
539	32702	2025-02-28	0	0.00
540	32703	2025-08-16	0	0.00
541	32704	2025-05-02	0	0.00
542	32705	2025-10-31	0	0.00
543	32706	2025-05-04	0	0.00
544	32708	2024-12-06	0	0.00
545	32709	2024-12-11	0	0.00
546	32710	2025-08-09	0	0.00
547	32711	2025-11-07	1	55000.00
548	32712	2025-07-25	0	0.00
549	32713	2025-03-08	0	0.00
550	32714	2025-02-10	0	0.00
551	32715	2025-05-19	0	0.00
552	32716	2025-04-20	0	0.00
553	32717	2025-02-02	0	0.00
554	32718	2025-08-08	0	0.00
555	32719	2025-03-10	0	0.00
556	32720	2025-04-19	0	0.00
557	32721	2025-06-25	0	0.00
558	32722	2025-06-10	0	0.00
559	32723	2024-12-23	0	0.00
560	32726	2025-06-07	0	0.00
561	32727	2025-09-01	0	0.00
562	32728	2025-09-23	0	0.00
563	32729	2025-03-29	0	0.00
564	32730	2025-04-12	0	0.00
565	32731	2025-04-07	0	0.00
566	32732	2025-02-07	0	0.00
567	32733	2025-05-31	0	0.00
568	32734	2025-02-09	0	0.00
569	32736	2025-09-28	0	0.00
570	32737	2025-07-06	0	0.00
571	32738	2025-08-10	0	0.00
572	32740	2025-11-11	3	40000.00
573	32741	2025-05-29	0	0.00
574	32742	2025-01-06	0	0.00
575	32743	2025-01-17	0	0.00
576	32744	2025-02-19	0	0.00
577	32745	2024-11-13	0	0.00
578	32746	2025-07-13	0	0.00
579	32748	2024-11-02	0	0.00
580	32749	2025-01-18	0	0.00
581	32751	2024-11-02	0	0.00
582	32752	2025-10-20	0	0.00
583	32753	2025-07-05	0	0.00
584	32754	2025-09-14	0	0.00
585	32755	2025-08-08	0	0.00
586	32758	2024-12-14	0	0.00
587	32759	2025-03-10	0	0.00
588	32760	2025-09-05	0	0.00
589	32762	2025-05-20	0	0.00
590	32764	2025-03-19	0	0.00
591	32765	2025-01-30	0	0.00
592	32766	2024-12-01	0	0.00
593	32767	2025-08-12	0	0.00
594	32768	2024-11-21	0	0.00
595	32769	2024-12-25	0	0.00
596	32770	2025-05-31	0	0.00
597	32771	2025-02-11	0	0.00
598	32772	2025-04-21	0	0.00
599	32773	2025-04-28	0	0.00
600	32774	2025-09-07	0	0.00
601	32775	2025-03-06	0	0.00
602	32776	2025-09-28	0	0.00
603	32777	2025-08-30	0	0.00
604	32779	2025-10-30	0	0.00
605	32781	2025-08-07	0	0.00
606	32782	2025-03-13	0	0.00
607	32783	2025-07-20	0	0.00
608	32784	2025-02-08	0	0.00
609	32785	2025-02-22	0	0.00
610	32786	2025-10-10	0	0.00
611	32787	2025-01-11	0	0.00
612	32788	2025-04-20	0	0.00
613	32789	2025-04-20	0	0.00
614	32790	2025-10-30	0	0.00
615	32791	2025-03-19	0	0.00
616	32792	2025-03-16	0	0.00
617	32794	2025-07-21	0	0.00
618	32795	2024-11-27	0	0.00
619	32796	2025-06-29	0	0.00
620	32798	2025-02-25	0	0.00
621	32799	2025-01-20	0	0.00
622	32800	2025-01-04	0	0.00
623	32801	2025-10-11	0	0.00
624	32802	2025-01-23	0	0.00
625	32803	2025-10-21	0	0.00
626	32804	2025-05-24	0	0.00
627	32805	2025-02-13	0	0.00
628	32806	2025-08-19	0	0.00
629	32807	2024-12-03	0	0.00
630	32809	2024-12-03	0	0.00
631	32812	2025-04-10	0	0.00
632	32814	2025-08-17	0	0.00
633	32815	2025-03-17	0	0.00
634	32817	2025-03-15	0	0.00
635	32818	2025-06-01	0	0.00
636	32820	2025-03-11	0	0.00
637	32821	2025-09-24	0	0.00
638	32822	2025-06-20	0	0.00
639	32823	2024-11-22	0	0.00
640	32825	2025-07-25	0	0.00
641	32826	2025-01-31	0	0.00
642	32827	2025-04-27	0	0.00
643	32828	2025-06-15	0	0.00
644	32829	2025-06-11	0	0.00
645	32831	2025-05-24	0	0.00
646	32833	2024-12-21	0	0.00
647	32835	2025-02-01	0	0.00
648	32838	2025-03-23	0	0.00
649	32839	2025-05-31	0	0.00
650	32840	2025-08-30	0	0.00
651	32841	2025-08-31	0	0.00
652	32843	2025-01-08	0	0.00
653	32844	2025-10-08	0	0.00
654	32845	2025-09-20	0	0.00
655	32846	2024-12-17	0	0.00
656	32847	2025-10-20	0	0.00
657	32848	2025-07-05	0	0.00
658	32850	2025-07-18	0	0.00
659	32851	2024-11-15	0	0.00
660	32852	2025-08-25	0	0.00
661	32853	2024-12-08	0	0.00
662	32854	2024-11-18	0	0.00
663	32855	2024-11-23	0	0.00
664	32856	2024-12-23	0	0.00
665	32857	2025-03-03	0	0.00
666	32858	2024-12-14	0	0.00
667	32859	2024-12-04	0	0.00
668	32860	2025-05-13	0	0.00
669	32861	2025-08-07	0	0.00
670	32863	2025-05-09	0	0.00
671	32864	2025-08-20	0	0.00
672	32865	2025-11-02	0	0.00
673	32866	2025-09-01	0	0.00
674	32867	2025-10-23	1	5000.00
675	32868	2025-09-04	0	0.00
676	32870	2025-04-15	0	0.00
677	32871	2025-07-20	0	0.00
678	32872	2024-11-01	0	0.00
679	32873	2025-09-17	0	0.00
680	32874	2025-02-14	0	0.00
681	32875	2025-07-28	0	0.00
682	32876	2025-02-04	0	0.00
683	32877	2025-04-18	0	0.00
684	32878	2025-06-02	0	0.00
685	32881	2025-10-11	0	0.00
686	32882	2025-10-26	1	40000.00
687	32883	2025-06-13	0	0.00
688	32884	2025-08-16	0	0.00
689	32886	2025-06-25	0	0.00
690	32887	2025-07-06	0	0.00
691	32888	2025-05-04	0	0.00
692	32889	2025-05-15	0	0.00
693	32890	2025-09-21	0	0.00
694	32891	2025-01-12	0	0.00
695	32892	2025-02-08	0	0.00
696	32893	2024-11-17	0	0.00
697	32894	2025-01-16	0	0.00
698	32895	2025-05-18	0	0.00
699	32896	2024-12-17	0	0.00
700	32897	2025-09-08	0	0.00
701	32898	2025-05-05	0	0.00
702	32899	2025-03-29	0	0.00
703	32900	2025-04-21	0	0.00
704	32902	2025-01-07	0	0.00
705	32903	2025-03-03	0	0.00
706	32905	2025-08-07	0	0.00
707	32906	2025-01-20	0	0.00
708	32908	2024-11-26	0	0.00
709	32909	2025-10-25	0	0.00
710	32910	2025-06-27	0	0.00
711	32912	2025-05-06	0	0.00
712	32913	2025-01-30	0	0.00
713	32915	2025-09-15	0	0.00
714	32916	2025-06-21	0	0.00
715	32918	2024-11-27	0	0.00
716	32919	2025-07-02	0	0.00
717	32920	2025-05-31	0	0.00
718	32921	2025-05-29	0	0.00
719	32922	2025-06-26	0	0.00
720	32923	2025-05-10	0	0.00
721	32924	2025-02-18	0	0.00
722	32925	2025-06-03	0	0.00
723	32926	2025-01-22	0	0.00
724	32927	2025-05-02	0	0.00
725	32930	2025-10-03	0	0.00
726	32932	2025-09-29	0	0.00
727	32933	2025-11-01	0	40000.00
728	32934	2025-05-02	0	0.00
729	32935	2025-02-13	0	0.00
730	32936	2025-07-17	0	0.00
731	32937	2025-05-30	0	0.00
732	32938	2025-04-16	0	0.00
733	32939	2025-02-20	0	0.00
734	32940	2025-10-23	0	0.00
735	32942	2024-12-12	0	0.00
736	32943	2025-02-20	0	0.00
737	32945	2025-01-24	0	0.00
738	32947	2024-10-29	0	0.00
739	32948	2025-01-04	0	0.00
740	32950	2025-01-10	0	0.00
741	32952	2025-02-02	0	0.00
742	32955	2025-07-31	0	0.00
743	32956	2025-07-18	0	0.00
744	32957	2025-04-24	0	0.00
745	32958	2025-01-28	0	0.00
746	32960	2025-03-02	0	0.00
747	32961	2025-01-18	0	0.00
748	32962	2025-05-07	0	0.00
749	32964	2025-01-13	0	0.00
750	32965	2025-01-05	0	0.00
751	32966	2025-09-26	0	0.00
752	32967	2025-03-27	0	0.00
753	32968	2025-10-20	0	0.00
754	32971	2025-03-03	0	0.00
755	32972	2024-11-24	0	0.00
756	32973	2025-02-26	0	0.00
757	32974	2025-03-26	0	0.00
758	32975	2025-05-23	0	0.00
759	32976	2025-05-14	0	0.00
760	32977	2025-10-18	0	0.00
761	32978	2025-11-06	5	15000.00
762	32979	2025-01-22	0	0.00
763	32980	2025-01-10	0	0.00
764	32981	2025-02-23	0	0.00
765	32982	2024-10-30	0	0.00
766	32983	2025-02-25	0	0.00
767	32984	2025-01-24	0	0.00
768	32985	2024-11-30	0	0.00
769	32986	2025-04-11	0	0.00
770	32987	2025-04-17	0	0.00
771	32988	2025-07-31	0	0.00
772	32989	2025-10-26	0	25000.00
773	32991	2025-04-19	0	0.00
774	32992	2024-11-22	0	0.00
775	32993	2025-07-21	0	0.00
776	32994	2025-02-13	0	0.00
777	32995	2025-01-03	0	0.00
778	32997	2024-12-09	0	0.00
779	32998	2024-12-26	0	0.00
780	32999	2025-02-23	0	0.00
781	33001	2025-05-26	0	0.00
782	33002	2024-11-15	0	0.00
783	33003	2025-10-09	0	0.00
784	33004	2025-01-25	0	0.00
785	33005	2025-03-15	0	0.00
786	33006	2024-12-17	0	0.00
787	33008	2025-09-13	0	0.00
788	33009	2025-01-23	0	0.00
789	33010	2025-10-20	0	0.00
790	33012	2025-08-18	0	0.00
791	33013	2024-11-22	0	0.00
792	33014	2025-10-28	0	0.00
793	33018	2025-10-21	0	115000.00
794	33019	2025-07-03	0	0.00
795	33022	2025-01-31	0	0.00
796	33023	2025-10-22	0	0.00
797	33025	2025-04-16	0	0.00
798	33026	2024-11-08	0	0.00
799	33027	2025-07-04	0	0.00
800	33028	2025-08-17	0	0.00
801	33029	2025-02-12	0	0.00
802	33030	2025-07-31	0	0.00
803	33031	2025-04-16	0	0.00
804	33032	2025-02-04	0	0.00
805	33033	2024-12-23	0	0.00
806	33034	2024-12-12	0	0.00
807	33035	2025-03-26	0	0.00
808	33036	2025-07-11	0	0.00
809	33039	2025-03-14	0	0.00
810	33040	2025-04-27	0	0.00
811	33041	2025-05-15	0	0.00
812	33042	2025-01-30	0	0.00
813	33043	2025-02-01	0	0.00
814	33044	2025-09-01	0	0.00
815	33046	2025-03-02	0	0.00
816	33049	2024-11-22	0	0.00
817	33051	2025-02-25	0	0.00
818	33052	2025-02-05	0	0.00
819	33053	2025-05-26	0	0.00
820	33056	2025-10-19	0	0.00
821	33057	2025-03-30	0	0.00
822	33058	2024-12-21	0	0.00
823	33059	2025-01-18	0	0.00
824	33061	2025-10-02	0	0.00
825	33062	2025-04-29	0	0.00
826	33063	2025-08-27	0	0.00
827	33065	2025-07-19	0	0.00
828	33066	2025-07-15	0	0.00
829	33068	2025-02-05	0	0.00
830	33069	2025-09-10	0	0.00
831	33070	2024-11-08	0	0.00
832	33071	2025-06-18	0	0.00
833	33074	2025-10-27	0	10000.00
834	33075	2024-12-17	0	0.00
835	33076	2025-04-29	0	0.00
836	33077	2025-05-20	0	0.00
837	33078	2025-06-06	0	0.00
838	33079	2024-12-13	0	0.00
839	33080	2025-08-21	0	0.00
840	33081	2025-07-09	0	0.00
841	33082	2025-04-08	0	0.00
842	33084	2025-06-09	0	0.00
843	33085	2025-08-14	0	0.00
844	33086	2024-12-28	0	0.00
845	33087	2025-02-15	0	0.00
846	33088	2025-02-18	0	0.00
847	33089	2025-04-22	0	0.00
848	33090	2025-05-30	0	0.00
849	33091	2025-01-21	0	0.00
850	33092	2025-01-09	0	0.00
851	33094	2025-06-05	0	0.00
852	33096	2024-12-15	0	0.00
853	33097	2025-02-22	0	0.00
854	33098	2025-03-25	0	0.00
855	33100	2024-11-30	0	0.00
856	33102	2024-12-06	0	0.00
857	33104	2025-07-17	0	0.00
858	33105	2025-05-12	0	0.00
859	33106	2025-10-29	0	0.00
860	33107	2025-07-06	0	0.00
861	33108	2025-08-23	0	0.00
862	33110	2025-08-03	0	0.00
863	33111	2025-04-02	0	0.00
864	33113	2025-04-16	0	0.00
865	33114	2025-05-27	0	0.00
866	33115	2025-04-28	0	0.00
867	33116	2024-11-12	0	0.00
868	33117	2025-02-01	0	0.00
869	33118	2025-08-14	0	0.00
870	33119	2025-03-12	0	0.00
871	33120	2025-09-25	0	0.00
872	33122	2025-09-10	0	0.00
873	33124	2024-11-10	0	0.00
874	33125	2025-08-08	0	0.00
875	33126	2025-03-22	0	0.00
876	33128	2025-10-08	0	0.00
877	33131	2025-07-22	0	0.00
878	33132	2025-07-26	0	0.00
879	33134	2024-11-22	0	0.00
880	33135	2024-11-25	0	0.00
881	33136	2025-08-09	0	0.00
882	33137	2025-02-26	0	0.00
883	33139	2025-03-31	0	0.00
884	33140	2025-08-10	0	0.00
885	33141	2025-04-20	0	0.00
886	33142	2025-06-01	0	0.00
887	33143	2025-01-26	0	0.00
888	33144	2024-12-09	0	0.00
889	33145	2025-10-26	1	5000.00
890	33146	2025-02-09	0	0.00
891	33147	2024-12-19	0	0.00
892	33148	2024-12-19	0	0.00
893	33150	2025-10-16	0	0.00
894	33151	2025-01-23	0	0.00
895	33152	2025-02-26	0	0.00
896	33154	2025-10-30	0	0.00
897	33156	2025-04-16	0	0.00
898	33157	2024-12-03	0	0.00
899	33158	2025-08-01	0	0.00
900	33159	2025-04-25	0	0.00
901	33160	2025-08-20	0	0.00
902	33161	2025-02-24	0	0.00
903	33162	2025-10-12	0	0.00
904	33163	2025-04-18	0	0.00
905	33164	2025-02-20	0	0.00
906	33165	2025-09-16	0	0.00
907	33166	2025-03-22	0	0.00
908	33167	2025-01-31	0	0.00
909	33168	2025-10-01	0	0.00
910	33169	2025-08-21	0	0.00
911	33170	2025-03-01	0	0.00
912	33171	2025-05-14	0	0.00
913	33172	2024-11-26	0	0.00
914	33173	2025-02-06	0	0.00
915	33174	2025-10-24	0	0.00
916	33175	2024-12-21	0	0.00
917	33176	2025-10-26	0	0.00
918	33178	2025-03-22	0	0.00
919	33179	2025-09-25	0	0.00
920	33181	2025-09-29	0	0.00
921	33182	2025-10-25	6	0.00
922	33183	2025-02-12	0	0.00
923	33184	2025-04-02	0	0.00
924	33185	2024-12-22	0	0.00
925	33186	2025-05-22	0	0.00
926	33188	2024-12-12	0	0.00
927	33189	2025-08-07	0	0.00
928	33190	2025-04-23	0	0.00
929	33191	2024-12-19	0	0.00
930	33192	2025-05-07	0	0.00
931	33193	2025-04-01	0	0.00
932	33194	2025-03-12	0	0.00
933	33195	2025-07-21	0	0.00
934	33196	2025-03-23	0	0.00
935	33197	2025-10-04	0	0.00
936	33200	2025-03-18	0	0.00
937	33201	2025-05-07	0	0.00
938	33202	2025-07-28	0	0.00
939	33203	2025-01-18	0	0.00
940	33204	2024-12-26	0	0.00
941	33205	2025-07-28	0	0.00
942	33206	2025-08-03	0	0.00
943	33207	2025-08-08	0	0.00
944	33208	2025-11-16	0	55000.00
945	33209	2025-01-06	0	0.00
946	33210	2025-08-09	0	0.00
947	33211	2025-03-21	0	0.00
948	33212	2025-03-04	0	0.00
949	33215	2025-05-31	0	0.00
950	33216	2024-11-22	0	0.00
951	33219	2025-04-01	0	0.00
952	33221	2025-05-28	0	0.00
953	33222	2025-02-09	0	0.00
954	33223	2025-08-08	0	0.00
955	33224	2025-03-07	0	0.00
956	33225	2025-07-21	0	0.00
957	33226	2024-12-23	0	0.00
958	33227	2025-03-27	0	0.00
959	33228	2025-05-07	0	0.00
960	33230	2025-03-02	0	0.00
961	33231	2025-03-03	0	0.00
962	33232	2025-03-27	0	0.00
963	33233	2025-09-17	0	0.00
964	33235	2025-03-07	0	0.00
965	33237	2025-02-04	0	0.00
966	33238	2025-10-05	0	0.00
967	33239	2025-04-17	0	0.00
968	33240	2025-09-01	0	0.00
969	33242	2025-01-22	0	0.00
970	33243	2025-09-01	0	0.00
971	33245	2024-12-16	0	0.00
972	33246	2025-10-16	14	25000.00
973	33247	2024-12-21	0	0.00
974	33248	2025-11-05	0	0.00
975	33249	2025-04-16	0	0.00
976	33250	2025-06-03	0	0.00
977	33251	2025-03-21	0	0.00
978	33252	2025-03-15	0	0.00
979	33253	2025-09-10	0	0.00
980	33255	2025-02-19	0	0.00
981	33257	2024-11-10	0	0.00
982	33259	2025-10-18	6	45000.00
983	33261	2025-10-28	0	0.00
984	33263	2025-07-03	0	0.00
985	33264	2025-09-19	0	0.00
986	33266	2024-11-07	0	0.00
987	33267	2025-04-03	0	0.00
988	33269	2025-03-02	0	0.00
989	33270	2024-11-09	0	0.00
990	33272	2025-01-07	0	0.00
991	33273	2025-03-30	0	0.00
992	33274	2025-09-02	0	0.00
993	33275	2025-11-03	12	130000.00
994	33276	2025-01-25	0	0.00
995	33277	2025-04-25	0	0.00
996	33278	2025-01-26	0	0.00
997	33279	2025-05-19	0	0.00
998	33280	2024-12-10	0	0.00
999	33281	2025-10-17	0	0.00
1000	33282	2025-05-01	0	0.00
1001	33284	2025-02-02	0	0.00
1002	33285	2025-11-08	5	0.00
1003	33286	2025-03-10	0	0.00
1004	33287	2025-04-09	0	0.00
1005	33288	2025-03-26	0	0.00
1006	33289	2025-03-31	0	0.00
1007	33290	2025-03-24	0	0.00
1008	33291	2025-06-01	0	0.00
1009	33295	2025-01-09	0	0.00
1010	33296	2024-12-26	0	0.00
1011	33297	2025-03-28	0	0.00
1012	33298	2025-02-02	0	0.00
1013	33299	2025-03-10	0	0.00
1014	33300	2025-06-19	0	0.00
1015	33301	2025-04-06	0	0.00
1016	33302	2025-08-25	0	0.00
1017	33303	2025-05-30	0	0.00
1018	33304	2025-10-10	0	45000.00
1019	33305	2025-06-13	0	0.00
1020	33306	2025-05-28	0	0.00
1021	33309	2025-05-11	0	0.00
1022	33310	2025-10-25	4	0.00
1023	33311	2025-01-02	0	0.00
1024	33313	2025-06-13	0	0.00
1025	33314	2025-05-25	0	0.00
1026	33315	2025-04-17	0	0.00
1027	33316	2025-06-26	0	0.00
1028	33317	2025-06-09	0	0.00
1029	33318	2025-05-01	0	0.00
1030	33319	2025-04-09	0	0.00
1031	33322	2025-03-05	0	0.00
1032	33323	2025-09-25	0	0.00
1033	33324	2025-03-18	0	0.00
1034	33326	2025-05-29	0	0.00
1035	33327	2025-07-15	0	0.00
1036	33328	2025-06-29	0	0.00
1037	33329	2025-07-22	0	0.00
1038	33330	2025-09-21	0	0.00
1039	33331	2025-08-08	0	0.00
1040	33333	2025-05-26	0	0.00
1041	33334	2025-09-18	0	0.00
1042	33335	2025-01-29	0	0.00
1043	33336	2025-09-19	0	0.00
1044	33338	2025-01-25	0	0.00
1045	33339	2025-08-04	0	0.00
1046	33340	2025-06-29	0	0.00
1047	33342	2024-12-23	0	0.00
1048	33344	2025-04-15	0	0.00
1049	33345	2024-12-13	0	0.00
1050	33346	2025-01-04	0	0.00
1051	33347	2025-06-12	0	0.00
1052	33348	2025-06-01	0	0.00
1053	33349	2025-01-30	0	0.00
1054	33350	2025-07-07	0	0.00
1055	33351	2025-04-27	0	0.00
1056	33352	2025-02-13	0	0.00
1057	33353	2025-11-10	14	50000.00
1058	33354	2025-10-23	1	15000.00
1059	33357	2024-12-26	0	0.00
1060	33358	2025-07-04	0	0.00
1061	33361	2025-01-18	0	0.00
1062	33362	2024-11-16	0	0.00
1063	33363	2025-04-27	0	0.00
1064	33364	2025-09-23	0	0.00
1065	33365	2025-02-16	0	0.00
1066	33366	2025-01-17	0	0.00
1067	33368	2025-07-02	0	0.00
1068	33369	2025-01-18	0	0.00
1069	33370	2024-11-28	0	0.00
1070	33371	2025-09-22	0	0.00
1071	33372	2025-01-12	0	0.00
1072	33373	2025-04-12	0	0.00
1073	33374	2025-05-22	0	0.00
1074	33376	2025-04-14	0	0.00
1075	33377	2024-11-24	0	0.00
1076	33379	2025-09-08	0	0.00
1077	33380	2025-01-11	0	0.00
1078	33381	2024-11-06	0	0.00
1079	33382	2025-09-11	0	0.00
1080	33383	2025-02-26	0	0.00
1081	33384	2024-12-28	0	0.00
1082	33385	2025-10-13	0	0.00
1083	33386	2025-03-28	0	0.00
1084	33387	2025-04-13	0	0.00
1085	33388	2025-01-31	0	0.00
1086	33389	2025-06-24	0	0.00
1087	33390	2025-08-20	0	0.00
1088	33391	2025-09-16	0	0.00
1089	33393	2025-07-01	0	0.00
1090	33394	2024-11-06	0	0.00
1091	33395	2025-07-20	0	0.00
1092	33398	2025-10-08	0	0.00
1093	33399	2025-07-30	0	0.00
1094	33400	2025-06-26	0	0.00
1095	33401	2025-03-30	0	0.00
1096	33402	2024-12-12	0	0.00
1097	33403	2025-01-29	0	0.00
1098	33404	2025-03-07	0	0.00
1099	33405	2025-09-03	0	0.00
1100	33406	2025-09-18	0	0.00
1101	33407	2024-11-22	0	0.00
1102	33408	2025-01-28	0	0.00
1103	33409	2025-07-03	0	0.00
1104	33410	2025-10-18	0	0.00
1105	33411	2025-06-17	0	0.00
1106	33412	2025-03-28	0	0.00
1107	33413	2025-10-10	0	0.00
1108	33414	2025-06-10	0	0.00
1109	33416	2024-11-24	0	0.00
1110	33417	2025-06-03	0	0.00
1111	33418	2025-09-15	0	0.00
1112	33421	2025-10-21	0	0.00
1113	33424	2025-02-08	0	0.00
1114	33425	2025-02-11	0	0.00
1115	33426	2024-12-17	0	0.00
1116	33427	2025-10-16	1	25000.00
1117	33428	2025-10-25	0	0.00
1118	33429	2025-10-09	0	0.00
1119	33430	2024-12-27	0	0.00
1120	33432	2024-11-12	0	0.00
1121	33433	2025-09-11	0	0.00
1122	33434	2025-07-27	0	0.00
1123	33436	2025-05-10	0	0.00
1124	33438	2025-11-03	0	35000.00
1125	33439	2025-03-31	0	0.00
1126	33440	2025-07-06	0	0.00
1127	33441	2025-08-15	0	0.00
1128	33442	2025-03-31	0	0.00
1129	33444	2025-08-26	0	0.00
1130	33445	2025-08-30	0	0.00
1131	33446	2024-11-20	0	0.00
1132	33447	2024-12-15	0	0.00
1133	33448	2025-03-30	0	0.00
1134	33449	2025-03-01	0	0.00
1135	33450	2025-11-15	23	40000.00
1136	33451	2025-03-09	0	0.00
1137	33453	2025-03-30	0	0.00
1138	33455	2025-08-15	0	0.00
1139	33456	2025-07-13	0	0.00
1140	33457	2024-12-29	0	0.00
1141	33458	2025-06-23	0	0.00
1142	33459	2025-04-19	0	0.00
1143	33460	2025-10-21	0	5000.00
1144	33461	2025-09-08	0	0.00
1145	33462	2025-01-18	0	0.00
1146	33463	2024-11-20	0	0.00
1147	33465	2025-06-03	0	0.00
1148	33466	2025-10-16	5	0.00
1149	33467	2024-11-26	0	0.00
1150	33469	2025-02-15	0	0.00
1151	33470	2025-02-08	0	0.00
1152	33472	2025-05-10	0	0.00
1153	33473	2025-02-17	0	0.00
1154	33475	2025-05-14	0	0.00
1155	33476	2025-04-10	0	0.00
1156	33477	2025-01-07	0	0.00
1157	33479	2025-04-23	0	0.00
1158	33480	2025-04-15	0	0.00
1159	33481	2025-08-21	0	0.00
1160	33482	2024-11-13	0	0.00
1161	33483	2024-12-18	0	0.00
1162	33484	2025-03-03	0	0.00
1163	33486	2025-08-17	0	0.00
1164	33488	2025-02-27	0	0.00
1165	33489	2025-02-27	0	0.00
1166	33491	2025-03-08	0	0.00
1167	33492	2025-01-02	0	0.00
1168	33493	2025-02-16	0	0.00
1169	33494	2025-04-06	0	0.00
1170	33495	2025-11-09	10	0.00
1171	33497	2025-03-30	0	0.00
1172	33498	2025-08-25	0	0.00
1173	33499	2025-08-01	0	0.00
1174	33502	2024-11-14	0	0.00
1175	33503	2025-02-10	0	0.00
1176	33504	2025-06-17	0	0.00
1177	33507	2025-01-05	0	0.00
1178	33508	2024-11-19	0	0.00
1179	33509	2025-06-02	0	0.00
1180	33510	2025-01-21	0	0.00
1181	33511	2025-06-29	0	0.00
1182	33512	2025-07-29	0	0.00
1183	33513	2025-02-27	0	0.00
1184	33514	2025-03-25	0	0.00
1185	33515	2025-03-18	0	0.00
1186	33518	2025-02-22	0	0.00
1187	33520	2025-04-20	0	0.00
1188	33521	2025-03-24	0	0.00
1189	33522	2025-07-24	0	0.00
1190	33523	2025-01-13	0	0.00
1191	33524	2025-08-13	0	0.00
1192	33525	2025-07-21	0	0.00
1193	33528	2025-04-04	0	0.00
1194	33530	2025-02-28	0	0.00
1195	33531	2025-05-07	0	0.00
1196	33532	2025-07-01	0	0.00
1197	33534	2025-07-04	0	0.00
1198	33537	2025-05-11	0	0.00
1199	33538	2025-05-26	0	0.00
1200	33540	2025-02-05	0	0.00
1201	33541	2025-07-16	0	0.00
1202	33542	2025-10-10	0	20000.00
1203	33543	2025-10-20	0	0.00
1204	33544	2025-08-03	0	0.00
1205	33545	2025-05-11	0	0.00
1206	33546	2025-01-04	0	0.00
1207	33547	2024-11-19	0	0.00
1208	33548	2025-03-02	0	0.00
1209	33549	2025-01-06	0	0.00
1210	33550	2025-02-09	0	0.00
1211	33551	2024-12-17	0	0.00
1212	33553	2025-03-14	0	0.00
1213	33554	2025-05-18	0	0.00
1214	33555	2025-10-22	10	55000.00
1215	33556	2024-10-30	0	0.00
1216	33557	2025-05-12	0	0.00
1217	33558	2025-01-26	0	0.00
1218	33560	2025-10-10	0	0.00
1219	33562	2025-03-09	0	0.00
1220	33563	2025-08-09	0	0.00
1221	33564	2025-03-23	0	0.00
1222	33565	2025-03-31	0	0.00
1223	33566	2025-07-02	0	0.00
1224	33567	2025-05-04	0	0.00
1225	33568	2025-06-28	0	0.00
1226	33569	2025-04-08	0	0.00
1227	33570	2025-01-01	0	0.00
1228	33571	2025-11-17	5	35000.00
1229	33572	2024-12-28	0	0.00
1230	33573	2025-10-07	0	0.00
1231	33575	2025-01-09	0	0.00
1232	33577	2025-10-09	0	0.00
1233	33578	2025-09-04	0	0.00
1234	33579	2024-12-21	0	0.00
1235	33580	2024-11-25	0	0.00
1236	33582	2025-08-02	0	0.00
1237	33583	2025-03-13	0	0.00
1238	33585	2025-06-23	0	0.00
1239	33586	2025-07-14	0	0.00
1240	33587	2025-08-23	0	0.00
1241	33588	2025-08-15	0	0.00
1242	33590	2025-08-09	0	0.00
1243	33591	2025-09-17	0	0.00
1244	33592	2025-06-07	0	0.00
1245	33593	2025-05-27	0	0.00
1246	33594	2024-12-07	0	0.00
1247	33596	2024-11-20	0	0.00
1248	33597	2025-06-21	0	0.00
1249	33598	2025-01-20	0	0.00
1250	33599	2025-06-24	0	0.00
1251	33600	2025-04-04	0	0.00
1252	33601	2025-03-22	0	0.00
1253	33602	2024-12-23	0	0.00
1254	33604	2025-04-19	0	0.00
1255	33605	2025-08-22	0	0.00
1256	33606	2024-12-28	0	0.00
1257	33607	2025-09-12	0	0.00
1258	33608	2025-03-15	0	0.00
1259	33609	2025-07-28	0	0.00
1260	33610	2025-02-23	0	0.00
1261	33613	2025-03-17	0	0.00
1262	33614	2025-01-16	0	0.00
1263	33615	2025-08-28	0	0.00
1264	33617	2025-03-29	0	0.00
1265	33618	2025-08-20	0	0.00
1266	33619	2025-04-21	0	0.00
1267	33622	2025-10-31	0	0.00
1268	33623	2025-07-02	0	0.00
1269	33624	2025-06-03	0	0.00
1270	33625	2025-10-20	0	0.00
1271	33626	2024-12-28	0	0.00
1272	33630	2025-02-15	0	0.00
1273	33631	2025-04-28	0	0.00
1274	33632	2025-09-13	0	0.00
1275	33633	2025-03-06	0	0.00
1276	33635	2025-10-01	0	0.00
1277	33637	2025-03-26	0	0.00
1278	33638	2025-02-04	0	0.00
1279	33639	2025-06-12	0	0.00
1280	33641	2025-08-09	0	0.00
1281	33642	2024-11-25	0	0.00
1282	33643	2024-12-11	0	0.00
1283	33644	2025-05-26	0	0.00
1284	33645	2025-04-26	0	0.00
1285	33646	2025-10-16	0	0.00
1286	33647	2025-06-24	0	0.00
1287	33648	2025-03-23	0	0.00
1288	33650	2025-06-18	0	0.00
1289	33651	2025-04-21	0	0.00
1290	33652	2025-02-12	0	0.00
1291	33653	2024-12-23	0	0.00
1292	33654	2025-08-15	0	0.00
1293	33655	2025-06-28	0	0.00
1294	33656	2025-05-14	0	0.00
1295	33657	2025-03-03	0	0.00
1296	33658	2025-05-04	0	0.00
1297	33659	2025-06-15	0	0.00
1298	33661	2025-03-15	0	0.00
1299	33662	2025-07-29	0	0.00
1300	33663	2024-12-02	0	0.00
1301	33664	2025-03-31	0	0.00
1302	33665	2025-01-01	0	0.00
1303	33666	2025-08-17	0	0.00
1304	33667	2025-03-21	0	0.00
1305	33668	2024-11-19	0	0.00
1306	33670	2025-06-05	0	0.00
1307	33671	2025-01-27	0	0.00
1308	33672	2025-06-02	0	0.00
1309	33673	2025-06-02	0	0.00
1310	33674	2025-07-18	0	0.00
1311	33678	2025-10-12	0	0.00
1312	33679	2025-06-07	0	0.00
1313	33682	2025-07-06	0	0.00
1314	33683	2024-11-17	0	0.00
1315	33684	2024-12-30	0	0.00
1316	33685	2025-05-22	0	0.00
1317	33686	2025-10-17	0	0.00
1318	33687	2025-10-28	0	30000.00
1319	33688	2025-01-15	0	0.00
1320	33690	2025-10-10	0	0.00
1321	33691	2025-07-27	0	0.00
1322	33692	2025-07-26	0	0.00
1323	33693	2025-05-09	0	0.00
1324	33694	2025-08-13	0	0.00
1325	33695	2025-04-25	0	0.00
1326	33696	2025-04-18	0	0.00
1327	33699	2025-06-27	0	0.00
1328	33701	2025-02-01	0	0.00
1329	33702	2025-09-15	0	0.00
1330	33703	2025-11-16	4	40000.00
1331	33704	2025-02-13	0	0.00
1332	33705	2025-08-08	0	0.00
1333	33707	2025-09-07	0	0.00
1334	33708	2025-08-26	0	0.00
1335	33709	2025-03-29	0	0.00
1336	33710	2024-11-06	0	0.00
1337	33711	2024-11-18	0	0.00
1338	33713	2025-07-01	0	0.00
1339	33714	2025-06-26	0	0.00
1340	33716	2024-11-22	0	0.00
1341	33717	2025-04-27	0	0.00
1342	33718	2025-04-29	0	0.00
1343	33719	2025-06-21	0	0.00
1344	33720	2025-04-04	0	0.00
1345	33722	2025-07-12	0	0.00
1346	33723	2025-04-26	0	0.00
1347	33724	2024-12-01	0	0.00
1348	33725	2025-05-04	0	0.00
1349	33726	2024-11-30	0	0.00
1350	33727	2025-01-22	0	0.00
1351	33728	2025-06-12	0	0.00
1352	33729	2025-03-26	0	0.00
1353	33730	2025-03-23	0	0.00
1354	33732	2024-12-06	0	0.00
1355	33733	2025-08-19	0	0.00
1356	33734	2025-01-26	0	0.00
1357	33736	2025-01-05	0	0.00
1358	33737	2025-01-13	0	0.00
1359	33738	2025-07-10	0	0.00
1360	33739	2025-02-26	0	0.00
1361	33740	2025-06-17	0	0.00
1362	33741	2025-02-22	0	0.00
1363	33742	2025-01-29	0	0.00
1364	33743	2025-10-24	3	55000.00
1365	33744	2025-09-22	0	0.00
1366	33745	2025-10-22	0	0.00
1367	33746	2025-05-31	0	0.00
1368	33748	2025-04-16	0	0.00
1369	33749	2024-12-30	0	0.00
1370	33750	2025-09-29	0	0.00
1371	33751	2025-02-24	0	0.00
1372	33752	2025-03-25	0	0.00
1373	33753	2025-10-15	0	0.00
1374	33755	2025-09-02	0	0.00
1375	33756	2025-06-10	0	0.00
1376	33757	2025-01-17	0	0.00
1377	33758	2025-04-02	0	0.00
1378	33759	2024-11-16	0	0.00
1379	33760	2025-09-01	0	0.00
1380	33761	2025-07-21	0	0.00
1381	33762	2024-11-24	0	0.00
1382	33764	2025-08-03	0	0.00
1383	33765	2025-04-21	0	0.00
1384	33766	2025-02-04	0	0.00
1385	33767	2025-10-13	0	0.00
1386	33768	2025-06-27	0	0.00
1387	33769	2025-08-10	0	0.00
1388	33770	2025-02-08	0	0.00
1389	33772	2025-07-11	0	0.00
1390	33773	2025-02-25	0	0.00
1391	33775	2025-09-24	0	0.00
1392	33776	2024-11-23	0	0.00
1393	33778	2025-09-24	0	0.00
1394	33779	2025-02-05	0	0.00
1395	33780	2024-12-12	0	0.00
1396	33781	2025-04-09	0	0.00
1397	33782	2025-08-20	0	0.00
1398	33783	2025-02-18	0	0.00
1399	33785	2025-01-15	0	0.00
1400	33787	2025-09-15	0	0.00
1401	33788	2025-09-03	0	0.00
1402	33789	2025-06-15	0	0.00
1403	33790	2025-03-08	0	0.00
1404	33791	2025-05-26	0	0.00
1405	33792	2025-04-23	0	0.00
1406	33793	2024-11-11	0	0.00
1407	33795	2025-04-23	0	0.00
1408	33796	2025-09-14	0	0.00
1409	33797	2025-03-09	0	0.00
1410	33799	2025-05-07	0	0.00
1411	33801	2025-11-16	0	0.00
1412	33802	2025-06-21	0	0.00
1413	33803	2025-10-29	2	75000.00
1414	33805	2025-08-03	0	0.00
1415	33806	2025-05-25	0	0.00
1416	33809	2025-06-08	0	0.00
1417	33812	2025-09-09	0	0.00
1418	33813	2025-06-11	0	0.00
1419	33815	2025-03-23	0	0.00
1420	33816	2025-01-26	0	0.00
1421	33817	2025-06-27	0	0.00
1422	33818	2025-08-15	0	0.00
1423	33819	2025-02-25	0	0.00
1424	33820	2025-05-10	0	0.00
1425	33821	2024-11-25	0	0.00
1426	33822	2025-09-18	0	0.00
1427	33823	2025-04-13	0	0.00
1428	33826	2025-02-18	0	0.00
1429	33827	2025-08-28	0	0.00
1430	33828	2025-06-24	0	0.00
1431	33829	2024-12-01	0	0.00
1432	33832	2024-12-08	0	0.00
1433	33835	2025-03-14	0	0.00
1434	33836	2025-01-26	0	0.00
1435	33837	2025-08-12	0	0.00
1436	33838	2025-06-24	0	0.00
1437	33841	2025-02-27	0	0.00
1438	33842	2025-09-13	0	0.00
1439	33843	2025-05-01	0	0.00
1440	33844	2025-10-08	1	35000.00
1441	33845	2025-03-07	0	0.00
1442	33846	2025-11-05	0	0.00
1443	33847	2025-05-07	0	0.00
1444	33848	2025-04-08	0	0.00
1445	33849	2025-10-19	0	0.00
1446	33850	2025-04-03	0	0.00
1447	33851	2025-01-08	0	0.00
1448	33852	2024-12-12	0	0.00
1449	33853	2025-05-31	0	0.00
1450	33854	2025-04-30	0	0.00
1451	33855	2024-12-22	0	0.00
1452	33856	2024-12-17	0	0.00
1453	33857	2025-10-26	4	0.00
1454	33858	2025-03-01	0	0.00
1455	33859	2025-11-14	0	40000.00
1456	33861	2025-09-18	0	0.00
1457	33862	2025-05-06	0	0.00
1458	33864	2024-12-25	0	0.00
1459	33866	2025-10-02	0	15000.00
1460	33867	2025-10-24	0	0.00
1461	33868	2025-04-24	0	0.00
1462	33869	2025-07-25	0	0.00
1463	33871	2025-09-30	0	0.00
1464	33872	2025-07-29	0	0.00
1465	33873	2025-03-12	0	0.00
1466	33874	2025-04-19	0	0.00
1467	33875	2025-01-11	0	0.00
1468	33876	2025-02-06	0	0.00
1469	33877	2025-06-15	0	0.00
1470	33878	2025-08-12	0	0.00
1471	33879	2025-10-25	0	0.00
1472	33882	2025-03-01	0	0.00
1473	33884	2024-11-09	0	0.00
1474	33885	2025-02-10	0	0.00
1475	33886	2024-11-28	0	0.00
1476	33887	2024-11-05	0	0.00
1477	33890	2024-12-10	0	0.00
1478	33891	2024-12-13	0	0.00
1479	33892	2025-01-17	0	0.00
1480	33893	2025-01-18	0	0.00
1481	33895	2025-02-19	0	0.00
1482	33896	2024-11-25	0	0.00
1483	33898	2025-09-24	0	0.00
1484	33900	2025-01-25	0	0.00
1485	33902	2024-11-11	0	0.00
1486	33903	2025-03-06	0	0.00
1487	33904	2025-04-23	0	0.00
1488	33905	2025-04-22	0	0.00
1489	33906	2024-12-04	0	0.00
1490	33907	2025-11-09	8	55000.00
1491	33908	2025-06-24	0	0.00
1492	33909	2025-07-02	0	0.00
1493	33910	2025-04-15	0	0.00
1494	33911	2025-10-04	0	0.00
1495	33912	2025-06-03	0	0.00
1496	33913	2025-07-07	0	0.00
1497	33914	2025-11-02	3	0.00
1498	33915	2025-01-24	0	0.00
1499	33916	2025-01-11	0	0.00
1500	33917	2025-09-15	0	0.00
1501	33918	2025-07-26	0	0.00
1502	33919	2025-01-30	0	0.00
1503	33921	2025-01-12	0	0.00
1504	33924	2025-02-21	0	0.00
1505	33926	2024-12-21	0	0.00
1506	33927	2024-12-01	0	0.00
1507	33928	2025-06-10	0	0.00
1508	33929	2025-05-01	0	0.00
1509	33930	2025-03-04	0	0.00
1510	33931	2025-02-07	0	0.00
1511	33932	2025-04-29	0	0.00
1512	33933	2025-07-07	0	0.00
1513	33934	2024-12-14	0	0.00
1514	33935	2025-04-08	0	0.00
1515	33936	2025-05-12	0	0.00
1516	33937	2025-09-03	0	0.00
1517	33938	2024-12-29	0	0.00
1518	33939	2024-11-02	0	0.00
1519	33940	2025-01-09	0	0.00
1520	33941	2025-03-27	0	0.00
1521	33943	2025-02-02	0	0.00
1522	33944	2025-06-19	0	0.00
1523	33945	2024-12-20	0	0.00
1524	33947	2025-06-16	0	0.00
1525	33949	2025-09-30	0	0.00
1526	33950	2025-07-14	0	0.00
1527	33951	2025-02-20	0	0.00
1528	33952	2025-07-05	0	0.00
1529	33953	2025-08-10	0	0.00
1530	33954	2025-06-05	0	0.00
1531	33956	2025-04-23	0	0.00
1532	33958	2025-02-28	0	0.00
1533	33959	2025-02-24	0	0.00
1534	33960	2024-12-06	0	0.00
1535	33961	2024-11-13	0	0.00
1536	33962	2025-06-22	0	0.00
1537	33964	2025-03-04	0	0.00
1538	33965	2025-06-20	0	0.00
1539	33966	2025-03-29	0	0.00
1540	33967	2025-01-12	0	0.00
1541	33968	2025-07-28	0	0.00
1542	33969	2025-02-27	0	0.00
1543	33970	2025-10-20	2	0.00
1544	33971	2025-02-14	0	0.00
1545	33972	2025-08-22	0	0.00
1546	33974	2025-04-14	0	0.00
1547	33975	2024-12-13	0	0.00
1548	33976	2025-10-01	0	0.00
1549	33977	2025-06-15	0	0.00
1550	33978	2025-10-29	0	0.00
1551	33979	2024-11-14	0	0.00
1552	33981	2025-05-24	0	0.00
1553	33982	2025-05-16	0	0.00
1554	33984	2025-05-11	0	0.00
1555	33985	2025-04-25	0	0.00
1556	33987	2025-08-27	0	0.00
1557	33988	2025-07-06	0	0.00
1558	33989	2024-12-15	0	0.00
1559	33991	2025-02-06	0	0.00
1560	33992	2024-11-13	0	0.00
1561	33993	2025-04-09	0	0.00
1562	33994	2025-07-14	0	0.00
1563	33995	2025-03-25	0	0.00
1564	33996	2025-07-13	0	0.00
1565	33997	2025-10-25	0	0.00
1566	33999	2025-10-22	0	0.00
1567	34000	2025-09-04	0	0.00
\.


--
-- TOC entry 5010 (class 0 OID 17527)
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
11	Supplier 11
12	Supplier 12
13	Supplier 13
14	Supplier 14
15	Supplier 15
16	Supplier 16
17	Supplier 17
18	Supplier 18
19	Supplier 19
20	Supplier 20
21	Supplier 21
22	Supplier 22
23	Supplier 23
24	Supplier 24
25	Supplier 25
26	Supplier 26
27	Supplier 27
28	Supplier 28
29	Supplier 29
30	Supplier 30
31	Supplier 31
32	Supplier 32
33	Supplier 33
34	Supplier 34
35	Supplier 35
36	Supplier 36
37	Supplier 37
38	Supplier 38
39	Supplier 39
40	Supplier 40
41	Supplier 41
42	Supplier 42
43	Supplier 43
44	Supplier 44
45	Supplier 45
46	Supplier 46
47	Supplier 47
48	Supplier 48
49	Supplier 49
50	Supplier 50
51	Supplier 51
52	Supplier 52
53	Supplier 53
54	Supplier 54
55	Supplier 55
56	Supplier 56
57	Supplier 57
58	Supplier 58
59	Supplier 59
60	Supplier 60
61	Supplier 61
62	Supplier 62
63	Supplier 63
64	Supplier 64
65	Supplier 65
66	Supplier 66
67	Supplier 67
68	Supplier 68
69	Supplier 69
70	Supplier 70
71	Supplier 71
72	Supplier 72
73	Supplier 73
74	Supplier 74
75	Supplier 75
76	Supplier 76
77	Supplier 77
78	Supplier 78
79	Supplier 79
80	Supplier 80
81	Supplier 81
82	Supplier 82
83	Supplier 83
84	Supplier 84
85	Supplier 85
86	Supplier 86
87	Supplier 87
88	Supplier 88
89	Supplier 89
90	Supplier 90
91	Supplier 91
92	Supplier 92
93	Supplier 93
94	Supplier 94
95	Supplier 95
96	Supplier 96
97	Supplier 97
98	Supplier 98
99	Supplier 99
100	Supplier 100
101	Supplier 101
102	Supplier 102
103	Supplier 103
104	Supplier 104
105	Supplier 105
106	Supplier 106
107	Supplier 107
108	Supplier 108
109	Supplier 109
110	Supplier 110
111	Supplier 111
112	Supplier 112
113	Supplier 113
114	Supplier 114
115	Supplier 115
116	Supplier 116
117	Supplier 117
118	Supplier 118
119	Supplier 119
120	Supplier 120
121	Supplier 121
122	Supplier 122
123	Supplier 123
124	Supplier 124
125	Supplier 125
126	Supplier 126
127	Supplier 127
128	Supplier 128
129	Supplier 129
130	Supplier 130
131	Supplier 131
132	Supplier 132
133	Supplier 133
134	Supplier 134
135	Supplier 135
136	Supplier 136
137	Supplier 137
138	Supplier 138
139	Supplier 139
140	Supplier 140
141	Supplier 141
142	Supplier 142
143	Supplier 143
144	Supplier 144
145	Supplier 145
146	Supplier 146
147	Supplier 147
148	Supplier 148
149	Supplier 149
150	Supplier 150
151	Supplier 151
152	Supplier 152
153	Supplier 153
154	Supplier 154
155	Supplier 155
156	Supplier 156
157	Supplier 157
158	Supplier 158
159	Supplier 159
160	Supplier 160
161	Supplier 161
162	Supplier 162
163	Supplier 163
164	Supplier 164
165	Supplier 165
166	Supplier 166
167	Supplier 167
168	Supplier 168
169	Supplier 169
170	Supplier 170
171	Supplier 171
172	Supplier 172
173	Supplier 173
174	Supplier 174
175	Supplier 175
176	Supplier 176
177	Supplier 177
178	Supplier 178
179	Supplier 179
180	Supplier 180
181	Supplier 181
182	Supplier 182
183	Supplier 183
184	Supplier 184
185	Supplier 185
186	Supplier 186
187	Supplier 187
188	Supplier 188
189	Supplier 189
190	Supplier 190
191	Supplier 191
192	Supplier 192
193	Supplier 193
194	Supplier 194
195	Supplier 195
196	Supplier 196
197	Supplier 197
198	Supplier 198
199	Supplier 199
200	Supplier 200
201	Supplier 201
202	Supplier 202
203	Supplier 203
204	Supplier 204
205	Supplier 205
206	Supplier 206
207	Supplier 207
208	Supplier 208
209	Supplier 209
210	Supplier 210
211	Supplier 211
212	Supplier 212
213	Supplier 213
214	Supplier 214
215	Supplier 215
216	Supplier 216
217	Supplier 217
218	Supplier 218
219	Supplier 219
220	Supplier 220
221	Supplier 221
222	Supplier 222
223	Supplier 223
224	Supplier 224
225	Supplier 225
226	Supplier 226
227	Supplier 227
228	Supplier 228
229	Supplier 229
230	Supplier 230
231	Supplier 231
232	Supplier 232
233	Supplier 233
234	Supplier 234
235	Supplier 235
236	Supplier 236
237	Supplier 237
238	Supplier 238
239	Supplier 239
240	Supplier 240
241	Supplier 241
242	Supplier 242
243	Supplier 243
244	Supplier 244
245	Supplier 245
246	Supplier 246
247	Supplier 247
248	Supplier 248
249	Supplier 249
250	Supplier 250
251	Supplier 251
252	Supplier 252
253	Supplier 253
254	Supplier 254
255	Supplier 255
256	Supplier 256
257	Supplier 257
258	Supplier 258
259	Supplier 259
260	Supplier 260
261	Supplier 261
262	Supplier 262
263	Supplier 263
264	Supplier 264
265	Supplier 265
266	Supplier 266
267	Supplier 267
268	Supplier 268
269	Supplier 269
270	Supplier 270
271	Supplier 271
272	Supplier 272
273	Supplier 273
274	Supplier 274
275	Supplier 275
276	Supplier 276
277	Supplier 277
278	Supplier 278
279	Supplier 279
280	Supplier 280
281	Supplier 281
282	Supplier 282
283	Supplier 283
284	Supplier 284
285	Supplier 285
286	Supplier 286
287	Supplier 287
288	Supplier 288
289	Supplier 289
290	Supplier 290
291	Supplier 291
292	Supplier 292
293	Supplier 293
294	Supplier 294
295	Supplier 295
296	Supplier 296
297	Supplier 297
298	Supplier 298
299	Supplier 299
300	Supplier 300
301	Supplier 301
302	Supplier 302
303	Supplier 303
304	Supplier 304
305	Supplier 305
306	Supplier 306
307	Supplier 307
308	Supplier 308
309	Supplier 309
310	Supplier 310
311	Supplier 311
312	Supplier 312
313	Supplier 313
314	Supplier 314
315	Supplier 315
316	Supplier 316
317	Supplier 317
318	Supplier 318
319	Supplier 319
320	Supplier 320
321	Supplier 321
322	Supplier 322
323	Supplier 323
324	Supplier 324
325	Supplier 325
326	Supplier 326
327	Supplier 327
328	Supplier 328
329	Supplier 329
330	Supplier 330
331	Supplier 331
332	Supplier 332
333	Supplier 333
334	Supplier 334
335	Supplier 335
336	Supplier 336
337	Supplier 337
338	Supplier 338
339	Supplier 339
340	Supplier 340
341	Supplier 341
342	Supplier 342
343	Supplier 343
344	Supplier 344
345	Supplier 345
346	Supplier 346
347	Supplier 347
348	Supplier 348
349	Supplier 349
350	Supplier 350
351	Supplier 351
352	Supplier 352
353	Supplier 353
354	Supplier 354
355	Supplier 355
356	Supplier 356
357	Supplier 357
358	Supplier 358
359	Supplier 359
360	Supplier 360
361	Supplier 361
362	Supplier 362
363	Supplier 363
364	Supplier 364
365	Supplier 365
366	Supplier 366
367	Supplier 367
368	Supplier 368
369	Supplier 369
370	Supplier 370
371	Supplier 371
372	Supplier 372
373	Supplier 373
374	Supplier 374
375	Supplier 375
376	Supplier 376
377	Supplier 377
378	Supplier 378
379	Supplier 379
380	Supplier 380
381	Supplier 381
382	Supplier 382
383	Supplier 383
384	Supplier 384
385	Supplier 385
386	Supplier 386
387	Supplier 387
388	Supplier 388
389	Supplier 389
390	Supplier 390
391	Supplier 391
392	Supplier 392
393	Supplier 393
394	Supplier 394
395	Supplier 395
396	Supplier 396
397	Supplier 397
398	Supplier 398
399	Supplier 399
400	Supplier 400
401	Supplier 401
402	Supplier 402
403	Supplier 403
404	Supplier 404
405	Supplier 405
406	Supplier 406
407	Supplier 407
408	Supplier 408
409	Supplier 409
410	Supplier 410
411	Supplier 411
412	Supplier 412
413	Supplier 413
414	Supplier 414
415	Supplier 415
416	Supplier 416
417	Supplier 417
418	Supplier 418
419	Supplier 419
420	Supplier 420
421	Supplier 421
422	Supplier 422
423	Supplier 423
424	Supplier 424
425	Supplier 425
426	Supplier 426
427	Supplier 427
428	Supplier 428
429	Supplier 429
430	Supplier 430
431	Supplier 431
432	Supplier 432
433	Supplier 433
434	Supplier 434
435	Supplier 435
436	Supplier 436
437	Supplier 437
438	Supplier 438
439	Supplier 439
440	Supplier 440
441	Supplier 441
442	Supplier 442
443	Supplier 443
444	Supplier 444
445	Supplier 445
446	Supplier 446
447	Supplier 447
448	Supplier 448
449	Supplier 449
450	Supplier 450
451	Supplier 451
452	Supplier 452
453	Supplier 453
454	Supplier 454
455	Supplier 455
456	Supplier 456
457	Supplier 457
458	Supplier 458
459	Supplier 459
460	Supplier 460
461	Supplier 461
462	Supplier 462
463	Supplier 463
464	Supplier 464
465	Supplier 465
466	Supplier 466
467	Supplier 467
468	Supplier 468
469	Supplier 469
470	Supplier 470
471	Supplier 471
472	Supplier 472
473	Supplier 473
474	Supplier 474
475	Supplier 475
476	Supplier 476
477	Supplier 477
478	Supplier 478
479	Supplier 479
480	Supplier 480
481	Supplier 481
482	Supplier 482
483	Supplier 483
484	Supplier 484
485	Supplier 485
486	Supplier 486
487	Supplier 487
488	Supplier 488
489	Supplier 489
490	Supplier 490
491	Supplier 491
492	Supplier 492
493	Supplier 493
494	Supplier 494
495	Supplier 495
496	Supplier 496
497	Supplier 497
498	Supplier 498
499	Supplier 499
500	Supplier 500
501	Supplier 501
502	Supplier 502
503	Supplier 503
504	Supplier 504
505	Supplier 505
506	Supplier 506
507	Supplier 507
508	Supplier 508
509	Supplier 509
510	Supplier 510
511	Supplier 511
512	Supplier 512
513	Supplier 513
514	Supplier 514
515	Supplier 515
516	Supplier 516
517	Supplier 517
518	Supplier 518
519	Supplier 519
520	Supplier 520
521	Supplier 521
522	Supplier 522
523	Supplier 523
524	Supplier 524
525	Supplier 525
526	Supplier 526
527	Supplier 527
528	Supplier 528
529	Supplier 529
530	Supplier 530
531	Supplier 531
532	Supplier 532
533	Supplier 533
534	Supplier 534
535	Supplier 535
536	Supplier 536
537	Supplier 537
538	Supplier 538
539	Supplier 539
540	Supplier 540
541	Supplier 541
542	Supplier 542
543	Supplier 543
544	Supplier 544
545	Supplier 545
546	Supplier 546
547	Supplier 547
548	Supplier 548
549	Supplier 549
550	Supplier 550
551	Supplier 551
552	Supplier 552
553	Supplier 553
554	Supplier 554
555	Supplier 555
556	Supplier 556
557	Supplier 557
558	Supplier 558
559	Supplier 559
560	Supplier 560
561	Supplier 561
562	Supplier 562
563	Supplier 563
564	Supplier 564
565	Supplier 565
566	Supplier 566
567	Supplier 567
568	Supplier 568
569	Supplier 569
570	Supplier 570
571	Supplier 571
572	Supplier 572
573	Supplier 573
574	Supplier 574
575	Supplier 575
576	Supplier 576
577	Supplier 577
578	Supplier 578
579	Supplier 579
580	Supplier 580
581	Supplier 581
582	Supplier 582
583	Supplier 583
584	Supplier 584
585	Supplier 585
586	Supplier 586
587	Supplier 587
588	Supplier 588
589	Supplier 589
590	Supplier 590
591	Supplier 591
592	Supplier 592
593	Supplier 593
594	Supplier 594
595	Supplier 595
596	Supplier 596
597	Supplier 597
598	Supplier 598
599	Supplier 599
600	Supplier 600
601	Supplier 601
602	Supplier 602
603	Supplier 603
604	Supplier 604
605	Supplier 605
606	Supplier 606
607	Supplier 607
608	Supplier 608
609	Supplier 609
610	Supplier 610
611	Supplier 611
612	Supplier 612
613	Supplier 613
614	Supplier 614
615	Supplier 615
616	Supplier 616
617	Supplier 617
618	Supplier 618
619	Supplier 619
620	Supplier 620
621	Supplier 621
622	Supplier 622
623	Supplier 623
624	Supplier 624
625	Supplier 625
626	Supplier 626
627	Supplier 627
628	Supplier 628
629	Supplier 629
630	Supplier 630
631	Supplier 631
632	Supplier 632
633	Supplier 633
634	Supplier 634
635	Supplier 635
636	Supplier 636
637	Supplier 637
638	Supplier 638
639	Supplier 639
640	Supplier 640
641	Supplier 641
642	Supplier 642
643	Supplier 643
644	Supplier 644
645	Supplier 645
646	Supplier 646
647	Supplier 647
648	Supplier 648
649	Supplier 649
650	Supplier 650
651	Supplier 651
652	Supplier 652
653	Supplier 653
654	Supplier 654
655	Supplier 655
656	Supplier 656
657	Supplier 657
658	Supplier 658
659	Supplier 659
660	Supplier 660
661	Supplier 661
662	Supplier 662
663	Supplier 663
664	Supplier 664
665	Supplier 665
666	Supplier 666
667	Supplier 667
668	Supplier 668
669	Supplier 669
670	Supplier 670
671	Supplier 671
672	Supplier 672
673	Supplier 673
674	Supplier 674
675	Supplier 675
676	Supplier 676
677	Supplier 677
678	Supplier 678
679	Supplier 679
680	Supplier 680
681	Supplier 681
682	Supplier 682
683	Supplier 683
684	Supplier 684
685	Supplier 685
686	Supplier 686
687	Supplier 687
688	Supplier 688
689	Supplier 689
690	Supplier 690
691	Supplier 691
692	Supplier 692
693	Supplier 693
694	Supplier 694
695	Supplier 695
696	Supplier 696
697	Supplier 697
698	Supplier 698
699	Supplier 699
700	Supplier 700
701	Supplier 701
702	Supplier 702
703	Supplier 703
704	Supplier 704
705	Supplier 705
706	Supplier 706
707	Supplier 707
708	Supplier 708
709	Supplier 709
710	Supplier 710
711	Supplier 711
712	Supplier 712
713	Supplier 713
714	Supplier 714
715	Supplier 715
716	Supplier 716
717	Supplier 717
718	Supplier 718
719	Supplier 719
720	Supplier 720
721	Supplier 721
722	Supplier 722
723	Supplier 723
724	Supplier 724
725	Supplier 725
726	Supplier 726
727	Supplier 727
728	Supplier 728
729	Supplier 729
730	Supplier 730
731	Supplier 731
732	Supplier 732
733	Supplier 733
734	Supplier 734
735	Supplier 735
736	Supplier 736
737	Supplier 737
738	Supplier 738
739	Supplier 739
740	Supplier 740
741	Supplier 741
742	Supplier 742
743	Supplier 743
744	Supplier 744
745	Supplier 745
746	Supplier 746
747	Supplier 747
748	Supplier 748
749	Supplier 749
750	Supplier 750
751	Supplier 751
752	Supplier 752
753	Supplier 753
754	Supplier 754
755	Supplier 755
756	Supplier 756
757	Supplier 757
758	Supplier 758
759	Supplier 759
760	Supplier 760
761	Supplier 761
762	Supplier 762
763	Supplier 763
764	Supplier 764
765	Supplier 765
766	Supplier 766
767	Supplier 767
768	Supplier 768
769	Supplier 769
770	Supplier 770
771	Supplier 771
772	Supplier 772
773	Supplier 773
774	Supplier 774
775	Supplier 775
776	Supplier 776
777	Supplier 777
778	Supplier 778
779	Supplier 779
780	Supplier 780
781	Supplier 781
782	Supplier 782
783	Supplier 783
784	Supplier 784
785	Supplier 785
786	Supplier 786
787	Supplier 787
788	Supplier 788
789	Supplier 789
790	Supplier 790
791	Supplier 791
792	Supplier 792
793	Supplier 793
794	Supplier 794
795	Supplier 795
796	Supplier 796
797	Supplier 797
798	Supplier 798
799	Supplier 799
800	Supplier 800
801	Supplier 801
802	Supplier 802
803	Supplier 803
804	Supplier 804
805	Supplier 805
806	Supplier 806
807	Supplier 807
808	Supplier 808
809	Supplier 809
810	Supplier 810
811	Supplier 811
812	Supplier 812
813	Supplier 813
814	Supplier 814
815	Supplier 815
816	Supplier 816
817	Supplier 817
818	Supplier 818
819	Supplier 819
820	Supplier 820
821	Supplier 821
822	Supplier 822
823	Supplier 823
824	Supplier 824
825	Supplier 825
826	Supplier 826
827	Supplier 827
828	Supplier 828
829	Supplier 829
830	Supplier 830
831	Supplier 831
832	Supplier 832
833	Supplier 833
834	Supplier 834
835	Supplier 835
836	Supplier 836
837	Supplier 837
838	Supplier 838
839	Supplier 839
840	Supplier 840
841	Supplier 841
842	Supplier 842
843	Supplier 843
844	Supplier 844
845	Supplier 845
846	Supplier 846
847	Supplier 847
848	Supplier 848
849	Supplier 849
850	Supplier 850
851	Supplier 851
852	Supplier 852
853	Supplier 853
854	Supplier 854
855	Supplier 855
856	Supplier 856
857	Supplier 857
858	Supplier 858
859	Supplier 859
860	Supplier 860
861	Supplier 861
862	Supplier 862
863	Supplier 863
864	Supplier 864
865	Supplier 865
866	Supplier 866
867	Supplier 867
868	Supplier 868
869	Supplier 869
870	Supplier 870
871	Supplier 871
872	Supplier 872
873	Supplier 873
874	Supplier 874
875	Supplier 875
876	Supplier 876
877	Supplier 877
878	Supplier 878
879	Supplier 879
880	Supplier 880
881	Supplier 881
882	Supplier 882
883	Supplier 883
884	Supplier 884
885	Supplier 885
886	Supplier 886
887	Supplier 887
888	Supplier 888
889	Supplier 889
890	Supplier 890
891	Supplier 891
892	Supplier 892
893	Supplier 893
894	Supplier 894
895	Supplier 895
896	Supplier 896
897	Supplier 897
898	Supplier 898
899	Supplier 899
900	Supplier 900
901	Supplier 901
902	Supplier 902
903	Supplier 903
904	Supplier 904
905	Supplier 905
906	Supplier 906
907	Supplier 907
908	Supplier 908
909	Supplier 909
910	Supplier 910
911	Supplier 911
912	Supplier 912
913	Supplier 913
914	Supplier 914
915	Supplier 915
916	Supplier 916
917	Supplier 917
918	Supplier 918
919	Supplier 919
920	Supplier 920
921	Supplier 921
922	Supplier 922
923	Supplier 923
924	Supplier 924
925	Supplier 925
926	Supplier 926
927	Supplier 927
928	Supplier 928
929	Supplier 929
930	Supplier 930
931	Supplier 931
932	Supplier 932
933	Supplier 933
934	Supplier 934
935	Supplier 935
936	Supplier 936
937	Supplier 937
938	Supplier 938
939	Supplier 939
940	Supplier 940
941	Supplier 941
942	Supplier 942
943	Supplier 943
944	Supplier 944
945	Supplier 945
946	Supplier 946
947	Supplier 947
948	Supplier 948
949	Supplier 949
950	Supplier 950
951	Supplier 951
952	Supplier 952
953	Supplier 953
954	Supplier 954
955	Supplier 955
956	Supplier 956
957	Supplier 957
958	Supplier 958
959	Supplier 959
960	Supplier 960
961	Supplier 961
962	Supplier 962
963	Supplier 963
964	Supplier 964
965	Supplier 965
966	Supplier 966
967	Supplier 967
968	Supplier 968
969	Supplier 969
970	Supplier 970
971	Supplier 971
972	Supplier 972
973	Supplier 973
974	Supplier 974
975	Supplier 975
976	Supplier 976
977	Supplier 977
978	Supplier 978
979	Supplier 979
980	Supplier 980
981	Supplier 981
982	Supplier 982
983	Supplier 983
984	Supplier 984
985	Supplier 985
986	Supplier 986
987	Supplier 987
988	Supplier 988
989	Supplier 989
990	Supplier 990
991	Supplier 991
992	Supplier 992
993	Supplier 993
994	Supplier 994
995	Supplier 995
996	Supplier 996
997	Supplier 997
998	Supplier 998
999	Supplier 999
1000	Supplier 1000
\.


--
-- TOC entry 5021 (class 0 OID 0)
-- Dependencies: 217
-- Name: anggota_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.anggota_seq', 2000, true);


--
-- TOC entry 5022 (class 0 OID 0)
-- Dependencies: 219
-- Name: buku_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.buku_seq', 10000, true);


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

SELECT pg_catalog.setval('public.detail_peminjaman_seq', 8000, true);


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

SELECT pg_catalog.setval('public.pegawai_seq', 500, true);


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

SELECT pg_catalog.setval('public.peminjaman_seq', 34000, true);


--
-- TOC entry 5029 (class 0 OID 0)
-- Dependencies: 224
-- Name: pengembalian_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.pengembalian_seq', 1567, true);


--
-- TOC entry 5030 (class 0 OID 0)
-- Dependencies: 221
-- Name: supplier_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.supplier_seq', 1000, true);


--
-- TOC entry 4809 (class 2606 OID 17484)
-- Name: anggota anggota_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.anggota
    ADD CONSTRAINT anggota_pkey PRIMARY KEY (id_anggota);


--
-- TOC entry 4817 (class 2606 OID 17511)
-- Name: buku buku_isbn_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.buku
    ADD CONSTRAINT buku_isbn_key UNIQUE (isbn);


--
-- TOC entry 4822 (class 2606 OID 17516)
-- Name: buku_kategori buku_kategori_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.buku_kategori
    ADD CONSTRAINT buku_kategori_pkey PRIMARY KEY (id_buku, id_kategori);


--
-- TOC entry 4819 (class 2606 OID 17509)
-- Name: buku buku_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.buku
    ADD CONSTRAINT buku_pkey PRIMARY KEY (id_buku);


--
-- TOC entry 4828 (class 2606 OID 17553)
-- Name: detail_pembelian detail_pembelian_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.detail_pembelian
    ADD CONSTRAINT detail_pembelian_pkey PRIMARY KEY (id_detail);


--
-- TOC entry 4833 (class 2606 OID 17586)
-- Name: detail_peminjaman detail_peminjaman_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.detail_peminjaman
    ADD CONSTRAINT detail_peminjaman_pkey PRIMARY KEY (id_detail);


--
-- TOC entry 4813 (class 2606 OID 17500)
-- Name: kategori kategori_nama_kategori_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kategori
    ADD CONSTRAINT kategori_nama_kategori_key UNIQUE (nama_kategori);


--
-- TOC entry 4815 (class 2606 OID 17498)
-- Name: kategori kategori_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kategori
    ADD CONSTRAINT kategori_pkey PRIMARY KEY (id_kategori);


--
-- TOC entry 4811 (class 2606 OID 17492)
-- Name: pegawai pegawai_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pegawai
    ADD CONSTRAINT pegawai_pkey PRIMARY KEY (id_pegawai);


--
-- TOC entry 4826 (class 2606 OID 17539)
-- Name: pembelian pembelian_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pembelian
    ADD CONSTRAINT pembelian_pkey PRIMARY KEY (id_pembelian);


--
-- TOC entry 4831 (class 2606 OID 17570)
-- Name: peminjaman peminjaman_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.peminjaman
    ADD CONSTRAINT peminjaman_pkey PRIMARY KEY (id_peminjaman);


--
-- TOC entry 4837 (class 2606 OID 17605)
-- Name: pengembalian pengembalian_id_peminjaman_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pengembalian
    ADD CONSTRAINT pengembalian_id_peminjaman_key UNIQUE (id_peminjaman);


--
-- TOC entry 4839 (class 2606 OID 17603)
-- Name: pengembalian pengembalian_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pengembalian
    ADD CONSTRAINT pengembalian_pkey PRIMARY KEY (id_pengembalian);


--
-- TOC entry 4824 (class 2606 OID 17532)
-- Name: supplier supplier_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.supplier
    ADD CONSTRAINT supplier_pkey PRIMARY KEY (id_supplier);


--
-- TOC entry 4820 (class 1259 OID 17614)
-- Name: idx_buku_isbn; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_buku_isbn ON public.buku USING btree (isbn);


--
-- TOC entry 4834 (class 1259 OID 17612)
-- Name: idx_detail_peminjaman_buku; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_detail_peminjaman_buku ON public.detail_peminjaman USING btree (id_buku);


--
-- TOC entry 4829 (class 1259 OID 17611)
-- Name: idx_peminjaman_anggota; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_peminjaman_anggota ON public.peminjaman USING btree (id_anggota);


--
-- TOC entry 4835 (class 1259 OID 17613)
-- Name: idx_pengembalian_tanggal; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_pengembalian_tanggal ON public.pengembalian USING btree (tanggal_pengembalian);


--
-- TOC entry 4840 (class 2606 OID 17517)
-- Name: buku_kategori buku_kategori_id_buku_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.buku_kategori
    ADD CONSTRAINT buku_kategori_id_buku_fkey FOREIGN KEY (id_buku) REFERENCES public.buku(id_buku) ON DELETE CASCADE;


--
-- TOC entry 4841 (class 2606 OID 17522)
-- Name: buku_kategori buku_kategori_id_kategori_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.buku_kategori
    ADD CONSTRAINT buku_kategori_id_kategori_fkey FOREIGN KEY (id_kategori) REFERENCES public.kategori(id_kategori) ON DELETE CASCADE;


--
-- TOC entry 4843 (class 2606 OID 17559)
-- Name: detail_pembelian detail_pembelian_id_buku_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.detail_pembelian
    ADD CONSTRAINT detail_pembelian_id_buku_fkey FOREIGN KEY (id_buku) REFERENCES public.buku(id_buku);


--
-- TOC entry 4844 (class 2606 OID 17554)
-- Name: detail_pembelian detail_pembelian_id_pembelian_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.detail_pembelian
    ADD CONSTRAINT detail_pembelian_id_pembelian_fkey FOREIGN KEY (id_pembelian) REFERENCES public.pembelian(id_pembelian) ON DELETE CASCADE;


--
-- TOC entry 4847 (class 2606 OID 17592)
-- Name: detail_peminjaman detail_peminjaman_id_buku_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.detail_peminjaman
    ADD CONSTRAINT detail_peminjaman_id_buku_fkey FOREIGN KEY (id_buku) REFERENCES public.buku(id_buku);


--
-- TOC entry 4848 (class 2606 OID 17587)
-- Name: detail_peminjaman detail_peminjaman_id_peminjaman_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.detail_peminjaman
    ADD CONSTRAINT detail_peminjaman_id_peminjaman_fkey FOREIGN KEY (id_peminjaman) REFERENCES public.peminjaman(id_peminjaman) ON DELETE CASCADE;


--
-- TOC entry 4842 (class 2606 OID 17540)
-- Name: pembelian pembelian_id_supplier_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pembelian
    ADD CONSTRAINT pembelian_id_supplier_fkey FOREIGN KEY (id_supplier) REFERENCES public.supplier(id_supplier);


--
-- TOC entry 4845 (class 2606 OID 17571)
-- Name: peminjaman peminjaman_id_anggota_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.peminjaman
    ADD CONSTRAINT peminjaman_id_anggota_fkey FOREIGN KEY (id_anggota) REFERENCES public.anggota(id_anggota);


--
-- TOC entry 4846 (class 2606 OID 17576)
-- Name: peminjaman peminjaman_id_pegawai_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.peminjaman
    ADD CONSTRAINT peminjaman_id_pegawai_fkey FOREIGN KEY (id_pegawai) REFERENCES public.pegawai(id_pegawai);


--
-- TOC entry 4849 (class 2606 OID 17606)
-- Name: pengembalian pengembalian_id_peminjaman_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pengembalian
    ADD CONSTRAINT pengembalian_id_peminjaman_fkey FOREIGN KEY (id_peminjaman) REFERENCES public.peminjaman(id_peminjaman) ON DELETE CASCADE;


-- Completed on 2025-10-22 10:22:16

--
-- PostgreSQL database dump complete
--

\unrestrict mUTS1ogzuxJk684DVXbuoTR6e9o7b4hvo21qFn1HdFgsuFyhGPrjgjES8VXBC4T

