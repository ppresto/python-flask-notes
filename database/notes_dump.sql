--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.8
-- Dumped by pg_dump version 11.2

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: alembic_version; Type: TABLE; Schema: public; Owner: demo
--

CREATE TABLE public.alembic_version (
    version_num character varying(32) NOT NULL
);


ALTER TABLE public.alembic_version OWNER TO demo;

--
-- Name: note; Type: TABLE; Schema: public; Owner: demo
--

CREATE TABLE public.note (
    id integer NOT NULL,
    title character varying(200),
    body text,
    created_at timestamp without time zone DEFAULT now(),
    updated_at timestamp without time zone DEFAULT now(),
    user_id integer NOT NULL
);


ALTER TABLE public.note OWNER TO demo;

--
-- Name: note_id_seq; Type: SEQUENCE; Schema: public; Owner: demo
--

CREATE SEQUENCE public.note_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.note_id_seq OWNER TO demo;

--
-- Name: note_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: demo
--

ALTER SEQUENCE public.note_id_seq OWNED BY public.note.id;


--
-- Name: user; Type: TABLE; Schema: public; Owner: demo
--

CREATE TABLE public."user" (
    id integer NOT NULL,
    username character varying(80) NOT NULL,
    password character varying(200),
    created_at timestamp without time zone DEFAULT now(),
    updated_at timestamp without time zone DEFAULT now()
);


ALTER TABLE public."user" OWNER TO demo;

--
-- Name: user_id_seq; Type: SEQUENCE; Schema: public; Owner: demo
--

CREATE SEQUENCE public.user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_id_seq OWNER TO demo;

--
-- Name: user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: demo
--

ALTER SEQUENCE public.user_id_seq OWNED BY public."user".id;


--
-- Name: note id; Type: DEFAULT; Schema: public; Owner: demo
--

ALTER TABLE ONLY public.note ALTER COLUMN id SET DEFAULT nextval('public.note_id_seq'::regclass);


--
-- Name: user id; Type: DEFAULT; Schema: public; Owner: demo
--

ALTER TABLE ONLY public."user" ALTER COLUMN id SET DEFAULT nextval('public.user_id_seq'::regclass);


--
-- Data for Name: alembic_version; Type: TABLE DATA; Schema: public; Owner: demo
--

COPY public.alembic_version (version_num) FROM stdin;
b8f90d067af9
\.


--
-- Data for Name: note; Type: TABLE DATA; Schema: public; Owner: demo
--

COPY public.note (id, title, body, created_at, updated_at, user_id) FROM stdin;
\.


--
-- Data for Name: user; Type: TABLE DATA; Schema: public; Owner: demo
--

COPY public."user" (id, username, password, created_at, updated_at) FROM stdin;
1	user1	pbkdf2:sha256:150000$YXK1nEgV$71b40346ee1103ba9a7d3e90347d0ed1505597ef61433025b2f98e99642fac9c	2019-05-06 18:58:57.317467	2019-05-06 18:58:57.317467
\.


--
-- Name: note_id_seq; Type: SEQUENCE SET; Schema: public; Owner: demo
--

SELECT pg_catalog.setval('public.note_id_seq', 11, true);


--
-- Name: user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: demo
--

SELECT pg_catalog.setval('public.user_id_seq', 1, true);


--
-- Name: alembic_version alembic_version_pkc; Type: CONSTRAINT; Schema: public; Owner: demo
--

ALTER TABLE ONLY public.alembic_version
    ADD CONSTRAINT alembic_version_pkc PRIMARY KEY (version_num);


--
-- Name: note note_pkey; Type: CONSTRAINT; Schema: public; Owner: demo
--

ALTER TABLE ONLY public.note
    ADD CONSTRAINT note_pkey PRIMARY KEY (id);


--
-- Name: user user_pkey; Type: CONSTRAINT; Schema: public; Owner: demo
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_pkey PRIMARY KEY (id);


--
-- Name: user user_username_key; Type: CONSTRAINT; Schema: public; Owner: demo
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_username_key UNIQUE (username);


--
-- Name: note note_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: demo
--

ALTER TABLE ONLY public.note
    ADD CONSTRAINT note_user_id_fkey FOREIGN KEY (user_id) REFERENCES public."user"(id);


--
-- Name: TABLE alembic_version; Type: ACL; Schema: public; Owner: demo
--

