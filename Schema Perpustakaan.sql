--
-- PostgreSQL database dump
--

\restrict lNtYVSEfsWrbGyU5zzsS0udVyxugRUZ8Imjr5bRk6vg8zH90VJ9p5waKtgHsg3b

-- Dumped from database version 17.6
-- Dumped by pg_dump version 17.6

-- Started on 2025-10-22 10:29:09

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


-- Completed on 2025-10-22 10:29:10

--
-- PostgreSQL database dump complete
--

\unrestrict lNtYVSEfsWrbGyU5zzsS0udVyxugRUZ8Imjr5bRk6vg8zH90VJ9p5waKtgHsg3b

