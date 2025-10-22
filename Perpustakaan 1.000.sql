--
-- PostgreSQL database dump
--

\restrict qfPppzi9QfhBjb0fjfaxmACpNLXqf6H9ISWFXhVbeGALJyEalIDcVII0Jt8gZpB

-- Dumped from database version 17.6
-- Dumped by pg_dump version 17.6

-- Started on 2025-10-22 10:40:25

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
-- TOC entry 217 (class 1259 OID 32778)
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
-- TOC entry 227 (class 1259 OID 32788)
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
-- TOC entry 219 (class 1259 OID 32780)
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
-- TOC entry 230 (class 1259 OID 32812)
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
-- TOC entry 231 (class 1259 OID 32823)
-- Name: buku_kategori; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.buku_kategori (
    id_buku integer NOT NULL,
    id_kategori integer NOT NULL
);


ALTER TABLE public.buku_kategori OWNER TO postgres;

--
-- TOC entry 226 (class 1259 OID 32787)
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
-- TOC entry 234 (class 1259 OID 32856)
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
-- TOC entry 223 (class 1259 OID 32784)
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
-- TOC entry 236 (class 1259 OID 32892)
-- Name: detail_peminjaman; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.detail_peminjaman (
    id_detail integer DEFAULT nextval('public.detail_peminjaman_seq'::regclass) NOT NULL,
    id_peminjaman integer NOT NULL,
    id_buku integer NOT NULL
);


ALTER TABLE public.detail_peminjaman OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 32781)
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
-- TOC entry 229 (class 1259 OID 32804)
-- Name: kategori; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.kategori (
    id_kategori integer DEFAULT nextval('public.kategori_seq'::regclass) NOT NULL,
    nama_kategori character varying(100) NOT NULL
);


ALTER TABLE public.kategori OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 32779)
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
-- TOC entry 228 (class 1259 OID 32796)
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
-- TOC entry 225 (class 1259 OID 32786)
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
-- TOC entry 233 (class 1259 OID 32844)
-- Name: pembelian; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pembelian (
    id_pembelian integer DEFAULT nextval('public.pembelian_seq'::regclass) NOT NULL,
    id_supplier integer,
    tanggal_pembelian date DEFAULT CURRENT_DATE NOT NULL
);


ALTER TABLE public.pembelian OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 32783)
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
-- TOC entry 235 (class 1259 OID 32875)
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
-- TOC entry 224 (class 1259 OID 32785)
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
-- TOC entry 237 (class 1259 OID 32908)
-- Name: pengembalian; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pengembalian (
    id_pengembalian integer DEFAULT nextval('public.pengembalian_seq'::regclass) NOT NULL,
    id_peminjaman integer NOT NULL,
    tanggal_pengembalian date NOT NULL,
    keterlambatan_hari integer DEFAULT 0 NOT NULL,
    denda numeric(12,2) DEFAULT 0 NOT NULL
);


ALTER TABLE public.pengembalian OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 32782)
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
-- TOC entry 232 (class 1259 OID 32838)
-- Name: supplier; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.supplier (
    id_supplier integer DEFAULT nextval('public.supplier_seq'::regclass) NOT NULL,
    nama_supplier character varying(200) NOT NULL
);


ALTER TABLE public.supplier OWNER TO postgres;

--
-- TOC entry 4905 (class 0 OID 32788)
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
\.


--
-- TOC entry 4908 (class 0 OID 32812)
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
9	1000000000009	Judul Buku 9	11
10	1000000000010	Judul Buku 10	0
11	1000000000011	Judul Buku 11	0
12	1000000000012	Judul Buku 12	0
13	1000000000013	Judul Buku 13	0
14	1000000000014	Judul Buku 14	21
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
103	1000000000103	Judul Buku 103	2
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
334	1000000000334	Judul Buku 334	13
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
359	1000000000359	Judul Buku 359	7
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
375	1000000000375	Judul Buku 375	19
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
393	1000000000393	Judul Buku 393	21
394	1000000000394	Judul Buku 394	0
395	1000000000395	Judul Buku 395	0
396	1000000000396	Judul Buku 396	0
397	1000000000397	Judul Buku 397	0
398	1000000000398	Judul Buku 398	0
399	1000000000399	Judul Buku 399	17
400	1000000000400	Judul Buku 400	0
401	1000000000401	Judul Buku 401	0
402	1000000000402	Judul Buku 402	0
403	1000000000403	Judul Buku 403	0
404	1000000000404	Judul Buku 404	0
405	1000000000405	Judul Buku 405	0
406	1000000000406	Judul Buku 406	0
407	1000000000407	Judul Buku 407	0
408	1000000000408	Judul Buku 408	0
409	1000000000409	Judul Buku 409	8
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
549	1000000000549	Judul Buku 549	9
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
657	1000000000657	Judul Buku 657	20
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
684	1000000000684	Judul Buku 684	8
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
724	1000000000724	Judul Buku 724	16
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
762	1000000000762	Judul Buku 762	6
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
812	1000000000812	Judul Buku 812	7
813	1000000000813	Judul Buku 813	0
814	1000000000814	Judul Buku 814	0
815	1000000000815	Judul Buku 815	0
816	1000000000816	Judul Buku 816	0
817	1000000000817	Judul Buku 817	0
818	1000000000818	Judul Buku 818	0
819	1000000000819	Judul Buku 819	0
820	1000000000820	Judul Buku 820	0
821	1000000000821	Judul Buku 821	7
822	1000000000822	Judul Buku 822	12
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
880	1000000000880	Judul Buku 880	12
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
892	1000000000892	Judul Buku 892	14
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
910	1000000000910	Judul Buku 910	11
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
\.


--
-- TOC entry 4909 (class 0 OID 32823)
-- Dependencies: 231
-- Data for Name: buku_kategori; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.buku_kategori (id_buku, id_kategori) FROM stdin;
1	19
2	1
3	1
4	3
5	14
6	15
7	10
8	3
9	13
10	16
11	3
12	9
13	10
14	11
15	3
16	17
17	1
18	5
19	19
20	18
21	6
22	6
23	11
24	8
25	6
26	9
27	15
28	10
29	15
30	13
31	13
32	17
33	4
34	11
35	11
36	10
37	18
38	7
39	15
40	15
41	2
42	20
43	15
44	16
45	7
46	2
47	10
48	11
49	15
50	5
51	12
52	11
53	13
54	10
55	16
56	13
57	16
58	2
59	3
60	1
61	16
62	11
63	17
64	9
65	2
66	14
67	11
68	15
69	10
70	20
71	11
72	3
73	20
74	14
75	7
76	18
77	16
78	13
79	13
80	8
81	9
82	16
83	15
84	7
85	3
86	19
87	12
88	3
89	15
90	19
91	15
92	13
93	4
94	18
95	14
96	8
97	5
98	8
99	1
100	2
101	20
102	12
103	11
104	2
105	9
106	9
107	5
108	11
109	4
110	6
111	3
112	14
113	16
114	13
115	5
116	9
117	10
118	2
119	12
120	4
121	6
122	12
123	6
124	20
125	9
126	19
127	18
128	18
129	9
130	17
131	11
132	8
133	20
134	4
135	3
136	1
137	6
138	12
139	12
140	12
141	5
142	7
143	7
144	2
145	7
146	16
147	18
148	12
149	8
150	17
151	4
152	20
153	8
154	11
155	10
156	6
157	17
158	10
159	5
160	14
161	3
162	13
163	7
164	13
165	2
166	12
167	8
168	11
169	11
170	5
171	18
172	18
173	11
174	10
175	2
176	16
177	17
178	17
179	12
180	13
181	11
182	12
183	3
184	20
185	14
186	16
187	6
188	11
189	13
190	9
191	19
192	19
193	12
194	1
195	13
196	8
197	13
198	17
199	4
200	7
201	7
202	19
203	17
204	16
205	1
206	9
207	19
208	9
209	11
210	18
211	6
212	18
213	5
214	7
215	13
216	3
217	20
218	20
219	14
220	11
221	12
222	4
223	8
224	7
225	1
226	7
227	9
228	19
229	2
230	19
231	18
232	15
233	15
234	19
235	7
236	12
237	2
238	8
239	8
240	1
241	2
242	11
243	14
244	5
245	16
246	3
247	12
248	5
249	12
250	3
251	19
252	2
253	4
254	5
255	3
256	7
257	16
258	14
259	15
260	4
261	3
262	8
263	9
264	17
265	16
266	18
267	12
268	5
269	16
270	7
271	7
272	18
273	16
274	10
275	2
276	9
277	18
278	4
279	7
280	9
281	10
282	3
283	8
284	10
285	16
286	12
287	14
288	14
289	5
290	12
291	16
292	16
293	5
294	8
295	8
296	19
297	19
298	6
299	18
300	15
301	4
302	8
303	5
304	19
305	11
306	8
307	19
308	10
309	13
310	10
311	3
312	19
313	14
314	1
315	20
316	16
317	6
318	12
319	6
320	15
321	11
322	4
323	14
324	20
325	9
326	6
327	19
328	3
329	20
330	9
331	8
332	16
333	7
334	17
335	14
336	3
337	20
338	6
339	7
340	15
341	18
342	12
343	10
344	3
345	3
346	10
347	14
348	9
349	2
350	6
351	17
352	5
353	13
354	19
355	18
356	13
357	3
358	16
359	14
360	5
361	16
362	2
363	15
364	1
365	6
366	3
367	12
368	14
369	12
370	6
371	7
372	3
373	7
374	2
375	6
376	7
377	13
378	2
379	4
380	16
381	14
382	8
383	2
384	16
385	5
386	18
387	16
388	11
389	17
390	4
391	7
392	11
393	3
394	15
395	4
396	17
397	8
398	15
399	20
400	20
401	16
402	6
403	14
404	6
405	17
406	10
407	18
408	13
409	13
410	20
411	2
412	3
413	12
414	8
415	7
416	19
417	20
418	8
419	2
420	3
421	18
422	13
423	14
424	5
425	6
426	10
427	19
428	3
429	2
430	3
431	9
432	8
433	13
434	8
435	19
436	2
437	18
438	20
439	2
440	12
441	10
442	6
443	16
444	10
445	13
446	4
447	3
448	4
449	2
450	18
451	15
452	10
453	13
454	8
455	15
456	15
457	2
458	3
459	5
460	8
461	18
462	6
463	12
464	3
465	15
466	15
467	17
468	5
469	7
470	17
471	20
472	11
473	12
474	2
475	19
476	13
477	18
478	9
479	18
480	10
481	20
482	2
483	3
484	14
485	17
486	6
487	18
488	10
489	17
490	9
491	3
492	3
493	8
494	2
495	10
496	12
497	18
498	4
499	20
500	12
501	2
502	10
503	20
504	15
505	1
506	9
507	17
508	7
509	10
510	14
511	5
512	17
513	14
514	3
515	15
516	15
517	11
518	2
519	4
520	6
521	3
522	4
523	8
524	15
525	12
526	2
527	13
528	19
529	4
530	5
531	16
532	7
533	5
534	1
535	14
536	14
537	16
538	15
539	7
540	18
541	20
542	6
543	10
544	18
545	9
546	7
547	10
548	15
549	2
550	4
551	15
552	14
553	7
554	16
555	12
556	3
557	11
558	9
559	17
560	15
561	5
562	9
563	20
564	2
565	13
566	1
567	2
568	11
569	3
570	19
571	5
572	16
573	10
574	5
575	19
576	15
577	8
578	6
579	6
580	17
581	6
582	5
583	18
584	14
585	3
586	12
587	13
588	5
589	5
590	2
591	4
592	12
593	15
594	15
595	15
596	12
597	18
598	8
599	6
600	8
601	18
602	18
603	3
604	1
605	7
606	5
607	13
608	3
609	13
610	5
611	12
612	19
613	5
614	6
615	3
616	3
617	10
618	2
619	10
620	6
621	19
622	3
623	19
624	1
625	18
626	7
627	16
628	3
629	8
630	16
631	16
632	5
633	7
634	18
635	18
636	15
637	5
638	17
639	1
640	8
641	11
642	17
643	7
644	5
645	2
646	12
647	2
648	11
649	3
650	11
651	19
652	14
653	6
654	17
655	2
656	18
657	18
658	3
659	4
660	16
661	20
662	9
663	9
664	17
665	11
666	18
667	12
668	2
669	6
670	19
671	19
672	6
673	9
674	12
675	2
676	6
677	2
678	9
679	13
680	16
681	9
682	4
683	5
684	3
685	11
686	10
687	20
688	15
689	5
690	14
691	17
692	10
693	12
694	14
695	4
696	19
697	11
698	18
699	11
700	16
701	19
702	18
703	16
704	8
705	2
706	13
707	1
708	19
709	3
710	20
711	7
712	12
713	15
714	1
715	16
716	15
717	9
718	19
719	18
720	2
721	19
722	13
723	15
724	8
725	19
726	18
727	16
728	4
729	17
730	9
731	3
732	19
733	2
734	4
735	14
736	19
737	20
738	14
739	4
740	5
741	6
742	2
743	7
744	7
745	15
746	7
747	10
748	13
749	9
750	13
751	2
752	9
753	1
754	16
755	13
756	2
757	16
758	12
759	2
760	5
761	15
762	14
763	17
764	5
765	10
766	10
767	9
768	7
769	4
770	16
771	7
772	5
773	6
774	20
775	13
776	2
777	5
778	19
779	18
780	18
781	13
782	18
783	2
784	4
785	12
786	14
787	13
788	13
789	5
790	6
791	3
792	4
793	14
794	12
795	12
796	7
797	2
798	12
799	16
800	7
801	15
802	11
803	19
804	15
805	2
806	17
807	10
808	15
809	17
810	8
811	3
812	13
813	6
814	19
815	5
816	11
817	9
818	18
819	13
820	18
821	2
822	1
823	14
824	17
825	9
826	6
827	3
828	5
829	9
830	9
831	19
832	7
833	14
834	2
835	12
836	20
837	5
838	19
839	4
840	5
841	12
842	8
843	15
844	16
845	2
846	3
847	19
848	14
849	17
850	2
851	16
852	4
853	8
854	8
855	16
856	15
857	14
858	5
859	20
860	3
861	3
862	3
863	5
864	20
865	15
866	2
867	4
868	9
869	11
870	2
871	10
872	11
873	13
874	5
875	12
876	5
877	14
878	6
879	6
880	18
881	6
882	9
883	6
884	16
885	15
886	6
887	13
888	19
889	14
890	10
891	6
892	15
893	12
894	18
895	5
896	4
897	10
898	12
899	18
900	10
901	2
902	18
903	9
904	17
905	15
906	4
907	15
908	19
909	12
910	5
911	20
912	8
913	13
914	19
915	3
916	12
917	10
918	15
919	2
920	15
921	12
922	2
923	3
924	4
925	12
926	14
927	2
928	12
929	10
930	17
931	8
932	2
933	2
934	4
935	9
936	10
937	10
938	3
939	14
940	5
941	12
942	8
943	1
944	18
945	3
946	14
947	8
948	12
949	7
950	19
951	17
952	16
953	15
954	11
955	11
956	9
957	2
958	16
959	16
960	18
961	19
962	8
963	4
964	5
965	7
966	5
967	10
968	5
969	12
970	11
971	18
972	8
973	19
974	11
975	11
976	7
977	10
978	17
979	16
980	19
981	6
982	11
983	15
984	11
985	9
986	14
987	12
988	16
989	15
990	10
991	1
992	9
993	1
994	5
995	8
996	9
997	1
998	10
999	17
1000	20
\.