GRANT SELECT ON TABLE public.alembic_version TO "v-root-my-role-1eKjqJ4S6jfNYauaGDh8-1557208928";
GRANT SELECT ON TABLE public.alembic_version TO "v-root-my-role-k4sk9DKjxZniZyaeJvZW-1557208934";
GRANT SELECT ON TABLE public.alembic_version TO "v-root-my-role-HtbBg1kMKN5ICYHAr2Ov-1557208965";
GRANT SELECT ON TABLE public.alembic_version TO "v-root-my-role-xVhZAYG4tQFmQh0uHksP-1557208975";
GRANT SELECT ON TABLE public.alembic_version TO "v-root-my-role-9G7Aboy9pqWtjSxH2Qwg-1557209051";
GRANT SELECT ON TABLE public.alembic_version TO "v-root-my-role-jAnux8rKyvAgUJX8kcjx-1557209075";
GRANT SELECT ON TABLE public.alembic_version TO "v-root-my-role-oqoUUGq7kuHP0XNMrsua-1557209139";
GRANT SELECT ON TABLE public.alembic_version TO "v-root-my-role-3OmPqc5EBPhCOIXIMzXd-1557209403";
GRANT SELECT ON TABLE public.alembic_version TO "v-root-my-role-k3sk9ukxEsOHmq1SLN0I-1557209541";
GRANT SELECT ON TABLE public.alembic_version TO "v-root-my-role-8PRtauqRD2KtuYsJlxKH-1557209603";
GRANT SELECT ON TABLE public.alembic_version TO "v-root-my-role-3umFuuuFpKredu9rdfLD-1557209620";
GRANT SELECT ON TABLE public.alembic_version TO "v-root-my-role-AX73GFRyZDN15AzQoFvM-1557210570";
GRANT SELECT ON TABLE public.alembic_version TO "v-root-my-role-2sIqsEfrMa7pivA1Q9f2-1557210632";
GRANT SELECT ON TABLE public.alembic_version TO "v-root-my-role-5rTcB4Fnj973leNaodc4-1557210638";
GRANT SELECT ON TABLE public.alembic_version TO "v-root-my-role-NVSHKvMHN9kJFXHOyTS0-1557210655";
GRANT SELECT ON TABLE public.alembic_version TO "v-root-my-role-3Dj4Q66A11iPRIYC49q2-1557210658";
GRANT SELECT ON TABLE public.alembic_version TO "v-root-my-role-Bg9vH2rFL7d82Cc2agdq-1557210692";
GRANT SELECT ON TABLE public.alembic_version TO "v-root-my-role-tqdwOMroJoRA5agA51Me-1557210711";
GRANT SELECT ON TABLE public.alembic_version TO "v-root-my-role-uNzyC2plN8Ae9mpQzAXf-1557210720";
GRANT SELECT ON TABLE public.alembic_version TO "v-root-my-role-QRnrTf1lVvP1rsn0P94e-1557210754";
GRANT SELECT ON TABLE public.alembic_version TO "v-root-my-role-8kYhmnAMNlTNlKjffaVe-1557210779";
GRANT SELECT ON TABLE public.alembic_version TO "v-root-my-role-qn6kwJTMGylXdIjXCWZu-1557210785";
GRANT SELECT ON TABLE public.alembic_version TO "v-root-my-role-6WzpJWdlcMuVgobFoLi3-1557210812";
GRANT SELECT ON TABLE public.alembic_version TO "v-root-my-role-sF07ltP7Y5DAZAw8oqmN-1557211439";
GRANT SELECT ON TABLE public.alembic_version TO "v-root-my-role-0AN8yMySZUDGzE2Nd2Rn-1557211540";
GRANT SELECT ON TABLE public.alembic_version TO "v-root-my-role-mfNptR2BdDCF61zr5MTK-1557211566";
GRANT SELECT ON TABLE public.alembic_version TO "v-root-my-role-Hq6KRALoJGxs1ZBAgm8I-1557211730";
GRANT SELECT ON TABLE public.alembic_version TO "v-root-my-role-N6IoQlrIffmvHkb7OiOw-1557251132";
GRANT SELECT ON TABLE public.alembic_version TO "v-root-my-role-O1bsqZYbyo339UzTIZvw-1557251208";
GRANT SELECT ON TABLE public.alembic_version TO "v-root-my-role-iLyeA81PqHarfgb38Ie4-1557251399";
GRANT SELECT ON TABLE public.alembic_version TO "v-root-my-role-7jAQZl7414f6r6C9O6ay-1557251987";
GRANT SELECT ON TABLE public.alembic_version TO "v-root-my-role-vtWigHIH7el5p4XtIOmJ-1557252261";
GRANT SELECT ON TABLE public.alembic_version TO "v-root-my-role-fYDUawYHswOCutozrcAV-1557252262";
GRANT SELECT ON TABLE public.alembic_version TO "v-root-my-role-imortiMIRIfJsjBfidje-1557252350";
GRANT SELECT ON TABLE public.alembic_version TO "v-root-my-role-hgc6m3pGztJTcjImvQPN-1557252351";
GRANT ALL ON TABLE public.alembic_version TO "v-root-my-role-k2h0okIIKYXTAv6ZRtKA-1557275053";
GRANT ALL ON TABLE public.alembic_version TO "v-root-my-role-4txpzpcNjSrn2wCfaewE-1557275124";
GRANT ALL ON TABLE public.alembic_version TO "v-root-my-role-fpo12GgWPeA1LDWkgrM2-1557275125";
GRANT ALL ON TABLE public.alembic_version TO "v-root-my-role-aSdZ3RJYjqtEgrp5cUV3-1557275181";
GRANT ALL ON TABLE public.alembic_version TO "v-root-my-role-zYZeEJ4xnMVPUMqDyCab-1557275182";
GRANT ALL ON TABLE public.alembic_version TO "v-root-my-role-RTNskAgEWYcNtcAunKBs-1557417089";
GRANT ALL ON TABLE public.alembic_version TO "v-root-notes-ro-fmtjUFEAuSMMjK7KXOCB-1557417216";
GRANT ALL ON TABLE public.alembic_version TO "v-root-notes-ro-ryTiAWSVRizdO9jQirs1-1557417447";
GRANT ALL ON TABLE public.alembic_version TO "v-root-notes-ro-4f09Qgs2a04uIaFVjzYW-1557417448";
GRANT ALL ON TABLE public.alembic_version TO "v-root-notes-ro-b0f3nHMMAP293v6kqU9J-1557417663";
GRANT ALL ON TABLE public.alembic_version TO "v-root-notes-ro-hFPXiGnYLCDcm72S2GyK-1557417664";
GRANT ALL ON TABLE public.alembic_version TO "v-root-notes-ro-JWveK40UlAlWIDOsBitJ-1557418697";
GRANT ALL ON TABLE public.alembic_version TO "v-root-notes-ro-NM4dGSzU8JcMXy3M7vDh-1557418921";
GRANT ALL ON TABLE public.alembic_version TO "v-root-notes-ro-phDBOy2drOgDe6jgxwtY-1557418922";
GRANT ALL ON TABLE public.alembic_version TO "v-root-notes-ro-gGn5qKdobOFmvL0NASEX-1557418991";
GRANT ALL ON TABLE public.alembic_version TO "v-root-notes-ro-IgSwY2TTG3L9pwx7849A-1557418992";
GRANT ALL ON TABLE public.alembic_version TO "v-root-notes-ro-0qfTuX1rZKzUAIuCqGmW-1557419018";
GRANT ALL ON TABLE public.alembic_version TO "v-root-notes-ro-jZ2J9tDsrcKtdtEiH1SK-1557419019";
GRANT ALL ON TABLE public.alembic_version TO "v-root-notes-ro-gmEHSbfFJo41U1AMFhhS-1557427999";
GRANT ALL ON TABLE public.alembic_version TO "v-root-notes-ro-veOjBJe2xIZ2TjI05OE3-1557428252";
GRANT ALL ON TABLE public.alembic_version TO "v-root-notes-ro-eSueoEkw7YhQFEHYK45J-1557428253";
GRANT ALL ON TABLE public.alembic_version TO "v-root-notes-ro-EjsZs0gDBz7Ou2gaInvN-1557428278";
GRANT ALL ON TABLE public.alembic_version TO "v-root-notes-ro-Vqm5q8iQNsBj6l1lGAeR-1557428279";


