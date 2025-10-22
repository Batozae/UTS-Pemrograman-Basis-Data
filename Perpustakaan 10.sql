--
-- PostgreSQL database dump
--

\restrict gScyV1UV9n0irH54ZDdo0ZDn9HLf1cdGth30NyU5EUuxFEZtnUvVfe82bHVaNE8

-- Dumped from database version 17.6
-- Dumped by pg_dump version 17.6

-- Started on 2025-10-22 12:32:42

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
-- TOC entry 217 (class 1259 OID 16768)
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
-- TOC entry 227 (class 1259 OID 16778)
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
-- TOC entry 219 (class 1259 OID 16770)
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
-- TOC entry 230 (class 1259 OID 16802)
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
-- TOC entry 231 (class 1259 OID 16813)
-- Name: buku_kategori; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.buku_kategori (
    id_buku integer NOT NULL,
    id_kategori integer NOT NULL
);


ALTER TABLE public.buku_kategori OWNER TO postgres;

--
-- TOC entry 226 (class 1259 OID 16777)
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
-- TOC entry 234 (class 1259 OID 16846)
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
-- TOC entry 223 (class 1259 OID 16774)
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
-- TOC entry 236 (class 1259 OID 16882)
-- Name: detail_peminjaman; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.detail_peminjaman (
    id_detail integer DEFAULT nextval('public.detail_peminjaman_seq'::regclass) NOT NULL,
    id_peminjaman integer NOT NULL,
    id_buku integer NOT NULL
);


ALTER TABLE public.detail_peminjaman OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 16771)
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
-- TOC entry 229 (class 1259 OID 16794)
-- Name: kategori; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.kategori (
    id_kategori integer DEFAULT nextval('public.kategori_seq'::regclass) NOT NULL,
    nama_kategori character varying(100) NOT NULL
);


ALTER TABLE public.kategori OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 16769)
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
-- TOC entry 228 (class 1259 OID 16786)
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
-- TOC entry 225 (class 1259 OID 16776)
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
-- TOC entry 233 (class 1259 OID 16834)
-- Name: pembelian; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pembelian (
    id_pembelian integer DEFAULT nextval('public.pembelian_seq'::regclass) NOT NULL,
    id_supplier integer,
    tanggal_pembelian date DEFAULT CURRENT_DATE NOT NULL
);


ALTER TABLE public.pembelian OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 16773)
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
-- TOC entry 235 (class 1259 OID 16865)
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
-- TOC entry 224 (class 1259 OID 16775)
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
-- TOC entry 237 (class 1259 OID 16898)
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
-- TOC entry 221 (class 1259 OID 16772)
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
-- TOC entry 232 (class 1259 OID 16828)
-- Name: supplier; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.supplier (
    id_supplier integer DEFAULT nextval('public.supplier_seq'::regclass) NOT NULL,
    nama_supplier character varying(200) NOT NULL
);


ALTER TABLE public.supplier OWNER TO postgres;

--
-- TOC entry 5005 (class 0 OID 16778)
-- Dependencies: 227
-- Data for Name: anggota; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.anggota (id_anggota, nama_anggota, alamat_anggota, tgl_lahir, no_telp, email) FROM stdin;
1	Anggota 1	Alamat 1	2006-10-26	0810000001	anggota1@mail.test
2	Anggota 2	Alamat 2	2005-10-26	0810000002	anggota2@mail.test
\.


--
-- TOC entry 5008 (class 0 OID 16802)
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
\.


--
-- TOC entry 5009 (class 0 OID 16813)
-- Dependencies: 231
-- Data for Name: buku_kategori; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.buku_kategori (id_buku, id_kategori) FROM stdin;
1	20
2	4
3	5
4	15
5	13
6	2
7	10
8	15
9	3
10	19
\.


--
-- TOC entry 5012 (class 0 OID 16846)
-- Dependencies: 234
-- Data for Name: detail_pembelian; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.detail_pembelian (id_detail, id_pembelian, id_buku, jumlah, harga_satuan) FROM stdin;
\.


--
-- TOC entry 5014 (class 0 OID 16882)
-- Dependencies: 236
-- Data for Name: detail_peminjaman; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.detail_peminjaman (id_detail, id_peminjaman, id_buku) FROM stdin;
1	3	9
2	4	9
3	3	8
4	4	10
5	3	3
6	4	10
7	3	8
8	4	3
\.


--
-- TOC entry 5007 (class 0 OID 16794)
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
-- TOC entry 5006 (class 0 OID 16786)
-- Dependencies: 228
-- Data for Name: pegawai; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.pegawai (id_pegawai, nama_pegawai, alamat_pegawai, posisi) FROM stdin;
1	Pegawai 1	Alamat Pegawai 1	Admin
\.