--
-- TOC entry 4912 (class 0 OID 32856)
-- Dependencies: 234
-- Data for Name: detail_pembelian; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.detail_pembelian (id_detail, id_pembelian, id_buku, jumlah, harga_satuan) FROM stdin;
1	1	762	6	49.46
2	2	9	11	21.64
3	3	910	11	97.26
4	4	821	7	70.91
5	5	14	21	29.73
6	6	724	16	40.79
7	7	822	12	80.32
8	8	812	7	27.17
9	9	880	12	16.71
10	10	549	9	8.38
11	11	359	7	82.00
12	12	375	19	44.67
13	13	892	14	72.02
14	14	409	8	27.03
15	15	393	21	54.21
16	16	399	17	32.50
17	17	334	13	26.50
18	18	684	8	8.16
19	19	103	2	19.95
20	20	657	20	6.32
\.


--
-- TOC entry 4914 (class 0 OID 32892)
-- Dependencies: 236
-- Data for Name: detail_peminjaman; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.detail_peminjaman (id_detail, id_peminjaman, id_buku) FROM stdin;
\.


--
-- TOC entry 4907 (class 0 OID 32804)
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
-- TOC entry 4906 (class 0 OID 32796)
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
51	Pegawai 1	Alamat Pegawai 1	\N
52	Pegawai 2	Alamat Pegawai 2	\N
53	Pegawai 3	Alamat Pegawai 3	\N
54	Pegawai 4	Alamat Pegawai 4	\N
55	Pegawai 5	Alamat Pegawai 5	\N
56	Pegawai 6	Alamat Pegawai 6	\N
57	Pegawai 7	Alamat Pegawai 7	\N
58	Pegawai 8	Alamat Pegawai 8	\N
59	Pegawai 9	Alamat Pegawai 9	\N
60	Pegawai 10	Alamat Pegawai 10	\N
61	Pegawai 11	Alamat Pegawai 11	\N
62	Pegawai 12	Alamat Pegawai 12	\N
63	Pegawai 13	Alamat Pegawai 13	\N
64	Pegawai 14	Alamat Pegawai 14	\N
65	Pegawai 15	Alamat Pegawai 15	\N
66	Pegawai 16	Alamat Pegawai 16	\N
67	Pegawai 17	Alamat Pegawai 17	\N
68	Pegawai 18	Alamat Pegawai 18	\N
69	Pegawai 19	Alamat Pegawai 19	\N
70	Pegawai 20	Alamat Pegawai 20	\N
71	Pegawai 21	Alamat Pegawai 21	\N
72	Pegawai 22	Alamat Pegawai 22	\N
73	Pegawai 23	Alamat Pegawai 23	\N
74	Pegawai 24	Alamat Pegawai 24	\N
75	Pegawai 25	Alamat Pegawai 25	\N
76	Pegawai 26	Alamat Pegawai 26	\N
77	Pegawai 27	Alamat Pegawai 27	\N
78	Pegawai 28	Alamat Pegawai 28	\N
79	Pegawai 29	Alamat Pegawai 29	\N
80	Pegawai 30	Alamat Pegawai 30	\N
81	Pegawai 31	Alamat Pegawai 31	\N
82	Pegawai 32	Alamat Pegawai 32	\N
83	Pegawai 33	Alamat Pegawai 33	\N
84	Pegawai 34	Alamat Pegawai 34	\N
85	Pegawai 35	Alamat Pegawai 35	\N
86	Pegawai 36	Alamat Pegawai 36	\N
87	Pegawai 37	Alamat Pegawai 37	\N
88	Pegawai 38	Alamat Pegawai 38	\N
89	Pegawai 39	Alamat Pegawai 39	\N
90	Pegawai 40	Alamat Pegawai 40	\N
91	Pegawai 41	Alamat Pegawai 41	\N
92	Pegawai 42	Alamat Pegawai 42	\N
93	Pegawai 43	Alamat Pegawai 43	\N
94	Pegawai 44	Alamat Pegawai 44	\N
95	Pegawai 45	Alamat Pegawai 45	\N
96	Pegawai 46	Alamat Pegawai 46	\N
97	Pegawai 47	Alamat Pegawai 47	\N
98	Pegawai 48	Alamat Pegawai 48	\N
99	Pegawai 49	Alamat Pegawai 49	\N
100	Pegawai 50	Alamat Pegawai 50	\N
101	Pegawai 51	Alamat Pegawai 51	\N
102	Pegawai 52	Alamat Pegawai 52	\N
103	Pegawai 53	Alamat Pegawai 53	\N
104	Pegawai 54	Alamat Pegawai 54	\N
105	Pegawai 55	Alamat Pegawai 55	\N
106	Pegawai 56	Alamat Pegawai 56	\N
107	Pegawai 57	Alamat Pegawai 57	\N
108	Pegawai 58	Alamat Pegawai 58	\N
109	Pegawai 59	Alamat Pegawai 59	\N
110	Pegawai 60	Alamat Pegawai 60	\N
111	Pegawai 61	Alamat Pegawai 61	\N
112	Pegawai 62	Alamat Pegawai 62	\N
113	Pegawai 63	Alamat Pegawai 63	\N
114	Pegawai 64	Alamat Pegawai 64	\N
115	Pegawai 65	Alamat Pegawai 65	\N
116	Pegawai 66	Alamat Pegawai 66	\N
117	Pegawai 67	Alamat Pegawai 67	\N
118	Pegawai 68	Alamat Pegawai 68	\N
119	Pegawai 69	Alamat Pegawai 69	\N
120	Pegawai 70	Alamat Pegawai 70	\N
121	Pegawai 71	Alamat Pegawai 71	\N
122	Pegawai 72	Alamat Pegawai 72	\N
123	Pegawai 73	Alamat Pegawai 73	\N
124	Pegawai 74	Alamat Pegawai 74	\N
125	Pegawai 75	Alamat Pegawai 75	\N
126	Pegawai 76	Alamat Pegawai 76	\N
127	Pegawai 77	Alamat Pegawai 77	\N
128	Pegawai 78	Alamat Pegawai 78	\N
129	Pegawai 79	Alamat Pegawai 79	\N
130	Pegawai 80	Alamat Pegawai 80	\N
131	Pegawai 81	Alamat Pegawai 81	\N
132	Pegawai 82	Alamat Pegawai 82	\N
133	Pegawai 83	Alamat Pegawai 83	\N
134	Pegawai 84	Alamat Pegawai 84	\N
135	Pegawai 85	Alamat Pegawai 85	\N
136	Pegawai 86	Alamat Pegawai 86	\N
137	Pegawai 87	Alamat Pegawai 87	\N
138	Pegawai 88	Alamat Pegawai 88	\N
139	Pegawai 89	Alamat Pegawai 89	\N
140	Pegawai 90	Alamat Pegawai 90	\N
141	Pegawai 91	Alamat Pegawai 91	\N
142	Pegawai 92	Alamat Pegawai 92	\N
143	Pegawai 93	Alamat Pegawai 93	\N
144	Pegawai 94	Alamat Pegawai 94	\N
145	Pegawai 95	Alamat Pegawai 95	\N
146	Pegawai 96	Alamat Pegawai 96	\N
147	Pegawai 97	Alamat Pegawai 97	\N
148	Pegawai 98	Alamat Pegawai 98	\N
149	Pegawai 99	Alamat Pegawai 99	\N
150	Pegawai 100	Alamat Pegawai 100	\N
151	Pegawai 101	Alamat Pegawai 101	\N
152	Pegawai 102	Alamat Pegawai 102	\N
153	Pegawai 103	Alamat Pegawai 103	\N
154	Pegawai 104	Alamat Pegawai 104	\N
155	Pegawai 105	Alamat Pegawai 105	\N
156	Pegawai 106	Alamat Pegawai 106	\N
157	Pegawai 107	Alamat Pegawai 107	\N
158	Pegawai 108	Alamat Pegawai 108	\N
159	Pegawai 109	Alamat Pegawai 109	\N
160	Pegawai 110	Alamat Pegawai 110	\N
161	Pegawai 111	Alamat Pegawai 111	\N
162	Pegawai 112	Alamat Pegawai 112	\N
163	Pegawai 113	Alamat Pegawai 113	\N
164	Pegawai 114	Alamat Pegawai 114	\N
165	Pegawai 115	Alamat Pegawai 115	\N
166	Pegawai 116	Alamat Pegawai 116	\N
167	Pegawai 117	Alamat Pegawai 117	\N
168	Pegawai 118	Alamat Pegawai 118	\N
169	Pegawai 119	Alamat Pegawai 119	\N
170	Pegawai 120	Alamat Pegawai 120	\N
171	Pegawai 121	Alamat Pegawai 121	\N
172	Pegawai 122	Alamat Pegawai 122	\N
173	Pegawai 123	Alamat Pegawai 123	\N
174	Pegawai 124	Alamat Pegawai 124	\N
175	Pegawai 125	Alamat Pegawai 125	\N
176	Pegawai 126	Alamat Pegawai 126	\N
177	Pegawai 127	Alamat Pegawai 127	\N
178	Pegawai 128	Alamat Pegawai 128	\N
179	Pegawai 129	Alamat Pegawai 129	\N
180	Pegawai 130	Alamat Pegawai 130	\N
181	Pegawai 131	Alamat Pegawai 131	\N
182	Pegawai 132	Alamat Pegawai 132	\N
183	Pegawai 133	Alamat Pegawai 133	\N
184	Pegawai 134	Alamat Pegawai 134	\N
185	Pegawai 135	Alamat Pegawai 135	\N
186	Pegawai 136	Alamat Pegawai 136	\N
187	Pegawai 137	Alamat Pegawai 137	\N
188	Pegawai 138	Alamat Pegawai 138	\N
189	Pegawai 139	Alamat Pegawai 139	\N
190	Pegawai 140	Alamat Pegawai 140	\N
191	Pegawai 141	Alamat Pegawai 141	\N
192	Pegawai 142	Alamat Pegawai 142	\N
193	Pegawai 143	Alamat Pegawai 143	\N
194	Pegawai 144	Alamat Pegawai 144	\N
195	Pegawai 145	Alamat Pegawai 145	\N
196	Pegawai 146	Alamat Pegawai 146	\N
197	Pegawai 147	Alamat Pegawai 147	\N
198	Pegawai 148	Alamat Pegawai 148	\N
199	Pegawai 149	Alamat Pegawai 149	\N
200	Pegawai 150	Alamat Pegawai 150	\N
201	Pegawai 151	Alamat Pegawai 151	\N
202	Pegawai 152	Alamat Pegawai 152	\N
203	Pegawai 153	Alamat Pegawai 153	\N
204	Pegawai 154	Alamat Pegawai 154	\N
205	Pegawai 155	Alamat Pegawai 155	\N
206	Pegawai 156	Alamat Pegawai 156	\N
207	Pegawai 157	Alamat Pegawai 157	\N
208	Pegawai 158	Alamat Pegawai 158	\N
209	Pegawai 159	Alamat Pegawai 159	\N
210	Pegawai 160	Alamat Pegawai 160	\N
211	Pegawai 161	Alamat Pegawai 161	\N
212	Pegawai 162	Alamat Pegawai 162	\N
213	Pegawai 163	Alamat Pegawai 163	\N
214	Pegawai 164	Alamat Pegawai 164	\N
215	Pegawai 165	Alamat Pegawai 165	\N
216	Pegawai 166	Alamat Pegawai 166	\N
217	Pegawai 167	Alamat Pegawai 167	\N
218	Pegawai 168	Alamat Pegawai 168	\N
219	Pegawai 169	Alamat Pegawai 169	\N
220	Pegawai 170	Alamat Pegawai 170	\N
221	Pegawai 171	Alamat Pegawai 171	\N
222	Pegawai 172	Alamat Pegawai 172	\N
223	Pegawai 173	Alamat Pegawai 173	\N
224	Pegawai 174	Alamat Pegawai 174	\N
225	Pegawai 175	Alamat Pegawai 175	\N
226	Pegawai 176	Alamat Pegawai 176	\N
227	Pegawai 177	Alamat Pegawai 177	\N
228	Pegawai 178	Alamat Pegawai 178	\N
229	Pegawai 179	Alamat Pegawai 179	\N
230	Pegawai 180	Alamat Pegawai 180	\N
231	Pegawai 181	Alamat Pegawai 181	\N
232	Pegawai 182	Alamat Pegawai 182	\N
233	Pegawai 183	Alamat Pegawai 183	\N
234	Pegawai 184	Alamat Pegawai 184	\N
235	Pegawai 185	Alamat Pegawai 185	\N
236	Pegawai 186	Alamat Pegawai 186	\N
237	Pegawai 187	Alamat Pegawai 187	\N
238	Pegawai 188	Alamat Pegawai 188	\N
239	Pegawai 189	Alamat Pegawai 189	\N
240	Pegawai 190	Alamat Pegawai 190	\N
241	Pegawai 191	Alamat Pegawai 191	\N
242	Pegawai 192	Alamat Pegawai 192	\N
243	Pegawai 193	Alamat Pegawai 193	\N
244	Pegawai 194	Alamat Pegawai 194	\N
245	Pegawai 195	Alamat Pegawai 195	\N
246	Pegawai 196	Alamat Pegawai 196	\N
247	Pegawai 197	Alamat Pegawai 197	\N
248	Pegawai 198	Alamat Pegawai 198	\N
249	Pegawai 199	Alamat Pegawai 199	\N
250	Pegawai 200	Alamat Pegawai 200	\N
251	Pegawai 201	Alamat Pegawai 201	\N
252	Pegawai 202	Alamat Pegawai 202	\N
253	Pegawai 203	Alamat Pegawai 203	\N
254	Pegawai 204	Alamat Pegawai 204	\N
255	Pegawai 205	Alamat Pegawai 205	\N
256	Pegawai 206	Alamat Pegawai 206	\N
257	Pegawai 207	Alamat Pegawai 207	\N
258	Pegawai 208	Alamat Pegawai 208	\N
259	Pegawai 209	Alamat Pegawai 209	\N
260	Pegawai 210	Alamat Pegawai 210	\N
261	Pegawai 211	Alamat Pegawai 211	\N
262	Pegawai 212	Alamat Pegawai 212	\N
263	Pegawai 213	Alamat Pegawai 213	\N
264	Pegawai 214	Alamat Pegawai 214	\N
265	Pegawai 215	Alamat Pegawai 215	\N
266	Pegawai 216	Alamat Pegawai 216	\N
267	Pegawai 217	Alamat Pegawai 217	\N
268	Pegawai 218	Alamat Pegawai 218	\N
269	Pegawai 219	Alamat Pegawai 219	\N
270	Pegawai 220	Alamat Pegawai 220	\N
271	Pegawai 221	Alamat Pegawai 221	\N
272	Pegawai 222	Alamat Pegawai 222	\N
273	Pegawai 223	Alamat Pegawai 223	\N
274	Pegawai 224	Alamat Pegawai 224	\N
275	Pegawai 225	Alamat Pegawai 225	\N
276	Pegawai 226	Alamat Pegawai 226	\N
277	Pegawai 227	Alamat Pegawai 227	\N
278	Pegawai 228	Alamat Pegawai 228	\N
279	Pegawai 229	Alamat Pegawai 229	\N
280	Pegawai 230	Alamat Pegawai 230	\N
281	Pegawai 231	Alamat Pegawai 231	\N
282	Pegawai 232	Alamat Pegawai 232	\N
283	Pegawai 233	Alamat Pegawai 233	\N
284	Pegawai 234	Alamat Pegawai 234	\N
285	Pegawai 235	Alamat Pegawai 235	\N
286	Pegawai 236	Alamat Pegawai 236	\N
287	Pegawai 237	Alamat Pegawai 237	\N
288	Pegawai 238	Alamat Pegawai 238	\N
289	Pegawai 239	Alamat Pegawai 239	\N
290	Pegawai 240	Alamat Pegawai 240	\N
291	Pegawai 241	Alamat Pegawai 241	\N
292	Pegawai 242	Alamat Pegawai 242	\N
293	Pegawai 243	Alamat Pegawai 243	\N
294	Pegawai 244	Alamat Pegawai 244	\N
295	Pegawai 245	Alamat Pegawai 245	\N
296	Pegawai 246	Alamat Pegawai 246	\N
297	Pegawai 247	Alamat Pegawai 247	\N
298	Pegawai 248	Alamat Pegawai 248	\N
299	Pegawai 249	Alamat Pegawai 249	\N
300	Pegawai 250	Alamat Pegawai 250	\N
301	Pegawai 251	Alamat Pegawai 251	\N
302	Pegawai 252	Alamat Pegawai 252	\N
303	Pegawai 253	Alamat Pegawai 253	\N
304	Pegawai 254	Alamat Pegawai 254	\N
305	Pegawai 255	Alamat Pegawai 255	\N
306	Pegawai 256	Alamat Pegawai 256	\N
307	Pegawai 257	Alamat Pegawai 257	\N
308	Pegawai 258	Alamat Pegawai 258	\N
309	Pegawai 259	Alamat Pegawai 259	\N
310	Pegawai 260	Alamat Pegawai 260	\N
311	Pegawai 261	Alamat Pegawai 261	\N
312	Pegawai 262	Alamat Pegawai 262	\N
313	Pegawai 263	Alamat Pegawai 263	\N
314	Pegawai 264	Alamat Pegawai 264	\N
315	Pegawai 265	Alamat Pegawai 265	\N
316	Pegawai 266	Alamat Pegawai 266	\N
317	Pegawai 267	Alamat Pegawai 267	\N
318	Pegawai 268	Alamat Pegawai 268	\N
319	Pegawai 269	Alamat Pegawai 269	\N
320	Pegawai 270	Alamat Pegawai 270	\N
321	Pegawai 271	Alamat Pegawai 271	\N
322	Pegawai 272	Alamat Pegawai 272	\N
323	Pegawai 273	Alamat Pegawai 273	\N
324	Pegawai 274	Alamat Pegawai 274	\N
325	Pegawai 275	Alamat Pegawai 275	\N
326	Pegawai 276	Alamat Pegawai 276	\N
327	Pegawai 277	Alamat Pegawai 277	\N
328	Pegawai 278	Alamat Pegawai 278	\N
329	Pegawai 279	Alamat Pegawai 279	\N
330	Pegawai 280	Alamat Pegawai 280	\N
331	Pegawai 281	Alamat Pegawai 281	\N
332	Pegawai 282	Alamat Pegawai 282	\N
333	Pegawai 283	Alamat Pegawai 283	\N
334	Pegawai 284	Alamat Pegawai 284	\N
335	Pegawai 285	Alamat Pegawai 285	\N
336	Pegawai 286	Alamat Pegawai 286	\N
337	Pegawai 287	Alamat Pegawai 287	\N
338	Pegawai 288	Alamat Pegawai 288	\N
339	Pegawai 289	Alamat Pegawai 289	\N
340	Pegawai 290	Alamat Pegawai 290	\N
341	Pegawai 291	Alamat Pegawai 291	\N
342	Pegawai 292	Alamat Pegawai 292	\N
343	Pegawai 293	Alamat Pegawai 293	\N
344	Pegawai 294	Alamat Pegawai 294	\N
345	Pegawai 295	Alamat Pegawai 295	\N
346	Pegawai 296	Alamat Pegawai 296	\N
347	Pegawai 297	Alamat Pegawai 297	\N
348	Pegawai 298	Alamat Pegawai 298	\N
349	Pegawai 299	Alamat Pegawai 299	\N
350	Pegawai 300	Alamat Pegawai 300	\N
351	Pegawai 301	Alamat Pegawai 301	\N
352	Pegawai 302	Alamat Pegawai 302	\N
353	Pegawai 303	Alamat Pegawai 303	\N
354	Pegawai 304	Alamat Pegawai 304	\N
355	Pegawai 305	Alamat Pegawai 305	\N
356	Pegawai 306	Alamat Pegawai 306	\N
357	Pegawai 307	Alamat Pegawai 307	\N
358	Pegawai 308	Alamat Pegawai 308	\N
359	Pegawai 309	Alamat Pegawai 309	\N
360	Pegawai 310	Alamat Pegawai 310	\N
361	Pegawai 311	Alamat Pegawai 311	\N
362	Pegawai 312	Alamat Pegawai 312	\N
363	Pegawai 313	Alamat Pegawai 313	\N
364	Pegawai 314	Alamat Pegawai 314	\N
365	Pegawai 315	Alamat Pegawai 315	\N
366	Pegawai 316	Alamat Pegawai 316	\N
367	Pegawai 317	Alamat Pegawai 317	\N
368	Pegawai 318	Alamat Pegawai 318	\N
369	Pegawai 319	Alamat Pegawai 319	\N
370	Pegawai 320	Alamat Pegawai 320	\N
371	Pegawai 321	Alamat Pegawai 321	\N
372	Pegawai 322	Alamat Pegawai 322	\N
373	Pegawai 323	Alamat Pegawai 323	\N
374	Pegawai 324	Alamat Pegawai 324	\N
375	Pegawai 325	Alamat Pegawai 325	\N
376	Pegawai 326	Alamat Pegawai 326	\N
377	Pegawai 327	Alamat Pegawai 327	\N
378	Pegawai 328	Alamat Pegawai 328	\N
379	Pegawai 329	Alamat Pegawai 329	\N
380	Pegawai 330	Alamat Pegawai 330	\N
381	Pegawai 331	Alamat Pegawai 331	\N
382	Pegawai 332	Alamat Pegawai 332	\N
383	Pegawai 333	Alamat Pegawai 333	\N
384	Pegawai 334	Alamat Pegawai 334	\N
385	Pegawai 335	Alamat Pegawai 335	\N
386	Pegawai 336	Alamat Pegawai 336	\N
387	Pegawai 337	Alamat Pegawai 337	\N
388	Pegawai 338	Alamat Pegawai 338	\N
389	Pegawai 339	Alamat Pegawai 339	\N
390	Pegawai 340	Alamat Pegawai 340	\N
391	Pegawai 341	Alamat Pegawai 341	\N
392	Pegawai 342	Alamat Pegawai 342	\N
393	Pegawai 343	Alamat Pegawai 343	\N
394	Pegawai 344	Alamat Pegawai 344	\N
395	Pegawai 345	Alamat Pegawai 345	\N
396	Pegawai 346	Alamat Pegawai 346	\N
397	Pegawai 347	Alamat Pegawai 347	\N
398	Pegawai 348	Alamat Pegawai 348	\N
399	Pegawai 349	Alamat Pegawai 349	\N
400	Pegawai 350	Alamat Pegawai 350	\N
401	Pegawai 351	Alamat Pegawai 351	\N
402	Pegawai 352	Alamat Pegawai 352	\N
403	Pegawai 353	Alamat Pegawai 353	\N
404	Pegawai 354	Alamat Pegawai 354	\N
405	Pegawai 355	Alamat Pegawai 355	\N
406	Pegawai 356	Alamat Pegawai 356	\N
407	Pegawai 357	Alamat Pegawai 357	\N
408	Pegawai 358	Alamat Pegawai 358	\N
409	Pegawai 359	Alamat Pegawai 359	\N
410	Pegawai 360	Alamat Pegawai 360	\N
411	Pegawai 361	Alamat Pegawai 361	\N
412	Pegawai 362	Alamat Pegawai 362	\N
413	Pegawai 363	Alamat Pegawai 363	\N
414	Pegawai 364	Alamat Pegawai 364	\N
415	Pegawai 365	Alamat Pegawai 365	\N
416	Pegawai 366	Alamat Pegawai 366	\N
417	Pegawai 367	Alamat Pegawai 367	\N
418	Pegawai 368	Alamat Pegawai 368	\N
419	Pegawai 369	Alamat Pegawai 369	\N
420	Pegawai 370	Alamat Pegawai 370	\N
421	Pegawai 371	Alamat Pegawai 371	\N
422	Pegawai 372	Alamat Pegawai 372	\N
423	Pegawai 373	Alamat Pegawai 373	\N
424	Pegawai 374	Alamat Pegawai 374	\N
425	Pegawai 375	Alamat Pegawai 375	\N
426	Pegawai 376	Alamat Pegawai 376	\N
427	Pegawai 377	Alamat Pegawai 377	\N
428	Pegawai 378	Alamat Pegawai 378	\N
429	Pegawai 379	Alamat Pegawai 379	\N
430	Pegawai 380	Alamat Pegawai 380	\N
431	Pegawai 381	Alamat Pegawai 381	\N
432	Pegawai 382	Alamat Pegawai 382	\N
433	Pegawai 383	Alamat Pegawai 383	\N
434	Pegawai 384	Alamat Pegawai 384	\N
435	Pegawai 385	Alamat Pegawai 385	\N
436	Pegawai 386	Alamat Pegawai 386	\N
437	Pegawai 387	Alamat Pegawai 387	\N
438	Pegawai 388	Alamat Pegawai 388	\N
439	Pegawai 389	Alamat Pegawai 389	\N
440	Pegawai 390	Alamat Pegawai 390	\N
441	Pegawai 391	Alamat Pegawai 391	\N
442	Pegawai 392	Alamat Pegawai 392	\N
443	Pegawai 393	Alamat Pegawai 393	\N
444	Pegawai 394	Alamat Pegawai 394	\N
445	Pegawai 395	Alamat Pegawai 395	\N
446	Pegawai 396	Alamat Pegawai 396	\N
447	Pegawai 397	Alamat Pegawai 397	\N
448	Pegawai 398	Alamat Pegawai 398	\N
449	Pegawai 399	Alamat Pegawai 399	\N
450	Pegawai 400	Alamat Pegawai 400	\N
451	Pegawai 401	Alamat Pegawai 401	\N
452	Pegawai 402	Alamat Pegawai 402	\N
453	Pegawai 403	Alamat Pegawai 403	\N
454	Pegawai 404	Alamat Pegawai 404	\N
455	Pegawai 405	Alamat Pegawai 405	\N
456	Pegawai 406	Alamat Pegawai 406	\N
457	Pegawai 407	Alamat Pegawai 407	\N
458	Pegawai 408	Alamat Pegawai 408	\N
459	Pegawai 409	Alamat Pegawai 409	\N
460	Pegawai 410	Alamat Pegawai 410	\N
461	Pegawai 411	Alamat Pegawai 411	\N
462	Pegawai 412	Alamat Pegawai 412	\N
463	Pegawai 413	Alamat Pegawai 413	\N
464	Pegawai 414	Alamat Pegawai 414	\N
465	Pegawai 415	Alamat Pegawai 415	\N
466	Pegawai 416	Alamat Pegawai 416	\N
467	Pegawai 417	Alamat Pegawai 417	\N
468	Pegawai 418	Alamat Pegawai 418	\N
469	Pegawai 419	Alamat Pegawai 419	\N
470	Pegawai 420	Alamat Pegawai 420	\N
471	Pegawai 421	Alamat Pegawai 421	\N
472	Pegawai 422	Alamat Pegawai 422	\N
473	Pegawai 423	Alamat Pegawai 423	\N
474	Pegawai 424	Alamat Pegawai 424	\N
475	Pegawai 425	Alamat Pegawai 425	\N
476	Pegawai 426	Alamat Pegawai 426	\N
477	Pegawai 427	Alamat Pegawai 427	\N
478	Pegawai 428	Alamat Pegawai 428	\N
479	Pegawai 429	Alamat Pegawai 429	\N
480	Pegawai 430	Alamat Pegawai 430	\N
481	Pegawai 431	Alamat Pegawai 431	\N
482	Pegawai 432	Alamat Pegawai 432	\N
483	Pegawai 433	Alamat Pegawai 433	\N
484	Pegawai 434	Alamat Pegawai 434	\N
485	Pegawai 435	Alamat Pegawai 435	\N
486	Pegawai 436	Alamat Pegawai 436	\N
487	Pegawai 437	Alamat Pegawai 437	\N
488	Pegawai 438	Alamat Pegawai 438	\N
489	Pegawai 439	Alamat Pegawai 439	\N
490	Pegawai 440	Alamat Pegawai 440	\N
491	Pegawai 441	Alamat Pegawai 441	\N
492	Pegawai 442	Alamat Pegawai 442	\N
493	Pegawai 443	Alamat Pegawai 443	\N
494	Pegawai 444	Alamat Pegawai 444	\N
495	Pegawai 445	Alamat Pegawai 445	\N
496	Pegawai 446	Alamat Pegawai 446	\N
497	Pegawai 447	Alamat Pegawai 447	\N
498	Pegawai 448	Alamat Pegawai 448	\N
499	Pegawai 449	Alamat Pegawai 449	\N
500	Pegawai 450	Alamat Pegawai 450	\N
501	Pegawai 451	Alamat Pegawai 451	\N
502	Pegawai 452	Alamat Pegawai 452	\N
503	Pegawai 453	Alamat Pegawai 453	\N
504	Pegawai 454	Alamat Pegawai 454	\N
505	Pegawai 455	Alamat Pegawai 455	\N
506	Pegawai 456	Alamat Pegawai 456	\N
507	Pegawai 457	Alamat Pegawai 457	\N
508	Pegawai 458	Alamat Pegawai 458	\N
509	Pegawai 459	Alamat Pegawai 459	\N
510	Pegawai 460	Alamat Pegawai 460	\N
511	Pegawai 461	Alamat Pegawai 461	\N
512	Pegawai 462	Alamat Pegawai 462	\N
513	Pegawai 463	Alamat Pegawai 463	\N
514	Pegawai 464	Alamat Pegawai 464	\N
515	Pegawai 465	Alamat Pegawai 465	\N
516	Pegawai 466	Alamat Pegawai 466	\N
517	Pegawai 467	Alamat Pegawai 467	\N
518	Pegawai 468	Alamat Pegawai 468	\N
519	Pegawai 469	Alamat Pegawai 469	\N
520	Pegawai 470	Alamat Pegawai 470	\N
521	Pegawai 471	Alamat Pegawai 471	\N
522	Pegawai 472	Alamat Pegawai 472	\N
523	Pegawai 473	Alamat Pegawai 473	\N
524	Pegawai 474	Alamat Pegawai 474	\N
525	Pegawai 475	Alamat Pegawai 475	\N
526	Pegawai 476	Alamat Pegawai 476	\N
527	Pegawai 477	Alamat Pegawai 477	\N
528	Pegawai 478	Alamat Pegawai 478	\N
529	Pegawai 479	Alamat Pegawai 479	\N
530	Pegawai 480	Alamat Pegawai 480	\N
531	Pegawai 481	Alamat Pegawai 481	\N
532	Pegawai 482	Alamat Pegawai 482	\N
533	Pegawai 483	Alamat Pegawai 483	\N
534	Pegawai 484	Alamat Pegawai 484	\N
535	Pegawai 485	Alamat Pegawai 485	\N
536	Pegawai 486	Alamat Pegawai 486	\N
537	Pegawai 487	Alamat Pegawai 487	\N
538	Pegawai 488	Alamat Pegawai 488	\N
539	Pegawai 489	Alamat Pegawai 489	\N
540	Pegawai 490	Alamat Pegawai 490	\N
541	Pegawai 491	Alamat Pegawai 491	\N
542	Pegawai 492	Alamat Pegawai 492	\N
543	Pegawai 493	Alamat Pegawai 493	\N
544	Pegawai 494	Alamat Pegawai 494	\N
545	Pegawai 495	Alamat Pegawai 495	\N
546	Pegawai 496	Alamat Pegawai 496	\N
547	Pegawai 497	Alamat Pegawai 497	\N
548	Pegawai 498	Alamat Pegawai 498	\N
549	Pegawai 499	Alamat Pegawai 499	\N
550	Pegawai 500	Alamat Pegawai 500	\N
551	Pegawai 501	Alamat Pegawai 501	\N
552	Pegawai 502	Alamat Pegawai 502	\N
553	Pegawai 503	Alamat Pegawai 503	\N
554	Pegawai 504	Alamat Pegawai 504	\N
555	Pegawai 505	Alamat Pegawai 505	\N
556	Pegawai 506	Alamat Pegawai 506	\N
557	Pegawai 507	Alamat Pegawai 507	\N
558	Pegawai 508	Alamat Pegawai 508	\N
559	Pegawai 509	Alamat Pegawai 509	\N
560	Pegawai 510	Alamat Pegawai 510	\N
561	Pegawai 511	Alamat Pegawai 511	\N
562	Pegawai 512	Alamat Pegawai 512	\N
563	Pegawai 513	Alamat Pegawai 513	\N
564	Pegawai 514	Alamat Pegawai 514	\N
565	Pegawai 515	Alamat Pegawai 515	\N
566	Pegawai 516	Alamat Pegawai 516	\N
567	Pegawai 517	Alamat Pegawai 517	\N
568	Pegawai 518	Alamat Pegawai 518	\N
569	Pegawai 519	Alamat Pegawai 519	\N
570	Pegawai 520	Alamat Pegawai 520	\N
571	Pegawai 521	Alamat Pegawai 521	\N
572	Pegawai 522	Alamat Pegawai 522	\N
573	Pegawai 523	Alamat Pegawai 523	\N
574	Pegawai 524	Alamat Pegawai 524	\N
575	Pegawai 525	Alamat Pegawai 525	\N
576	Pegawai 526	Alamat Pegawai 526	\N
577	Pegawai 527	Alamat Pegawai 527	\N
578	Pegawai 528	Alamat Pegawai 528	\N
579	Pegawai 529	Alamat Pegawai 529	\N
580	Pegawai 530	Alamat Pegawai 530	\N
581	Pegawai 531	Alamat Pegawai 531	\N
582	Pegawai 532	Alamat Pegawai 532	\N
583	Pegawai 533	Alamat Pegawai 533	\N
584	Pegawai 534	Alamat Pegawai 534	\N
585	Pegawai 535	Alamat Pegawai 535	\N
586	Pegawai 536	Alamat Pegawai 536	\N
587	Pegawai 537	Alamat Pegawai 537	\N
588	Pegawai 538	Alamat Pegawai 538	\N
589	Pegawai 539	Alamat Pegawai 539	\N
590	Pegawai 540	Alamat Pegawai 540	\N
591	Pegawai 541	Alamat Pegawai 541	\N
592	Pegawai 542	Alamat Pegawai 542	\N
593	Pegawai 543	Alamat Pegawai 543	\N
594	Pegawai 544	Alamat Pegawai 544	\N
595	Pegawai 545	Alamat Pegawai 545	\N
596	Pegawai 546	Alamat Pegawai 546	\N
597	Pegawai 547	Alamat Pegawai 547	\N
598	Pegawai 548	Alamat Pegawai 548	\N
599	Pegawai 549	Alamat Pegawai 549	\N
600	Pegawai 550	Alamat Pegawai 550	\N
601	Pegawai 551	Alamat Pegawai 551	\N
602	Pegawai 552	Alamat Pegawai 552	\N
603	Pegawai 553	Alamat Pegawai 553	\N
604	Pegawai 554	Alamat Pegawai 554	\N
605	Pegawai 555	Alamat Pegawai 555	\N
606	Pegawai 556	Alamat Pegawai 556	\N
607	Pegawai 557	Alamat Pegawai 557	\N
608	Pegawai 558	Alamat Pegawai 558	\N
609	Pegawai 559	Alamat Pegawai 559	\N
610	Pegawai 560	Alamat Pegawai 560	\N
611	Pegawai 561	Alamat Pegawai 561	\N
612	Pegawai 562	Alamat Pegawai 562	\N
613	Pegawai 563	Alamat Pegawai 563	\N
614	Pegawai 564	Alamat Pegawai 564	\N
615	Pegawai 565	Alamat Pegawai 565	\N
616	Pegawai 566	Alamat Pegawai 566	\N
617	Pegawai 567	Alamat Pegawai 567	\N
618	Pegawai 568	Alamat Pegawai 568	\N
619	Pegawai 569	Alamat Pegawai 569	\N
620	Pegawai 570	Alamat Pegawai 570	\N
621	Pegawai 571	Alamat Pegawai 571	\N
622	Pegawai 572	Alamat Pegawai 572	\N
623	Pegawai 573	Alamat Pegawai 573	\N
624	Pegawai 574	Alamat Pegawai 574	\N
625	Pegawai 575	Alamat Pegawai 575	\N
626	Pegawai 576	Alamat Pegawai 576	\N
627	Pegawai 577	Alamat Pegawai 577	\N
628	Pegawai 578	Alamat Pegawai 578	\N
629	Pegawai 579	Alamat Pegawai 579	\N
630	Pegawai 580	Alamat Pegawai 580	\N
631	Pegawai 581	Alamat Pegawai 581	\N
632	Pegawai 582	Alamat Pegawai 582	\N
633	Pegawai 583	Alamat Pegawai 583	\N
634	Pegawai 584	Alamat Pegawai 584	\N
635	Pegawai 585	Alamat Pegawai 585	\N
636	Pegawai 586	Alamat Pegawai 586	\N
637	Pegawai 587	Alamat Pegawai 587	\N
638	Pegawai 588	Alamat Pegawai 588	\N
639	Pegawai 589	Alamat Pegawai 589	\N
640	Pegawai 590	Alamat Pegawai 590	\N
641	Pegawai 591	Alamat Pegawai 591	\N
642	Pegawai 592	Alamat Pegawai 592	\N
643	Pegawai 593	Alamat Pegawai 593	\N
644	Pegawai 594	Alamat Pegawai 594	\N
645	Pegawai 595	Alamat Pegawai 595	\N
646	Pegawai 596	Alamat Pegawai 596	\N
647	Pegawai 597	Alamat Pegawai 597	\N
648	Pegawai 598	Alamat Pegawai 598	\N
649	Pegawai 599	Alamat Pegawai 599	\N
650	Pegawai 600	Alamat Pegawai 600	\N
651	Pegawai 601	Alamat Pegawai 601	\N
652	Pegawai 602	Alamat Pegawai 602	\N
653	Pegawai 603	Alamat Pegawai 603	\N
654	Pegawai 604	Alamat Pegawai 604	\N
655	Pegawai 605	Alamat Pegawai 605	\N
656	Pegawai 606	Alamat Pegawai 606	\N
657	Pegawai 607	Alamat Pegawai 607	\N
658	Pegawai 608	Alamat Pegawai 608	\N
659	Pegawai 609	Alamat Pegawai 609	\N
660	Pegawai 610	Alamat Pegawai 610	\N
661	Pegawai 611	Alamat Pegawai 611	\N
662	Pegawai 612	Alamat Pegawai 612	\N
663	Pegawai 613	Alamat Pegawai 613	\N
664	Pegawai 614	Alamat Pegawai 614	\N
665	Pegawai 615	Alamat Pegawai 615	\N
666	Pegawai 616	Alamat Pegawai 616	\N
667	Pegawai 617	Alamat Pegawai 617	\N
668	Pegawai 618	Alamat Pegawai 618	\N
669	Pegawai 619	Alamat Pegawai 619	\N
670	Pegawai 620	Alamat Pegawai 620	\N
671	Pegawai 621	Alamat Pegawai 621	\N
672	Pegawai 622	Alamat Pegawai 622	\N
673	Pegawai 623	Alamat Pegawai 623	\N
674	Pegawai 624	Alamat Pegawai 624	\N
675	Pegawai 625	Alamat Pegawai 625	\N
676	Pegawai 626	Alamat Pegawai 626	\N
677	Pegawai 627	Alamat Pegawai 627	\N
678	Pegawai 628	Alamat Pegawai 628	\N
679	Pegawai 629	Alamat Pegawai 629	\N
680	Pegawai 630	Alamat Pegawai 630	\N
681	Pegawai 631	Alamat Pegawai 631	\N
682	Pegawai 632	Alamat Pegawai 632	\N
683	Pegawai 633	Alamat Pegawai 633	\N
684	Pegawai 634	Alamat Pegawai 634	\N
685	Pegawai 635	Alamat Pegawai 635	\N
686	Pegawai 636	Alamat Pegawai 636	\N
687	Pegawai 637	Alamat Pegawai 637	\N
688	Pegawai 638	Alamat Pegawai 638	\N
689	Pegawai 639	Alamat Pegawai 639	\N
690	Pegawai 640	Alamat Pegawai 640	\N
691	Pegawai 641	Alamat Pegawai 641	\N
692	Pegawai 642	Alamat Pegawai 642	\N
693	Pegawai 643	Alamat Pegawai 643	\N
694	Pegawai 644	Alamat Pegawai 644	\N
695	Pegawai 645	Alamat Pegawai 645	\N
696	Pegawai 646	Alamat Pegawai 646	\N
697	Pegawai 647	Alamat Pegawai 647	\N
698	Pegawai 648	Alamat Pegawai 648	\N
699	Pegawai 649	Alamat Pegawai 649	\N
700	Pegawai 650	Alamat Pegawai 650	\N
701	Pegawai 651	Alamat Pegawai 651	\N
702	Pegawai 652	Alamat Pegawai 652	\N
703	Pegawai 653	Alamat Pegawai 653	\N
704	Pegawai 654	Alamat Pegawai 654	\N
705	Pegawai 655	Alamat Pegawai 655	\N
706	Pegawai 656	Alamat Pegawai 656	\N
707	Pegawai 657	Alamat Pegawai 657	\N
708	Pegawai 658	Alamat Pegawai 658	\N
709	Pegawai 659	Alamat Pegawai 659	\N
710	Pegawai 660	Alamat Pegawai 660	\N
711	Pegawai 661	Alamat Pegawai 661	\N
712	Pegawai 662	Alamat Pegawai 662	\N
713	Pegawai 663	Alamat Pegawai 663	\N
714	Pegawai 664	Alamat Pegawai 664	\N
715	Pegawai 665	Alamat Pegawai 665	\N
716	Pegawai 666	Alamat Pegawai 666	\N
717	Pegawai 667	Alamat Pegawai 667	\N
718	Pegawai 668	Alamat Pegawai 668	\N
719	Pegawai 669	Alamat Pegawai 669	\N
720	Pegawai 670	Alamat Pegawai 670	\N
721	Pegawai 671	Alamat Pegawai 671	\N
722	Pegawai 672	Alamat Pegawai 672	\N
723	Pegawai 673	Alamat Pegawai 673	\N
724	Pegawai 674	Alamat Pegawai 674	\N
725	Pegawai 675	Alamat Pegawai 675	\N
726	Pegawai 676	Alamat Pegawai 676	\N
727	Pegawai 677	Alamat Pegawai 677	\N
728	Pegawai 678	Alamat Pegawai 678	\N
729	Pegawai 679	Alamat Pegawai 679	\N
730	Pegawai 680	Alamat Pegawai 680	\N
731	Pegawai 681	Alamat Pegawai 681	\N
732	Pegawai 682	Alamat Pegawai 682	\N
733	Pegawai 683	Alamat Pegawai 683	\N
734	Pegawai 684	Alamat Pegawai 684	\N
735	Pegawai 685	Alamat Pegawai 685	\N
736	Pegawai 686	Alamat Pegawai 686	\N
737	Pegawai 687	Alamat Pegawai 687	\N
738	Pegawai 688	Alamat Pegawai 688	\N
739	Pegawai 689	Alamat Pegawai 689	\N
740	Pegawai 690	Alamat Pegawai 690	\N
741	Pegawai 691	Alamat Pegawai 691	\N
742	Pegawai 692	Alamat Pegawai 692	\N
743	Pegawai 693	Alamat Pegawai 693	\N
744	Pegawai 694	Alamat Pegawai 694	\N
745	Pegawai 695	Alamat Pegawai 695	\N
746	Pegawai 696	Alamat Pegawai 696	\N
747	Pegawai 697	Alamat Pegawai 697	\N
748	Pegawai 698	Alamat Pegawai 698	\N
749	Pegawai 699	Alamat Pegawai 699	\N
750	Pegawai 700	Alamat Pegawai 700	\N
751	Pegawai 701	Alamat Pegawai 701	\N
752	Pegawai 702	Alamat Pegawai 702	\N
753	Pegawai 703	Alamat Pegawai 703	\N
754	Pegawai 704	Alamat Pegawai 704	\N
755	Pegawai 705	Alamat Pegawai 705	\N
756	Pegawai 706	Alamat Pegawai 706	\N
757	Pegawai 707	Alamat Pegawai 707	\N
758	Pegawai 708	Alamat Pegawai 708	\N
759	Pegawai 709	Alamat Pegawai 709	\N
760	Pegawai 710	Alamat Pegawai 710	\N
761	Pegawai 711	Alamat Pegawai 711	\N
762	Pegawai 712	Alamat Pegawai 712	\N
763	Pegawai 713	Alamat Pegawai 713	\N
764	Pegawai 714	Alamat Pegawai 714	\N
765	Pegawai 715	Alamat Pegawai 715	\N
766	Pegawai 716	Alamat Pegawai 716	\N
767	Pegawai 717	Alamat Pegawai 717	\N
768	Pegawai 718	Alamat Pegawai 718	\N
769	Pegawai 719	Alamat Pegawai 719	\N
770	Pegawai 720	Alamat Pegawai 720	\N
771	Pegawai 721	Alamat Pegawai 721	\N
772	Pegawai 722	Alamat Pegawai 722	\N
773	Pegawai 723	Alamat Pegawai 723	\N
774	Pegawai 724	Alamat Pegawai 724	\N
775	Pegawai 725	Alamat Pegawai 725	\N
776	Pegawai 726	Alamat Pegawai 726	\N
777	Pegawai 727	Alamat Pegawai 727	\N
778	Pegawai 728	Alamat Pegawai 728	\N
779	Pegawai 729	Alamat Pegawai 729	\N
780	Pegawai 730	Alamat Pegawai 730	\N
781	Pegawai 731	Alamat Pegawai 731	\N
782	Pegawai 732	Alamat Pegawai 732	\N
783	Pegawai 733	Alamat Pegawai 733	\N
784	Pegawai 734	Alamat Pegawai 734	\N
785	Pegawai 735	Alamat Pegawai 735	\N
786	Pegawai 736	Alamat Pegawai 736	\N
787	Pegawai 737	Alamat Pegawai 737	\N
788	Pegawai 738	Alamat Pegawai 738	\N
789	Pegawai 739	Alamat Pegawai 739	\N
790	Pegawai 740	Alamat Pegawai 740	\N
791	Pegawai 741	Alamat Pegawai 741	\N
792	Pegawai 742	Alamat Pegawai 742	\N
793	Pegawai 743	Alamat Pegawai 743	\N
794	Pegawai 744	Alamat Pegawai 744	\N
795	Pegawai 745	Alamat Pegawai 745	\N
796	Pegawai 746	Alamat Pegawai 746	\N
797	Pegawai 747	Alamat Pegawai 747	\N
798	Pegawai 748	Alamat Pegawai 748	\N
799	Pegawai 749	Alamat Pegawai 749	\N
800	Pegawai 750	Alamat Pegawai 750	\N
801	Pegawai 751	Alamat Pegawai 751	\N
802	Pegawai 752	Alamat Pegawai 752	\N
803	Pegawai 753	Alamat Pegawai 753	\N
804	Pegawai 754	Alamat Pegawai 754	\N
805	Pegawai 755	Alamat Pegawai 755	\N
806	Pegawai 756	Alamat Pegawai 756	\N
807	Pegawai 757	Alamat Pegawai 757	\N
808	Pegawai 758	Alamat Pegawai 758	\N
809	Pegawai 759	Alamat Pegawai 759	\N
810	Pegawai 760	Alamat Pegawai 760	\N
811	Pegawai 761	Alamat Pegawai 761	\N
812	Pegawai 762	Alamat Pegawai 762	\N
813	Pegawai 763	Alamat Pegawai 763	\N
814	Pegawai 764	Alamat Pegawai 764	\N
815	Pegawai 765	Alamat Pegawai 765	\N
816	Pegawai 766	Alamat Pegawai 766	\N
817	Pegawai 767	Alamat Pegawai 767	\N
818	Pegawai 768	Alamat Pegawai 768	\N
819	Pegawai 769	Alamat Pegawai 769	\N
820	Pegawai 770	Alamat Pegawai 770	\N
821	Pegawai 771	Alamat Pegawai 771	\N
822	Pegawai 772	Alamat Pegawai 772	\N
823	Pegawai 773	Alamat Pegawai 773	\N
824	Pegawai 774	Alamat Pegawai 774	\N
825	Pegawai 775	Alamat Pegawai 775	\N
826	Pegawai 776	Alamat Pegawai 776	\N
827	Pegawai 777	Alamat Pegawai 777	\N
828	Pegawai 778	Alamat Pegawai 778	\N
829	Pegawai 779	Alamat Pegawai 779	\N
830	Pegawai 780	Alamat Pegawai 780	\N
831	Pegawai 781	Alamat Pegawai 781	\N
832	Pegawai 782	Alamat Pegawai 782	\N
833	Pegawai 783	Alamat Pegawai 783	\N
834	Pegawai 784	Alamat Pegawai 784	\N
835	Pegawai 785	Alamat Pegawai 785	\N
836	Pegawai 786	Alamat Pegawai 786	\N
837	Pegawai 787	Alamat Pegawai 787	\N
838	Pegawai 788	Alamat Pegawai 788	\N
839	Pegawai 789	Alamat Pegawai 789	\N
840	Pegawai 790	Alamat Pegawai 790	\N
841	Pegawai 791	Alamat Pegawai 791	\N
842	Pegawai 792	Alamat Pegawai 792	\N
843	Pegawai 793	Alamat Pegawai 793	\N
844	Pegawai 794	Alamat Pegawai 794	\N
845	Pegawai 795	Alamat Pegawai 795	\N
846	Pegawai 796	Alamat Pegawai 796	\N
847	Pegawai 797	Alamat Pegawai 797	\N
848	Pegawai 798	Alamat Pegawai 798	\N
849	Pegawai 799	Alamat Pegawai 799	\N
850	Pegawai 800	Alamat Pegawai 800	\N
851	Pegawai 801	Alamat Pegawai 801	\N
852	Pegawai 802	Alamat Pegawai 802	\N
853	Pegawai 803	Alamat Pegawai 803	\N
854	Pegawai 804	Alamat Pegawai 804	\N
855	Pegawai 805	Alamat Pegawai 805	\N
856	Pegawai 806	Alamat Pegawai 806	\N
857	Pegawai 807	Alamat Pegawai 807	\N
858	Pegawai 808	Alamat Pegawai 808	\N
859	Pegawai 809	Alamat Pegawai 809	\N
860	Pegawai 810	Alamat Pegawai 810	\N
861	Pegawai 811	Alamat Pegawai 811	\N
862	Pegawai 812	Alamat Pegawai 812	\N
863	Pegawai 813	Alamat Pegawai 813	\N
864	Pegawai 814	Alamat Pegawai 814	\N
865	Pegawai 815	Alamat Pegawai 815	\N
866	Pegawai 816	Alamat Pegawai 816	\N
867	Pegawai 817	Alamat Pegawai 817	\N
868	Pegawai 818	Alamat Pegawai 818	\N
869	Pegawai 819	Alamat Pegawai 819	\N
870	Pegawai 820	Alamat Pegawai 820	\N
871	Pegawai 821	Alamat Pegawai 821	\N
872	Pegawai 822	Alamat Pegawai 822	\N
873	Pegawai 823	Alamat Pegawai 823	\N
874	Pegawai 824	Alamat Pegawai 824	\N
875	Pegawai 825	Alamat Pegawai 825	\N
876	Pegawai 826	Alamat Pegawai 826	\N
877	Pegawai 827	Alamat Pegawai 827	\N
878	Pegawai 828	Alamat Pegawai 828	\N
879	Pegawai 829	Alamat Pegawai 829	\N
880	Pegawai 830	Alamat Pegawai 830	\N
881	Pegawai 831	Alamat Pegawai 831	\N
882	Pegawai 832	Alamat Pegawai 832	\N
883	Pegawai 833	Alamat Pegawai 833	\N
884	Pegawai 834	Alamat Pegawai 834	\N
885	Pegawai 835	Alamat Pegawai 835	\N
886	Pegawai 836	Alamat Pegawai 836	\N
887	Pegawai 837	Alamat Pegawai 837	\N
888	Pegawai 838	Alamat Pegawai 838	\N
889	Pegawai 839	Alamat Pegawai 839	\N
890	Pegawai 840	Alamat Pegawai 840	\N
891	Pegawai 841	Alamat Pegawai 841	\N
892	Pegawai 842	Alamat Pegawai 842	\N
893	Pegawai 843	Alamat Pegawai 843	\N
894	Pegawai 844	Alamat Pegawai 844	\N
895	Pegawai 845	Alamat Pegawai 845	\N
896	Pegawai 846	Alamat Pegawai 846	\N
897	Pegawai 847	Alamat Pegawai 847	\N
898	Pegawai 848	Alamat Pegawai 848	\N
899	Pegawai 849	Alamat Pegawai 849	\N
900	Pegawai 850	Alamat Pegawai 850	\N
901	Pegawai 851	Alamat Pegawai 851	\N
902	Pegawai 852	Alamat Pegawai 852	\N
903	Pegawai 853	Alamat Pegawai 853	\N
904	Pegawai 854	Alamat Pegawai 854	\N
905	Pegawai 855	Alamat Pegawai 855	\N
906	Pegawai 856	Alamat Pegawai 856	\N
907	Pegawai 857	Alamat Pegawai 857	\N
908	Pegawai 858	Alamat Pegawai 858	\N
909	Pegawai 859	Alamat Pegawai 859	\N
910	Pegawai 860	Alamat Pegawai 860	\N
911	Pegawai 861	Alamat Pegawai 861	\N
912	Pegawai 862	Alamat Pegawai 862	\N
913	Pegawai 863	Alamat Pegawai 863	\N
914	Pegawai 864	Alamat Pegawai 864	\N
915	Pegawai 865	Alamat Pegawai 865	\N
916	Pegawai 866	Alamat Pegawai 866	\N
917	Pegawai 867	Alamat Pegawai 867	\N
918	Pegawai 868	Alamat Pegawai 868	\N
919	Pegawai 869	Alamat Pegawai 869	\N
920	Pegawai 870	Alamat Pegawai 870	\N
921	Pegawai 871	Alamat Pegawai 871	\N
922	Pegawai 872	Alamat Pegawai 872	\N
923	Pegawai 873	Alamat Pegawai 873	\N
924	Pegawai 874	Alamat Pegawai 874	\N
925	Pegawai 875	Alamat Pegawai 875	\N
926	Pegawai 876	Alamat Pegawai 876	\N
927	Pegawai 877	Alamat Pegawai 877	\N
928	Pegawai 878	Alamat Pegawai 878	\N
929	Pegawai 879	Alamat Pegawai 879	\N
930	Pegawai 880	Alamat Pegawai 880	\N
931	Pegawai 881	Alamat Pegawai 881	\N
932	Pegawai 882	Alamat Pegawai 882	\N
933	Pegawai 883	Alamat Pegawai 883	\N
934	Pegawai 884	Alamat Pegawai 884	\N
935	Pegawai 885	Alamat Pegawai 885	\N
936	Pegawai 886	Alamat Pegawai 886	\N
937	Pegawai 887	Alamat Pegawai 887	\N
938	Pegawai 888	Alamat Pegawai 888	\N
939	Pegawai 889	Alamat Pegawai 889	\N
940	Pegawai 890	Alamat Pegawai 890	\N
941	Pegawai 891	Alamat Pegawai 891	\N
942	Pegawai 892	Alamat Pegawai 892	\N
943	Pegawai 893	Alamat Pegawai 893	\N
944	Pegawai 894	Alamat Pegawai 894	\N
945	Pegawai 895	Alamat Pegawai 895	\N
946	Pegawai 896	Alamat Pegawai 896	\N
947	Pegawai 897	Alamat Pegawai 897	\N
948	Pegawai 898	Alamat Pegawai 898	\N
949	Pegawai 899	Alamat Pegawai 899	\N
950	Pegawai 900	Alamat Pegawai 900	\N
951	Pegawai 901	Alamat Pegawai 901	\N
952	Pegawai 902	Alamat Pegawai 902	\N
953	Pegawai 903	Alamat Pegawai 903	\N
954	Pegawai 904	Alamat Pegawai 904	\N
955	Pegawai 905	Alamat Pegawai 905	\N
956	Pegawai 906	Alamat Pegawai 906	\N
957	Pegawai 907	Alamat Pegawai 907	\N
958	Pegawai 908	Alamat Pegawai 908	\N
959	Pegawai 909	Alamat Pegawai 909	\N
960	Pegawai 910	Alamat Pegawai 910	\N
961	Pegawai 911	Alamat Pegawai 911	\N
962	Pegawai 912	Alamat Pegawai 912	\N
963	Pegawai 913	Alamat Pegawai 913	\N
964	Pegawai 914	Alamat Pegawai 914	\N
965	Pegawai 915	Alamat Pegawai 915	\N
966	Pegawai 916	Alamat Pegawai 916	\N
967	Pegawai 917	Alamat Pegawai 917	\N
968	Pegawai 918	Alamat Pegawai 918	\N
969	Pegawai 919	Alamat Pegawai 919	\N
970	Pegawai 920	Alamat Pegawai 920	\N
971	Pegawai 921	Alamat Pegawai 921	\N
972	Pegawai 922	Alamat Pegawai 922	\N
973	Pegawai 923	Alamat Pegawai 923	\N
974	Pegawai 924	Alamat Pegawai 924	\N
975	Pegawai 925	Alamat Pegawai 925	\N
976	Pegawai 926	Alamat Pegawai 926	\N
977	Pegawai 927	Alamat Pegawai 927	\N
978	Pegawai 928	Alamat Pegawai 928	\N
979	Pegawai 929	Alamat Pegawai 929	\N
980	Pegawai 930	Alamat Pegawai 930	\N
981	Pegawai 931	Alamat Pegawai 931	\N
982	Pegawai 932	Alamat Pegawai 932	\N
983	Pegawai 933	Alamat Pegawai 933	\N
984	Pegawai 934	Alamat Pegawai 934	\N
985	Pegawai 935	Alamat Pegawai 935	\N
986	Pegawai 936	Alamat Pegawai 936	\N
987	Pegawai 937	Alamat Pegawai 937	\N
988	Pegawai 938	Alamat Pegawai 938	\N
989	Pegawai 939	Alamat Pegawai 939	\N
990	Pegawai 940	Alamat Pegawai 940	\N
991	Pegawai 941	Alamat Pegawai 941	\N
992	Pegawai 942	Alamat Pegawai 942	\N
993	Pegawai 943	Alamat Pegawai 943	\N
994	Pegawai 944	Alamat Pegawai 944	\N
995	Pegawai 945	Alamat Pegawai 945	\N
996	Pegawai 946	Alamat Pegawai 946	\N
997	Pegawai 947	Alamat Pegawai 947	\N
998	Pegawai 948	Alamat Pegawai 948	\N
999	Pegawai 949	Alamat Pegawai 949	\N
1000	Pegawai 950	Alamat Pegawai 950	\N
1001	Pegawai 951	Alamat Pegawai 951	\N
1002	Pegawai 952	Alamat Pegawai 952	\N
1003	Pegawai 953	Alamat Pegawai 953	\N
1004	Pegawai 954	Alamat Pegawai 954	\N
1005	Pegawai 955	Alamat Pegawai 955	\N
1006	Pegawai 956	Alamat Pegawai 956	\N
1007	Pegawai 957	Alamat Pegawai 957	\N
1008	Pegawai 958	Alamat Pegawai 958	\N
1009	Pegawai 959	Alamat Pegawai 959	\N
1010	Pegawai 960	Alamat Pegawai 960	\N
1011	Pegawai 961	Alamat Pegawai 961	\N
1012	Pegawai 962	Alamat Pegawai 962	\N
1013	Pegawai 963	Alamat Pegawai 963	\N
1014	Pegawai 964	Alamat Pegawai 964	\N
1015	Pegawai 965	Alamat Pegawai 965	\N
1016	Pegawai 966	Alamat Pegawai 966	\N
1017	Pegawai 967	Alamat Pegawai 967	\N
1018	Pegawai 968	Alamat Pegawai 968	\N
1019	Pegawai 969	Alamat Pegawai 969	\N
1020	Pegawai 970	Alamat Pegawai 970	\N
1021	Pegawai 971	Alamat Pegawai 971	\N
1022	Pegawai 972	Alamat Pegawai 972	\N
1023	Pegawai 973	Alamat Pegawai 973	\N
1024	Pegawai 974	Alamat Pegawai 974	\N
1025	Pegawai 975	Alamat Pegawai 975	\N
1026	Pegawai 976	Alamat Pegawai 976	\N
1027	Pegawai 977	Alamat Pegawai 977	\N
1028	Pegawai 978	Alamat Pegawai 978	\N
1029	Pegawai 979	Alamat Pegawai 979	\N
1030	Pegawai 980	Alamat Pegawai 980	\N
1031	Pegawai 981	Alamat Pegawai 981	\N
1032	Pegawai 982	Alamat Pegawai 982	\N
1033	Pegawai 983	Alamat Pegawai 983	\N
1034	Pegawai 984	Alamat Pegawai 984	\N
1035	Pegawai 985	Alamat Pegawai 985	\N
1036	Pegawai 986	Alamat Pegawai 986	\N
1037	Pegawai 987	Alamat Pegawai 987	\N
1038	Pegawai 988	Alamat Pegawai 988	\N
1039	Pegawai 989	Alamat Pegawai 989	\N
1040	Pegawai 990	Alamat Pegawai 990	\N
1041	Pegawai 991	Alamat Pegawai 991	\N
1042	Pegawai 992	Alamat Pegawai 992	\N
1043	Pegawai 993	Alamat Pegawai 993	\N
1044	Pegawai 994	Alamat Pegawai 994	\N
1045	Pegawai 995	Alamat Pegawai 995	\N
1046	Pegawai 996	Alamat Pegawai 996	\N
1047	Pegawai 997	Alamat Pegawai 997	\N
1048	Pegawai 998	Alamat Pegawai 998	\N
1049	Pegawai 999	Alamat Pegawai 999	\N
1050	Pegawai 1000	Alamat Pegawai 1000	\N
\.


