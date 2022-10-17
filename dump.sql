--
-- PostgreSQL database dump
--

-- Dumped from database version 14.5 (Ubuntu 14.5-0ubuntu0.22.04.1)
-- Dumped by pg_dump version 14.5 (Ubuntu 14.5-0ubuntu0.22.04.1)

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
-- Name: sessions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.sessions (
    id integer NOT NULL,
    "userId" integer NOT NULL,
    token text NOT NULL,
    "CreatAt" timestamp without time zone DEFAULT now() NOT NULL
);


--
-- Name: sessions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.sessions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: sessions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.sessions_id_seq OWNED BY public.sessions.id;


--
-- Name: urls; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.urls (
    id integer NOT NULL,
    url text NOT NULL,
    "shortUrl" text NOT NULL,
    "userId" integer NOT NULL,
    "CreatAt" timestamp without time zone DEFAULT now() NOT NULL
);


--
-- Name: urls_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.urls_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: urls_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.urls_id_seq OWNED BY public.urls.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.users (
    id integer NOT NULL,
    name text NOT NULL,
    email text NOT NULL,
    password text NOT NULL,
    "CreatAt" timestamp without time zone DEFAULT now() NOT NULL
);


--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: views; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.views (
    id integer NOT NULL,
    url_id integer NOT NULL,
    user_id integer NOT NULL,
    "createAt" timestamp without time zone DEFAULT now() NOT NULL
);


--
-- Name: views_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.views_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: views_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.views_id_seq OWNED BY public.views.id;


--
-- Name: sessions id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sessions ALTER COLUMN id SET DEFAULT nextval('public.sessions_id_seq'::regclass);