--
-- Name: TABLE note; Type: ACL; Schema: public; Owner: demo
--

GRANT SELECT ON TABLE public.note TO "v-root-my-role-1eKjqJ4S6jfNYauaGDh8-1557208928";
GRANT SELECT ON TABLE public.note TO "v-root-my-role-k4sk9DKjxZniZyaeJvZW-1557208934";
GRANT SELECT ON TABLE public.note TO "v-root-my-role-HtbBg1kMKN5ICYHAr2Ov-1557208965";
GRANT SELECT ON TABLE public.note TO "v-root-my-role-xVhZAYG4tQFmQh0uHksP-1557208975";
GRANT SELECT ON TABLE public.note TO "v-root-my-role-9G7Aboy9pqWtjSxH2Qwg-1557209051";
GRANT SELECT ON TABLE public.note TO "v-root-my-role-jAnux8rKyvAgUJX8kcjx-1557209075";
GRANT SELECT ON TABLE public.note TO "v-root-my-role-oqoUUGq7kuHP0XNMrsua-1557209139";
GRANT SELECT ON TABLE public.note TO "v-root-my-role-3OmPqc5EBPhCOIXIMzXd-1557209403";
GRANT SELECT ON TABLE public.note TO "v-root-my-role-k3sk9ukxEsOHmq1SLN0I-1557209541";
GRANT SELECT ON TABLE public.note TO "v-root-my-role-8PRtauqRD2KtuYsJlxKH-1557209603";
GRANT SELECT ON TABLE public.note TO "v-root-my-role-3umFuuuFpKredu9rdfLD-1557209620";
GRANT SELECT ON TABLE public.note TO "v-root-my-role-AX73GFRyZDN15AzQoFvM-1557210570";
GRANT SELECT ON TABLE public.note TO "v-root-my-role-2sIqsEfrMa7pivA1Q9f2-1557210632";
GRANT SELECT ON TABLE public.note TO "v-root-my-role-5rTcB4Fnj973leNaodc4-1557210638";
GRANT SELECT ON TABLE public.note TO "v-root-my-role-NVSHKvMHN9kJFXHOyTS0-1557210655";
GRANT SELECT ON TABLE public.note TO "v-root-my-role-3Dj4Q66A11iPRIYC49q2-1557210658";
GRANT SELECT ON TABLE public.note TO "v-root-my-role-Bg9vH2rFL7d82Cc2agdq-1557210692";
GRANT SELECT ON TABLE public.note TO "v-root-my-role-tqdwOMroJoRA5agA51Me-1557210711";
GRANT SELECT ON TABLE public.note TO "v-root-my-role-uNzyC2plN8Ae9mpQzAXf-1557210720";
GRANT SELECT ON TABLE public.note TO "v-root-my-role-QRnrTf1lVvP1rsn0P94e-1557210754";
GRANT SELECT ON TABLE public.note TO "v-root-my-role-8kYhmnAMNlTNlKjffaVe-1557210779";
GRANT SELECT ON TABLE public.note TO "v-root-my-role-qn6kwJTMGylXdIjXCWZu-1557210785";
GRANT SELECT ON TABLE public.note TO "v-root-my-role-6WzpJWdlcMuVgobFoLi3-1557210812";
GRANT SELECT ON TABLE public.note TO "v-root-my-role-sF07ltP7Y5DAZAw8oqmN-1557211439";
GRANT SELECT ON TABLE public.note TO "v-root-my-role-0AN8yMySZUDGzE2Nd2Rn-1557211540";
GRANT SELECT ON TABLE public.note TO "v-root-my-role-mfNptR2BdDCF61zr5MTK-1557211566";
GRANT SELECT ON TABLE public.note TO "v-root-my-role-Hq6KRALoJGxs1ZBAgm8I-1557211730";
GRANT SELECT ON TABLE public.note TO "v-root-my-role-N6IoQlrIffmvHkb7OiOw-1557251132";
GRANT SELECT ON TABLE public.note TO "v-root-my-role-O1bsqZYbyo339UzTIZvw-1557251208";
GRANT SELECT ON TABLE public.note TO "v-root-my-role-iLyeA81PqHarfgb38Ie4-1557251399";
GRANT SELECT ON TABLE public.note TO "v-root-my-role-7jAQZl7414f6r6C9O6ay-1557251987";
GRANT SELECT ON TABLE public.note TO "v-root-my-role-vtWigHIH7el5p4XtIOmJ-1557252261";
GRANT SELECT ON TABLE public.note TO "v-root-my-role-fYDUawYHswOCutozrcAV-1557252262";
GRANT SELECT ON TABLE public.note TO "v-root-my-role-imortiMIRIfJsjBfidje-1557252350";
GRANT SELECT ON TABLE public.note TO "v-root-my-role-hgc6m3pGztJTcjImvQPN-1557252351";
GRANT ALL ON TABLE public.note TO "v-root-my-role-k2h0okIIKYXTAv6ZRtKA-1557275053";
GRANT ALL ON TABLE public.note TO "v-root-my-role-4txpzpcNjSrn2wCfaewE-1557275124";
GRANT ALL ON TABLE public.note TO "v-root-my-role-fpo12GgWPeA1LDWkgrM2-1557275125";
GRANT ALL ON TABLE public.note TO "v-root-my-role-aSdZ3RJYjqtEgrp5cUV3-1557275181";
GRANT ALL ON TABLE public.note TO "v-root-my-role-zYZeEJ4xnMVPUMqDyCab-1557275182";
GRANT ALL ON TABLE public.note TO "v-root-my-role-RTNskAgEWYcNtcAunKBs-1557417089";
GRANT ALL ON TABLE public.note TO "v-root-notes-ro-fmtjUFEAuSMMjK7KXOCB-1557417216";
GRANT ALL ON TABLE public.note TO "v-root-notes-ro-ryTiAWSVRizdO9jQirs1-1557417447";
GRANT ALL ON TABLE public.note TO "v-root-notes-ro-4f09Qgs2a04uIaFVjzYW-1557417448";
GRANT ALL ON TABLE public.note TO "v-root-notes-ro-b0f3nHMMAP293v6kqU9J-1557417663";
GRANT ALL ON TABLE public.note TO "v-root-notes-ro-hFPXiGnYLCDcm72S2GyK-1557417664";
GRANT ALL ON TABLE public.note TO "v-root-notes-ro-JWveK40UlAlWIDOsBitJ-1557418697";
GRANT ALL ON TABLE public.note TO "v-root-notes-ro-NM4dGSzU8JcMXy3M7vDh-1557418921";
GRANT ALL ON TABLE public.note TO "v-root-notes-ro-phDBOy2drOgDe6jgxwtY-1557418922";
GRANT ALL ON TABLE public.note TO "v-root-notes-ro-gGn5qKdobOFmvL0NASEX-1557418991";
GRANT ALL ON TABLE public.note TO "v-root-notes-ro-IgSwY2TTG3L9pwx7849A-1557418992";
GRANT ALL ON TABLE public.note TO "v-root-notes-ro-0qfTuX1rZKzUAIuCqGmW-1557419018";
GRANT ALL ON TABLE public.note TO "v-root-notes-ro-jZ2J9tDsrcKtdtEiH1SK-1557419019";
GRANT ALL ON TABLE public.note TO "v-root-notes-ro-gmEHSbfFJo41U1AMFhhS-1557427999";
GRANT ALL ON TABLE public.note TO "v-root-notes-ro-veOjBJe2xIZ2TjI05OE3-1557428252";
GRANT ALL ON TABLE public.note TO "v-root-notes-ro-eSueoEkw7YhQFEHYK45J-1557428253";
GRANT ALL ON TABLE public.note TO "v-root-notes-ro-EjsZs0gDBz7Ou2gaInvN-1557428278";
GRANT ALL ON TABLE public.note TO "v-root-notes-ro-Vqm5q8iQNsBj6l1lGAeR-1557428279";