--
-- TOC entry 4911 (class 0 OID 32844)
-- Dependencies: 233
-- Data for Name: pembelian; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.pembelian (id_pembelian, id_supplier, tanggal_pembelian) FROM stdin;
1	41	2025-08-18
2	13	2024-12-12
3	31	2025-07-30
4	6	2024-12-23
5	15	2025-09-07
6	13	2025-06-09
7	90	2025-05-26
8	95	2025-08-21
9	50	2025-02-27
10	39	2025-01-06
11	66	2024-11-28
12	7	2025-02-14
13	96	2025-04-24
14	56	2025-08-04
15	47	2025-10-15
16	98	2024-11-28
17	71	2025-04-15
18	95	2024-12-09
19	24	2025-07-01
20	61	2024-11-10
\.


--
-- TOC entry 4913 (class 0 OID 32875)
-- Dependencies: 235
-- Data for Name: peminjaman; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.peminjaman (id_peminjaman, id_anggota, id_pegawai, tanggal_pinjam, tenggat_waktu) FROM stdin;
451	84	1034	2025-08-26	2025-11-06
452	111	41	2025-07-29	2025-10-27
453	60	433	2024-11-23	2025-10-26
454	77	4	2025-05-21	2025-11-10
455	51	735	2025-10-07	2025-11-05
456	62	231	2025-07-09	2025-11-07
457	119	1011	2025-05-10	2025-10-31
458	168	655	2025-03-31	2025-10-31
459	176	523	2025-08-11	2025-10-27
460	6	82	2025-04-21	2025-11-06
461	26	513	2025-10-01	2025-10-23
462	116	654	2025-07-30	2025-10-27
463	45	133	2025-09-09	2025-10-23
464	131	1027	2025-02-18	2025-10-29
465	114	134	2025-04-18	2025-11-01
466	126	820	2025-04-28	2025-11-10
467	89	50	2025-01-11	2025-11-09
468	19	174	2025-02-15	2025-10-24
469	184	376	2025-03-19	2025-11-04
470	168	85	2024-12-29	2025-10-26
471	112	685	2025-04-03	2025-10-28
472	55	828	2025-10-12	2025-10-29
473	129	287	2025-02-11	2025-11-09
474	23	377	2025-05-24	2025-11-01
475	145	489	2025-05-10	2025-10-28
476	152	732	2025-02-03	2025-10-27
477	117	1021	2025-04-23	2025-10-24
478	70	979	2025-06-23	2025-10-27
479	104	982	2025-04-27	2025-10-23
480	75	11	2025-01-24	2025-10-26
481	100	394	2025-02-12	2025-11-04
482	142	223	2025-04-28	2025-10-27
483	149	313	2025-08-03	2025-10-30
484	29	336	2025-07-21	2025-11-10
485	97	393	2025-10-11	2025-10-22
486	7	543	2025-02-12	2025-10-24
487	38	377	2025-09-02	2025-11-06
488	136	479	2025-06-19	2025-10-22
489	61	342	2025-09-16	2025-11-05
490	4	381	2024-11-17	2025-10-25
491	164	959	2025-07-04	2025-11-08
492	96	838	2025-05-03	2025-11-08
493	178	349	2025-05-14	2025-11-08
494	54	6	2024-11-18	2025-10-26
495	76	212	2025-06-26	2025-11-08
496	158	793	2025-06-14	2025-10-21
497	62	481	2024-12-12	2025-11-09
498	187	843	2024-11-02	2025-10-23
499	23	857	2025-01-27	2025-11-05
500	102	879	2025-09-28	2025-11-03
501	75	427	2025-10-08	2025-10-31
502	200	275	2025-01-02	2025-10-26
503	50	548	2025-09-29	2025-10-22
504	188	253	2025-09-12	2025-10-29
505	177	963	2025-09-11	2025-10-24
506	70	816	2025-03-17	2025-11-04
507	34	344	2025-07-08	2025-10-30
508	9	937	2025-03-18	2025-10-24
509	160	766	2024-11-25	2025-10-30
510	105	622	2025-10-09	2025-10-29
511	120	644	2025-02-20	2025-11-01
512	159	247	2025-03-19	2025-10-29
513	192	937	2025-07-22	2025-10-31
514	8	79	2025-03-05	2025-11-07
515	151	1015	2025-05-23	2025-11-06
516	55	373	2025-10-12	2025-11-09
517	74	884	2025-07-24	2025-11-06
518	193	888	2025-01-10	2025-10-27
519	30	521	2025-05-16	2025-10-25
520	32	189	2025-10-19	2025-11-08
521	194	25	2025-04-13	2025-10-27
522	110	529	2025-04-29	2025-11-09
523	8	544	2025-07-01	2025-11-08
524	24	971	2024-10-23	2025-10-31
525	35	71	2025-09-30	2025-10-29
526	60	336	2025-06-14	2025-10-30
527	35	163	2024-12-20	2025-11-04
528	121	969	2025-09-06	2025-11-01
529	165	121	2025-01-31	2025-11-02
530	62	880	2025-05-03	2025-11-04
531	21	997	2025-06-08	2025-10-25
532	160	220	2025-09-02	2025-10-27
533	56	51	2025-07-10	2025-11-06
534	70	456	2025-10-07	2025-11-06
535	60	572	2025-01-18	2025-10-30
536	16	465	2025-02-25	2025-11-05
537	116	765	2025-02-11	2025-10-29
538	109	610	2025-04-02	2025-11-04
539	2	456	2025-04-27	2025-10-21
540	184	1021	2024-11-10	2025-10-23
541	181	631	2024-11-14	2025-10-23
542	160	488	2025-06-28	2025-11-09
543	38	486	2025-06-23	2025-11-10
544	92	873	2025-08-13	2025-11-06
545	177	985	2025-02-17	2025-11-07
546	106	728	2025-05-11	2025-10-28
547	68	420	2024-12-11	2025-10-27
548	152	1039	2025-04-05	2025-11-03
549	55	947	2025-09-26	2025-11-08
550	52	662	2025-01-19	2025-11-06
551	5	718	2025-05-20	2025-11-01
552	139	658	2025-02-23	2025-11-02
553	183	999	2025-05-17	2025-10-23
554	170	1004	2025-06-21	2025-11-10
555	55	403	2025-09-15	2025-10-25
556	74	883	2025-07-27	2025-11-03
557	80	977	2025-04-09	2025-11-05
558	135	117	2025-04-07	2025-10-23
559	92	871	2025-01-26	2025-10-27
560	148	272	2025-07-28	2025-10-31
561	190	902	2025-06-04	2025-11-08
562	79	490	2025-03-21	2025-10-24
563	194	242	2024-10-23	2025-11-02
564	19	119	2025-04-20	2025-10-23
565	26	599	2025-05-20	2025-11-07
566	153	928	2025-09-28	2025-11-03
567	91	658	2024-12-28	2025-10-28
568	39	612	2025-05-02	2025-10-23
569	184	70	2025-07-03	2025-11-04
570	43	276	2024-12-18	2025-10-26
571	12	658	2025-08-05	2025-11-07
572	173	329	2025-09-29	2025-11-03
573	103	851	2025-02-11	2025-10-28
574	171	103	2025-07-22	2025-10-28
575	33	489	2024-11-25	2025-11-05
576	44	1016	2025-09-15	2025-10-23
577	85	169	2025-08-20	2025-10-27
578	72	202	2024-12-22	2025-11-02
579	47	279	2025-02-27	2025-11-07
580	63	1040	2025-03-22	2025-10-25
581	80	442	2025-03-08	2025-10-27
582	183	266	2024-10-30	2025-11-01
583	123	607	2025-10-21	2025-11-06
584	41	526	2025-09-06	2025-10-26
585	183	921	2025-09-10	2025-10-29
586	69	809	2025-04-29	2025-10-22
587	114	703	2025-05-02	2025-11-09
588	157	110	2025-08-27	2025-10-30
589	41	1032	2025-07-20	2025-10-29
590	145	451	2025-09-13	2025-10-22
591	88	64	2025-04-16	2025-10-24
592	87	32	2025-09-04	2025-10-22
593	74	793	2025-01-22	2025-10-25
594	171	512	2024-11-22	2025-11-08
595	99	1030	2025-09-20	2025-11-05
596	178	985	2025-06-26	2025-10-29
597	43	243	2025-06-30	2025-10-30
598	180	67	2025-08-09	2025-11-09
599	68	913	2025-03-24	2025-10-22
600	23	678	2025-06-19	2025-11-01
601	189	838	2025-06-27	2025-11-06
602	126	481	2024-12-13	2025-11-02
603	81	403	2024-12-03	2025-10-28
604	69	785	2025-08-19	2025-10-21
605	145	498	2025-09-10	2025-10-27
606	147	458	2025-03-31	2025-11-10
607	74	989	2025-07-14	2025-11-07
608	35	629	2024-11-22	2025-10-26
609	40	656	2024-11-25	2025-11-05
610	15	767	2025-06-02	2025-11-06
611	97	448	2025-01-08	2025-11-04
612	114	747	2025-08-31	2025-11-04
613	129	987	2024-10-22	2025-11-09
614	50	967	2025-05-16	2025-10-25
615	182	988	2025-09-18	2025-11-09
616	92	988	2024-11-22	2025-11-09
617	140	852	2025-08-12	2025-11-03
618	10	566	2025-03-30	2025-11-09
619	96	956	2025-02-16	2025-11-09
620	92	52	2025-07-19	2025-10-29
621	86	311	2025-08-01	2025-10-26
622	87	230	2025-06-20	2025-10-22
623	86	224	2025-01-13	2025-11-05
624	24	381	2024-11-05	2025-10-26
625	143	10	2025-04-30	2025-10-22
626	37	406	2025-06-10	2025-10-22
627	177	969	2025-10-12	2025-11-03
628	20	607	2025-04-08	2025-11-05
629	74	37	2025-06-23	2025-11-01
630	8	431	2024-12-01	2025-11-06
631	33	775	2025-09-17	2025-10-23
632	13	880	2024-12-30	2025-11-04
633	84	907	2025-01-26	2025-11-05
634	22	135	2025-09-18	2025-11-03
635	144	1024	2025-02-10	2025-10-31
636	196	223	2025-03-23	2025-11-05
637	111	494	2025-08-03	2025-10-25
638	83	642	2025-08-09	2025-10-22
639	111	211	2025-05-14	2025-11-08
640	40	668	2025-07-12	2025-10-25
641	92	518	2025-10-04	2025-10-26
642	131	675	2024-12-09	2025-10-29
643	111	488	2024-11-28	2025-11-06
644	57	128	2025-07-30	2025-10-25
645	190	1010	2025-03-22	2025-10-24
646	101	575	2025-08-24	2025-11-02
647	166	753	2025-08-15	2025-10-30
648	92	154	2025-07-05	2025-10-25
649	120	99	2025-03-18	2025-10-29
650	147	525	2025-02-02	2025-11-09
\.


