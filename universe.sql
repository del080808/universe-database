--
-- PostgreSQL database dump
--

-- Dumped from database version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)
-- Dumped by pg_dump version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)

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
    has_tail boolean NOT NULL,
    galaxy_id integer
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
    age_in_millions_of_years integer,
    has_life boolean NOT NULL
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
-- Name: galaxy_types; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy_types (
    galaxy_type_id integer NOT NULL,
    name character varying(255) NOT NULL,
    description text
);


ALTER TABLE public.galaxy_types OWNER TO freecodecamp;

--
-- Name: galaxy_types_galaxy_type_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_types_galaxy_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_types_galaxy_type_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_types_galaxy_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_types_galaxy_type_id_seq OWNED BY public.galaxy_types.galaxy_type_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(255) NOT NULL,
    planet_id integer NOT NULL,
    has_ice boolean NOT NULL,
    has_atmosphere boolean NOT NULL,
    moon_size integer
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
    star_id integer NOT NULL,
    has_life boolean NOT NULL,
    planet_types text,
    distance_from_sun numeric
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
    galaxy_id integer NOT NULL,
    distance_from_earth numeric,
    is_spherical boolean NOT NULL,
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
-- Name: galaxy_types galaxy_type_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_types ALTER COLUMN galaxy_type_id SET DEFAULT nextval('public.galaxy_types_galaxy_type_id_seq'::regclass);


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

INSERT INTO public.comet (comet_id, name, has_tail, galaxy_id) VALUES (1, 'Halley', true, 1);
INSERT INTO public.comet (comet_id, name, has_tail, galaxy_id) VALUES (2, 'Encke', true, 1);
INSERT INTO public.comet (comet_id, name, has_tail, galaxy_id) VALUES (3, 'Swift-Tuttle', true, 2);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy (galaxy_id, name, description, age_in_millions_of_years, has_life) VALUES (1, 'Milky Way', 'Our galaxy', 13000, true);
INSERT INTO public.galaxy (galaxy_id, name, description, age_in_millions_of_years, has_life) VALUES (2, 'Andromeda', 'A neighboring galaxy', 10000, false);
INSERT INTO public.galaxy (galaxy_id, name, description, age_in_millions_of_years, has_life) VALUES (3, 'Sombrero', 'A distant galaxy', 8000, false);
INSERT INTO public.galaxy (galaxy_id, name, description, age_in_millions_of_years, has_life) VALUES (4, 'Whirlpool', 'A beautiful galaxy', 12000, true);
INSERT INTO public.galaxy (galaxy_id, name, description, age_in_millions_of_years, has_life) VALUES (5, 'Messier 87', 'A massive galaxy', 14000, true);
INSERT INTO public.galaxy (galaxy_id, name, description, age_in_millions_of_years, has_life) VALUES (8, 'NGC 224', 'A large galaxy in the Andromeda constellation', 15000, false);