--
-- Name: SEQUENCE note_id_seq; Type: ACL; Schema: public; Owner: demo
--

GRANT ALL ON SEQUENCE public.note_id_seq TO "v-root-my-role-k2h0okIIKYXTAv6ZRtKA-1557275053";
GRANT ALL ON SEQUENCE public.note_id_seq TO "v-root-my-role-4txpzpcNjSrn2wCfaewE-1557275124";
GRANT ALL ON SEQUENCE public.note_id_seq TO "v-root-my-role-fpo12GgWPeA1LDWkgrM2-1557275125";
GRANT ALL ON SEQUENCE public.note_id_seq TO "v-root-my-role-aSdZ3RJYjqtEgrp5cUV3-1557275181";
GRANT ALL ON SEQUENCE public.note_id_seq TO "v-root-my-role-zYZeEJ4xnMVPUMqDyCab-1557275182";
GRANT ALL ON SEQUENCE public.note_id_seq TO "v-root-my-role-RTNskAgEWYcNtcAunKBs-1557417089";
GRANT ALL ON SEQUENCE public.note_id_seq TO "v-root-notes-ro-fmtjUFEAuSMMjK7KXOCB-1557417216";
GRANT ALL ON SEQUENCE public.note_id_seq TO "v-root-notes-ro-ryTiAWSVRizdO9jQirs1-1557417447";
GRANT ALL ON SEQUENCE public.note_id_seq TO "v-root-notes-ro-4f09Qgs2a04uIaFVjzYW-1557417448";
GRANT ALL ON SEQUENCE public.note_id_seq TO "v-root-notes-ro-b0f3nHMMAP293v6kqU9J-1557417663";
GRANT ALL ON SEQUENCE public.note_id_seq TO "v-root-notes-ro-hFPXiGnYLCDcm72S2GyK-1557417664";
GRANT ALL ON SEQUENCE public.note_id_seq TO "v-root-notes-ro-JWveK40UlAlWIDOsBitJ-1557418697";
GRANT ALL ON SEQUENCE public.note_id_seq TO "v-root-notes-ro-NM4dGSzU8JcMXy3M7vDh-1557418921";
GRANT ALL ON SEQUENCE public.note_id_seq TO "v-root-notes-ro-phDBOy2drOgDe6jgxwtY-1557418922";
GRANT ALL ON SEQUENCE public.note_id_seq TO "v-root-notes-ro-gGn5qKdobOFmvL0NASEX-1557418991";
GRANT ALL ON SEQUENCE public.note_id_seq TO "v-root-notes-ro-IgSwY2TTG3L9pwx7849A-1557418992";
GRANT ALL ON SEQUENCE public.note_id_seq TO "v-root-notes-ro-0qfTuX1rZKzUAIuCqGmW-1557419018";
GRANT ALL ON SEQUENCE public.note_id_seq TO "v-root-notes-ro-jZ2J9tDsrcKtdtEiH1SK-1557419019";
GRANT ALL ON SEQUENCE public.note_id_seq TO "v-root-notes-ro-gmEHSbfFJo41U1AMFhhS-1557427999";
GRANT ALL ON SEQUENCE public.note_id_seq TO "v-root-notes-ro-veOjBJe2xIZ2TjI05OE3-1557428252";
GRANT ALL ON SEQUENCE public.note_id_seq TO "v-root-notes-ro-eSueoEkw7YhQFEHYK45J-1557428253";
GRANT ALL ON SEQUENCE public.note_id_seq TO "v-root-notes-ro-EjsZs0gDBz7Ou2gaInvN-1557428278";
GRANT ALL ON SEQUENCE public.note_id_seq TO "v-root-notes-ro-Vqm5q8iQNsBj6l1lGAeR-1557428279";