--
-- TOC entry 4915 (class 0 OID 32908)
-- Dependencies: 237
-- Data for Name: pengembalian; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.pengembalian (id_pengembalian, id_peminjaman, tanggal_pengembalian, keterlambatan_hari, denda) FROM stdin;
1	451	2025-09-20	0	0.00
2	453	2024-12-01	0	0.00
3	454	2025-06-04	0	0.00
4	455	2025-11-03	0	0.00
5	456	2025-07-11	0	0.00
6	457	2025-05-18	0	0.00
7	458	2025-04-21	0	0.00
8	460	2025-04-26	0	0.00
9	461	2025-10-18	3	0.00
10	462	2025-08-15	0	0.00
11	463	2025-10-03	0	0.00
12	464	2025-03-08	0	0.00
13	465	2025-04-23	0	0.00
14	466	2025-05-25	0	0.00
15	467	2025-01-18	0	0.00
16	468	2025-02-24	0	0.00
17	469	2025-04-16	0	0.00
18	472	2025-11-06	0	0.00
19	473	2025-02-20	0	0.00
20	474	2025-06-17	0	0.00
21	475	2025-05-28	0	0.00
22	476	2025-02-09	0	0.00
23	478	2025-06-27	0	0.00
24	479	2025-05-09	0	0.00
25	480	2025-02-23	0	0.00
26	483	2025-08-04	0	0.00
27	486	2025-02-25	0	0.00
28	487	2025-09-09	0	0.00
29	489	2025-09-24	0	0.00
30	491	2025-07-06	0	0.00
31	492	2025-05-07	0	0.00
32	494	2024-11-28	0	0.00
33	495	2025-06-30	0	0.00
34	496	2025-07-03	0	0.00
35	497	2024-12-15	0	0.00
36	498	2024-11-10	0	0.00
37	499	2025-02-04	0	0.00
38	500	2025-10-07	0	0.00
39	501	2025-10-13	0	0.00
40	502	2025-01-29	0	0.00
41	503	2025-10-24	0	15000.00
42	504	2025-09-13	0	0.00
43	505	2025-09-21	0	0.00
44	506	2025-03-26	0	0.00
45	507	2025-08-05	0	0.00
46	510	2025-10-12	0	20000.00
47	511	2025-03-11	0	0.00
48	512	2025-04-02	0	0.00
49	514	2025-03-25	0	0.00
50	515	2025-06-22	0	0.00
51	516	2025-10-21	0	0.00
52	517	2025-08-13	0	0.00
53	520	2025-11-11	0	0.00
54	522	2025-05-14	0	0.00
55	523	2025-07-25	0	0.00
56	524	2024-11-21	0	0.00
57	525	2025-10-23	0	0.00
58	527	2025-01-03	0	0.00
59	528	2025-09-10	0	0.00
60	529	2025-02-10	0	0.00
61	530	2025-05-05	0	0.00
62	532	2025-10-01	0	0.00
63	534	2025-10-10	0	0.00
64	536	2025-03-01	0	0.00
65	537	2025-03-04	0	0.00
66	538	2025-04-27	0	0.00
67	539	2025-05-21	0	0.00
68	540	2024-11-13	0	0.00
69	541	2024-12-04	0	0.00
70	542	2025-07-24	0	0.00
71	543	2025-07-09	0	0.00
72	544	2025-09-08	0	0.00
73	547	2025-01-06	0	0.00
74	548	2025-05-04	0	0.00
75	549	2025-10-13	0	0.00
76	550	2025-01-30	0	0.00
77	551	2025-06-08	0	0.00
78	552	2025-03-02	0	0.00
79	553	2025-06-16	0	0.00
80	555	2025-09-28	0	0.00
81	556	2025-08-18	0	0.00
82	557	2025-04-21	0	0.00
83	558	2025-05-01	0	0.00
84	559	2025-01-29	0	0.00
85	560	2025-08-03	0	0.00
86	561	2025-06-13	0	0.00
87	563	2024-11-07	0	0.00
88	564	2025-05-05	0	0.00
89	565	2025-05-27	0	0.00
90	567	2025-01-12	0	0.00
91	568	2025-05-24	0	0.00
92	569	2025-07-17	0	0.00
93	570	2025-01-05	0	0.00
94	571	2025-08-17	0	0.00
95	572	2025-10-02	0	0.00
96	574	2025-07-27	0	0.00
97	575	2024-12-25	0	0.00
98	576	2025-10-07	0	0.00
99	577	2025-08-30	0	0.00
100	578	2025-01-01	0	0.00
101	579	2025-03-14	0	0.00
102	582	2024-11-17	0	0.00
103	584	2025-09-26	0	0.00
104	585	2025-09-20	0	0.00
105	587	2025-05-10	0	0.00
106	588	2025-09-08	0	0.00
107	589	2025-08-10	0	0.00
108	590	2025-10-04	0	0.00
109	591	2025-04-17	0	0.00
110	592	2025-10-01	0	0.00
111	594	2024-12-03	0	0.00
112	595	2025-10-15	0	0.00
113	596	2025-07-24	0	0.00
114	597	2025-07-02	0	0.00
115	598	2025-09-02	0	0.00
116	599	2025-04-02	0	0.00
117	600	2025-06-27	0	0.00
118	601	2025-06-29	0	0.00
119	602	2025-01-05	0	0.00
120	603	2024-12-18	0	0.00
121	604	2025-09-02	0	0.00
122	605	2025-09-28	0	0.00
123	606	2025-04-25	0	0.00
124	607	2025-08-04	0	0.00
125	608	2024-12-10	0	0.00
126	611	2025-02-06	0	0.00
127	612	2025-09-28	0	0.00
128	613	2024-11-17	0	0.00
129	614	2025-06-05	0	0.00
130	615	2025-10-14	0	0.00
131	616	2024-11-28	0	0.00
132	619	2025-03-10	0	0.00
133	620	2025-07-29	0	0.00
134	621	2025-08-28	0	0.00
135	622	2025-07-01	0	0.00
136	623	2025-02-06	0	0.00
137	625	2025-05-25	0	0.00
138	626	2025-06-28	0	0.00
139	627	2025-10-27	0	0.00
140	630	2024-12-13	0	0.00
141	631	2025-10-05	0	0.00
142	632	2025-01-15	0	0.00
143	633	2025-02-10	0	0.00
144	634	2025-09-29	0	0.00
145	635	2025-03-05	0	0.00
146	636	2025-03-28	0	0.00
147	637	2025-08-31	0	0.00
148	638	2025-08-27	0	0.00
149	639	2025-06-04	0	0.00
150	640	2025-07-22	0	0.00
151	641	2025-10-28	0	0.00
152	642	2024-12-18	0	0.00
153	644	2025-08-29	0	0.00
154	645	2025-03-25	0	0.00
155	646	2025-09-10	0	0.00
156	647	2025-08-18	0	0.00
157	648	2025-07-25	0	0.00
\.


