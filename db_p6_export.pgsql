--
-- PostgreSQL database dump
--

-- Dumped from database version 13.2
-- Dumped by pg_dump version 13.2

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
-- Name: address; Type: TABLE; Schema: public; Owner: dianxia
--

CREATE TABLE public.address (
    address_id integer NOT NULL,
    street character varying(255),
    city character varying(255),
    zip_code character varying(255),
    country character varying(255),
    user_id integer
);


ALTER TABLE public.address OWNER TO dianxia;

--
-- Name: address_address_id_seq; Type: SEQUENCE; Schema: public; Owner: dianxia
--

CREATE SEQUENCE public.address_address_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.address_address_id_seq OWNER TO dianxia;

--
-- Name: address_address_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dianxia
--

ALTER SEQUENCE public.address_address_id_seq OWNED BY public.address.address_id;


--
-- Name: delivery_emp; Type: TABLE; Schema: public; Owner: dianxia
--

CREATE TABLE public.delivery_emp (
    del_emp_id integer NOT NULL,
    name character varying(255),
    password character varying(255),
    email character varying(255),
    order_id integer,
    address_id integer,
    availability character varying(255)
);


ALTER TABLE public.delivery_emp OWNER TO dianxia;

--
-- Name: delivery_emp_del_emp_id_seq; Type: SEQUENCE; Schema: public; Owner: dianxia
--

CREATE SEQUENCE public.delivery_emp_del_emp_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.delivery_emp_del_emp_id_seq OWNER TO dianxia;

--
-- Name: delivery_emp_del_emp_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dianxia
--

ALTER SEQUENCE public.delivery_emp_del_emp_id_seq OWNED BY public.delivery_emp.del_emp_id;


--
-- Name: has_ingredients; Type: TABLE; Schema: public; Owner: dianxia
--

CREATE TABLE public.has_ingredients (
    pizzeria_id integer NOT NULL,
    ing_id integer NOT NULL,
    quantity character varying(255)
);


ALTER TABLE public.has_ingredients OWNER TO dianxia;

--
-- Name: ingredients_list; Type: TABLE; Schema: public; Owner: dianxia
--

CREATE TABLE public.ingredients_list (
    ing_id integer NOT NULL,
    name character varying(255)
);


ALTER TABLE public.ingredients_list OWNER TO dianxia;

--
-- Name: ingredients_list_ing_id_seq; Type: SEQUENCE; Schema: public; Owner: dianxia
--

CREATE SEQUENCE public.ingredients_list_ing_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ingredients_list_ing_id_seq OWNER TO dianxia;

--
-- Name: ingredients_list_ing_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dianxia
--

ALTER SEQUENCE public.ingredients_list_ing_id_seq OWNED BY public.ingredients_list.ing_id;


--
-- Name: order; Type: TABLE; Schema: public; Owner: dianxia
--

CREATE TABLE public."order" (
    order_id integer NOT NULL,
    created_at date DEFAULT CURRENT_DATE NOT NULL,
    user_id integer,
    pi_emp_id integer,
    pizzeria_id integer,
    total_price character varying(255),
    order_status character varying(255)
);


ALTER TABLE public."order" OWNER TO dianxia;

--
-- Name: order_details; Type: TABLE; Schema: public; Owner: dianxia
--

CREATE TABLE public.order_details (
    order_det_id integer NOT NULL,
    order_id integer,
    product_id integer,
    quantity character varying(255),
    price character varying(255)
);


ALTER TABLE public.order_details OWNER TO dianxia;

--
-- Name: order_details_order_det_id_seq; Type: SEQUENCE; Schema: public; Owner: dianxia
--

CREATE SEQUENCE public.order_details_order_det_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.order_details_order_det_id_seq OWNER TO dianxia;

--
-- Name: order_details_order_det_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dianxia
--

ALTER SEQUENCE public.order_details_order_det_id_seq OWNED BY public.order_details.order_det_id;


--
-- Name: order_order_id_seq; Type: SEQUENCE; Schema: public; Owner: dianxia
--

CREATE SEQUENCE public.order_order_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.order_order_id_seq OWNER TO dianxia;