--
-- Name: TABLE "user"; Type: ACL; Schema: public; Owner: demo
--

GRANT SELECT ON TABLE public."user" TO "v-root-my-role-1eKjqJ4S6jfNYauaGDh8-1557208928";
GRANT SELECT ON TABLE public."user" TO "v-root-my-role-k4sk9DKjxZniZyaeJvZW-1557208934";
GRANT SELECT ON TABLE public."user" TO "v-root-my-role-HtbBg1kMKN5ICYHAr2Ov-1557208965";
GRANT SELECT ON TABLE public."user" TO "v-root-my-role-xVhZAYG4tQFmQh0uHksP-1557208975";
GRANT SELECT ON TABLE public."user" TO "v-root-my-role-9G7Aboy9pqWtjSxH2Qwg-1557209051";
GRANT SELECT ON TABLE public."user" TO "v-root-my-role-jAnux8rKyvAgUJX8kcjx-1557209075";
GRANT SELECT ON TABLE public."user" TO "v-root-my-role-oqoUUGq7kuHP0XNMrsua-1557209139";
GRANT SELECT ON TABLE public."user" TO "v-root-my-role-3OmPqc5EBPhCOIXIMzXd-1557209403";
GRANT SELECT ON TABLE public."user" TO "v-root-my-role-k3sk9ukxEsOHmq1SLN0I-1557209541";
GRANT SELECT ON TABLE public."user" TO "v-root-my-role-8PRtauqRD2KtuYsJlxKH-1557209603";
GRANT SELECT ON TABLE public."user" TO "v-root-my-role-3umFuuuFpKredu9rdfLD-1557209620";
GRANT SELECT ON TABLE public."user" TO "v-root-my-role-AX73GFRyZDN15AzQoFvM-1557210570";
GRANT SELECT ON TABLE public."user" TO "v-root-my-role-2sIqsEfrMa7pivA1Q9f2-1557210632";
GRANT SELECT ON TABLE public."user" TO "v-root-my-role-5rTcB4Fnj973leNaodc4-1557210638";
GRANT SELECT ON TABLE public."user" TO "v-root-my-role-NVSHKvMHN9kJFXHOyTS0-1557210655";
GRANT SELECT ON TABLE public."user" TO "v-root-my-role-3Dj4Q66A11iPRIYC49q2-1557210658";
GRANT SELECT ON TABLE public."user" TO "v-root-my-role-Bg9vH2rFL7d82Cc2agdq-1557210692";
GRANT SELECT ON TABLE public."user" TO "v-root-my-role-tqdwOMroJoRA5agA51Me-1557210711";
GRANT SELECT ON TABLE public."user" TO "v-root-my-role-uNzyC2plN8Ae9mpQzAXf-1557210720";
GRANT SELECT ON TABLE public."user" TO "v-root-my-role-QRnrTf1lVvP1rsn0P94e-1557210754";
GRANT SELECT ON TABLE public."user" TO "v-root-my-role-8kYhmnAMNlTNlKjffaVe-1557210779";
GRANT SELECT ON TABLE public."user" TO "v-root-my-role-qn6kwJTMGylXdIjXCWZu-1557210785";
GRANT SELECT ON TABLE public."user" TO "v-root-my-role-6WzpJWdlcMuVgobFoLi3-1557210812";
GRANT SELECT ON TABLE public."user" TO "v-root-my-role-sF07ltP7Y5DAZAw8oqmN-1557211439";
GRANT SELECT ON TABLE public."user" TO "v-root-my-role-0AN8yMySZUDGzE2Nd2Rn-1557211540";
GRANT SELECT ON TABLE public."user" TO "v-root-my-role-mfNptR2BdDCF61zr5MTK-1557211566";
GRANT SELECT ON TABLE public."user" TO "v-root-my-role-Hq6KRALoJGxs1ZBAgm8I-1557211730";
GRANT SELECT ON TABLE public."user" TO "v-root-my-role-N6IoQlrIffmvHkb7OiOw-1557251132";
GRANT SELECT ON TABLE public."user" TO "v-root-my-role-O1bsqZYbyo339UzTIZvw-1557251208";
GRANT SELECT ON TABLE public."user" TO "v-root-my-role-iLyeA81PqHarfgb38Ie4-1557251399";
GRANT SELECT ON TABLE public."user" TO "v-root-my-role-7jAQZl7414f6r6C9O6ay-1557251987";
GRANT SELECT ON TABLE public."user" TO "v-root-my-role-vtWigHIH7el5p4XtIOmJ-1557252261";
GRANT SELECT ON TABLE public."user" TO "v-root-my-role-fYDUawYHswOCutozrcAV-1557252262";
GRANT SELECT ON TABLE public."user" TO "v-root-my-role-imortiMIRIfJsjBfidje-1557252350";
GRANT SELECT ON TABLE public."user" TO "v-root-my-role-hgc6m3pGztJTcjImvQPN-1557252351";
GRANT ALL ON TABLE public."user" TO "v-root-my-role-k2h0okIIKYXTAv6ZRtKA-1557275053";
GRANT ALL ON TABLE public."user" TO "v-root-my-role-4txpzpcNjSrn2wCfaewE-1557275124";
GRANT ALL ON TABLE public."user" TO "v-root-my-role-fpo12GgWPeA1LDWkgrM2-1557275125";
GRANT ALL ON TABLE public."user" TO "v-root-my-role-aSdZ3RJYjqtEgrp5cUV3-1557275181";
GRANT ALL ON TABLE public."user" TO "v-root-my-role-zYZeEJ4xnMVPUMqDyCab-1557275182";
GRANT ALL ON TABLE public."user" TO "v-root-my-role-RTNskAgEWYcNtcAunKBs-1557417089";
GRANT ALL ON TABLE public."user" TO "v-root-notes-ro-fmtjUFEAuSMMjK7KXOCB-1557417216";
GRANT ALL ON TABLE public."user" TO "v-root-notes-ro-ryTiAWSVRizdO9jQirs1-1557417447";
GRANT ALL ON TABLE public."user" TO "v-root-notes-ro-4f09Qgs2a04uIaFVjzYW-1557417448";
GRANT ALL ON TABLE public."user" TO "v-root-notes-ro-b0f3nHMMAP293v6kqU9J-1557417663";
GRANT ALL ON TABLE public."user" TO "v-root-notes-ro-hFPXiGnYLCDcm72S2GyK-1557417664";
GRANT ALL ON TABLE public."user" TO "v-root-notes-ro-JWveK40UlAlWIDOsBitJ-1557418697";
GRANT ALL ON TABLE public."user" TO "v-root-notes-ro-NM4dGSzU8JcMXy3M7vDh-1557418921";
GRANT ALL ON TABLE public."user" TO "v-root-notes-ro-phDBOy2drOgDe6jgxwtY-1557418922";
GRANT ALL ON TABLE public."user" TO "v-root-notes-ro-gGn5qKdobOFmvL0NASEX-1557418991";
GRANT ALL ON TABLE public."user" TO "v-root-notes-ro-IgSwY2TTG3L9pwx7849A-1557418992";
GRANT ALL ON TABLE public."user" TO "v-root-notes-ro-0qfTuX1rZKzUAIuCqGmW-1557419018";
GRANT ALL ON TABLE public."user" TO "v-root-notes-ro-jZ2J9tDsrcKtdtEiH1SK-1557419019";
GRANT ALL ON TABLE public."user" TO "v-root-notes-ro-gmEHSbfFJo41U1AMFhhS-1557427999";
GRANT ALL ON TABLE public."user" TO "v-root-notes-ro-veOjBJe2xIZ2TjI05OE3-1557428252";
GRANT ALL ON TABLE public."user" TO "v-root-notes-ro-eSueoEkw7YhQFEHYK45J-1557428253";
GRANT ALL ON TABLE public."user" TO "v-root-notes-ro-EjsZs0gDBz7Ou2gaInvN-1557428278";
GRANT ALL ON TABLE public."user" TO "v-root-notes-ro-Vqm5q8iQNsBj6l1lGAeR-1557428279";