--
-- TOC entry 4910 (class 0 OID 32838)
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
\.


--
-- TOC entry 4921 (class 0 OID 0)
-- Dependencies: 217
-- Name: anggota_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.anggota_seq', 200, true);


--
-- TOC entry 4922 (class 0 OID 0)
-- Dependencies: 219
-- Name: buku_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.buku_seq', 1000, true);


--
-- TOC entry 4923 (class 0 OID 0)
-- Dependencies: 226
-- Name: detail_pembelian_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.detail_pembelian_seq', 20, true);


--
-- TOC entry 4924 (class 0 OID 0)
-- Dependencies: 223
-- Name: detail_peminjaman_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.detail_peminjaman_seq', 1, false);


--
-- TOC entry 4925 (class 0 OID 0)
-- Dependencies: 220
-- Name: kategori_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.kategori_seq', 20, true);


--
-- TOC entry 4926 (class 0 OID 0)
-- Dependencies: 218
-- Name: pegawai_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.pegawai_seq', 1050, true);


--
-- TOC entry 4927 (class 0 OID 0)
-- Dependencies: 225
-- Name: pembelian_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.pembelian_seq', 20, true);


--
-- TOC entry 4928 (class 0 OID 0)
-- Dependencies: 222
-- Name: peminjaman_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.peminjaman_seq', 700, true);