--
-- Name: order_order_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dianxia
--

ALTER SEQUENCE public.order_order_id_seq OWNED BY public."order".order_id;


--
-- Name: pizzeria; Type: TABLE; Schema: public; Owner: dianxia
--

CREATE TABLE public.pizzeria (
    pizzeria_id integer NOT NULL,
    name character varying(255),
    address character varying(255),
    phone_number character varying(255)
);


ALTER TABLE public.pizzeria OWNER TO dianxia;

--
-- Name: pizzeria_catalog; Type: TABLE; Schema: public; Owner: dianxia
--

CREATE TABLE public.pizzeria_catalog (
    product_id integer NOT NULL,
    name character varying(255),
    description character varying(255),
    image character varying(255),
    price character varying(255),
    availability character varying(255),
    recipe character varying(255)
);


ALTER TABLE public.pizzeria_catalog OWNER TO dianxia;

--
-- Name: pizzeria_catalog_product_id_seq; Type: SEQUENCE; Schema: public; Owner: dianxia
--

CREATE SEQUENCE public.pizzeria_catalog_product_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.pizzeria_catalog_product_id_seq OWNER TO dianxia;

--
-- Name: pizzeria_catalog_product_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dianxia
--

ALTER SEQUENCE public.pizzeria_catalog_product_id_seq OWNED BY public.pizzeria_catalog.product_id;


--
-- Name: pizzeria_emp; Type: TABLE; Schema: public; Owner: dianxia
--

CREATE TABLE public.pizzeria_emp (
    pi_emp_id integer NOT NULL,
    name character varying(255),
    password character varying(255),
    email character varying(255),
    pizzeria_id integer
);


ALTER TABLE public.pizzeria_emp OWNER TO dianxia;

--
-- Name: pizzeria_emp_pi_emp_id_seq; Type: SEQUENCE; Schema: public; Owner: dianxia
--

CREATE SEQUENCE public.pizzeria_emp_pi_emp_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.pizzeria_emp_pi_emp_id_seq OWNER TO dianxia;

--
-- Name: pizzeria_emp_pi_emp_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dianxia
--

ALTER SEQUENCE public.pizzeria_emp_pi_emp_id_seq OWNED BY public.pizzeria_emp.pi_emp_id;


--
-- Name: pizzeria_pizzeria_id_seq; Type: SEQUENCE; Schema: public; Owner: dianxia
--

CREATE SEQUENCE public.pizzeria_pizzeria_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.pizzeria_pizzeria_id_seq OWNER TO dianxia;

--
-- Name: pizzeria_pizzeria_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dianxia
--

ALTER SEQUENCE public.pizzeria_pizzeria_id_seq OWNED BY public.pizzeria.pizzeria_id;


--
-- Name: requires_ingredients; Type: TABLE; Schema: public; Owner: dianxia
--

CREATE TABLE public.requires_ingredients (
    product_id integer NOT NULL,
    ing_id integer NOT NULL,
    quantity character varying(255),
    ing_unity character varying(255)
);


ALTER TABLE public.requires_ingredients OWNER TO dianxia;

--
-- Name: user; Type: TABLE; Schema: public; Owner: dianxia
--

CREATE TABLE public."user" (
    user_id integer NOT NULL,
    name character varying(255),
    password character varying(255),
    email character varying(255)
);


ALTER TABLE public."user" OWNER TO dianxia;

--
-- Name: user_user_id_seq; Type: SEQUENCE; Schema: public; Owner: dianxia
--

CREATE SEQUENCE public.user_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_user_id_seq OWNER TO dianxia;

--
-- Name: user_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dianxia
--

ALTER SEQUENCE public.user_user_id_seq OWNED BY public."user".user_id;


--
-- Name: address address_id; Type: DEFAULT; Schema: public; Owner: dianxia
--

ALTER TABLE ONLY public.address ALTER COLUMN address_id SET DEFAULT nextval('public.address_address_id_seq'::regclass);


--
-- Name: delivery_emp del_emp_id; Type: DEFAULT; Schema: public; Owner: dianxia
--