--
-- TOC entry 5011 (class 0 OID 16834)
-- Dependencies: 233
-- Data for Name: pembelian; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.pembelian (id_pembelian, id_supplier, tanggal_pembelian) FROM stdin;
\.


--
-- TOC entry 5013 (class 0 OID 16865)
-- Dependencies: 235
-- Data for Name: peminjaman; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.peminjaman (id_peminjaman, id_anggota, id_pegawai, tanggal_pinjam, tenggat_waktu) FROM stdin;
3	2	1	2024-12-26	2025-10-28
4	1	1	2025-05-15	2025-10-23
\.


--
-- TOC entry 5015 (class 0 OID 16898)
-- Dependencies: 237
-- Data for Name: pengembalian; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.pengembalian (id_pengembalian, id_peminjaman, tanggal_pengembalian, keterlambatan_hari, denda) FROM stdin;
1	3	2025-01-06	0	0.00
2	4	2025-06-05	0	0.00
\.


--
-- TOC entry 5010 (class 0 OID 16828)
-- Dependencies: 232
-- Data for Name: supplier; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.supplier (id_supplier, nama_supplier) FROM stdin;
1	Supplier 1
\.


--
-- TOC entry 5021 (class 0 OID 0)
-- Dependencies: 217
-- Name: anggota_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.anggota_seq', 2, true);


--
-- TOC entry 5022 (class 0 OID 0)
-- Dependencies: 219
-- Name: buku_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.buku_seq', 10, true);


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

SELECT pg_catalog.setval('public.detail_peminjaman_seq', 8, true);


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

SELECT pg_catalog.setval('public.pegawai_seq', 1, true);


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

SELECT pg_catalog.setval('public.peminjaman_seq', 10, true);


--
-- TOC entry 5029 (class 0 OID 0)
-- Dependencies: 224
-- Name: pengembalian_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.pengembalian_seq', 2, true);


--
-- TOC entry 5030 (class 0 OID 0)
-- Dependencies: 221
-- Name: supplier_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.supplier_seq', 1, true);


--
-- TOC entry 4809 (class 2606 OID 16785)
-- Name: anggota anggota_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.anggota
    ADD CONSTRAINT anggota_pkey PRIMARY KEY (id_anggota);


--
-- TOC entry 4817 (class 2606 OID 16812)
-- Name: buku buku_isbn_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.buku
    ADD CONSTRAINT buku_isbn_key UNIQUE (isbn);


--
-- TOC entry 4822 (class 2606 OID 16817)
-- Name: buku_kategori buku_kategori_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.buku_kategori
    ADD CONSTRAINT buku_kategori_pkey PRIMARY KEY (id_buku, id_kategori);


--
-- TOC entry 4819 (class 2606 OID 16810)
-- Name: buku buku_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.buku
    ADD CONSTRAINT buku_pkey PRIMARY KEY (id_buku);


--
-- TOC entry 4828 (class 2606 OID 16854)
-- Name: detail_pembelian detail_pembelian_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.detail_pembelian
    ADD CONSTRAINT detail_pembelian_pkey PRIMARY KEY (id_detail);


--
-- TOC entry 4833 (class 2606 OID 16887)
-- Name: detail_peminjaman detail_peminjaman_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.detail_peminjaman
    ADD CONSTRAINT detail_peminjaman_pkey PRIMARY KEY (id_detail);


--
-- TOC entry 4813 (class 2606 OID 16801)
-- Name: kategori kategori_nama_kategori_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kategori
    ADD CONSTRAINT kategori_nama_kategori_key UNIQUE (nama_kategori);


--
-- TOC entry 4815 (class 2606 OID 16799)
-- Name: kategori kategori_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kategori
    ADD CONSTRAINT kategori_pkey PRIMARY KEY (id_kategori);


--
-- TOC entry 4811 (class 2606 OID 16793)
-- Name: pegawai pegawai_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pegawai
    ADD CONSTRAINT pegawai_pkey PRIMARY KEY (id_pegawai);


--
-- TOC entry 4826 (class 2606 OID 16840)
-- Name: pembelian pembelian_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pembelian
    ADD CONSTRAINT pembelian_pkey PRIMARY KEY (id_pembelian);


--
-- TOC entry 4831 (class 2606 OID 16871)
-- Name: peminjaman peminjaman_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.peminjaman
    ADD CONSTRAINT peminjaman_pkey PRIMARY KEY (id_peminjaman);


--
-- TOC entry 4837 (class 2606 OID 16906)
-- Name: pengembalian pengembalian_id_peminjaman_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pengembalian
    ADD CONSTRAINT pengembalian_id_peminjaman_key UNIQUE (id_peminjaman);