--
-- TOC entry 4929 (class 0 OID 0)
-- Dependencies: 224
-- Name: pengembalian_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.pengembalian_seq', 157, true);


--
-- TOC entry 4930 (class 0 OID 0)
-- Dependencies: 221
-- Name: supplier_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.supplier_seq', 100, true);


--
-- TOC entry 4709 (class 2606 OID 32795)
-- Name: anggota anggota_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.anggota
    ADD CONSTRAINT anggota_pkey PRIMARY KEY (id_anggota);


--
-- TOC entry 4717 (class 2606 OID 32822)
-- Name: buku buku_isbn_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.buku
    ADD CONSTRAINT buku_isbn_key UNIQUE (isbn);


--
-- TOC entry 4722 (class 2606 OID 32827)
-- Name: buku_kategori buku_kategori_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.buku_kategori
    ADD CONSTRAINT buku_kategori_pkey PRIMARY KEY (id_buku, id_kategori);


--
-- TOC entry 4719 (class 2606 OID 32820)
-- Name: buku buku_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.buku
    ADD CONSTRAINT buku_pkey PRIMARY KEY (id_buku);


--
-- TOC entry 4728 (class 2606 OID 32864)
-- Name: detail_pembelian detail_pembelian_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.detail_pembelian
    ADD CONSTRAINT detail_pembelian_pkey PRIMARY KEY (id_detail);