ALTER TABLE ONLY public.delivery_emp ALTER COLUMN del_emp_id SET DEFAULT nextval('public.delivery_emp_del_emp_id_seq'::regclass);


--
-- Name: ingredients_list ing_id; Type: DEFAULT; Schema: public; Owner: dianxia
--

ALTER TABLE ONLY public.ingredients_list ALTER COLUMN ing_id SET DEFAULT nextval('public.ingredients_list_ing_id_seq'::regclass);


--
-- Name: order order_id; Type: DEFAULT; Schema: public; Owner: dianxia
--

ALTER TABLE ONLY public."order" ALTER COLUMN order_id SET DEFAULT nextval('public.order_order_id_seq'::regclass);


--
-- Name: order_details order_det_id; Type: DEFAULT; Schema: public; Owner: dianxia
--

ALTER TABLE ONLY public.order_details ALTER COLUMN order_det_id SET DEFAULT nextval('public.order_details_order_det_id_seq'::regclass);


--
-- Name: pizzeria pizzeria_id; Type: DEFAULT; Schema: public; Owner: dianxia
--

ALTER TABLE ONLY public.pizzeria ALTER COLUMN pizzeria_id SET DEFAULT nextval('public.pizzeria_pizzeria_id_seq'::regclass);


--
-- Name: pizzeria_catalog product_id; Type: DEFAULT; Schema: public; Owner: dianxia
--

ALTER TABLE ONLY public.pizzeria_catalog ALTER COLUMN product_id SET DEFAULT nextval('public.pizzeria_catalog_product_id_seq'::regclass);


--
-- Name: pizzeria_emp pi_emp_id; Type: DEFAULT; Schema: public; Owner: dianxia
--

ALTER TABLE ONLY public.pizzeria_emp ALTER COLUMN pi_emp_id SET DEFAULT nextval('public.pizzeria_emp_pi_emp_id_seq'::regclass);


--
-- Name: user user_id; Type: DEFAULT; Schema: public; Owner: dianxia
--

ALTER TABLE ONLY public."user" ALTER COLUMN user_id SET DEFAULT nextval('public.user_user_id_seq'::regclass);


--
-- Data for Name: address; Type: TABLE DATA; Schema: public; Owner: dianxia
--

COPY public.address (address_id, street, city, zip_code, country, user_id) FROM stdin;
4	those	health	3	glass	5
5	subject	peace	0	behind	5
9	factor	send	7	ten	5
10	outside	I	10	measure	5
11	a	send	3	ready	7
13	wide	natural	0	enough	7
17	cup	surface	0	lay	7
18	once	positive	5	sometimes	7
20	whose	consumer	1	animal	7
22	many	term	8	it	7
\.


--
-- Data for Name: delivery_emp; Type: TABLE DATA; Schema: public; Owner: dianxia
--

COPY public.delivery_emp (del_emp_id, name, password, email, order_id, address_id, availability) FROM stdin;
2	Brandon Taylor	city	betty10@gmail.com	5	5	availability
1	Ann Noble	east	brockjoel@yahoo.com	1	4	availability
4	Sarah Cole	hand	rgomez@moran.com	6	9	availability
\.


--
-- Data for Name: has_ingredients; Type: TABLE DATA; Schema: public; Owner: dianxia
--

COPY public.has_ingredients (pizzeria_id, ing_id, quantity) FROM stdin;
3	3	50
3	5	30
3	15	40
\.


--
-- Data for Name: ingredients_list; Type: TABLE DATA; Schema: public; Owner: dianxia
--

COPY public.ingredients_list (ing_id, name) FROM stdin;
1	tomate
10	fromage
14	poivron
2	anchois
3	ananas
5	poulet
9	chorizo
12	saumon
15	farine
\.


--
-- Data for Name: order; Type: TABLE DATA; Schema: public; Owner: dianxia
--

COPY public."order" (order_id, created_at, user_id, pi_emp_id, pizzeria_id, total_price, order_status) FROM stdin;
1	2021-05-06	5	1	3	20	status
5	2021-05-06	6	1	3	10	status
6	2021-05-06	7	1	3	30	status
\.