--
-- Data for Name: galaxy_types; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy_types (galaxy_type_id, name, description) VALUES (1, 'Spiral', 'Galaxy with spiral arms');
INSERT INTO public.galaxy_types (galaxy_type_id, name, description) VALUES (2, 'Elliptical', 'Oval-shaped galaxy');
INSERT INTO public.galaxy_types (galaxy_type_id, name, description) VALUES (3, 'Irregular', 'Galaxy with no regular shape');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon (moon_id, name, planet_id, has_ice, has_atmosphere, moon_size) VALUES (1, 'Luna', 1, false, true, NULL);
INSERT INTO public.moon (moon_id, name, planet_id, has_ice, has_atmosphere, moon_size) VALUES (2, 'Phobos', 2, false, false, NULL);
INSERT INTO public.moon (moon_id, name, planet_id, has_ice, has_atmosphere, moon_size) VALUES (3, 'Deimos', 2, false, false, NULL);
INSERT INTO public.moon (moon_id, name, planet_id, has_ice, has_atmosphere, moon_size) VALUES (4, 'Io', 3, true, true, NULL);
INSERT INTO public.moon (moon_id, name, planet_id, has_ice, has_atmosphere, moon_size) VALUES (5, 'Europa', 3, true, true, NULL);
INSERT INTO public.moon (moon_id, name, planet_id, has_ice, has_atmosphere, moon_size) VALUES (6, 'Ganymede', 3, true, true, NULL);
INSERT INTO public.moon (moon_id, name, planet_id, has_ice, has_atmosphere, moon_size) VALUES (7, 'Titan', 4, true, true, NULL);
INSERT INTO public.moon (moon_id, name, planet_id, has_ice, has_atmosphere, moon_size) VALUES (8, 'Enceladus', 5, true, true, NULL);
INSERT INTO public.moon (moon_id, name, planet_id, has_ice, has_atmosphere, moon_size) VALUES (9, 'Triton', 6, true, true, NULL);
INSERT INTO public.moon (moon_id, name, planet_id, has_ice, has_atmosphere, moon_size) VALUES (10, 'Charon', 7, false, false, NULL);
INSERT INTO public.moon (moon_id, name, planet_id, has_ice, has_atmosphere, moon_size) VALUES (11, 'Oberon', 8, false, true, NULL);
INSERT INTO public.moon (moon_id, name, planet_id, has_ice, has_atmosphere, moon_size) VALUES (12, 'Miranda', 8, false, true, NULL);
INSERT INTO public.moon (moon_id, name, planet_id, has_ice, has_atmosphere, moon_size) VALUES (13, 'Ariel', 8, false, true, NULL);
INSERT INTO public.moon (moon_id, name, planet_id, has_ice, has_atmosphere, moon_size) VALUES (14, 'Rhea', 9, true, true, NULL);
INSERT INTO public.moon (moon_id, name, planet_id, has_ice, has_atmosphere, moon_size) VALUES (15, 'Mimas', 9, true, false, NULL);
INSERT INTO public.moon (moon_id, name, planet_id, has_ice, has_atmosphere, moon_size) VALUES (16, 'Tethys', 9, false, true, NULL);
INSERT INTO public.moon (moon_id, name, planet_id, has_ice, has_atmosphere, moon_size) VALUES (17, 'Iapetus', 9, false, false, NULL);
INSERT INTO public.moon (moon_id, name, planet_id, has_ice, has_atmosphere, moon_size) VALUES (18, 'Hyperion', 9, true, false, NULL);
INSERT INTO public.moon (moon_id, name, planet_id, has_ice, has_atmosphere, moon_size) VALUES (19, 'Phoebe', 9, false, true, NULL);
INSERT INTO public.moon (moon_id, name, planet_id, has_ice, has_atmosphere, moon_size) VALUES (20, 'Atlas', 9, true, true, NULL);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet (planet_id, name, star_id, has_life, planet_types, distance_from_sun) VALUES (1, 'Earth', 1, true, 'Terrestrial', 1);
INSERT INTO public.planet (planet_id, name, star_id, has_life, planet_types, distance_from_sun) VALUES (2, 'Mars', 1, false, 'Terrestrial', 1.5);
INSERT INTO public.planet (planet_id, name, star_id, has_life, planet_types, distance_from_sun) VALUES (3, 'Venus', 1, false, 'Terrestrial', 0.72);
INSERT INTO public.planet (planet_id, name, star_id, has_life, planet_types, distance_from_sun) VALUES (4, 'Jupiter', 1, false, 'Gas Giant', 5.2);
INSERT INTO public.planet (planet_id, name, star_id, has_life, planet_types, distance_from_sun) VALUES (5, 'Saturn', 1, false, 'Gas Giant', 9.5);
INSERT INTO public.planet (planet_id, name, star_id, has_life, planet_types, distance_from_sun) VALUES (6, 'Neptune', 1, false, 'Ice Giant', 30);
INSERT INTO public.planet (planet_id, name, star_id, has_life, planet_types, distance_from_sun) VALUES (7, 'Mercury', 1, false, 'Terrestrial', 0.39);
INSERT INTO public.planet (planet_id, name, star_id, has_life, planet_types, distance_from_sun) VALUES (8, 'Uranus', 1, false, 'Ice Giant', 19.2);
INSERT INTO public.planet (planet_id, name, star_id, has_life, planet_types, distance_from_sun) VALUES (9, 'Pluto', 1, false, 'Dwarf Planet', 39.5);
INSERT INTO public.planet (planet_id, name, star_id, has_life, planet_types, distance_from_sun) VALUES (10, 'Titan', 2, false, 'Moon', 4.4);
INSERT INTO public.planet (planet_id, name, star_id, has_life, planet_types, distance_from_sun) VALUES (11, 'Europa', 2, false, 'Moon', 5.2);
INSERT INTO public.planet (planet_id, name, star_id, has_life, planet_types, distance_from_sun) VALUES (12, 'Callisto', 2, false, 'Moon', 5.9);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star (star_id, name, galaxy_id, distance_from_earth, is_spherical, temperature) VALUES (1, 'Sun', 1, 0, true, NULL);
INSERT INTO public.star (star_id, name, galaxy_id, distance_from_earth, is_spherical, temperature) VALUES (2, 'Alpha Centauri', 2, 4.37, true, NULL);
INSERT INTO public.star (star_id, name, galaxy_id, distance_from_earth, is_spherical, temperature) VALUES (3, 'Sirius', 1, 8.6, true, NULL);
INSERT INTO public.star (star_id, name, galaxy_id, distance_from_earth, is_spherical, temperature) VALUES (4, 'Betelgeuse', 3, 642, true, NULL);
INSERT INTO public.star (star_id, name, galaxy_id, distance_from_earth, is_spherical, temperature) VALUES (5, 'Polaris', 4, 433, true, NULL);
INSERT INTO public.star (star_id, name, galaxy_id, distance_from_earth, is_spherical, temperature) VALUES (6, 'Antares', 2, 323, true, NULL);


--
-- Name: comet_comet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.comet_comet_id_seq', 3, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 8, true);


--
-- Name: galaxy_types_galaxy_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_types_galaxy_type_id_seq', 3, true);


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
-- Name: galaxy_types galaxy_types_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_types
    ADD CONSTRAINT galaxy_types_name_key UNIQUE (name);


--
-- Name: galaxy_types galaxy_types_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_types
    ADD CONSTRAINT galaxy_types_pkey PRIMARY KEY (galaxy_type_id);


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
-- Name: comet comet_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT comet_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


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

