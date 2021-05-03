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
    user_id integer,
    street character varying(255),
    city character varying(255),
    zip_code character varying(255),
    country character varying(255)
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
-- Name: admin; Type: TABLE; Schema: public; Owner: dianxia
--

CREATE TABLE public.admin (
    adm_id integer NOT NULL,
    name character varying(255),
    password character varying(255),
    email character varying(255),
    pizzeria_id integer,
    ing_id integer,
    order_id integer
);


ALTER TABLE public.admin OWNER TO dianxia;

--
-- Name: admin_adm_id_seq; Type: SEQUENCE; Schema: public; Owner: dianxia
--

CREATE SEQUENCE public.admin_adm_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.admin_adm_id_seq OWNER TO dianxia;

--
-- Name: admin_adm_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dianxia
--

ALTER SEQUENCE public.admin_adm_id_seq OWNED BY public.admin.adm_id;


--
-- Name: delivery; Type: TABLE; Schema: public; Owner: dianxia
--

CREATE TABLE public.delivery (
    order_del_id integer NOT NULL,
    order_id integer,
    address_id integer,
    delivery_status character varying(255)
);


ALTER TABLE public.delivery OWNER TO dianxia;

--
-- Name: delivery_emp; Type: TABLE; Schema: public; Owner: dianxia
--