--
-- Data for Name: order_details; Type: TABLE DATA; Schema: public; Owner: dianxia
--

COPY public.order_details (order_det_id, order_id, product_id, quantity, price) FROM stdin;
1	1	1	2	20
3	5	1	1	10
5	6	1	3	30
\.


--
-- Data for Name: pizzeria; Type: TABLE DATA; Schema: public; Owner: dianxia
--

COPY public.pizzeria (pizzeria_id, name, address, phone_number) FROM stdin;
3	luigi	99667 Lacey Manor Apt. 033\nMatamouth, AK 35926	998.996.5890
7	mario	PSC 1705, Box 8497\nAPO AE 06372	+1-719-465-7973x753
8	pizzeria luigi & mario	3869 Walsh Stream\nPort Austin, UT 63525	746.091.5575
9	super pizzeria	979 Laura Extension Suite 577\nWest Ericafort, RI 13277	+1-221-981-5589x2264
11	fake pizzeria	Unit 2006 Box 6902\nDPO AE 53041	+1-588-859-7270x8545
15	on mange bien	87512 Destiny Fort\nSouth Christopherville, VA 68402	001-361-886-6268x93410
16	pineapple pizzeria	6122 Kramer Squares Suite 566\nWest Cindy, CT 88163	001-610-876-2924x341
18	pizzéria qui existe	718 Everett Squares\nBeckyton, DC 37806	001-832-187-5121
20	pineapple	561 Bentley Shoals\nNorth Courtneymouth, VT 61786	(161)727-7383x658
\.


--
-- Data for Name: pizzeria_catalog; Type: TABLE DATA; Schema: public; Owner: dianxia
--

COPY public.pizzeria_catalog (product_id, name, description, image, price, availability, recipe) FROM stdin;
1	pizza à l'ananas	description	pizza.png	1498	dark	super cool recette
2	pizza au chorizo	description	pizza.png	9443	court	super cool recette
4	vegan bbq	description	pizza.png	4891	statement	super cool recette
8	chèvre-miel	description	pizza.png	2971	education	super cool recette
9	indienne	description	pizza.png	2656	building	super cool recette
11	reine	description	pizza.png	7750	final	super cool recette
13	orientale	description	pizza.png	6891	nor	super cool recette
\.


--
-- Data for Name: pizzeria_emp; Type: TABLE DATA; Schema: public; Owner: dianxia
--

COPY public.pizzeria_emp (pi_emp_id, name, password, email, pizzeria_id) FROM stdin;
1	Karen Ball	against	nguyenkyle@yahoo.com	3
3	Juan Kelley	high	batesjonathan@chase-stewart.com	7
7	Kelly Walker	she	tuckermichele@hotmail.com	8
8	Matthew Howe	yeah	richardparker@gmail.com	9
10	Ryan Mitchell	test	gloriapreston@moore-macias.info	11
12	Jessica Davis	listen	williamharrison@hart-richards.com	20
\.


--
-- Data for Name: requires_ingredients; Type: TABLE DATA; Schema: public; Owner: dianxia
--

COPY public.requires_ingredients (product_id, ing_id, quantity, ing_unity) FROM stdin;
1	3	1	30 g
1	5	1	30 g
1	15	1	50 g
\.


--
-- Data for Name: user; Type: TABLE DATA; Schema: public; Owner: dianxia
--

COPY public."user" (user_id, name, password, email) FROM stdin;
5	Jennifer Molina	newspaper	mbecker@gmail.com
6	Joseph Fitzgerald	religious	johnpeterson@griffin.com
7	Kristopher Holt	whatever	riddletravis@ramsey-lopez.biz
11	Michelle Taylor	investment	xobrien@hayden-smith.com
12	Tanya Garcia	near	cervantessusan@yahoo.com
13	Lisa Collins	town	kwalton@morris-bryant.com
15	Melanie Gibbs	between	dbrooks@jenkins.com
19	Rebecca Rogers	yard	ldiaz@yahoo.com
20	Dwayne Sanchez	trouble	howard06@white-sellers.info
22	Andre Cruz	someone	samantha76@santiago.com
24	Christopher Davis	they	zdavis@gmail.com
\.