--
-- TOC entry 4733 (class 2606 OID 32897)
-- Name: detail_peminjaman detail_peminjaman_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.detail_peminjaman
    ADD CONSTRAINT detail_peminjaman_pkey PRIMARY KEY (id_detail);


--
-- TOC entry 4713 (class 2606 OID 32811)
-- Name: kategori kategori_nama_kategori_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kategori
    ADD CONSTRAINT kategori_nama_kategori_key UNIQUE (nama_kategori);


--
-- TOC entry 4715 (class 2606 OID 32809)
-- Name: kategori kategori_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kategori
    ADD CONSTRAINT kategori_pkey PRIMARY KEY (id_kategori);


--
-- TOC entry 4711 (class 2606 OID 32803)
-- Name: pegawai pegawai_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pegawai
    ADD CONSTRAINT pegawai_pkey PRIMARY KEY (id_pegawai);


--
-- TOC entry 4726 (class 2606 OID 32850)
-- Name: pembelian pembelian_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pembelian
    ADD CONSTRAINT pembelian_pkey PRIMARY KEY (id_pembelian);


--
-- TOC entry 4731 (class 2606 OID 32881)
-- Name: peminjaman peminjaman_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.peminjaman
    ADD CONSTRAINT peminjaman_pkey PRIMARY KEY (id_peminjaman);


