--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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
-- Name: comet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.comet (
    comet_id integer NOT NULL,
    name character varying(255) NOT NULL,
    tail_length numeric(10,2),
    orbital_period integer,
    star_id integer,
    is_active boolean,
    has_passed_near_earth boolean,
    description text,
    discovery_year integer
);


ALTER TABLE public.comet OWNER TO freecodecamp;

--
-- Name: comet_comet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.comet_comet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.comet_comet_id_seq OWNER TO freecodecamp;

--
-- Name: comet_comet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.comet_comet_id_seq OWNED BY public.comet.comet_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(255) NOT NULL,
    description text,
    number_of_stars integer,
    has_supermassive_black_hole boolean,
    is_barred boolean
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
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(255) NOT NULL,
    description text,
    diameter numeric(10,2),
    planet_id integer,
    has_water_ice boolean,
    is_geologically_active boolean,
    orbit_duration integer
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
    name character varying(255) NOT NULL,
    description text,
    orbital_period numeric(10,2),
    star_id integer,
    has_life boolean,
    is_terrestrial boolean
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
    name character varying(255) NOT NULL,
    description text,
    luminosity numeric(10,2),
    galaxy_id integer,
    is_binary_system boolean,
    is_variable_star boolean,
    temperature integer
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
-- Name: comet comet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet ALTER COLUMN comet_id SET DEFAULT nextval('public.comet_comet_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


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
-- Data for Name: comet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.comet VALUES (1, 'Halley', 24.20, 76, 1, true, true, 'Famous periodic comet', 1986);
INSERT INTO public.comet VALUES (2, 'Hale-Bopp', 80.00, 2533, 1, false, false, 'Great comet of 1997', 1997);
INSERT INTO public.comet VALUES (3, 'Swift-Tuttle', 26.00, 133, 1, true, true, 'Largest known comet', 1992);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Andromeda', 'Neighboring galaxy', 100000000, true, false);
INSERT INTO public.galaxy VALUES (2, 'Milky Way', 'Our home galaxy', 100000000, true, true);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'Spiral galaxy', 40000000, false, false);
INSERT INTO public.galaxy VALUES (4, 'Whirlpool', 'Interacting galaxy', 16000000, true, false);
INSERT INTO public.galaxy VALUES (5, 'Sombrero', 'Unusual galaxy with halo', 8000000, true, true);
INSERT INTO public.galaxy VALUES (6, 'Messier 82', 'Starburst galaxy', 3000000, true, false);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 'Earth natural satellite', 3474.80, 1, true, false, 27);
INSERT INTO public.moon VALUES (2, 'Phobos', 'One of Mars moons', 22.40, 2, false, false, 7);
INSERT INTO public.moon VALUES (3, 'Deimos', 'One of Mars moons', 12.40, 2, false, false, 0);
INSERT INTO public.moon VALUES (4, 'Europa', 'One of Jupiter moons', 3121.60, 4, true, true, 0);
INSERT INTO public.moon VALUES (5, 'Ganymede', 'Largest moon in the solar system', 5268.20, 4, true, true, 0);
INSERT INTO public.moon VALUES (6, 'Callisto', 'One of Jupiter moons', 4820.60, 4, true, false, 0);
INSERT INTO public.moon VALUES (7, 'Io', 'Volcanically active moon', 3642.60, 4, false, true, 0);
INSERT INTO public.moon VALUES (8, 'Titan', 'Largest moon of Saturn', 5150.80, 5, true, true, 0);
INSERT INTO public.moon VALUES (9, 'Enceladus', 'Saturn icy moon', 504.20, 5, true, true, 0);
INSERT INTO public.moon VALUES (10, 'Mimas', 'Known for large crater', 396.40, 5, false, false, 0);
INSERT INTO public.moon VALUES (11, 'Triton', 'Largest moon of Neptune', 2706.80, 8, true, true, 0);
INSERT INTO public.moon VALUES (12, 'Charon', 'Largest moon of Pluto', 1212.00, 9, false, false, 0);
INSERT INTO public.moon VALUES (13, 'Oberon', 'One of Uranus moons', 1523.40, 7, false, false, 0);
INSERT INTO public.moon VALUES (14, 'Rhea', 'One of Saturn moons', 1527.60, 5, true, false, 0);
INSERT INTO public.moon VALUES (15, 'Hyperion', 'Moon of Saturn', 270.00, 5, true, false, 0);
INSERT INTO public.moon VALUES (16, 'Miranda', 'One of Uranus moons', 471.60, 7, true, true, 0);
INSERT INTO public.moon VALUES (17, 'Umbriel', 'Dark moon of Uranus', 1169.40, 7, false, false, 0);
INSERT INTO public.moon VALUES (18, 'Ariel', 'Uranian moon', 1158.80, 7, true, true, 0);
INSERT INTO public.moon VALUES (19, 'Galatea', 'One of Neptune moons', 176.20, 8, true, false, 0);
INSERT INTO public.moon VALUES (20, 'Despina', 'Moon of Neptune', 148.00, 8, false, false, 0);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 'Our home planet', 365.25, 1, true, true);
INSERT INTO public.planet VALUES (2, 'Mars', 'The Red Planet', 687.00, 1, false, true);
INSERT INTO public.planet VALUES (3, 'Venus', 'Earths twin', 224.70, 1, false, true);
INSERT INTO public.planet VALUES (4, 'Jupiter', 'The Gas Giant', 4332.59, 1, false, false);
INSERT INTO public.planet VALUES (5, 'Saturn', 'Known for its rings', 10759.22, 1, false, false);
INSERT INTO public.planet VALUES (6, 'Mercury', 'Closest to the Sun', 88.00, 1, false, true);
INSERT INTO public.planet VALUES (7, 'Uranus', 'An ice giant', 30688.50, 1, false, false);
INSERT INTO public.planet VALUES (8, 'Neptune', 'Furthest planet', 60182.00, 1, false, false);
INSERT INTO public.planet VALUES (9, 'Alpha Centauri Bb', 'Exoplanet', 3.24, 2, false, true);
INSERT INTO public.planet VALUES (10, 'Proxima Centauri b', 'Potentially habitable exoplanet', 11.20, 6, false, true);
INSERT INTO public.planet VALUES (11, 'Betelgeuse b', 'Hypothetical planet', 365.00, 3, false, false);
INSERT INTO public.planet VALUES (12, 'Vega IX', 'Imaginary planet', 250.00, 5, false, false);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 'Our star', 1.00, 2, false, false, 5778);
INSERT INTO public.star VALUES (2, 'Alpha Centauri', 'Closest star system', 1.52, 2, true, false, 0);
INSERT INTO public.star VALUES (3, 'Betelgeuse', 'Red supergiant', 120000.00, 3, false, true, 2600);
INSERT INTO public.star VALUES (4, 'Sirius', 'Brightest star in the night sky', 25.40, 2, true, true, 9900);
INSERT INTO public.star VALUES (5, 'Vega', 'Part of the Summer Triangle', 40.12, 2, false, true, 0);
INSERT INTO public.star VALUES (6, 'Proxima Centauri', 'Closest star to the Sun', 0.00, 2, false, true, 0);


--
-- Name: comet_comet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.comet_comet_id_seq', 3, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


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
-- Name: comet comet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT comet_name_key UNIQUE (name);


--
-- Name: comet comet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT comet_pkey PRIMARY KEY (comet_id);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: comet comet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT comet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