CREATE TABLE public.delivery_emp (
    del_emp_id integer NOT NULL,
    name character varying(255),
    password character varying(255),
    email character varying(255),
    order_del_id integer,
    delivery_status character varying(255)
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
-- Name: delivery_order_del_id_seq; Type: SEQUENCE; Schema: public; Owner: dianxia
--

CREATE SEQUENCE public.delivery_order_del_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.delivery_order_del_id_seq OWNER TO dianxia;

--
-- Name: delivery_order_del_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dianxia
--

ALTER SEQUENCE public.delivery_order_del_id_seq OWNED BY public.delivery.order_del_id;


--
-- Name: ingredients_list; Type: TABLE; Schema: public; Owner: dianxia
--

CREATE TABLE public.ingredients_list (
    ing_id integer NOT NULL,
    name character varying(255),
    ing_stock character varying(255),
    pizzeria_id integer
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
-- Name: orders; Type: TABLE; Schema: public; Owner: dianxia
--

CREATE TABLE public.orders (
    order_id integer NOT NULL,
    product_id integer,
    user_id integer,
    pizzeria_id integer,
    total_price character varying(255),
    order_status character varying(255)
);


ALTER TABLE public.orders OWNER TO dianxia;

--
-- Name: orders_order_id_seq; Type: SEQUENCE; Schema: public; Owner: dianxia
--

CREATE SEQUENCE public.orders_order_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.orders_order_id_seq OWNER TO dianxia;

--
-- Name: orders_order_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dianxia
--

ALTER SEQUENCE public.orders_order_id_seq OWNED BY public.orders.order_id;


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
    ingredients integer
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
    pizzeria_id integer,
    ing_id integer,
    order_id integer
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
-- Name: recipe; Type: TABLE; Schema: public; Owner: dianxia
--

CREATE TABLE public.recipe (
    rec_id integer NOT NULL,
    name character varying(255),
    description character varying(255),
    pizzeria_id integer
);


ALTER TABLE public.recipe OWNER TO dianxia;

--
-- Name: recipe_rec_id_seq; Type: SEQUENCE; Schema: public; Owner: dianxia
--

CREATE SEQUENCE public.recipe_rec_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.recipe_rec_id_seq OWNER TO dianxia;

--
-- Name: recipe_rec_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dianxia
--

ALTER SEQUENCE public.recipe_rec_id_seq OWNED BY public.recipe.rec_id;


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
-- Name: admin adm_id; Type: DEFAULT; Schema: public; Owner: dianxia
--

ALTER TABLE ONLY public.admin ALTER COLUMN adm_id SET DEFAULT nextval('public.admin_adm_id_seq'::regclass);


--
-- Name: delivery order_del_id; Type: DEFAULT; Schema: public; Owner: dianxia
--

ALTER TABLE ONLY public.delivery ALTER COLUMN order_del_id SET DEFAULT nextval('public.delivery_order_del_id_seq'::regclass);


--
-- Name: delivery_emp del_emp_id; Type: DEFAULT; Schema: public; Owner: dianxia
--

ALTER TABLE ONLY public.delivery_emp ALTER COLUMN del_emp_id SET DEFAULT nextval('public.delivery_emp_del_emp_id_seq'::regclass);


--
-- Name: ingredients_list ing_id; Type: DEFAULT; Schema: public; Owner: dianxia
--

ALTER TABLE ONLY public.ingredients_list ALTER COLUMN ing_id SET DEFAULT nextval('public.ingredients_list_ing_id_seq'::regclass);


--
-- Name: orders order_id; Type: DEFAULT; Schema: public; Owner: dianxia
--

ALTER TABLE ONLY public.orders ALTER COLUMN order_id SET DEFAULT nextval('public.orders_order_id_seq'::regclass);


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
-- Name: recipe rec_id; Type: DEFAULT; Schema: public; Owner: dianxia
--

ALTER TABLE ONLY public.recipe ALTER COLUMN rec_id SET DEFAULT nextval('public.recipe_rec_id_seq'::regclass);


--
-- Name: user user_id; Type: DEFAULT; Schema: public; Owner: dianxia
--

ALTER TABLE ONLY public."user" ALTER COLUMN user_id SET DEFAULT nextval('public.user_user_id_seq'::regclass);


--
-- Data for Name: address; Type: TABLE DATA; Schema: public; Owner: dianxia
--

COPY public.address (address_id, user_id, street, city, zip_code, country) FROM stdin;
1	1	blob	user_1	12345	france
2	2	Foo	user_2	12345	france
3	3	Bar	user_3	12345	france
4	1	out	arm	1185	low
5	4	man	eat	7452	attorney
6	1	good	focus	4343	here
7	0	approach	address	465	ability
8	0	hold	song	4101	explain
9	8	once	newspaper	1206	discover
11	1	top	clearly	5740	moment
\.


--
-- Data for Name: admin; Type: TABLE DATA; Schema: public; Owner: dianxia
--

COPY public.admin (adm_id, name, password, email, pizzeria_id, ing_id, order_id) FROM stdin;
1	Christina Padilla	minute	key	5	6	5
\.


--
-- Data for Name: delivery; Type: TABLE DATA; Schema: public; Owner: dianxia
--

COPY public.delivery (order_del_id, order_id, address_id, delivery_status) FROM stdin;
1	3	1	behavior
\.


--
-- Data for Name: delivery_emp; Type: TABLE DATA; Schema: public; Owner: dianxia
--

COPY public.delivery_emp (del_emp_id, name, password, email, order_del_id, delivery_status) FROM stdin;
1	a	a	a	1	a
\.


--
-- Data for Name: ingredients_list; Type: TABLE DATA; Schema: public; Owner: dianxia
--

COPY public.ingredients_list (ing_id, name, ing_stock, pizzeria_id) FROM stdin;
1	Dana Hernandez	5106	3
3	Kristin Johnson	7147	4
\.


--
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: dianxia
--

COPY public.orders (order_id, product_id, user_id, pizzeria_id, total_price, order_status) FROM stdin;
1	4	1	6	health	direction
\.


--
-- Data for Name: pizzeria; Type: TABLE DATA; Schema: public; Owner: dianxia
--

COPY public.pizzeria (pizzeria_id, name, address, phone_number) FROM stdin;
1	Michelle Carney	75828 Little Underpass Suite 387\nBrandonside, NJ 81725	001-143-174-2097x84650
2	Kelly Moran	123 Andrea Hills\nKimmouth, IN 09528	+1-392-375-1653
3	Richard Johnson	USNV Fernandez\nFPO AP 12678	548-084-6114
5	Ashley Schroeder	1755 Lang Pine Apt. 788\nRichardland, DE 17880	+1-145-822-1969x6242
\.


--
-- Data for Name: pizzeria_catalog; Type: TABLE DATA; Schema: public; Owner: dianxia
--

COPY public.pizzeria_catalog (product_id, name, description, image, price, availability, ingredients) FROM stdin;
1	Cody Miranda	million	able	5154	toward	3
3	Tracy Johnson	form	cover	6980	line	6
\.


--
-- Data for Name: pizzeria_emp; Type: TABLE DATA; Schema: public; Owner: dianxia
--

COPY public.pizzeria_emp (pi_emp_id, name, password, email, pizzeria_id, ing_id, order_id) FROM stdin;
1	James Mann	she	wife	7	2	1
\.


--
-- Data for Name: recipe; Type: TABLE DATA; Schema: public; Owner: dianxia
--

COPY public.recipe (rec_id, name, description, pizzeria_id) FROM stdin;
1	Mr. Nathan Stewart	per	8
2	Linda Fowler	agency	6
3	Kevin Anderson	car	2
\.


--
-- Data for Name: user; Type: TABLE DATA; Schema: public; Owner: dianxia
--

COPY public."user" (user_id, name, password, email) FROM stdin;
1	user1	blob	email_user_1
2	user2	Foo	email_user_2
3	user3	Bar	email_user_3
4	user1	blob	email_user_1
5	user2	Foo	email_user_2
6	user3	Bar	email_user_3
7	Michelle White	family	artist
8	Nathan Jackson	nice	for
9	David Roman	must	there
10	Alexis Roman	both	wonder
11	Maria Taylor DDS	husband	certain
12	Amanda Reeves	security	hospital
13	Matthew Edwards	if	around
14	Wendy Hicks	task	suggest
\.


--
-- Name: address_address_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dianxia
--

SELECT pg_catalog.setval('public.address_address_id_seq', 34, true);


--
-- Name: admin_adm_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dianxia
--

SELECT pg_catalog.setval('public.admin_adm_id_seq', 1, true);


--
-- Name: delivery_emp_del_emp_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dianxia
--

SELECT pg_catalog.setval('public.delivery_emp_del_emp_id_seq', 3, true);


--
-- Name: delivery_order_del_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dianxia
--

SELECT pg_catalog.setval('public.delivery_order_del_id_seq', 2, true);


--
-- Name: ingredients_list_ing_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dianxia
--

SELECT pg_catalog.setval('public.ingredients_list_ing_id_seq', 10, true);


--
-- Name: orders_order_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dianxia
--

SELECT pg_catalog.setval('public.orders_order_id_seq', 2, true);


--
-- Name: pizzeria_catalog_product_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dianxia
--

SELECT pg_catalog.setval('public.pizzeria_catalog_product_id_seq', 4, true);


--
-- Name: pizzeria_emp_pi_emp_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dianxia
--

SELECT pg_catalog.setval('public.pizzeria_emp_pi_emp_id_seq', 2, true);


--
-- Name: pizzeria_pizzeria_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dianxia
--

SELECT pg_catalog.setval('public.pizzeria_pizzeria_id_seq', 13, true);


--
-- Name: recipe_rec_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dianxia
--

SELECT pg_catalog.setval('public.recipe_rec_id_seq', 3, true);


--
-- Name: user_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dianxia
--

SELECT pg_catalog.setval('public.user_user_id_seq', 40, true);


--
-- Name: address address_pkey; Type: CONSTRAINT; Schema: public; Owner: dianxia
--

ALTER TABLE ONLY public.address
    ADD CONSTRAINT address_pkey PRIMARY KEY (address_id);


--
-- Name: admin admin_pkey; Type: CONSTRAINT; Schema: public; Owner: dianxia
--

ALTER TABLE ONLY public.admin
    ADD CONSTRAINT admin_pkey PRIMARY KEY (adm_id);


--
-- Name: delivery_emp delivery_emp_pkey; Type: CONSTRAINT; Schema: public; Owner: dianxia
--

ALTER TABLE ONLY public.delivery_emp
    ADD CONSTRAINT delivery_emp_pkey PRIMARY KEY (del_emp_id);


--
-- Name: delivery delivery_pkey; Type: CONSTRAINT; Schema: public; Owner: dianxia
--

ALTER TABLE ONLY public.delivery
    ADD CONSTRAINT delivery_pkey PRIMARY KEY (order_del_id);


--
-- Name: ingredients_list ingredients_list_pkey; Type: CONSTRAINT; Schema: public; Owner: dianxia
--

ALTER TABLE ONLY public.ingredients_list
    ADD CONSTRAINT ingredients_list_pkey PRIMARY KEY (ing_id);


--
-- Name: orders orders_pkey; Type: CONSTRAINT; Schema: public; Owner: dianxia
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (order_id);


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
-- Name: recipe recipe_pkey; Type: CONSTRAINT; Schema: public; Owner: dianxia
--

ALTER TABLE ONLY public.recipe
    ADD CONSTRAINT recipe_pkey PRIMARY KEY (rec_id);


--
-- Name: user user_pkey; Type: CONSTRAINT; Schema: public; Owner: dianxia
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_pkey PRIMARY KEY (user_id);


--
-- Name: delivery address_id; Type: FK CONSTRAINT; Schema: public; Owner: dianxia
--

ALTER TABLE ONLY public.delivery
    ADD CONSTRAINT address_id FOREIGN KEY (order_del_id) REFERENCES public.address(address_id);


--
-- Name: admin ing_id; Type: FK CONSTRAINT; Schema: public; Owner: dianxia
--

ALTER TABLE ONLY public.admin
    ADD CONSTRAINT ing_id FOREIGN KEY (adm_id) REFERENCES public.ingredients_list(ing_id);


--
-- Name: pizzeria_emp ing_id; Type: FK CONSTRAINT; Schema: public; Owner: dianxia
--

ALTER TABLE ONLY public.pizzeria_emp
    ADD CONSTRAINT ing_id FOREIGN KEY (pi_emp_id) REFERENCES public.ingredients_list(ing_id);


--
-- Name: pizzeria_catalog ingredients; Type: FK CONSTRAINT; Schema: public; Owner: dianxia
--

ALTER TABLE ONLY public.pizzeria_catalog
    ADD CONSTRAINT ingredients FOREIGN KEY (product_id) REFERENCES public.ingredients_list(ing_id);


--
-- Name: delivery_emp order_del_id; Type: FK CONSTRAINT; Schema: public; Owner: dianxia
--

ALTER TABLE ONLY public.delivery_emp
    ADD CONSTRAINT order_del_id FOREIGN KEY (order_del_id) REFERENCES public.delivery(order_del_id);


--
-- Name: admin order_id; Type: FK CONSTRAINT; Schema: public; Owner: dianxia
--

ALTER TABLE ONLY public.admin
    ADD CONSTRAINT order_id FOREIGN KEY (adm_id) REFERENCES public.orders(order_id);


--
-- Name: pizzeria_emp order_id; Type: FK CONSTRAINT; Schema: public; Owner: dianxia
--

ALTER TABLE ONLY public.pizzeria_emp
    ADD CONSTRAINT order_id FOREIGN KEY (pi_emp_id) REFERENCES public.orders(order_id);


--
-- Name: delivery order_id; Type: FK CONSTRAINT; Schema: public; Owner: dianxia
--

ALTER TABLE ONLY public.delivery
    ADD CONSTRAINT order_id FOREIGN KEY (order_del_id) REFERENCES public.orders(order_id);


--
-- Name: ingredients_list pizzeria_id; Type: FK CONSTRAINT; Schema: public; Owner: dianxia
--

ALTER TABLE ONLY public.ingredients_list
    ADD CONSTRAINT pizzeria_id FOREIGN KEY (ing_id) REFERENCES public.pizzeria(pizzeria_id);


--
-- Name: orders pizzeria_id; Type: FK CONSTRAINT; Schema: public; Owner: dianxia
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT pizzeria_id FOREIGN KEY (order_id) REFERENCES public.pizzeria(pizzeria_id);


--
-- Name: admin pizzeria_id; Type: FK CONSTRAINT; Schema: public; Owner: dianxia
--

ALTER TABLE ONLY public.admin
    ADD CONSTRAINT pizzeria_id FOREIGN KEY (adm_id) REFERENCES public.pizzeria(pizzeria_id);


--
-- Name: pizzeria_emp pizzeria_id; Type: FK CONSTRAINT; Schema: public; Owner: dianxia
--

ALTER TABLE ONLY public.pizzeria_emp
    ADD CONSTRAINT pizzeria_id FOREIGN KEY (pi_emp_id) REFERENCES public.pizzeria(pizzeria_id);


--
-- Name: recipe pizzeria_id; Type: FK CONSTRAINT; Schema: public; Owner: dianxia
--

ALTER TABLE ONLY public.recipe
    ADD CONSTRAINT pizzeria_id FOREIGN KEY (rec_id) REFERENCES public.pizzeria(pizzeria_id);


--
-- Name: orders product_id; Type: FK CONSTRAINT; Schema: public; Owner: dianxia
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT product_id FOREIGN KEY (order_id) REFERENCES public.pizzeria_catalog(product_id);


--
-- Name: address user_id; Type: FK CONSTRAINT; Schema: public; Owner: dianxia
--

ALTER TABLE ONLY public.address
    ADD CONSTRAINT user_id FOREIGN KEY (address_id) REFERENCES public."user"(user_id);


--
-- Name: orders user_id; Type: FK CONSTRAINT; Schema: public; Owner: dianxia
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT user_id FOREIGN KEY (order_id) REFERENCES public."user"(user_id);


--
-- PostgreSQL database dump complete
--

