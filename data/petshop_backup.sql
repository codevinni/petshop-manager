--
-- PostgreSQL database dump
--

\restrict TjhQb0AFCoNRH2SC7yqq9hOfOXOaD99U0SHGUgydJJXe9aQPG9a9P2u9crF3GZ2

-- Dumped from database version 18.0
-- Dumped by pg_dump version 18.0

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

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: admin; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.admin (
    username character varying NOT NULL,
    password character varying NOT NULL,
    id bigint NOT NULL
);


ALTER TABLE public.admin OWNER TO postgres;

--
-- Name: admin_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.admin_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.admin_id_seq OWNER TO postgres;

--
-- Name: admin_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.admin_id_seq OWNED BY public.admin.id;


--
-- Name: agendamento; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.agendamento (
    id bigint NOT NULL,
    client_id bigint NOT NULL,
    dog_id bigint NOT NULL,
    date timestamp without time zone,
    status character varying
);


ALTER TABLE public.agendamento OWNER TO postgres;

--
-- Name: agendamento_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.agendamento_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.agendamento_id_seq OWNER TO postgres;

--
-- Name: agendamento_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.agendamento_id_seq OWNED BY public.agendamento.id;


--
-- Name: agendamento_servicos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.agendamento_servicos (
    agendamento_id bigint NOT NULL,
    servico character varying NOT NULL
);


ALTER TABLE public.agendamento_servicos OWNER TO postgres;

--
-- Name: caes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.caes (
    id bigint NOT NULL,
    name character varying,
    size character varying,
    owner_id bigint NOT NULL,
    dog_breed character varying
);


ALTER TABLE public.caes OWNER TO postgres;

--
-- Name: caes_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.caes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.caes_id_seq OWNER TO postgres;

--
-- Name: caes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.caes_id_seq OWNED BY public.caes.id;


--
-- Name: clientes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.clientes (
    id bigint CONSTRAINT cliente_id_not_null NOT NULL,
    name character varying,
    cpf character varying,
    number character varying,
    email character varying,
    birth date
);


ALTER TABLE public.clientes OWNER TO postgres;

--
-- Name: cliente_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.cliente_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.cliente_id_seq OWNER TO postgres;

--
-- Name: cliente_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.cliente_id_seq OWNED BY public.clientes.id;


--
-- Name: prestacao_servico; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.prestacao_servico (
    id bigint NOT NULL,
    appointment_id bigint NOT NULL,
    date timestamp without time zone,
    total_value numeric
);


ALTER TABLE public.prestacao_servico OWNER TO postgres;

--
-- Name: prestacao_servico_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.prestacao_servico_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.prestacao_servico_id_seq OWNER TO postgres;

--
-- Name: prestacao_servico_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.prestacao_servico_id_seq OWNED BY public.prestacao_servico.id;


--
-- Name: servicos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.servicos (
    name character varying NOT NULL,
    price numeric NOT NULL
);


ALTER TABLE public.servicos OWNER TO postgres;

--
-- Name: admin id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin ALTER COLUMN id SET DEFAULT nextval('public.admin_id_seq'::regclass);


--
-- Name: agendamento id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.agendamento ALTER COLUMN id SET DEFAULT nextval('public.agendamento_id_seq'::regclass);


--
-- Name: caes id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.caes ALTER COLUMN id SET DEFAULT nextval('public.caes_id_seq'::regclass);


--
-- Name: clientes id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clientes ALTER COLUMN id SET DEFAULT nextval('public.cliente_id_seq'::regclass);


--
-- Name: prestacao_servico id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.prestacao_servico ALTER COLUMN id SET DEFAULT nextval('public.prestacao_servico_id_seq'::regclass);


--
-- Data for Name: admin; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.admin (username, password, id) FROM stdin;
admin	admin	1
\.


--
-- Data for Name: agendamento; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.agendamento (id, client_id, dog_id, date, status) FROM stdin;
1	2	1	2025-11-16 00:00:00	Pendente
2	1	2	2025-11-14 00:00:00	Pendente
4	4	4	2025-12-04 00:00:00	Pendente
5	2	5	2025-11-20 00:00:00	Concluído
3	3	3	2025-11-13 00:00:00	Concluído
\.