--
-- Name: address_address_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dianxia
--

SELECT pg_catalog.setval('public.address_address_id_seq', 22, true);


--
-- Name: delivery_emp_del_emp_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dianxia
--

SELECT pg_catalog.setval('public.delivery_emp_del_emp_id_seq', 6, true);


--
-- Name: ingredients_list_ing_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dianxia
--

SELECT pg_catalog.setval('public.ingredients_list_ing_id_seq', 14, true);


--
-- Name: order_details_order_det_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dianxia
--

SELECT pg_catalog.setval('public.order_details_order_det_id_seq', 5, true);


--
-- Name: order_order_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dianxia
--

SELECT pg_catalog.setval('public.order_order_id_seq', 10, true);


--
-- Name: pizzeria_catalog_product_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dianxia
--

SELECT pg_catalog.setval('public.pizzeria_catalog_product_id_seq', 13, true);


--
-- Name: pizzeria_emp_pi_emp_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dianxia
--

SELECT pg_catalog.setval('public.pizzeria_emp_pi_emp_id_seq', 12, true);


--
-- Name: pizzeria_pizzeria_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dianxia
--

SELECT pg_catalog.setval('public.pizzeria_pizzeria_id_seq', 20, true);


--
-- Name: user_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dianxia
--

SELECT pg_catalog.setval('public.user_user_id_seq', 24, true);


--
-- Name: address address_pkey; Type: CONSTRAINT; Schema: public; Owner: dianxia
--

ALTER TABLE ONLY public.address
    ADD CONSTRAINT address_pkey PRIMARY KEY (address_id);


--
-- Name: delivery_emp delivery_emp_pkey; Type: CONSTRAINT; Schema: public; Owner: dianxia
--

ALTER TABLE ONLY public.delivery_emp
    ADD CONSTRAINT delivery_emp_pkey PRIMARY KEY (del_emp_id);


--
-- Name: has_ingredients has_ingredients_pkey; Type: CONSTRAINT; Schema: public; Owner: dianxia
--

ALTER TABLE ONLY public.has_ingredients
    ADD CONSTRAINT has_ingredients_pkey PRIMARY KEY (pizzeria_id, ing_id);


--
-- Name: ingredients_list ingredients_list_pkey; Type: CONSTRAINT; Schema: public; Owner: dianxia
--

ALTER TABLE ONLY public.ingredients_list
    ADD CONSTRAINT ingredients_list_pkey PRIMARY KEY (ing_id);


--
-- Name: order_details order_details_pkey; Type: CONSTRAINT; Schema: public; Owner: dianxia
--

ALTER TABLE ONLY public.order_details
    ADD CONSTRAINT order_details_pkey PRIMARY KEY (order_det_id);


--
-- Name: order order_pkey; Type: CONSTRAINT; Schema: public; Owner: dianxia
--

ALTER TABLE ONLY public."order"
    ADD CONSTRAINT order_pkey PRIMARY KEY (order_id);


--
-- Name: pizzeria_catalog pizzeria_catalog_pkey; Type: CONSTRAINT; Schema: public; Owner: dianxia
--

ALTER TABLE ONLY public.pizzeria_catalog
    ADD CONSTRAINT pizzeria_catalog_pkey PRIMARY KEY (product_id);


--
-- Name: pizzeria_emp pizzeria_emp_pkey; Type: CONSTRAINT; Schema: public; Owner: dianxia
--

ALTER TABLE ONLY public.pizzeria_emp
    ADD CONSTRAINT pizzeria_emp_pkey PRIMARY KEY (pi_emp_id);


--
-- Name: pizzeria pizzeria_pkey; Type: CONSTRAINT; Schema: public; Owner: dianxia
--

ALTER TABLE ONLY public.pizzeria
    ADD CONSTRAINT pizzeria_pkey PRIMARY KEY (pizzeria_id);


--
-- Name: requires_ingredients requires_ingredients_pkey; Type: CONSTRAINT; Schema: public; Owner: dianxia
--

ALTER TABLE ONLY public.requires_ingredients
    ADD CONSTRAINT requires_ingredients_pkey PRIMARY KEY (product_id, ing_id);


