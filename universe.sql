--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(15) NOT NULL,
    has_life boolean,
    description text,
    age_in_million_years numeric,
    distance_from_earth_km integer,
    type text
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: junction; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.junction (
    junction_id integer NOT NULL,
    name character varying(20) NOT NULL,
    relationship character varying(20) NOT NULL
);


ALTER TABLE public.junction OWNER TO freecodecamp;

--
-- Name: junction_junction_idd_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.junction_junction_idd_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.junction_junction_idd_seq OWNER TO freecodecamp;

--
-- Name: junction_junction_idd_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.junction_junction_idd_seq OWNED BY public.junction.junction_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(15) NOT NULL,
    has_life boolean,
    description text,
    planet_id integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(15) NOT NULL,
    has_life boolean,
    description text,
    diameter_in_km integer,
    orbit_in_earthdays integer,
    star_id integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(15) NOT NULL,
    has_life boolean,
    description text,
    rotation_per_sec numeric,
    distance_from_earth integer,
    type text,
    galaxy_id integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: junction junction_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.junction ALTER COLUMN junction_id SET DEFAULT nextval('public.junction_junction_idd_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Andromeda', false, 'A barred-spiralled galaxy that is the closest major galaxy to the MILKY WAY', 2.5, 1000000, 'AA');
INSERT INTO public.galaxy VALUES (2, 'Antennae', false, 'These are a pair of interacting galaxies in the constellation Corvus', 45, 2000000, 'AB');
INSERT INTO public.galaxy VALUES (3, 'Butterfly', false, 'Set of unbarred spiral galaxies in the constellation virgo', 60, 3000000, 'BA');
INSERT INTO public.galaxy VALUES (4, 'Cigar', false, 'Starburst galaxy in the constellation Ursa Major', 12, 4000000, 'BB');
INSERT INTO public.galaxy VALUES (5, 'Comet', false, 'A spiral galaxy located in the galaxy cluster Abell 2667', 3200, 5000000, 'CA');
INSERT INTO public.galaxy VALUES (6, 'Fireworks', false, 'Intermedite spiral galaxy with a small bright nuclues', 25.2, 6000000, 'CC');


--
-- Data for Name: junction; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.junction VALUES (1, 'first_rel', 'A first test');
INSERT INTO public.junction VALUES (3, 'third_rel', 'A third test');
INSERT INTO public.junction VALUES (2, 'second_rel', 'A second test');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Phobos', false, 'Largest natural satellite in mars', 4);
INSERT INTO public.moon VALUES (2, 'Deimos', false, 'The smaller of the natural satellite of mars', 4);
INSERT INTO public.moon VALUES (3, 'Europa', false, 'Smallest of the galiean moons orbiting jupiter', 5);
INSERT INTO public.moon VALUES (4, 'Ganymede', false, 'The largest satelitte in the solar system', 5);
INSERT INTO public.moon VALUES (5, 'Tiatan', false, 'This is the largest moon on saturn', 6);
INSERT INTO public.moon VALUES (6, 'Atlas', false, 'Inner moon of staurn discovered in 1980', 6);
INSERT INTO public.moon VALUES (7, 'Tarvos', false, 'A prograde irregular satellite of saturn', 6);
INSERT INTO public.moon VALUES (8, 'Methone', false, 'A small egg-shaped moon of saturn', 6);
INSERT INTO public.moon VALUES (9, 'Anthe', false, 'A very small satellite of saturn', 6);
INSERT INTO public.moon VALUES (10, 'Gerd', false, 'A natural satellite of saturn', 6);
INSERT INTO public.moon VALUES (11, 'Geirrod', false, 'A natural satellite of saturn', 6);
INSERT INTO public.moon VALUES (12, 'Ariel', false, 'Fourth largest moon in uranius', 7);
INSERT INTO public.moon VALUES (13, 'Umbriel', false, 'A moon of uranius', 7);
INSERT INTO public.moon VALUES (14, 'Titania', false, 'Largest moon of uranus', 7);
INSERT INTO public.moon VALUES (15, 'Oberon', false, 'Outermost major moon of uranus', 7);
INSERT INTO public.moon VALUES (16, 'Miranda', false, 'Smallest of Uranus satellite', 7);
INSERT INTO public.moon VALUES (17, 'Cordelia', false, 'Innermost known moon of uranus', 7);
INSERT INTO public.moon VALUES (18, 'Ophelia', false, 'A moon of uranus', 7);
INSERT INTO public.moon VALUES (19, 'Bianca', false, 'A moon of uranus', 7);
INSERT INTO public.moon VALUES (20, 'Cressida', false, 'A moon of uranus', 7);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mecury', false, 'Named for the messenger of the Roman gods', 4878, 88, 5);
INSERT INTO public.planet VALUES (2, 'Venus', false, 'Hottest planet in the solar system', 12104, 225, 1);
INSERT INTO public.planet VALUES (3, 'Earth', true, 'A water world with two-third covered by water', 12760, 365, 2);
INSERT INTO public.planet VALUES (4, 'Mars', false, 'Named for the Roman god of war', 6787, 687, 2);
INSERT INTO public.planet VALUES (5, 'Jupiter', false, 'Largest planet in the solar system', 139822, 4330, 4);
INSERT INTO public.planet VALUES (6, 'Saturn', false, 'Named after the Roman god of agriculture', 120500, 1, 3);
INSERT INTO public.planet VALUES (7, 'UraUranus', false, 'Heaven in ancient myth', 51120, 30660, 6);
INSERT INTO public.planet VALUES (8, 'Neptune', false, '17 times size of earth and has rocky core', 549530, 60225, 6);
INSERT INTO public.planet VALUES (9, 'Pluto', false, 'Named for the Roman God of underworld', 2301, 90520, 6);
INSERT INTO public.planet VALUES (10, 'Ikoyi', true, 'Destroyed planet', 25500, 55, 4);
INSERT INTO public.planet VALUES (11, 'Igbomina', true, 'It has become irrelevant', 200, 20, 2);
INSERT INTO public.planet VALUES (12, 'Kyrenia', true, 'It has good habours', 150, 259, 1);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Altair', false, 'The brightest star in the northern constellation', 200, 1000000, 'AA', 1);
INSERT INTO public.star VALUES (4, 'Sirius', false, 'A binary star in the constellation Canis Major', 25, 4000000, 'BB', 1);
INSERT INTO public.star VALUES (3, 'Acturus', false, 'Brightest star in the northern constellation Bootes', 36, 3000000, 'BA', 3);
INSERT INTO public.star VALUES (2, 'Capella', false, 'Sixth brightest star in the night sky', 104, 2000000, 'AB', 3);
INSERT INTO public.star VALUES (6, 'Achernar', false, 'Brightest star in the constellation Eridanus', 250, 6000000, 'CC', 5);
INSERT INTO public.star VALUES (5, 'Delta Cephei', false, 'Prototype star of the class of Cepheid Variables', 50, 5000000, 'CA', 6);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: junction_junction_idd_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.junction_junction_idd_seq', 3, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: junction junction_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.junction
    ADD CONSTRAINT junction_name_key UNIQUE (name);


--
-- Name: junction junction_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.junction
    ADD CONSTRAINT junction_pkey PRIMARY KEY (junction_id);


--
-- Name: moon moon_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: galaxy unique_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT unique_name UNIQUE (name);


--
-- Name: star galaxy_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT galaxy_id FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet star_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT star_id FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- PostgreSQL database dump complete
--