--
-- Name: SEQUENCE user_id_seq; Type: ACL; Schema: public; Owner: demo
--

GRANT ALL ON SEQUENCE public.user_id_seq TO "v-root-my-role-k2h0okIIKYXTAv6ZRtKA-1557275053";
GRANT ALL ON SEQUENCE public.user_id_seq TO "v-root-my-role-4txpzpcNjSrn2wCfaewE-1557275124";
GRANT ALL ON SEQUENCE public.user_id_seq TO "v-root-my-role-fpo12GgWPeA1LDWkgrM2-1557275125";
GRANT ALL ON SEQUENCE public.user_id_seq TO "v-root-my-role-aSdZ3RJYjqtEgrp5cUV3-1557275181";
GRANT ALL ON SEQUENCE public.user_id_seq TO "v-root-my-role-zYZeEJ4xnMVPUMqDyCab-1557275182";
GRANT ALL ON SEQUENCE public.user_id_seq TO "v-root-my-role-RTNskAgEWYcNtcAunKBs-1557417089";
GRANT ALL ON SEQUENCE public.user_id_seq TO "v-root-notes-ro-fmtjUFEAuSMMjK7KXOCB-1557417216";
GRANT ALL ON SEQUENCE public.user_id_seq TO "v-root-notes-ro-ryTiAWSVRizdO9jQirs1-1557417447";
GRANT ALL ON SEQUENCE public.user_id_seq TO "v-root-notes-ro-4f09Qgs2a04uIaFVjzYW-1557417448";
GRANT ALL ON SEQUENCE public.user_id_seq TO "v-root-notes-ro-b0f3nHMMAP293v6kqU9J-1557417663";
GRANT ALL ON SEQUENCE public.user_id_seq TO "v-root-notes-ro-hFPXiGnYLCDcm72S2GyK-1557417664";
GRANT ALL ON SEQUENCE public.user_id_seq TO "v-root-notes-ro-JWveK40UlAlWIDOsBitJ-1557418697";
GRANT ALL ON SEQUENCE public.user_id_seq TO "v-root-notes-ro-NM4dGSzU8JcMXy3M7vDh-1557418921";
GRANT ALL ON SEQUENCE public.user_id_seq TO "v-root-notes-ro-phDBOy2drOgDe6jgxwtY-1557418922";
GRANT ALL ON SEQUENCE public.user_id_seq TO "v-root-notes-ro-gGn5qKdobOFmvL0NASEX-1557418991";
GRANT ALL ON SEQUENCE public.user_id_seq TO "v-root-notes-ro-IgSwY2TTG3L9pwx7849A-1557418992";
GRANT ALL ON SEQUENCE public.user_id_seq TO "v-root-notes-ro-0qfTuX1rZKzUAIuCqGmW-1557419018";
GRANT ALL ON SEQUENCE public.user_id_seq TO "v-root-notes-ro-jZ2J9tDsrcKtdtEiH1SK-1557419019";
GRANT ALL ON SEQUENCE public.user_id_seq TO "v-root-notes-ro-gmEHSbfFJo41U1AMFhhS-1557427999";
GRANT ALL ON SEQUENCE public.user_id_seq TO "v-root-notes-ro-veOjBJe2xIZ2TjI05OE3-1557428252";
GRANT ALL ON SEQUENCE public.user_id_seq TO "v-root-notes-ro-eSueoEkw7YhQFEHYK45J-1557428253";
GRANT ALL ON SEQUENCE public.user_id_seq TO "v-root-notes-ro-EjsZs0gDBz7Ou2gaInvN-1557428278";
GRANT ALL ON SEQUENCE public.user_id_seq TO "v-root-notes-ro-Vqm5q8iQNsBj6l1lGAeR-1557428279";


--
-- PostgreSQL database dump complete
--

