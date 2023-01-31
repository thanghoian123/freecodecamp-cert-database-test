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

DROP DATABASE worldcup;
--
-- Name: worldcup; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE worldcup WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE worldcup OWNER TO freecodecamp;

\connect worldcup

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
-- Name: games; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.games (
    game_id integer NOT NULL,
    winner_goals integer NOT NULL,
    opponent_goals integer NOT NULL,
    round character varying(50) NOT NULL,
    year integer NOT NULL,
    winner_id integer NOT NULL,
    opponent_id integer NOT NULL
);


ALTER TABLE public.games OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.games_game_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.games_game_id_seq OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.games_game_id_seq OWNED BY public.games.game_id;


--
-- Name: teams; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.teams (
    team_id integer NOT NULL,
    name character varying(50) NOT NULL
);


ALTER TABLE public.teams OWNER TO freecodecamp;

--
-- Name: teams_team_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.teams_team_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.teams_team_id_seq OWNER TO freecodecamp;

--
-- Name: teams_team_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.teams_team_id_seq OWNED BY public.teams.team_id;


--
-- Name: games game_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games ALTER COLUMN game_id SET DEFAULT nextval('public.games_game_id_seq'::regclass);


--
-- Name: teams team_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.teams ALTER COLUMN team_id SET DEFAULT nextval('public.teams_team_id_seq'::regclass);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.games VALUES (1, 4, 2, 'Final', 2018, 313, 312);
INSERT INTO public.games VALUES (2, 2, 0, 'Third Place', 2018, 315, 314);
INSERT INTO public.games VALUES (3, 2, 1, 'Semi-Final', 2018, 312, 314);
INSERT INTO public.games VALUES (4, 1, 0, 'Semi-Final', 2018, 313, 315);
INSERT INTO public.games VALUES (5, 3, 2, 'Quarter-Final', 2018, 312, 316);
INSERT INTO public.games VALUES (6, 2, 0, 'Quarter-Final', 2018, 314, 317);
INSERT INTO public.games VALUES (7, 2, 1, 'Quarter-Final', 2018, 315, 318);
INSERT INTO public.games VALUES (8, 2, 0, 'Quarter-Final', 2018, 313, 319);
INSERT INTO public.games VALUES (9, 2, 1, 'Eighth-Final', 2018, 314, 320);
INSERT INTO public.games VALUES (10, 1, 0, 'Eighth-Final', 2018, 317, 321);
INSERT INTO public.games VALUES (11, 3, 2, 'Eighth-Final', 2018, 315, 322);
INSERT INTO public.games VALUES (12, 2, 0, 'Eighth-Final', 2018, 318, 323);
INSERT INTO public.games VALUES (13, 2, 1, 'Eighth-Final', 2018, 312, 324);
INSERT INTO public.games VALUES (14, 2, 1, 'Eighth-Final', 2018, 316, 325);
INSERT INTO public.games VALUES (15, 2, 1, 'Eighth-Final', 2018, 319, 326);
INSERT INTO public.games VALUES (16, 4, 3, 'Eighth-Final', 2018, 313, 327);
INSERT INTO public.games VALUES (17, 1, 0, 'Final', 2014, 328, 327);
INSERT INTO public.games VALUES (18, 3, 0, 'Third Place', 2014, 329, 318);
INSERT INTO public.games VALUES (19, 1, 0, 'Semi-Final', 2014, 327, 329);
INSERT INTO public.games VALUES (20, 7, 1, 'Semi-Final', 2014, 328, 318);
INSERT INTO public.games VALUES (21, 1, 0, 'Quarter-Final', 2014, 329, 330);
INSERT INTO public.games VALUES (22, 1, 0, 'Quarter-Final', 2014, 327, 315);
INSERT INTO public.games VALUES (23, 2, 1, 'Quarter-Final', 2014, 318, 320);
INSERT INTO public.games VALUES (24, 1, 0, 'Quarter-Final', 2014, 328, 313);
INSERT INTO public.games VALUES (25, 2, 1, 'Eighth-Final', 2014, 318, 331);
INSERT INTO public.games VALUES (26, 2, 0, 'Eighth-Final', 2014, 320, 319);
INSERT INTO public.games VALUES (27, 2, 0, 'Eighth-Final', 2014, 313, 332);
INSERT INTO public.games VALUES (28, 2, 1, 'Eighth-Final', 2014, 328, 333);
INSERT INTO public.games VALUES (29, 2, 1, 'Eighth-Final', 2014, 329, 323);
INSERT INTO public.games VALUES (30, 2, 1, 'Eighth-Final', 2014, 330, 334);
INSERT INTO public.games VALUES (31, 1, 0, 'Eighth-Final', 2014, 327, 321);
INSERT INTO public.games VALUES (32, 2, 1, 'Eighth-Final', 2014, 315, 335);


--
-- Data for Name: teams; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.teams VALUES (312, 'Croatia');
INSERT INTO public.teams VALUES (313, 'France');
INSERT INTO public.teams VALUES (314, 'England');
INSERT INTO public.teams VALUES (315, 'Belgium');
INSERT INTO public.teams VALUES (316, 'Russia');
INSERT INTO public.teams VALUES (317, 'Sweden');
INSERT INTO public.teams VALUES (318, 'Brazil');
INSERT INTO public.teams VALUES (319, 'Uruguay');
INSERT INTO public.teams VALUES (320, 'Colombia');
INSERT INTO public.teams VALUES (321, 'Switzerland');
INSERT INTO public.teams VALUES (322, 'Japan');
INSERT INTO public.teams VALUES (323, 'Mexico');
INSERT INTO public.teams VALUES (324, 'Denmark');
INSERT INTO public.teams VALUES (325, 'Spain');
INSERT INTO public.teams VALUES (326, 'Portugal');
INSERT INTO public.teams VALUES (327, 'Argentina');
INSERT INTO public.teams VALUES (328, 'Germany');
INSERT INTO public.teams VALUES (329, 'Netherlands');
INSERT INTO public.teams VALUES (330, 'Costa Rica');
INSERT INTO public.teams VALUES (331, 'Chile');
INSERT INTO public.teams VALUES (332, 'Nigeria');
INSERT INTO public.teams VALUES (333, 'Algeria');
INSERT INTO public.teams VALUES (334, 'Greece');
INSERT INTO public.teams VALUES (335, 'United States');


--
-- Name: games_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_game_id_seq', 32, true);


--
-- Name: teams_team_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.teams_team_id_seq', 335, true);


--
-- Name: games games_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_pkey PRIMARY KEY (game_id);


--
-- Name: teams teams_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.teams
    ADD CONSTRAINT teams_name_key UNIQUE (name);


--
-- Name: teams teams_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.teams
    ADD CONSTRAINT teams_pkey PRIMARY KEY (team_id);


--
-- Name: games fk_team_opponent; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT fk_team_opponent FOREIGN KEY (opponent_id) REFERENCES public.teams(team_id);


--
-- Name: games fk_team_win; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT fk_team_win FOREIGN KEY (winner_id) REFERENCES public.teams(team_id);


--
-- PostgreSQL database dump complete
--