--
-- Name: user user_pkey; Type: CONSTRAINT; Schema: public; Owner: dianxia
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_pkey PRIMARY KEY (user_id);


--
-- Name: address address_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dianxia
--

ALTER TABLE ONLY public.address
    ADD CONSTRAINT address_user_id_fkey FOREIGN KEY (user_id) REFERENCES public."user"(user_id) ON DELETE CASCADE;


--
-- Name: delivery_emp delivery_emp_address_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dianxia
--

ALTER TABLE ONLY public.delivery_emp
    ADD CONSTRAINT delivery_emp_address_id_fkey FOREIGN KEY (address_id) REFERENCES public.address(address_id) ON DELETE CASCADE;


--
-- Name: delivery_emp delivery_emp_order_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dianxia
--

ALTER TABLE ONLY public.delivery_emp
    ADD CONSTRAINT delivery_emp_order_id_fkey FOREIGN KEY (order_id) REFERENCES public."order"(order_id) ON DELETE CASCADE;


--
-- Name: has_ingredients has_ingredients_ing_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dianxia
--

ALTER TABLE ONLY public.has_ingredients
    ADD CONSTRAINT has_ingredients_ing_id_fkey FOREIGN KEY (ing_id) REFERENCES public.ingredients_list(ing_id) ON DELETE CASCADE;


--
-- Name: has_ingredients has_ingredients_pizzeria_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dianxia
--

ALTER TABLE ONLY public.has_ingredients
    ADD CONSTRAINT has_ingredients_pizzeria_id_fkey FOREIGN KEY (pizzeria_id) REFERENCES public.pizzeria(pizzeria_id) ON DELETE CASCADE;


--
-- Name: order_details order_details_order_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dianxia
--

ALTER TABLE ONLY public.order_details
    ADD CONSTRAINT order_details_order_id_fkey FOREIGN KEY (order_id) REFERENCES public."order"(order_id) ON DELETE CASCADE;


--
-- Name: order_details order_details_product_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dianxia
--

ALTER TABLE ONLY public.order_details
    ADD CONSTRAINT order_details_product_id_fkey FOREIGN KEY (product_id) REFERENCES public.pizzeria_catalog(product_id) ON DELETE CASCADE;


--
-- Name: order order_pi_emp_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dianxia
--

ALTER TABLE ONLY public."order"
    ADD CONSTRAINT order_pi_emp_id_fkey FOREIGN KEY (pi_emp_id) REFERENCES public.pizzeria_emp(pi_emp_id) ON DELETE CASCADE;


--
-- Name: order order_pizzeria_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dianxia
--

ALTER TABLE ONLY public."order"
    ADD CONSTRAINT order_pizzeria_id_fkey FOREIGN KEY (pizzeria_id) REFERENCES public.pizzeria(pizzeria_id) ON DELETE CASCADE;


--
-- Name: order order_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dianxia
--

ALTER TABLE ONLY public."order"
    ADD CONSTRAINT order_user_id_fkey FOREIGN KEY (user_id) REFERENCES public."user"(user_id) ON DELETE CASCADE;


--
-- Name: pizzeria_emp pizzeria_emp_pizzeria_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dianxia
--

ALTER TABLE ONLY public.pizzeria_emp
    ADD CONSTRAINT pizzeria_emp_pizzeria_id_fkey FOREIGN KEY (pizzeria_id) REFERENCES public.pizzeria(pizzeria_id) ON DELETE CASCADE;


--
-- Name: requires_ingredients requires_ingredients_ing_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dianxia
--

ALTER TABLE ONLY public.requires_ingredients
    ADD CONSTRAINT requires_ingredients_ing_id_fkey FOREIGN KEY (ing_id) REFERENCES public.ingredients_list(ing_id) ON DELETE CASCADE;


--
-- Name: requires_ingredients requires_ingredients_product_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dianxia
--

ALTER TABLE ONLY public.requires_ingredients
    ADD CONSTRAINT requires_ingredients_product_id_fkey FOREIGN KEY (product_id) REFERENCES public.pizzeria_catalog(product_id) ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