--
-- TOC entry 4737 (class 2606 OID 32917)
-- Name: pengembalian pengembalian_id_peminjaman_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pengembalian
    ADD CONSTRAINT pengembalian_id_peminjaman_key UNIQUE (id_peminjaman);


--
-- TOC entry 4739 (class 2606 OID 32915)
-- Name: pengembalian pengembalian_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pengembalian
    ADD CONSTRAINT pengembalian_pkey PRIMARY KEY (id_pengembalian);


--
-- TOC entry 4724 (class 2606 OID 32843)
-- Name: supplier supplier_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.supplier
    ADD CONSTRAINT supplier_pkey PRIMARY KEY (id_supplier);


--
-- TOC entry 4720 (class 1259 OID 32926)
-- Name: idx_buku_isbn; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_buku_isbn ON public.buku USING btree (isbn);


--
-- TOC entry 4734 (class 1259 OID 32924)
-- Name: idx_detail_peminjaman_buku; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_detail_peminjaman_buku ON public.detail_peminjaman USING btree (id_buku);


--
-- TOC entry 4729 (class 1259 OID 32923)
-- Name: idx_peminjaman_anggota; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_peminjaman_anggota ON public.peminjaman USING btree (id_anggota);


--
-- TOC entry 4735 (class 1259 OID 32925)
-- Name: idx_pengembalian_tanggal; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_pengembalian_tanggal ON public.pengembalian USING btree (tanggal_pengembalian);


--
-- TOC entry 4740 (class 2606 OID 32828)
-- Name: buku_kategori buku_kategori_id_buku_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.buku_kategori
    ADD CONSTRAINT buku_kategori_id_buku_fkey FOREIGN KEY (id_buku) REFERENCES public.buku(id_buku) ON DELETE CASCADE;


--
-- TOC entry 4741 (class 2606 OID 32833)
-- Name: buku_kategori buku_kategori_id_kategori_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.buku_kategori
    ADD CONSTRAINT buku_kategori_id_kategori_fkey FOREIGN KEY (id_kategori) REFERENCES public.kategori(id_kategori) ON DELETE CASCADE;


--
-- TOC entry 4743 (class 2606 OID 32870)
-- Name: detail_pembelian detail_pembelian_id_buku_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.detail_pembelian
    ADD CONSTRAINT detail_pembelian_id_buku_fkey FOREIGN KEY (id_buku) REFERENCES public.buku(id_buku);


--
-- TOC entry 4744 (class 2606 OID 32865)
-- Name: detail_pembelian detail_pembelian_id_pembelian_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.detail_pembelian
    ADD CONSTRAINT detail_pembelian_id_pembelian_fkey FOREIGN KEY (id_pembelian) REFERENCES public.pembelian(id_pembelian) ON DELETE CASCADE;


--
-- TOC entry 4747 (class 2606 OID 32903)
-- Name: detail_peminjaman detail_peminjaman_id_buku_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.detail_peminjaman
    ADD CONSTRAINT detail_peminjaman_id_buku_fkey FOREIGN KEY (id_buku) REFERENCES public.buku(id_buku);


--
-- TOC entry 4748 (class 2606 OID 32898)
-- Name: detail_peminjaman detail_peminjaman_id_peminjaman_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.detail_peminjaman
    ADD CONSTRAINT detail_peminjaman_id_peminjaman_fkey FOREIGN KEY (id_peminjaman) REFERENCES public.peminjaman(id_peminjaman) ON DELETE CASCADE;


--
-- TOC entry 4742 (class 2606 OID 32851)
-- Name: pembelian pembelian_id_supplier_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pembelian
    ADD CONSTRAINT pembelian_id_supplier_fkey FOREIGN KEY (id_supplier) REFERENCES public.supplier(id_supplier);


--
-- TOC entry 4745 (class 2606 OID 32882)
-- Name: peminjaman peminjaman_id_anggota_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.peminjaman
    ADD CONSTRAINT peminjaman_id_anggota_fkey FOREIGN KEY (id_anggota) REFERENCES public.anggota(id_anggota);


--
-- TOC entry 4746 (class 2606 OID 32887)
-- Name: peminjaman peminjaman_id_pegawai_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.peminjaman
    ADD CONSTRAINT peminjaman_id_pegawai_fkey FOREIGN KEY (id_pegawai) REFERENCES public.pegawai(id_pegawai);


--
-- TOC entry 4749 (class 2606 OID 32918)
-- Name: pengembalian pengembalian_id_peminjaman_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pengembalian
    ADD CONSTRAINT pengembalian_id_peminjaman_fkey FOREIGN KEY (id_peminjaman) REFERENCES public.peminjaman(id_peminjaman) ON DELETE CASCADE;


-- Completed on 2025-10-22 10:40:25

--
-- PostgreSQL database dump complete
--

\unrestrict qfPppzi9QfhBjb0fjfaxmACpNLXqf6H9ISWFXhVbeGALJyEalIDcVII0Jt8gZpB