--
-- Name: urls id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.urls ALTER COLUMN id SET DEFAULT nextval('public.urls_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Name: views id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.views ALTER COLUMN id SET DEFAULT nextval('public.views_id_seq'::regclass);


--
-- Data for Name: sessions; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.sessions VALUES (2, 2, '255c4e15-507a-40a2-a69c-1d62db63218f', '2022-10-17 13:29:58.718051');
INSERT INTO public.sessions VALUES (3, 2, '6c96259c-f332-45bf-addc-f7b027e35c06', '2022-10-17 13:30:12.476199');
INSERT INTO public.sessions VALUES (4, 2, 'a4789f96-af27-4a99-b2c0-714e1e2bc366', '2022-10-17 13:34:33.375497');
INSERT INTO public.sessions VALUES (5, 1, '23dba092-4c30-497d-935c-26c90aa9acdc', '2022-10-17 16:21:05.574155');


--
-- Data for Name: urls; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.urls VALUES (4, 'https://bootcampra.notion.site/Projeto-Shortly-API-21533489cd5042058524caf3429b62e4', 'im6GQ4hR4wXrClFA44fe7', 2, '2022-10-17 14:49:35.927186');
INSERT INTO public.urls VALUES (5, 'https://bootcampra.notion.site/Projeto-Shortly-API-21533489cd5042058524caf3429b62e4', 'a1rXJjx_32jxnyL91d-pN', 2, '2022-10-17 14:53:23.032995');
INSERT INTO public.urls VALUES (6, 'https://bootcampra.notion.site/Projeto-Shortly-API-21533489cd5042058524caf3429b62e4', 'DOZ7f-ZjDAzT_PmZZ3lH-', 2, '2022-10-17 14:55:40.042367');
INSERT INTO public.urls VALUES (7, 'https://bootcampra.notion.site/Projeto-Shortly-API-21533489cd5042058524caf3429b62e4', '_diNCdzz-54os7o5ZAdMY', 2, '2022-10-17 14:56:25.047095');
INSERT INTO public.urls VALUES (8, 'https://bootcampra.notion.site/Projeto-Shortly-API-21533489cd5042058524caf3429b62e4', 'oapUbq61N1SeO4Dv0F2LU', 2, '2022-10-17 14:57:28.019352');
INSERT INTO public.urls VALUES (9, 'https://bootcampra.notion.site/Projeto-Shortly-API-21533489cd5042058524caf3429b62e4', 'jWazEEToF9UO6-bE01WF2', 2, '2022-10-17 14:58:34.367457');
INSERT INTO public.urls VALUES (10, 'https://bootcampra.notion.site/Projeto-Shortly-API-21533489cd5042058524caf3429b62e4', '_WM-CqEFoI5mX6YQptEyf', 2, '2022-10-17 14:59:22.057435');
INSERT INTO public.urls VALUES (11, 'https://bootcampra.notion.site/Projeto-Shortly-API-21533489cd5042058524caf3429b62e4', 'Okm4TEnzaCiV47xuueRBd', 2, '2022-10-17 15:01:19.935267');
INSERT INTO public.urls VALUES (12, 'https://bootcampra.notion.site/Projeto-Shortly-API-21533489cd5042058524caf3429b62e4', 'tk2-xR2ww6bQbGeFByBpN', 2, '2022-10-17 15:01:52.357384');
INSERT INTO public.urls VALUES (13, 'https://bootcampra.notion.site/Projeto-Shortly-API-21533489cd5042058524caf3429b62e4', 'uzoJ1FI2wBMU6Kse-QOf6', 1, '2022-10-17 16:21:23.592185');


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.users VALUES (1, 'lkndflksnfkldsn', 'joao@driven.com.br', '$2b$10$I54zCNfSNFqQRMnq1QPrbeSupFXQIN10z4SHE90NmNjGI9dOh7V8K', '2022-10-17 12:37:01.156498');
INSERT INTO public.users VALUES (2, 'wefnjelknlewkew', 'joo@driven.com.br', '$2b$10$HfYYt2t2aLVSmwpciBUkK.EyYlrOBF6vruqP54.4k8WIDMBuw73Ui', '2022-10-17 12:39:16.12362');


--
-- Data for Name: views; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.views VALUES (3, 12, 2, '2022-10-17 15:20:08.550582');
INSERT INTO public.views VALUES (4, 12, 2, '2022-10-17 15:20:08.559087');
INSERT INTO public.views VALUES (5, 12, 2, '2022-10-17 15:20:08.563277');
INSERT INTO public.views VALUES (6, 12, 2, '2022-10-17 15:20:08.567262');
INSERT INTO public.views VALUES (7, 12, 2, '2022-10-17 15:20:08.571883');
INSERT INTO public.views VALUES (8, 12, 2, '2022-10-17 15:20:08.576209');
INSERT INTO public.views VALUES (9, 12, 2, '2022-10-17 15:20:08.581264');
INSERT INTO public.views VALUES (10, 12, 2, '2022-10-17 15:20:08.586033');
INSERT INTO public.views VALUES (11, 12, 2, '2022-10-17 15:20:08.590262');
INSERT INTO public.views VALUES (12, 12, 2, '2022-10-17 15:20:08.594963');
INSERT INTO public.views VALUES (13, 12, 2, '2022-10-17 15:20:08.599766');
INSERT INTO public.views VALUES (14, 12, 2, '2022-10-17 15:21:19.005712');
INSERT INTO public.views VALUES (15, 12, 2, '2022-10-17 15:21:19.014974');
INSERT INTO public.views VALUES (16, 12, 2, '2022-10-17 15:21:19.020002');
INSERT INTO public.views VALUES (17, 12, 2, '2022-10-17 15:21:19.025684');
INSERT INTO public.views VALUES (18, 12, 2, '2022-10-17 15:21:19.030954');
INSERT INTO public.views VALUES (19, 12, 2, '2022-10-17 15:21:19.036256');
INSERT INTO public.views VALUES (20, 12, 2, '2022-10-17 15:21:19.0418');
INSERT INTO public.views VALUES (21, 12, 2, '2022-10-17 15:21:19.046932');
INSERT INTO public.views VALUES (22, 12, 2, '2022-10-17 15:21:19.051351');
INSERT INTO public.views VALUES (23, 12, 2, '2022-10-17 15:21:19.056049');
INSERT INTO public.views VALUES (24, 12, 2, '2022-10-17 15:21:19.060442');
INSERT INTO public.views VALUES (25, 12, 2, '2022-10-17 15:21:36.452876');
INSERT INTO public.views VALUES (26, 12, 2, '2022-10-17 15:21:36.466224');
INSERT INTO public.views VALUES (27, 12, 2, '2022-10-17 15:21:36.482073');
INSERT INTO public.views VALUES (28, 12, 2, '2022-10-17 15:21:36.489575');
INSERT INTO public.views VALUES (29, 12, 2, '2022-10-17 15:21:36.49803');
INSERT INTO public.views VALUES (30, 12, 2, '2022-10-17 15:21:36.50595');
INSERT INTO public.views VALUES (31, 12, 2, '2022-10-17 15:21:36.512218');
INSERT INTO public.views VALUES (32, 12, 2, '2022-10-17 15:21:36.52234');
INSERT INTO public.views VALUES (33, 12, 2, '2022-10-17 15:21:36.529375');
INSERT INTO public.views VALUES (34, 12, 2, '2022-10-17 15:21:36.535595');
INSERT INTO public.views VALUES (35, 12, 2, '2022-10-17 15:21:36.541501');
INSERT INTO public.views VALUES (36, 12, 2, '2022-10-17 15:21:36.547943');
INSERT INTO public.views VALUES (37, 12, 2, '2022-10-17 15:21:36.554343');
INSERT INTO public.views VALUES (38, 12, 2, '2022-10-17 15:21:36.561057');
INSERT INTO public.views VALUES (39, 12, 2, '2022-10-17 15:21:36.569882');
INSERT INTO public.views VALUES (40, 12, 2, '2022-10-17 15:21:36.576171');
INSERT INTO public.views VALUES (41, 12, 2, '2022-10-17 15:21:36.582486');
INSERT INTO public.views VALUES (42, 12, 2, '2022-10-17 15:21:36.589482');
INSERT INTO public.views VALUES (43, 12, 2, '2022-10-17 15:21:36.595058');
INSERT INTO public.views VALUES (44, 12, 2, '2022-10-17 15:21:36.601898');
INSERT INTO public.views VALUES (45, 12, 2, '2022-10-17 15:21:36.608122');
INSERT INTO public.views VALUES (46, 12, 2, '2022-10-17 15:22:09.315583');
INSERT INTO public.views VALUES (47, 12, 2, '2022-10-17 15:22:09.325783');
INSERT INTO public.views VALUES (48, 12, 2, '2022-10-17 15:22:09.33587');
INSERT INTO public.views VALUES (49, 12, 2, '2022-10-17 15:22:09.346956');
INSERT INTO public.views VALUES (50, 12, 2, '2022-10-17 15:22:09.356619');
INSERT INTO public.views VALUES (51, 12, 2, '2022-10-17 15:22:09.364081');
INSERT INTO public.views VALUES (52, 12, 2, '2022-10-17 15:22:09.371756');
INSERT INTO public.views VALUES (53, 12, 2, '2022-10-17 15:22:09.379907');
INSERT INTO public.views VALUES (54, 12, 2, '2022-10-17 15:22:09.389382');
INSERT INTO public.views VALUES (55, 12, 2, '2022-10-17 15:22:09.396669');
INSERT INTO public.views VALUES (56, 12, 2, '2022-10-17 15:22:09.404116');
INSERT INTO public.views VALUES (57, 12, 2, '2022-10-17 15:22:09.410842');
INSERT INTO public.views VALUES (58, 12, 2, '2022-10-17 15:22:09.418188');
INSERT INTO public.views VALUES (59, 12, 2, '2022-10-17 15:22:09.425373');
INSERT INTO public.views VALUES (60, 12, 2, '2022-10-17 15:22:09.476902');
INSERT INTO public.views VALUES (61, 12, 2, '2022-10-17 15:22:09.493453');
INSERT INTO public.views VALUES (62, 12, 2, '2022-10-17 15:22:09.499898');
INSERT INTO public.views VALUES (63, 12, 2, '2022-10-17 15:22:09.507131');
INSERT INTO public.views VALUES (64, 12, 2, '2022-10-17 15:22:09.513823');
INSERT INTO public.views VALUES (65, 12, 2, '2022-10-17 15:22:09.520261');
INSERT INTO public.views VALUES (66, 12, 2, '2022-10-17 15:22:09.543397');
INSERT INTO public.views VALUES (67, 12, 2, '2022-10-17 15:22:19.961323');
INSERT INTO public.views VALUES (68, 12, 2, '2022-10-17 15:22:19.979412');
INSERT INTO public.views VALUES (69, 12, 2, '2022-10-17 15:22:19.987956');
INSERT INTO public.views VALUES (70, 12, 2, '2022-10-17 15:22:19.996706');
INSERT INTO public.views VALUES (71, 12, 2, '2022-10-17 15:22:20.005063');
INSERT INTO public.views VALUES (72, 12, 2, '2022-10-17 15:22:20.014038');
INSERT INTO public.views VALUES (73, 12, 2, '2022-10-17 15:22:20.023237');
INSERT INTO public.views VALUES (74, 12, 2, '2022-10-17 15:22:20.032259');
INSERT INTO public.views VALUES (75, 12, 2, '2022-10-17 15:22:20.04096');
INSERT INTO public.views VALUES (76, 12, 2, '2022-10-17 15:22:20.057679');
INSERT INTO public.views VALUES (77, 12, 2, '2022-10-17 15:22:20.120434');
INSERT INTO public.views VALUES (78, 12, 2, '2022-10-17 15:22:20.138951');
INSERT INTO public.views VALUES (79, 12, 2, '2022-10-17 15:22:20.148186');
INSERT INTO public.views VALUES (80, 12, 2, '2022-10-17 15:22:20.155282');
INSERT INTO public.views VALUES (81, 12, 2, '2022-10-17 15:22:20.19961');
INSERT INTO public.views VALUES (82, 12, 2, '2022-10-17 15:22:20.212111');
INSERT INTO public.views VALUES (83, 12, 2, '2022-10-17 15:22:20.21998');
INSERT INTO public.views VALUES (84, 12, 2, '2022-10-17 15:22:20.230639');
INSERT INTO public.views VALUES (85, 12, 2, '2022-10-17 15:22:20.238291');
INSERT INTO public.views VALUES (86, 12, 2, '2022-10-17 15:22:20.245607');
INSERT INTO public.views VALUES (87, 12, 2, '2022-10-17 15:22:20.253556');
INSERT INTO public.views VALUES (88, 12, 2, '2022-10-17 15:22:33.548726');
INSERT INTO public.views VALUES (89, 12, 2, '2022-10-17 15:22:33.558628');
INSERT INTO public.views VALUES (90, 12, 2, '2022-10-17 15:22:33.566992');
INSERT INTO public.views VALUES (91, 12, 2, '2022-10-17 15:22:33.574742');
INSERT INTO public.views VALUES (92, 12, 2, '2022-10-17 15:22:33.582047');
INSERT INTO public.views VALUES (93, 12, 2, '2022-10-17 15:22:33.589153');
INSERT INTO public.views VALUES (94, 12, 2, '2022-10-17 15:22:33.596676');
INSERT INTO public.views VALUES (95, 12, 2, '2022-10-17 15:22:33.604071');
INSERT INTO public.views VALUES (96, 12, 2, '2022-10-17 15:22:33.61114');
INSERT INTO public.views VALUES (97, 12, 2, '2022-10-17 15:22:33.619823');
INSERT INTO public.views VALUES (98, 12, 2, '2022-10-17 15:22:33.627824');
INSERT INTO public.views VALUES (99, 12, 2, '2022-10-17 15:22:33.635532');
INSERT INTO public.views VALUES (100, 12, 2, '2022-10-17 15:22:33.642543');
INSERT INTO public.views VALUES (101, 12, 2, '2022-10-17 15:22:33.649649');
INSERT INTO public.views VALUES (102, 12, 2, '2022-10-17 15:22:33.657407');
INSERT INTO public.views VALUES (103, 12, 2, '2022-10-17 15:22:33.664756');
INSERT INTO public.views VALUES (104, 12, 2, '2022-10-17 15:22:33.705409');
INSERT INTO public.views VALUES (105, 12, 2, '2022-10-17 15:22:33.712747');
INSERT INTO public.views VALUES (106, 12, 2, '2022-10-17 15:22:33.720192');
INSERT INTO public.views VALUES (107, 12, 2, '2022-10-17 15:22:33.7292');
INSERT INTO public.views VALUES (108, 12, 2, '2022-10-17 15:22:33.737255');
INSERT INTO public.views VALUES (109, 12, 2, '2022-10-17 15:22:34.688003');
INSERT INTO public.views VALUES (110, 12, 2, '2022-10-17 15:22:34.69514');
INSERT INTO public.views VALUES (111, 12, 2, '2022-10-17 15:22:34.701233');
INSERT INTO public.views VALUES (112, 12, 2, '2022-10-17 15:22:34.707477');
INSERT INTO public.views VALUES (113, 12, 2, '2022-10-17 15:22:34.714205');
INSERT INTO public.views VALUES (114, 12, 2, '2022-10-17 15:22:34.720255');
INSERT INTO public.views VALUES (115, 12, 2, '2022-10-17 15:22:34.726237');
INSERT INTO public.views VALUES (116, 12, 2, '2022-10-17 15:22:34.734388');
INSERT INTO public.views VALUES (117, 12, 2, '2022-10-17 15:22:34.741326');
INSERT INTO public.views VALUES (118, 12, 2, '2022-10-17 15:22:34.748696');
INSERT INTO public.views VALUES (119, 12, 2, '2022-10-17 15:22:34.755598');
INSERT INTO public.views VALUES (120, 12, 2, '2022-10-17 15:22:34.763515');
INSERT INTO public.views VALUES (121, 12, 2, '2022-10-17 15:22:34.770757');
INSERT INTO public.views VALUES (122, 12, 2, '2022-10-17 15:22:34.778537');
INSERT INTO public.views VALUES (123, 12, 2, '2022-10-17 15:22:34.786991');
INSERT INTO public.views VALUES (124, 12, 2, '2022-10-17 15:22:34.794964');
INSERT INTO public.views VALUES (125, 12, 2, '2022-10-17 15:22:34.803427');
INSERT INTO public.views VALUES (126, 12, 2, '2022-10-17 15:22:34.812062');
INSERT INTO public.views VALUES (127, 12, 2, '2022-10-17 15:22:34.826782');
INSERT INTO public.views VALUES (128, 12, 2, '2022-10-17 15:22:34.866751');
INSERT INTO public.views VALUES (129, 12, 2, '2022-10-17 15:22:34.875166');
INSERT INTO public.views VALUES (130, 12, 2, '2022-10-17 15:24:45.766149');
INSERT INTO public.views VALUES (131, 12, 2, '2022-10-17 15:24:45.77768');
INSERT INTO public.views VALUES (132, 12, 2, '2022-10-17 15:24:45.788351');
INSERT INTO public.views VALUES (133, 12, 2, '2022-10-17 15:24:45.795832');
INSERT INTO public.views VALUES (134, 12, 2, '2022-10-17 15:24:45.805075');
INSERT INTO public.views VALUES (135, 12, 2, '2022-10-17 15:24:45.813407');
INSERT INTO public.views VALUES (136, 12, 2, '2022-10-17 15:24:45.821061');
INSERT INTO public.views VALUES (137, 12, 2, '2022-10-17 15:24:45.828733');
INSERT INTO public.views VALUES (138, 12, 2, '2022-10-17 15:24:45.836181');
INSERT INTO public.views VALUES (139, 12, 2, '2022-10-17 15:24:45.851654');
INSERT INTO public.views VALUES (140, 12, 2, '2022-10-17 15:24:45.863704');
INSERT INTO public.views VALUES (141, 12, 2, '2022-10-17 15:24:45.876492');
INSERT INTO public.views VALUES (142, 12, 2, '2022-10-17 15:24:45.935145');
INSERT INTO public.views VALUES (143, 12, 2, '2022-10-17 15:24:45.944675');
INSERT INTO public.views VALUES (144, 12, 2, '2022-10-17 15:24:45.954662');
INSERT INTO public.views VALUES (145, 12, 2, '2022-10-17 15:24:45.963409');
INSERT INTO public.views VALUES (146, 12, 2, '2022-10-17 15:24:45.972321');
INSERT INTO public.views VALUES (147, 12, 2, '2022-10-17 15:24:45.980503');
INSERT INTO public.views VALUES (148, 12, 2, '2022-10-17 15:24:46.005233');
INSERT INTO public.views VALUES (149, 12, 2, '2022-10-17 15:24:46.014897');
INSERT INTO public.views VALUES (150, 12, 2, '2022-10-17 15:24:46.023551');
INSERT INTO public.views VALUES (151, 12, 2, '2022-10-17 15:24:53.008107');
INSERT INTO public.views VALUES (152, 12, 2, '2022-10-17 15:24:53.035763');
INSERT INTO public.views VALUES (153, 12, 2, '2022-10-17 15:24:53.047862');
INSERT INTO public.views VALUES (154, 12, 2, '2022-10-17 15:24:53.056352');
INSERT INTO public.views VALUES (155, 12, 2, '2022-10-17 15:24:53.065658');
INSERT INTO public.views VALUES (156, 12, 2, '2022-10-17 15:24:53.074692');
INSERT INTO public.views VALUES (157, 12, 2, '2022-10-17 15:24:53.082861');
INSERT INTO public.views VALUES (158, 12, 2, '2022-10-17 15:24:53.092006');
INSERT INTO public.views VALUES (159, 12, 2, '2022-10-17 15:24:53.101254');
INSERT INTO public.views VALUES (160, 12, 2, '2022-10-17 15:24:53.109866');
INSERT INTO public.views VALUES (161, 12, 2, '2022-10-17 15:24:53.123267');
INSERT INTO public.views VALUES (162, 12, 2, '2022-10-17 15:24:53.132499');
INSERT INTO public.views VALUES (163, 12, 2, '2022-10-17 15:24:53.141086');
INSERT INTO public.views VALUES (164, 12, 2, '2022-10-17 15:24:53.178809');
INSERT INTO public.views VALUES (165, 12, 2, '2022-10-17 15:24:53.186611');
INSERT INTO public.views VALUES (166, 12, 2, '2022-10-17 15:24:53.194392');
INSERT INTO public.views VALUES (167, 12, 2, '2022-10-17 15:24:53.201674');
INSERT INTO public.views VALUES (168, 12, 2, '2022-10-17 15:24:53.208359');
INSERT INTO public.views VALUES (169, 12, 2, '2022-10-17 15:24:53.215989');
INSERT INTO public.views VALUES (170, 12, 2, '2022-10-17 15:24:53.223116');
INSERT INTO public.views VALUES (171, 12, 2, '2022-10-17 15:24:53.230092');
INSERT INTO public.views VALUES (172, 12, 2, '2022-10-17 15:25:23.375315');
INSERT INTO public.views VALUES (173, 12, 2, '2022-10-17 15:25:31.314333');
INSERT INTO public.views VALUES (174, 12, 2, '2022-10-17 15:26:31.571885');
INSERT INTO public.views VALUES (175, 12, 2, '2022-10-17 15:27:43.705846');
INSERT INTO public.views VALUES (176, 12, 2, '2022-10-17 15:31:01.26212');
INSERT INTO public.views VALUES (177, 12, 2, '2022-10-17 15:31:32.289458');
INSERT INTO public.views VALUES (178, 12, 2, '2022-10-17 15:39:07.786679');
INSERT INTO public.views VALUES (179, 13, 1, '2022-10-17 16:21:51.710594');


--
-- Name: sessions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.sessions_id_seq', 5, true);


--
-- Name: urls_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.urls_id_seq', 13, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.users_id_seq', 2, true);


--
-- Name: views_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.views_id_seq', 179, true);


--
-- Name: sessions sessions_pk; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT sessions_pk PRIMARY KEY (id);


--
-- Name: urls urls_pk; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.urls
    ADD CONSTRAINT urls_pk PRIMARY KEY (id);


--
-- Name: users users_CreatAt_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT "users_CreatAt_key" UNIQUE ("CreatAt");


--
-- Name: users users_email_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- Name: users users_password_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_password_key UNIQUE (password);


--
-- Name: users users_pk; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pk PRIMARY KEY (id);


--
-- Name: views views_pk; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.views
    ADD CONSTRAINT views_pk PRIMARY KEY (id);


--
-- Name: sessions sessions_fk0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT sessions_fk0 FOREIGN KEY ("userId") REFERENCES public.users(id);


--
-- Name: urls urls_fk0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.urls
    ADD CONSTRAINT urls_fk0 FOREIGN KEY ("userId") REFERENCES public.users(id);


--
-- Name: views views_fk0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.views
    ADD CONSTRAINT views_fk0 FOREIGN KEY (url_id) REFERENCES public.urls(id);


--
-- Name: views views_fk1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.views
    ADD CONSTRAINT views_fk1 FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- PostgreSQL database dump complete
--