--
-- Data for Name: agendamento_servicos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.agendamento_servicos (agendamento_id, servico) FROM stdin;
1	Banho
1	Hidratação
2	Corte de unhas
2	Limpeza de Ouvidos
2	Tosa na máquina
3	Limpeza de Ouvidos
4	Banho
4	Corte de unhas
4	Tosa na máquina
5	Limpeza de Ouvidos
\.


--
-- Data for Name: caes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.caes (id, name, size, owner_id, dog_breed) FROM stdin;
1	Vilma Tereza	Pequeno	2	Pug
2	Sirius	Médio	1	Pastor Belga
3	Princesa	Grande	3	Pit Bull
4	Zeus	Pequeno	4	Pinscher
5	Sophia	Grande	2	Labrador
\.


--
-- Data for Name: clientes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.clientes (id, name, cpf, number, email, birth) FROM stdin;
1	Vinicius	23789456021	3299998877	vinicius@email.com	2004-05-13
2	Helen	49820531798	3288776699	helen@email.com	2004-07-26
3	Junior	87642498962	32945678932	junior@email.com	2009-11-05
4	Maria	64295681952	32776689052	maria@email.com	2014-02-11
\.


--
-- Data for Name: prestacao_servico; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.prestacao_servico (id, appointment_id, date, total_value) FROM stdin;
1	5	2025-11-12 00:00:00	15
2	3	2025-11-13 00:00:00	15
\.


--
-- Data for Name: servicos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.servicos (name, price) FROM stdin;
Banho	50
Tosa na máquina	40
Hidratação	30
Corte de unhas	20
Limpeza de Ouvidos	15
\.


--
-- Name: admin_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.admin_id_seq', 1, true);


--
-- Name: agendamento_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.agendamento_id_seq', 5, true);


--
-- Name: caes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.caes_id_seq', 5, true);


--
-- Name: cliente_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cliente_id_seq', 4, true);


--
-- Name: prestacao_servico_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.prestacao_servico_id_seq', 2, true);


--
-- Name: clientes UNQ_cpf; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clientes
    ADD CONSTRAINT "UNQ_cpf" UNIQUE (cpf);


--
-- Name: admin admin_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin
    ADD CONSTRAINT admin_pkey PRIMARY KEY (id);


--
-- Name: agendamento agendamento_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.agendamento
    ADD CONSTRAINT agendamento_pkey PRIMARY KEY (id);


--
-- Name: caes caes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.caes
    ADD CONSTRAINT caes_pkey PRIMARY KEY (id);


--
-- Name: clientes cliente_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clientes
    ADD CONSTRAINT cliente_pkey PRIMARY KEY (id);


--
-- Name: prestacao_servico prestacao_servico_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.prestacao_servico
    ADD CONSTRAINT prestacao_servico_pkey PRIMARY KEY (id);


--
-- Name: servicos servicos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.servicos
    ADD CONSTRAINT servicos_pkey PRIMARY KEY (name);


--
-- Name: agendamento_servicos FK_Agendamento; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.agendamento_servicos
    ADD CONSTRAINT "FK_Agendamento" FOREIGN KEY (agendamento_id) REFERENCES public.agendamento(id);


--
-- Name: prestacao_servico FK_AgendamentoID; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.prestacao_servico
    ADD CONSTRAINT "FK_AgendamentoID" FOREIGN KEY (appointment_id) REFERENCES public.agendamento(id);


--
-- Name: agendamento FK_ClientID; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.agendamento
    ADD CONSTRAINT "FK_ClientID" FOREIGN KEY (client_id) REFERENCES public.clientes(id);


--
-- Name: agendamento FK_DogID; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.agendamento
    ADD CONSTRAINT "FK_DogID" FOREIGN KEY (dog_id) REFERENCES public.caes(id);


--
-- Name: caes FK_OwnerId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.caes
    ADD CONSTRAINT "FK_OwnerId" FOREIGN KEY (owner_id) REFERENCES public.clientes(id);


--
-- Name: agendamento_servicos FK_Servico; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.agendamento_servicos
    ADD CONSTRAINT "FK_Servico" FOREIGN KEY (servico) REFERENCES public.servicos(name);


--
-- PostgreSQL database dump complete
--

\unrestrict TjhQb0AFCoNRH2SC7yqq9hOfOXOaD99U0SHGUgydJJXe9aQPG9a9P2u9crF3GZ2