--
-- TOC entry 4839 (class 2606 OID 16904)
-- Name: pengembalian pengembalian_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pengembalian
    ADD CONSTRAINT pengembalian_pkey PRIMARY KEY (id_pengembalian);


--
-- TOC entry 4824 (class 2606 OID 16833)
-- Name: supplier supplier_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.supplier
    ADD CONSTRAINT supplier_pkey PRIMARY KEY (id_supplier);


--
-- TOC entry 4820 (class 1259 OID 16923)
-- Name: idx_buku_isbn; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_buku_isbn ON public.buku USING btree (isbn);


--
-- TOC entry 4834 (class 1259 OID 16921)
-- Name: idx_detail_peminjaman_buku; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_detail_peminjaman_buku ON public.detail_peminjaman USING btree (id_buku);


--
-- TOC entry 4829 (class 1259 OID 16920)
-- Name: idx_peminjaman_anggota; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_peminjaman_anggota ON public.peminjaman USING btree (id_anggota);


--
-- TOC entry 4835 (class 1259 OID 16922)
-- Name: idx_pengembalian_tanggal; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_pengembalian_tanggal ON public.pengembalian USING btree (tanggal_pengembalian);


--
-- TOC entry 4840 (class 2606 OID 16818)
-- Name: buku_kategori buku_kategori_id_buku_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.buku_kategori
    ADD CONSTRAINT buku_kategori_id_buku_fkey FOREIGN KEY (id_buku) REFERENCES public.buku(id_buku) ON DELETE CASCADE;


--
-- TOC entry 4841 (class 2606 OID 16823)
-- Name: buku_kategori buku_kategori_id_kategori_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.buku_kategori
    ADD CONSTRAINT buku_kategori_id_kategori_fkey FOREIGN KEY (id_kategori) REFERENCES public.kategori(id_kategori) ON DELETE CASCADE;


--
-- TOC entry 4843 (class 2606 OID 16860)
-- Name: detail_pembelian detail_pembelian_id_buku_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.detail_pembelian
    ADD CONSTRAINT detail_pembelian_id_buku_fkey FOREIGN KEY (id_buku) REFERENCES public.buku(id_buku);


--
-- TOC entry 4844 (class 2606 OID 16855)
-- Name: detail_pembelian detail_pembelian_id_pembelian_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.detail_pembelian
    ADD CONSTRAINT detail_pembelian_id_pembelian_fkey FOREIGN KEY (id_pembelian) REFERENCES public.pembelian(id_pembelian) ON DELETE CASCADE;


--
-- TOC entry 4847 (class 2606 OID 16893)
-- Name: detail_peminjaman detail_peminjaman_id_buku_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.detail_peminjaman
    ADD CONSTRAINT detail_peminjaman_id_buku_fkey FOREIGN KEY (id_buku) REFERENCES public.buku(id_buku);


--
-- TOC entry 4848 (class 2606 OID 16888)
-- Name: detail_peminjaman detail_peminjaman_id_peminjaman_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.detail_peminjaman
    ADD CONSTRAINT detail_peminjaman_id_peminjaman_fkey FOREIGN KEY (id_peminjaman) REFERENCES public.peminjaman(id_peminjaman) ON DELETE CASCADE;


--
-- TOC entry 4842 (class 2606 OID 16841)
-- Name: pembelian pembelian_id_supplier_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pembelian
    ADD CONSTRAINT pembelian_id_supplier_fkey FOREIGN KEY (id_supplier) REFERENCES public.supplier(id_supplier);


--
-- TOC entry 4845 (class 2606 OID 16872)
-- Name: peminjaman peminjaman_id_anggota_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.peminjaman
    ADD CONSTRAINT peminjaman_id_anggota_fkey FOREIGN KEY (id_anggota) REFERENCES public.anggota(id_anggota);


--
-- TOC entry 4846 (class 2606 OID 16877)
-- Name: peminjaman peminjaman_id_pegawai_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.peminjaman
    ADD CONSTRAINT peminjaman_id_pegawai_fkey FOREIGN KEY (id_pegawai) REFERENCES public.pegawai(id_pegawai);


--
-- TOC entry 4849 (class 2606 OID 16907)
-- Name: pengembalian pengembalian_id_peminjaman_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pengembalian
    ADD CONSTRAINT pengembalian_id_peminjaman_fkey FOREIGN KEY (id_peminjaman) REFERENCES public.peminjaman(id_peminjaman) ON DELETE CASCADE;


-- Completed on 2025-10-22 12:32:42

--
-- PostgreSQL database dump complete
--

\unrestrict gScyV1UV9n0irH54ZDdo0ZDn9HLf1cdGth30NyU5EUuxFEZtnUvVfe82bHVaNE8

