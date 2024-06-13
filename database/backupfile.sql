--
-- PostgreSQL database dump
--

-- Dumped from database version 16.2
-- Dumped by pg_dump version 16.1

SET statement_timeout = 0;

SET lock_timeout = 0;

SET idle_in_transaction_session_timeout = 0;

SET client_encoding = 'UTF8';

SET standard_conforming_strings = on;

SELECT pg_catalog.set_config ('search_path', '', false);

SET check_function_bodies = false;

SET xmloption = content;

SET client_min_messages = warning;

SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: casts; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.casts (
    id_cast integer NOT NULL,
    "character" character varying,
    name character varying,
    gender integer
);

ALTER TABLE public.casts OWNER TO postgres;

--
-- Name: casts_id_cast_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.casts_id_cast_seq AS integer START
WITH
    1 INCREMENT BY 1 NO MINVALUE NO MAXVALUE CACHE 1;

ALTER SEQUENCE public.casts_id_cast_seq OWNER TO postgres;

--
-- Name: casts_id_cast_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.casts_id_cast_seq OWNED BY public.casts.id_cast;

--
-- Name: cinema; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cinema (
    cinema_id integer NOT NULL,
    name character varying
);

ALTER TABLE public.cinema OWNER TO postgres;

--
-- Name: cinema_cinema_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.cinema_cinema_id_seq AS integer START
WITH
    1 INCREMENT BY 1 NO MINVALUE NO MAXVALUE CACHE 1;

ALTER SEQUENCE public.cinema_cinema_id_seq OWNER TO postgres;

--
-- Name: cinema_cinema_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.cinema_cinema_id_seq OWNED BY public.cinema.cinema_id;

--
-- Name: crew; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.crew (
    id_crew integer NOT NULL,
    gender character varying,
    role character varying
);

ALTER TABLE public.crew OWNER TO postgres;

--
-- Name: crew_id_crew_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.crew_id_crew_seq AS integer START
WITH
    1 INCREMENT BY 1 NO MINVALUE NO MAXVALUE CACHE 1;

ALTER SEQUENCE public.crew_id_crew_seq OWNER TO postgres;

--
-- Name: crew_id_crew_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.crew_id_crew_seq OWNED BY public.crew.id_crew;

--
-- Name: gerne; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.gerne (
    id_gerne integer NOT NULL,
    name character varying
);

ALTER TABLE public.gerne OWNER TO postgres;

--
-- Name: gerne_id_gerne_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.gerne_id_gerne_seq AS integer START
WITH
    1 INCREMENT BY 1 NO MINVALUE NO MAXVALUE CACHE 1;

ALTER SEQUENCE public.gerne_id_gerne_seq OWNER TO postgres;

--
-- Name: gerne_id_gerne_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.gerne_id_gerne_seq OWNED BY public.gerne.id_gerne;

--
-- Name: movie; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.movie (
    movie_id integer NOT NULL,
    title character varying,
    overview text,
    original_language character varying,
    ageres integer,
    release_date date,
    status character varying,
    tagline text,
    length integer,
    url text
);

ALTER TABLE public.movie OWNER TO postgres;

--
-- Name: movie_join_cast; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.movie_join_cast (
    movie_id integer,
    id_cast integer
);

ALTER TABLE public.movie_join_cast OWNER TO postgres;

--
-- Name: movie_join_crew; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.movie_join_crew (
    movie_id integer,
    id_crew integer
);

ALTER TABLE public.movie_join_crew OWNER TO postgres;

--
-- Name: movie_join_gerne; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.movie_join_gerne (
    movie_id integer,
    id_gerne integer
);

ALTER TABLE public.movie_join_gerne OWNER TO postgres;

--
-- Name: movie_movie_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.movie_movie_id_seq AS integer START
WITH
    1 INCREMENT BY 1 NO MINVALUE NO MAXVALUE CACHE 1;

ALTER SEQUENCE public.movie_movie_id_seq OWNER TO postgres;

--
-- Name: movie_movie_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.movie_movie_id_seq OWNED BY public.movie.movie_id;

--
-- Name: room; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.room (
    room_id integer NOT NULL,
    cinema_id integer,
    type character varying
);

ALTER TABLE public.room OWNER TO postgres;

--
-- Name: room_room_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.room_room_id_seq AS integer START
WITH
    1 INCREMENT BY 1 NO MINVALUE NO MAXVALUE CACHE 1;

ALTER SEQUENCE public.room_room_id_seq OWNER TO postgres;

--
-- Name: room_room_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.room_room_id_seq OWNED BY public.room.room_id;

--
-- Name: schedule; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.schedule (
    schedule_id integer NOT NULL,
    schedule_movie_date date,
    schedule_movie_start time without time zone,
    movie_id integer
);

ALTER TABLE public.schedule OWNER TO postgres;

--
-- Name: schedule_schedule_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.schedule_schedule_id_seq AS integer START
WITH
    1 INCREMENT BY 1 NO MINVALUE NO MAXVALUE CACHE 1;

ALTER SEQUENCE public.schedule_schedule_id_seq OWNER TO postgres;

--
-- Name: schedule_schedule_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.schedule_schedule_id_seq OWNED BY public.schedule.schedule_id;

--
-- Name: seat; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.seat (
    seat_id integer NOT NULL,
    room_id integer
);

ALTER TABLE public.seat OWNER TO postgres;

--
-- Name: seat_seat_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.seat_seat_id_seq AS integer START
WITH
    1 INCREMENT BY 1 NO MINVALUE NO MAXVALUE CACHE 1;

ALTER SEQUENCE public.seat_seat_id_seq OWNER TO postgres;

--
-- Name: seat_seat_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.seat_seat_id_seq OWNED BY public.seat.seat_id;

--
-- Name: seatschedule; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.seatschedule (
    seat_id integer,
    schedule_id integer,
    status character varying,
    price integer
);

ALTER TABLE public.seatschedule OWNER TO postgres;

--
-- Name: ticket; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ticket (
    id integer NOT NULL,
    user_id integer,
    movie_id integer,
    cinema_id integer,
    schedule_id integer,
    seat_id integer
);

ALTER TABLE public.ticket OWNER TO postgres;

--
-- Name: ticket_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.ticket_id_seq AS integer START
WITH
    1 INCREMENT BY 1 NO MINVALUE NO MAXVALUE CACHE 1;

ALTER SEQUENCE public.ticket_id_seq OWNER TO postgres;

--
-- Name: ticket_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.ticket_id_seq OWNED BY public.ticket.id;

--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    username character varying,
    email character varying,
    birth_date date,
    password character varying,
    phone character varying
);

ALTER TABLE public.users OWNER TO postgres;

--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_user_id_seq AS integer START
WITH
    1 INCREMENT BY 1 NO MINVALUE NO MAXVALUE CACHE 1;

ALTER SEQUENCE public.users_user_id_seq OWNER TO postgres;

--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;

--
-- Name: casts id_cast; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.casts
ALTER COLUMN id_cast
SET DEFAULT nextval(
    'public.casts_id_cast_seq'::regclass
);

--
-- Name: cinema cinema_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cinema
ALTER COLUMN cinema_id
SET DEFAULT nextval(
    'public.cinema_cinema_id_seq'::regclass
);

--
-- Name: crew id_crew; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.crew
ALTER COLUMN id_crew
SET DEFAULT nextval(
    'public.crew_id_crew_seq'::regclass
);

--
-- Name: gerne id_gerne; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.gerne
ALTER COLUMN id_gerne
SET DEFAULT nextval(
    'public.gerne_id_gerne_seq'::regclass
);

--
-- Name: movie movie_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie
ALTER COLUMN movie_id
SET DEFAULT nextval(
    'public.movie_movie_id_seq'::regclass
);

--
-- Name: room room_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.room
ALTER COLUMN room_id
SET DEFAULT nextval(
    'public.room_room_id_seq'::regclass
);

--
-- Name: schedule schedule_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.schedule
ALTER COLUMN schedule_id
SET DEFAULT nextval(
    'public.schedule_schedule_id_seq'::regclass
);

--
-- Name: seat seat_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.seat
ALTER COLUMN seat_id
SET DEFAULT nextval(
    'public.seat_seat_id_seq'::regclass
);

--
-- Name: ticket id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ticket
ALTER COLUMN id
SET DEFAULT nextval(
    'public.ticket_id_seq'::regclass
);

--
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
ALTER COLUMN user_id
SET DEFAULT nextval(
    'public.users_user_id_seq'::regclass
);

--
-- Data for Name: casts; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.casts ( id_cast, "character", name, gender ) FROM stdin;

65731	Jake Sully	Sam Worthington	2
8691	Neytiri	Zoe Saldana	1
10205	Dr. Grace Augustine	Sigourney Weaver	1
32747	Col. Quaritch	Stephen Lang	2
17647	Trudy Chacon	Michelle Rodriguez	1
1771	Selfridge	Giovanni Ribisi	2
59231	Norm Spellman	Joel David Moore	2
30485	Moat	CCH Pounder	1
15853	Eytukan	Wes Studi	2
10964	Tsu'Tey	Laz Alonso	2
95697	Dr. Max Patel	Dileep Rao	2
98215	Lyle Wainfleet	Matt Gerald	2
154153	Private Fike	Sean Anthony Moran	2
397312	Cryo Vault Med Tech	Jason Whyte	2
42317	Venture Star Crew Chief	Scott Lawrence	2
986734	Lock Up Trooper	Kelly Kilgour	2
1207227	Shuttle Pilot	James Patrick Pitt	0
1180936	Shuttle Co-Pilot	Sean Patrick Murphy	0
1019578	Shuttle Crew Chief	Peter Dillon	2
91443	Tractor Operator / Troupe	Kevin Dorman	0
173391	Dragon Gunship Pilot	Kelson Henderson	2
1207236	Dragon Gunship Gunner	David Van Horn	0
215913	Dragon Gunship Navigator	Jacob Tomuri	0
143206	Suit #1	Michael Blain-Rozgay	0
169676	Suit #2	Jon Curry	2
1048610	Ambient Room Tech	Luke Hawker	0
42288	Ambient Room Tech / Troupe	Woody Schultz	0
68278	Horse Clan Leader	Peter Mensah	2
1207247	Link Room Tech	Sonia Yee	0
1207248	Basketball Avatar / Troupe	Jahnel Curfman	1
89714	Basketball Avatar	Ilram Choi	0
1207249	Na'vi Child	Kyla Warren	0
1207250	Troupe	Lisa Roumain	0
83105	Troupe	Debra Wilson	1
1207253	Troupe	Chris Mala	0
1207251	Troupe	Taylor Kibby	0
1207252	Troupe	Jodie Landau	0
1207254	Troupe	Julie Lamm	0
1207257	Troupe	Cullen B. Madden	0
1207259	Troupe	Joseph Brady Madden	0
1207262	Troupe	Frankie Torres	0
1158600	Troupe	Austin Wilson	1
983705	Troupe	Sara Wilson	1
1207263	Troupe	Tamica Washington-Miller	0
1145098	Op Center Staff	Lucy Briant	1
33305	Op Center Staff	Nathan Meister	2
1207264	Op Center Staff	Gerry Blair	0
33311	Op Center Staff	Matthew Chamberlain	2
1207265	Op Center Staff	Paul Yates	0
1207266	Op Center Duty Officer	Wray Wilson	0
54492	Op Center Staff	James Gaylyn	2
1207267	Dancer	Melvin Leno Clark III	0
1207268	Dancer	Carvon Futrell	0
1207269	Dancer	Brandon Jelkes	0
1207270	Dancer	Micah Moch	0
1207271	Dancer	Hanniyah Muhammad	0
1207272	Dancer	Christopher Nolen	0
1207273	Dancer	Christa Oliver	0
1207274	Dancer	April Marie Thomas	0
1207275	Dancer	Bravita A. Threatt	0
1207276	Mining Chief (uncredited)	Colin Bleasdale	0
107969	Veteran Miner (uncredited)	Mike Bodnar	0
1207278	Richard (uncredited)	Matt Clayton	0
147898	Nav'i (uncredited)	Nicole Dionne	1
1207280	Trooper (uncredited)	Jamie Harrison	0
1207281	Trooper (uncredited)	Allan Henry	0
1207282	Ground Technician (uncredited)	Anthony Ingruber	2
1207283	Flight Crew Mechanic (uncredited)	Ashley Jeffery	0
98216	Samson Pilot	Dean Knowsley	0
1201399	Trooper (uncredited)	Joseph Mika-Hunt	0
236696	Banshee (uncredited)	Terry Notary	0
1207287	Soldier (uncredited)	Kai Pantano	0
1207288	Blast Technician (uncredited)	Logan Pithyou	0
1207289	Vindum Raah (uncredited)	Stuart Pollock	0
584868	Hero (uncredited)	Raja	0
1207290	Ops Centreworker (uncredited)	Gareth Ruck	0
1062463	Engineer (uncredited)	Rhian Sheehan	0
60656	Col. Quaritch's Mech Suit (uncredited)	T. J. Storm	0
1207291	Female Marine (uncredited)	Jodie Taylor	0
1186027	Ikran Clan Leader (uncredited)	Alicia Vela-Bailey	1
1207292	Geologist (uncredited)	Richard Whiteside	0
103259	Na'vi (uncredited)	Nikie Zambo	0
42286	Ambient Room Tech / Troupe	Julene Renee	1
85	Captain Jack Sparrow	Johnny Depp	2
114	Will Turner	Orlando Bloom	2
116	Elizabeth Swann	Keira Knightley	1
1640	William "Bootstrap Bill" Turner	Stellan Skarsgård	2
1619	Captain Sao Feng	Chow Yun-fat	2
2440	Captain Davy Jones	Bill Nighy	2
118	Captain Hector Barbossa	Geoffrey Rush	2
1709	Admiral James Norrington	Jack Davenport	2
2449	Joshamee Gibbs	Kevin McNally	2
2441	Lord Cutler Beckett	Tom Hollander	2
2038	Tia Dalma	Naomie Harris	1
378	Governor Weatherby Swann	Jonathan Pryce	2
1430	Captain Teague Sparrow	Keith Richards	2
1710	Pintel	Lee Arenberg	2
1711	Ragetti	Mackenzie Crook	2
4031	Lieutenant Theodore Groves	Greg Ellis	2
1715	Cotton	David Bailie	2
4030	Marty	Martin Klebba	2
939	Ian Mercer	David Schofield	0
2450	Scarlett	Lauren Maher	1
2452	Giselle	Vanessa Branch	1
1714	Mullroy	Angus Barnett	2
1713	Murtogg	Giles New	0
22075	Tai Huang	Reggie Lee	2
61259	Henry Turner	Dominic Scott Kay	2
33500	Mistress Ching	Takayo Fischer	1
1224149	Lieutenant Greitzer	David Meunier	2
429401	Hadras	Ho-Kwan Tse	2
1123	Clacker	Andy Beckwith	0
1056117	Penrod	Peter Donald Badalamenti II	2
21700	Cotton's Parrot (voice)	Christopher S. Capp	2
2603	Captain Jocard	Hakeem Kae-Kazim	2
70577	Captain Ammand	Ghassan Massoud	0
8784	James Bond	Daniel Craig	2
27319	Blofeld	Christoph Waltz	2
121529	Madeleine	Léa Seydoux	1
5469	M	Ralph Fiennes	2
28782	Lucia	Monica Bellucci	1
17064	Q	Ben Whishaw	2
543530	Hinx	Dave Bautista	2
125660	C	Andrew Scott	2
139549	Tanner	Rory Kinnear	2
2244	Mr. White	Jesper Christensen	2
1381616	Marco Sciarra	Alessandro Cremona	0
929937	Estrella	Stephanie Sigman	1
87265	Mexican Man in Lift	Tenoch Huerta	0
983710	Mexican Woman in Lift	Adriana Paz	1
1385592	Gallo	Domenico Fortunato	2
1545546	Gallo's Accomplice	Marco Zingaro	0
1545547	Gallo's Accomplice	Stefano Elfi DiClaudia	2
122556	Q's Assistant	Ian Bonar	0
1599239	Moneypenny's Boyfriend	Tam Williams	2
1599241	Blofeld's London Helicopter Pilot	Richard Banham	2
230681	SC019 Police Commander	Pip Carter	2
30446	SC019 Police Officer	Simon Lenagan	2
48377	Priest	Alessandro Bressanello	2
578512	Moreau	Marc Zinga	0
1093974	Vogel	Brigitte Millar	0
89624	Abrika	Adel Bencherif	2
1129783	Blofeld's Right Hand Man	Gediminas Adomaitis	2
226388	Lorenzo	Peppe Lanzetta	0
1299312	Francesco	Francesco Arca	2
124628	Marco	Matteo Taranto	2
1562103	Palazzo Security	Emilio Aniba	2
1474616	Guerra	Benito Sagredo	2
1247684	Businessman	Dai Tabuchi	2
1599245	Businessman	George Lasha	2
1599247	Businessman	Sargon Yelda	0
1599251	Businessman	Andy Cheung	2
1599252	Marshall	Erick Hayden	2
1599253	Valerian	Oleg Mirochnikov	2
123548	Fiat Driver	Antonio Salines	2
1599254	Street Sweeper	Miloud Mourad Benamara	2
1599255	Chairman	Gido Schimanski	2
1404403	Head of Nation	Nigel Barber	0
74415	Head of Nation	Patrice Naiambana	2
1599256	Head of Nation	Stephane Cornicard	2
1599257	Head of Nation	Gary Fannin	2
1599258	Head of Nation	Sadao Ueda	2
1599259	Head of Nation	Phillip Law	0
1599260	Head of Nation	Wai Wong	2
1477143	Head of Nation	Joseph Balderrama	2
1599261	Aide	Eiji Mihara	2
1168129	Aide	Junichi Kajioka	2
48393	Clinic Barman	Victor Schefé	0
1437333	Clinic Security Guard	Harald Windisch	2
1599262	Clinic Security Guard	Tristan Matthiae	2
14637	Cable Car Heavy	Detlef Bothe	2
1599263	Cable Car Heavy	Bodo Friesecke	2
1599264	Syringe Heavy	Wilhem Iben	2
1599265	Snowboarder	Noemi Krausz	1
1599266	Snowboarder	Noah Saavedra	2
1599267	Snowboarder	Francis Attakpah	0
1599268	Snowboarder	Michael Glantschnig	2
1599269	Snowboarder	Marlon Boess	2
1599270	Snowboarder	Marie Wohlmuth	1
1599271	Snowboarder	Lili Epply	1
1599272	Snowboarder	Konstantin Gerlach	2
1102369	L'Americain Manater	Lara Parmiani	1
1372694	Train Guard	Umit Ulgen	2
1363060	Train Waiter	Amra Mallassi	2
1599275	Train Barman	Ziad Abaza	2
1599276	Blofeld's Chauffeur	Walid Mumuni	2
1599277	Blofeld's Guard	Derek Horsham	0
229320	Blofeld's Guard	Nari Blair-Mangat	2
1599278	Blofeld's Butler	Michael White	0
1599279	Blofeld's Waiter	Adam McGrady	0
1436816	Blofeld's Analyst	Nader Dernaika	2
1599280	Blofeld's Chief Analyst	Pezhmaan Alinia	2
5309	M (uncredited)	Judi Dench	1
1186597	Clinic Patron (uncredited)	Neve Gachev	1
1654739	Businessman (uncredited)	Karl Farrer	2
1682535	Lair Staff (uncredited)	Kim Adis	1
1682536	Mexican Sprite (uncredited)	Maurisa Selene Coleman	1
1725801	Pilot David	Matija Mondi Matović	2
3894	Bruce Wayne / Batman	Christian Bale	2
3895	Alfred Pennyworth	Michael Caine	2
64	James Gordon	Gary Oldman	2
1813	Selina Kyle / Catwoman	Anne Hathaway	1
2524	Bane	Tom Hardy	2
8293	Miranda Tate	Marion Cotillard	1
24045	Blake	Joseph Gordon-Levitt	2
192	Lucius Fox	Morgan Freeman	2
2037	Dr. Jonathan Crane / Scarecrow	Cillian Murphy	2
36594	Jen	Juno Temple	1
3896	Ra's Al Ghul	Liam Neeson	2
8654	Deputy Commissioner Foley	Matthew Modine	2
16607	Dr. Pavel	Alon Aboutboul	2
77335	Daggett	Ben Mendelsohn	2
21316	The Mayor	Nestor Carbonell	2
928532	Young Ra's Al Ghul	Josh Pence	0
71010	Prisoner	Tom Conti	0
125025	Young Talia Al Ghul	Joey King	1
211521	Mercenary Security #1	Warren Brown	2
10582	Captain Jones	Daniel Sunjata	2
224365	Special Ops Sergeant	Sam Kennard	0
1334307	Hooded Man #2	Aliash Tepina	0
1334308	Caterer	Nick Julian	0
1334309	Maid	Miranda Nolan	1
1172491	Maid	Claire Julien	0
49735	CIA Op	Aidan Gillen	2
39659	Stryver	Burn Gorman	0
16841	Congressman	Brett Cullen	2
159879	DWP Man	Joseph Lyle Taylor	2
8191	Fr. Reilly	Chris Ellis	2
1240417	SWAT in Dive Bar	Duane Henry	2
1218818	SWAT in Alley	James Harvey Ward	0
84754	Cop in Manhole	Gonzalo Menendez	2
1473276	Sewer Thug #1	Cameron Jack	2
1364324	Sewer Thug #2	Lex Daniel	2
1473749	Mark	Tyler Dean Flores	2
539	Doctor	Thomas Lennon	2
158484	Yuppie	Trevor White	0
10689	Allen	Rob Brown	2
9632	Exchange Security Chief	Fredric Lehne	2
1205900	Female Security Guard	Courtney Munch	0
1403768	Paparazzi #1	Chris Hill	2
1465242	Paparazzi #2	Travis Guba	2
141014	Rich Twit	Jay Benedict	2
32363	Officer Simon Jansen	Will Estes	2
21182	Shoe Shine Man at GSE	David Dayan Fisher	2
83271	Trader #1	Glen Powell	2
535	Trader #3	Russ Fega	2
1226016	Valet at Museum	Andres Perez-Molina	2
15011	Veteran Cop	Brent Briscoe	2
70225	Fredericks	John Nolan	2
24627	2 Star Air Force General	Oliver Cotton	2
142290	Airport Cop	Mark Killeen	0
1377686	Analyst #1	Sarah Goldberg	0
550549	Analyst #2	John MacMillan	2
21505	Army Captain at Bridge	Robert Wisdom	2
98804	Cement Truck Driver	Ronnie Gene Blevins	2
1386824	CIA Analyst	John Hollingworth	0
31362	Cop with Gordon	Ian Bohen	2
145313	Blind Prisoner	Uri Gavriel	2
53252	Ex-Prisoner at River	Noel Gugliemi	2
24202	Gangbanger	Hector Atreyu Ruiz	2
1301187	Huge Inmate	Patrick Cox	0
204191	Kid with Apple	Aramis Knight	2
40039	Barsad	Josh Stewart	2
21416	President	William Devane	2
55411	Skinny Prisoner	David Gyasi	2
1244314	Special Forces #2	Patrick Jordan	2
1286878	Mercenary at City Hall	Joshua Elijah Reese	0
6365	Uniform	Desmond Harrington	2
1417415	Bomb Truck Driver	Mychael Bates	2
941	Wayne's Lawyer	Tomas Arana	2
1225911	Applied Sciences Tech #1	Peter Holden	0
100891	Applied Sciences Tech #2	David Monahan	2
20469	Lawyer's Clerk	Jillian Armenante	1
105832	Greeter at Museum	Aja Evans	1
1355615	Valet at Wayne Enterprises	Aldous Davidson	0
51930	Warden at Blackgate	Wade Williams	2
95577	Waiter in Florence Café	Jake Canuso	0
1010873	Janitor at GSE	Massi Furlan	0
26088	Mercenary Security #4	Christopher Judge	2
853194	Board Member #2	Patrick Leahy	2
171606	Uniform #2	Todd Gearhart	0
1406682	Gotham City Police Officer (uncredited)	Marc Abbink	2
1167718	Young Stock Broker (uncredited)	Isiah Adams	0
572221	Gotham City Police Officer (uncredited)	Charlie Alejandro	1
1116933	Former Upscaler (uncredited)	Robert Arensen	2
1524158	Angry Mobster / Prisoner (uncredited)	Grant Babbitt	0
139188	Gotham Rogues Fan (uncredited)	Fileena Bahris	0
1075845	Mercenary (uncredited)	Rick Bolander	0
1283949	Police Officer (uncredited)	Kyle Patrick Brennan	0
1344943	Gotham City Police Officer (uncredited)	Scott Churchson	0
1240191	Gotham Rogues Coach (uncredited)	Bill Cowher	0
1359461	Pentagon Navy Petty (uncredited)	Graham Curry	0
1163300	Reporter (uncredited)	Stephanie Domini Ehlert	1
93752	Older Upscale Person (uncredited)	John Farrer	0
1343309	Prisoner / Thug (uncredited)	Frank Fata	0
1372419	Stock Broker (uncredited)	Christopher Bryan Gomez	0
1502323	Thug (uncredited)	Vito Grassi	0
1509064	Stockbroker in Snipers Scoop - Stock Exchange (uncredited)	Michael Wren Gucciardo	2
1525392	Prisoner (uncredited)	Sam Harris	2
1365976	Police Officer (uncredited)	Ed Heavey	0
1098036	Gotham Police Officer / Fan (uncredited)	John W. Iwanonkiw	2
1354413	Gordon's Cop #4 (uncredited)	Cindy Jackson	0
123875	Boom Operator News Crew (uncredited)	Daniel Jordano	0
127060	Gothamite (uncredited)	William Kania	0
1388256	Gotham Rogues Fan (uncredited)	Tiffany Kemp	0
1241239	Stock Broker (uncredited)	Sun Jae Kim	0
1378466	Thug (uncredited)	Hrvoje Klecz	0
1264686	Wall Street Broker (uncredited)	Alex Kruz	0
1169299	Gotham City Police Officer (uncredited)	Tyler La Marr	0
1269611	Thug (uncredited)	LeJon	2
1446471	Gotham City Police Officer (uncredited)	Paul Jude Letersky	0
1188950	Prisoner (uncredited)	Joe Lipari	0
1383091	Tourist (uncredited)	Silvia Lombardo	0
1480128	Gotham Rogues Fan (uncredited)	Jorge Mardel	0
1174970	Gotham Rogues Fan (uncredited)	Cale McConnell	0
127063	Gotham City Police Officer (uncredited)	David Dale McCue	0
1480130	Gotham Rogues Fan (uncredited)	Tiffany Sander McKenzie	1
1505308	Angry Mobster (uncredited)	Allen Merritt	0
1509148	Wayne Enterprises Security (uncredited)	Olan Montgomery	0
122339	Mercenary (uncredited)	Alex Moore	0
93778	Gotham City Police Officer (uncredited)	Shane Nolan	0
1205749	Prisoner / Thug (uncredited)	Jackson Nunn	0
1480150	Gotham City News Cameraman (uncredited)	Joseph O'Brien	0
20582	Prison Guard (uncredited)	Michael Papajohn	2
1298014	Prisoner / Mob (uncredited)	Salomon Passariello	0
1429650	Gotham Stock Trader (uncredited)	Kyle David Pierce	0
1349600	Gotham Rogues Player (uncredited)	Troy Polamalu	0
1066138	Gotham Police Officer (uncredited)	Michael Power	0
565508	Thug (uncredited)	James Rawlings	0
1513716	Doris in Black (uncredited)	Kirsten Roeters	0
1215314	Gotham Rogues Player (uncredited)	Ben Roethlisberger	0
1452954	Gotham Police Officer (uncredited)	Mark Roman	2
1451618	Thug (uncredited)	Anthony J. Sacco	2
1085730	Angry Thug (uncredited)	Eric Salazar	0
557202	Hot Football Fan (uncredited)	Emily Schooley	0
54211	Gotham Rogues Owner (uncredited)	Thomas Tull	0
1480223	Thug (uncredited)	Chris Vaina	2
102516	Prisoner (voice) (uncredited)	Vincent van Ommen	0
1205751	Gotham City Press (uncredited)	Michelle Vezzani	0
1205623	Gotham Rogues Fan (uncredited)	Barbara Vincent	0
1358468	Doctor	David Shih	2
1521872	Gotham City Police Officer (uncredited)	Justin Michael Woods	0
306870	Mercenary Soldier (uncredited)	Jason Yee	0
1205141	Gotham Citizen (uncredited)	Maria Zambrana	1
1343746	Gotham City Police Officer (uncredited)	John Zion	0
1454322	Thug (uncredited)	Alex Ziwak	2
1553053	Gotham City Police Officer (uncredited)	Tommy Bayiokos	2
1553307	Football Fan (uncredited)	Matthew Gooley	0
1553377	Cop (uncredited)	Jeff Moffitt	0
1574936	Football Fan (uncredited)	Mark Falvo	0
1576421	Thug (uncredited)	Diogo Hausen	0
1580574	Prisoner (uncredited)	Gary Sievers	2
1583389	Mercenary (uncredited)	Orion McCabe	0
1633514	Court Room Thug (uncredited)	London May	2
1673036	Gothamite (uncredited)	James Quinn	2
1536670	Thug #2 in Basement	Daniel Newman	2
60900	John Carter	Taylor Kitsch	2
21044	Dejah Thoris	Lynn Collins	1
2206	Sola	Samantha Morton	1
5293	Tars Tarkas	Willem Dafoe	2
19159	Tal Hajus	Thomas Haden Church	2
2983	Matai Shang	Mark Strong	2
8785	Tardos Mors	Ciarán Hinds	2
17287	Sab Than	Dominic West	2
17648	Kantos Kan	James Purefoy	2
17419	Powell	Bryan Cranston	2
6416	Sarkoja	Polly Walker	1
57675	Edgar Rice Burroughs	Daryl Sabara	2
89830	Stayman #1 / Helm	Arkie Reece	2
205278	Stayman #3	Davood Ghadami	2
218345	Lightmaster	Pippa Nixon	1
1390394	Thern #2	James Embree	2
1518112	Thern #1	Philip Philmar	0
1721985	Pretty Woman in NYC Doorway	Emily Tierney	1
1721992	Telegraph Clerk	Edmund Kente	2
118617	Dalton	Nicholas Woodeson	2
1722006	Stable Boy	Kyle Agnew	2
130129	Dix the Storekeeper	Don Stark	2
65716	Rowdy #1	Josh Daugherty	2
1724736	Rowdy #2	Jared Cyr	2
62082	Stockade Guard	Christopher Goodman	2
1367241	Sarah Carter	Amanda Clayton	1
1844319	Apache #1 (as Joe Billingiere)	Joseph Billingiere	0
2219	Peter Parker / Spider-Man	Tobey Maguire	2
205	Mary Jane Watson	Kirsten Dunst	1
17051	Harry Osborn / New Goblin	James Franco	2
17052	Eddie Brock / Venom	Topher Grace	2
18997	Gwen Stacey	Bryce Dallas Howard	1
18998	May Parker	Rosemary Harris	1
2505	Captain Stacey	James Cromwell	2
18999	J. Jonah Jameson	J.K. Simmons	2
9207	Mrs. Marko	Theresa Russell	1
19152	Dr. Curt Connors	Dylan Baker	2
5502	Joseph Robertson	Bill Nunn	2
9281	Miss Brant	Elizabeth Banks	1
11769	Hoffman	Ted Raimi	2
6585	Penny Marko	Perla Haney-Jardine	1
19153	Ben Parker	Cliff Robertson	0
2368	Mr. Ditkovitch	Elya Baskin	2
20645	Ursula	Mageina Tovah	1
20580	Flash Thompson	Joe Manganiello	2
7624	Man in Times Square	Stan Lee	2
11357	Maître d	Bruce Campbell	2
19155	Pianist	Christopher Young	2
7628	Driver	Grant Curtis	0
19154	John Jameson	Daniel Gillies	2
19326	Houseman	John Paxton	0
59206	Mrs. Stacy	Becky Ann Baker	1
78311	Photographer	Steve Valentine	2
116627	Anchorman	Hal Fishman	0
113608	Jennifer Dugan	Lucy Gordon	1
99932	Congratulatory Woman at Daily Bugle	Toni Wynne	1
552526	Crane Disaster Radio Policeman	Andre B. Blake	2
1226471	Play Director	Tim Maculan	2
159456	Play Producer	Marc Vann	2
105701	Jazz Club Manager	Joe Bays	2
66653	Precinct Detective	Gregg Daniel	2
1451076	Emergency Room Doctor	Rogelio T. Ramos	2
11766	Crane Operator	Timothy Patrick Quill	0
1781288	Woman Outside Theater	Kathryn Bryding	1
1739821	Police Detective	Joe Virzi	0
1735986	New Jersey State Policeman	Bill E. Rogers	0
1781297	New Jersey State Policeman	Michael Alexander	0
1435965	Test Site Technician	April Parker-Jones	1
1781298	Test Site Technician	Edward Padilla	0
233298	Test Site Technician	Robert Curtis Brown	2
60490	Test Site Technician	Paul Terrell Clayton	2
175606	Test Site Technician	Carolyn Neff	0
1656631	Test Site Technician	Christina Cindrich	1
173163	ICU Nurse	Sonya Maddox	0
1781299	Cop at Crane Disaster	Derrick 'Phoenix' Thomas	0
1781300	Mary Jane's Replacement	Jessi Collins	1
1781301	Boy at Key to the City Ceremony	Michael McLaughlin	0
1781302	Councilwoman	Anne Gartlan	1
53257	Policeman at Sand Truck	Emilio Rivera	2
92486	Policeman at Sand Truck	Keith Woulard	0
52946	Armored Car Driver	Reynaldo Gallegos	2
1781303	Newstand Patron	Jim Coope	0
98396	Newstand Patron	Dean Edwards	0
558055	Newstand Patron	Margaret Laney	1
1781304	Coffee Shop Waitress	Aimee Miles	1
1781307	Jazz Club Waitress	Tanya Bond	1
193946	Jazz Club Bouncer	Mark Kubr	2
1446719	Photoshoot Client	Tony Besson	0
1781308	Businessman (uncredited)	Ramon Adams	0
1781309	Theater Attendee (uncredited)	A.J. Adelman	0
1781310	Pedestrian (uncredited)	Angelis Alexandris	0
1781311	I.C.U Nurse (uncredited)	Dawn Marie Anderson	1
1653331	NYPD Officer (uncredited)	Frank Anello	2
1781312	Model (uncredited)	Anya Avaeva	1
111243	Bucket Boy (uncredited)	David Backus	2
1781313	News Reporter (uncredited)	Tiffany L. Baker	1
1781194	Photographer (uncredited)	Marc C. Cancassi	0
1781318	Rescued Girl (uncredited)	Sujeilee Candele	1
454223	Photographer (uncredited)	Michael Ciesla	0
232042	Jazz Club Waitress (uncredited)	Irina Costa	1
1496942	Theater Patron (uncredited)	John Crann	0
1209717	Jazz Club Girl (uncredited)	Crystal Marie Denha	1
1781325	Columbia Grad Student (uncredited)	Amy V. Dewhurst	1
1509622	New York City Commuter / Driver (uncredited)	Paul Edney	2
1610271	Girl at Key Ceremony (uncredited)	Natalie Fabry	1
1781326	Pedestrian (uncredited)	Keith Fausnaught	0
1781199	A Spidey Kid (uncredited)	Amanda Florian	1
1781205	A Spidey Kid (uncredited)	Brianna Leann Florian	1
1781217	A Spidey Kid (uncredited)	Tiffany Ashley Florian	1
1781327	Businessman (uncredited)	Shaun Patrick Flynn	0
1636759	Automobile Driver (uncredited)	Logan Fry	0
1781328	Spectator (uncredited)	Kevin Fung	0
1781329	News Spectator (uncredited)	Tony Galtieri	0
1781330	Funeral Limo Driver (uncredited)	Chuck Gerena	0
1639432	News Reporter (uncredited)	Brian Hopson	0
1781331	Cop (uncredited)	Claude Jay	0
1781332	Female New Yorker (uncredited)	Julie Jei	1
1316667	Jazz Club Bouncer (uncredited)	Andrew James Jones	0
105632	Girl at Key Ceremony (uncredited)	Natalie Jones	1
1781333	Student (uncredited)	Christopher Jude	0
1292243	ER Nurse (uncredited)	Brittany Krall	1
1781334	Dog Walker (uncredited)	Alyssa Lakota	1
1752230	Observer (uncredited)	Tia Latrell	0
1781221	Businesswoman (uncredited)	Linda Lee	1
570374	Woman in Court (uncredited)	Pierangeli Llinas	1
1246221	British Publicist (uncredited)	Bernadette Lords	1
1781344	Shocked Pedestrian (uncredited)	Sandrine Marlier	1
1781345	Journalist (uncredited)	Laura McDavid	1
1781346	Girl Screaming in Camaro (uncredited)	Natalie McNeil	1
1781347	Kid in Times Square (uncredited)	Daniel Mignault	0
163930	Oscorp Receptionist (uncredited)	Martha Millan	1
1781348	Girl in Times Square (uncredited)	Michele-Nanette Miller	1
1697017	Robbie's Assistant (uncredited)	Claudia Katz Minnick	1
1781349	Theatergoer (uncredited)	Robert Myers	0
1178562	Beautiful Girl (uncredited)	Jen Oda	1
1344665	Beautiful Woman (uncredited)	Anjelia Pelay	1
118389	Police Officer (uncredited)	Nick Poltoranin	0
1781350	Beautiful Woman (uncredited)	Vanessa Reseland	1
1781351	Beautiful Woman (uncredited)	La Rivers	0
60127	Businesswoman (uncredited)	Bria Roberts	1
1781352	Pedestrian (uncredited)	Luis Rosa	0
1422991	Sandman Victim (uncredited)	Vanessa Ross	1
106147	Bad Girl (uncredited)	Brenna Roth	1
1691382	City Hall Cheerer (uncredited)	Shade Rupe	0
1781353	Guy with Ticket (uncredited)	Arick Salmea	0
1367833	Jazz Club Beatnik (uncredited)	Eric Shackelford	0
1781354	Jazz Club Guest (uncredited)	Daniel Shafer	0
1781355	Café Girl (uncredited)	Abbey Skinner	1
1781356	Jazz Club Patron (uncredited)	Kristin Somo	1
1340943	Jazz Club Waitress (uncredited)	Jennifer Sparks	1
211964	Firefighter (uncredited)	Christopher Stadulis	0
1781358	Police Officer (uncredited)	Jimmy Star	0
1778304	Broadway Audience Member (uncredited)	Arne Starr	0
1781359	Jazz Club Musician (uncredited)	Liam Stone	0
1781360	Girl in Cab (uncredited)	Tajna Tanovic	1
1454306	Model (uncredited)	Aija Terauda	1
1781361	Hot Girl (uncredited)	Brigid Turner	0
1781362	Beautiful Woman (uncredited)	Evelyn Vaccaro	1
1781365	Bar Patron #5 (uncredited)	Nick Vlassopoulos	0
1614425	Model (uncredited)	Sincerely A. Ward	1
567242	Model (uncredited)	Silq Webster	0
1781366	Student (uncredited)	Graig F. Weich	0
1781368	Restaurant Patron (uncredited)	Fredrick Weiss	0
1225878	ER Nurse (uncredited)	Jennifer Weston	1
1781371	City Hall Cheerer (uncredited)	Trenton Willey	0
1368459	Spectator (uncredited)	Ray Wineteer	2
69899	Flynn Rider (voice)	Zachary Levi	2
16855	Rapunzel (voice)	Mandy Moore	1
2517	Mother Gothel (voice)	Donna Murphy	1
2372	Stabbington Brother (voice)	Ron Perlman	2
22132	Captain of the Guard (voice)	M.C. Gainey	2
4175	Big Nose Thug (voice)	Jeffrey Tambor	2
18	Hook Hand Thug (voice)	Brad Garrett	2
1219029	Short Thug (voice)	Paul F. Tompkins	0
10460	Vlad (voice)	Richard Kiel	0
1273208	Young Rapunzel / Little Girl (voice)	Delaney Rose Stein	0
121830	Guard 1 / Thug 1 (voice)	Nathan Greno	2
76595	Guard 2 / Thug 2 (voice)	Byron Howard	2
61958	Guard 3 (voice)	Tim Mertens	2
3223	Tony Stark / Iron Man	Robert Downey Jr.	2
74568	Thor Odinson	Chris Hemsworth	2
103	Bruce Banner / Hulk	Mark Ruffalo	2
16828	Steve Rogers / Captain America	Chris Evans	2
1245	Natasha Romanoff / Black Widow	Scarlett Johansson	1
17604	Clint Barton / Hawkeye	Jeremy Renner	2
13548	Ultron (voice)	James Spader	2
2231	Nick Fury	Samuel L. Jackson	2
1896	James Rhodes / War Machine	Don Cheadle	2
27428	Pietro Maximoff / Quicksilver	Aaron Taylor-Johnson	2
550843	Wanda Maximoff / Scarlet Witch	Elizabeth Olsen	1
6162	Jarvis (voice) / Vision	Paul Bettany	2
71189	Maria Hill	Cobie Smulders	1
53650	Sam Wilson / The Falcon	Anthony Mackie	2
39459	Peggy Carter	Hayley Atwell	1
17605	Heimdall	Idris Elba	2
1817	Laura Barton	Linda Cardellini	1
1401531	Dr. Helen Cho	Claudia Kim	1
3491	Strucker	Thomas Kretschmann	2
1333	Ulysses Klaue / Klaw	Andy Serkis	2
1146	Madame B	Julie Delpy	1
7030	Dr. List	Henry Goodman	2
1709130	Fortress Soldier	Chris Luca	0
1265796	Strucker Mercenary	Brian Schaeffer	0
1196961	Zrinka	Dominique Provost-Chalkley	1
1264233	Costel	Isaac Andrews	0
1760858	Sokovian Acid Student	Gareth Kieran Jones	0
1760859	Dr. Cho's Assistant	Chan Woo Lim	0
1760860	Dr. Cho's Assistant	Minhee Yeo	0
1504934	Klaue's Mercenary	Bentley Kalu	2
30086	Ballet Instructor	Julian Bleach	2
1029031	Johannesburg Cop	Christopher Beasley	0
1171654	Johannesburg Cop	Vuyo Dabula	0
1367843	Johannesburg Driver	Nondumiso Tembe	0
1760872	Johannesburg Onlooker	Kabelo Thai	0
1760864	Johannesburg Onlooker	Lele Leowaba	0
1760865	Johannesburg Onlooker	Mandla Gaduka	0
1760866	Johannesburg Onlooker	Harriet Manamela	0
1760867	Johannesburg Onlooker	Beulah Hashe	0
1760868	Johannesburg Onlooker	Musca Kumalo	0
1760869	Johannesburg Onlooker	Mathapelo September	0
1665609	Johannesburg Elevator Passenger	Antony Acheampong	0
1760871	Johannesburg Elevator Passenger	Chioma Anyanwu	0
1760879	Cooper Barton	Ben Sakamoto	0
1405571	Lila Barton	Imogen Poynton	0
1405570	Lila Barton	Isabella Poynton	0
1583054	World Hub Tech	Ingvild Deila	0
1760881	Korean Train Passenger	Sunny Yeo	0
1760882	Korean Train Passenger	Namju Go	0
1760884	Korean Train Passenger	Mina Kweon	0
1590327	Korean Train Passenger	Earl T. Kim	2
1760886	Korean Train Passenger	Arthur Lee	0
1760888	Sokovian Family	Verity Hewlett	0
1760890	Sokovian Family	Michael Matovski	0
1756778	Sokovian Family	Alma Noce	0
1760891	Sokovian Family	Riccardo Richetta	0
1760892	Sokovian Woman	Constanza Ruff	0
1760893	Tub Family Child	Monty Mclaren-Clark	0
6092	Sokovian Driver	Julia Krynke	0
1760898	Sokovian SUV Driver	Tony Christensen	0
1760899	Sokovian SUV Passenger	Ian Kay	0
1015829	Sokovian Police Captain	Barry Aird	0
43373	Specialist Cameron Klein	Aaron Himelstein	2
62105	Friday (voice)	Kerry Condon	1
1760900	Nathaniel Pietro Barton	Jaiden Stafford	0
1394333	Sokovian Citizen (uncredited)	Dilyana Bouklieva	1
16851	Thanos (uncredited)	Josh Brolin	2
1480144	Student (uncredited)	Joti Nagra	1
1429470	Dr. Taryl Jenkins (uncredited)	Nick W. Nicholson	0
1371439	Asgardian God (uncredited)	Daniel Westwood	0
10980	Harry Potter	Daniel Radcliffe	2
10989	Ron Weasley	Rupert Grint	2
10990	Hermione Granger	Emma Watson	1
10993	Draco Malfoy	Tom Felton	2
5658	Albus Dumbledore	Michael Gambon	2
388	Horace Slughorn	Jim Broadbent	2
1283	Bellatrix Lestrange	Helena Bonham Carter	1
1923	Rubeus Hagrid	Robbie Coltrane	2
10978	Minerva McGonagall	Maggie Smith	1
4566	Severus Snape	Alan Rickman	2
9191	Peter Pettigrew	Timothy Spall	2
11207	Remus Lupin	David Thewlis	2
477	Molly Weasley	Julie Walters	1
96841	Neville Longbottom	Matthew Lewis	2
140367	Luna Lovegood	Evanna Lynch	1
10991	Ginny Weasley	Bonnie Wright	1
140368	George Weasley	Oliver Phelps	2
96851	Fred Weasley	James Phelps	2
20999	Arthur Weasley	Mark Williams	2
11184	Filius Flitwick	Warwick Davis	2
3300	Nymphadora Tonks	Natalia Tena	1
234933	Cho Chang	Katie Leung	1
60348	Fenrir Greyback	Dave Legeno	2
10988	Lily Potter	Geraldine Somerville	1
15737	Narcissa Malfoy	Helen McCrory	1
234934	Cormac McLaggen	Freddie Stroma	2
11180	Argus Filch	David Bradley	2
964834	Tom Riddle (16 Years)	Frank Dillane	2
1114487	Tom Riddle (11 Years)	Hero Fiennes-Tiffin	0
9138	Poppy Pomfrey	Gemma Jones	1
234926	Padma Patil	Afshan Azad	1
234925	Parvati Patil	Shefali Chowdhury	0
174398	Katie Bell	Georgina Leonidas	1
234922	Seamus Finnigan	Devon Murray	2
234929	Romilda Vane	Anna Shaffer	1
11212	Gregory Goyle	Josh Herdman	2
956224	Vincent Crabbe	Jamie Waylett	2
234928	Pansy Parkinson	Scarlett Byrne	1
234924	Lavender Brown	Jessie Cave	1
234927	Blaise Zabini	Louis Cordice	0
234923	Dean Thomas	Alfie Enoch	0
1796454	Marcus Belby	Robert Knox	0
568374	Nigel Wolpert	William Melling	0
52888	Eldred Worple	Paul Ritter	2
234930	Leanne	Isabella Laughland	0
202032	Amycus Carrow	Ralph Ineson	2
568378	Alecto Carrow	Suzanne Toase	1
234919	Thorfinn Rowle	Rod Hunt	2
89387	Waitress	Elarica Gallacher	0
880	Bruce Wayne / Batman	Ben Affleck	2
73968	Clark Kent / Superman	Henry Cavill	2
90633	Diana Prince / Wonder Woman	Gal Gadot	1
9273	Lois Lane	Amy Adams	1
44735	Lex Luthor	Jesse Eisenberg	2
2882	Martha Kent	Diane Lane	1
16940	Alfred Pennyworth	Jeremy Irons	0
2975	Perry White	Laurence Fishburne	2
18686	Senator Finch	Holly Hunter	1
59233	Wallace Keefe	Scoot McNairy	2
208296	Anatoli Knyazev	Callan Mulvey	2
1156024	Mercy Graves	Tao Okamoto	1
20089	Jenet Klyburn	Jena Malone	1
1511243	Young Bruce Wayne	Brandon Spink	2
62220	Martha Wayne	Lauren Cohan	1
87447	Jack O'Dwyer	Hugh Maguire	2
56556	Jimmy Olsen	Michael Cassidy	2
1106260	Wayne Industries Pilot	Alan D. Purwin	2
1190987	Drone Pilot	Dan Amboyer	0
1272969	Jenny Jurwich	Rebecca Buller	0
9464	General Swanwick	Harry Lennix	2
1272970	Major Carrie Farris	Christina Wren	0
1622651	Carmen	Jade Chynoweth	1
91403	Glen Woodburn	Chad Krowchuk	0
1269	Jonathan Kent	Kevin Costner	2
132157	Barry Allen / The Flash	Ezra Miller	2
17178	POTUS (voice)	Patrick Wilson	2
335	General Zod	Michael Shannon	2
70177	Himself	Charlie Rose	2
1018992	Himself	Vikram Gandhi	2
1236584	Himself	Andrew Sullivan	2
550307	Himself	Neil deGrasse Tyson	2
12219	Himself	Jon Stewart	2
1227867	Herself	Soledad O'Brien	0
1696036	Herself	Erika R. Erickson	1
1596937	Herself	Dana Bash	1
1514160	Herself	Nancy Grace	1
1217309	Himself	Anderson Cooper	0
1696037	Herself	Brooke Baldwin	1
17832	A.I. Kelor (voice)	Carla Gugino	1
117642	Arthur Curry / Aquaman	Jason Momoa	2
3977	Silas Stone	Joe Morton	2
1313559	Victor Stone / Cyborg	Ray Fisher	2
1636956	Pete Ross	Joseph Cranford	2
1377087	Lana Lang	Emily Peterson	0
47296	Thomas Wayne	Jeffrey Dean Morgan	2
19300	General Amajagh	Sammi Rotibi	2
1467216	Metropolis Citizen	Hanna Dworkin	1
1691930	Metropolis Citizen	Tiffany L. Addison	1
1471446	Metropolis Citizen	Owais Ahmed	2
1691935	Metropolis Citizen	Anish Jethmalani	2
1691940	Metropolis Citizen	Tiffany Bedwell	1
1691945	Metropolis Citizen	Natalee Arteaga	1
1691946	Metropolis Citizen	Keith D. Gallagher	2
1691967	Metropolis Citizen	Jeff Dumas	2
1682540	Metropolis Citizen	Miriam Lee	1
1691970	Metropolis Citizen	Alicia Regan	1
1395056	Teacher	Stephanie Koenig	1
1648751	Sage	Ripley Sobo	1
1691971	Island Scientist	Richard Burden	2
156405	General Security Chief	Julius Tennon	2
134774	Kahina Ziri	Wunmi Mosaku	0
1561391	Senator Barrows	Dennis North	2
1141368	Officer Mazzuccheli	Kiff VandenHeuvel	0
1561419	Officer Rucka	Mason Heidger	2
74312	Hostage Girl	Ahney Her	1
1691981	Hostage Girl	Kristine Cabanban	1
53066	Cesar Santos	Sebastian Sozzi	2
79086	Himself	Kent Shocknek	2
1494289	Emmet Vale	Ralph Lister	2
1691982	Metropolis Cop	Sammy A. Publes	2
1691983	Metropolis Cop	Jay R. Adams	2
1691986	Hero's Park Tourist	David Midura	2
1691987	Reporter at Monument	Jay Towers	2
1395050	Air Force MP	Michael Ellison	0
1692027	Underground Fight Patron	Kirill Ostapenko	2
1692036	Beautiful Woman	Rashontae Wawrzyniak	1
1214961	Sports Announcer	Tom Luginbill	2
1692048	Sports Announcer	Dave Pasch	2
146413	Party Photographer	Danny Mooney 	2
1692050	Party Doorman	Henry Frost III	2
165293	LeBlanc	Nicole Forester	1
1695971	Metropolis Governor	Debbie Stabenow	1
146412	Colorado Woman	Milica Govich 	0
1695987	Jail Guard	John Lepard	2
1695988	Finch's Receptionist	Sandra Love Aldridge	1
1695990	James Harmon - Museum Director	Graham W.J. Beal	2
1695991	Bunker Soldier	Henri Franklin	2
1289444	Bunker Soldier	Jonathan West	2
1695992	US Park Officer	T.J. Martinelli	2
1561416	Wayne Accountant	Chris Newman	2
1696013	Diner Waitress	Lulu Dahl	1
1201979	DC Protestor	Sam Logan Khaleghi	2
1696018	DC Protestor	Anne Marie Damman	1
1452211	DC Protestor	Connie Craig	0
1696019	DC Protestor	Henrietta Hermelin	1
1334323	Convenience Store Robber	Albert Valladares	2
1685460	Helicopter Pilot	David Paris	2
1696038	Flight Attendant	Abigail Kuklis	1
1545503	Chairman of Joint Chiefs	Greg Violand	0
1007391	Vice Chairman of Joint Chiefs	Tiren Jhames	2
1505007	Signals Officer - Air Force	Steve Jasgur	2
1696221	Silo Officer	Jonathan Stanley	2
1390506	Silo Officer	Jesse Nagy	2
1696222	Supermax Guard	Duvale Murchison	2
1696223	Prison Barber	Thomas J. Fentress	2
1189226	Father Leone	Coburn Goss	0
1696226	Wagon Driver	Jeff Hanlin	0
1077782	Creature Vocals (voice)	Gary A. Hecker	2
130081	Kreatur (voice)	Robin Atkin Downes	2
1696230	Squatter Boy	Issac Ryan Brown	2
1374130	CIA Supervisor	Barton Bund	2
104195	Python Team Leader	Bailey Chase	2
1696231	Gotham Desk Cop	Patrick O'Connor Cronin	2
1000800	Gotham Desk Cop	Sonja Crosby	1
1696234	Inmate Thug	C.T. Fletcher	2
1696241	Inmate Thug	Ahman Green	2
1548735	Nairomian Crying Woman	Diana Gaitirira	0
1147413	Nairomian Crying Woman	Jalene Mack	1
1424325	Nairomian Crying Woman	Esodie Geiger	1
1696264	Nairomian Crying Woman	Nene Nwoko	1
1696251	Nairomian Driver	Scott Edward Logan	2
1696236	Gala Waiter	Marcus Goddard	2
1696238	Adriana Santos	Cruz Gonzalez-Cadel	1
162169	Older Goat Herder	Alma Martinez	1
8666	Older Goat Herder	Sal Lopez	0
1696268	Young Goat Herder	Marcel Shihadeh	0
1696262	Rebel Translator	Theo Bongani Ndyalvane	2
1393349	Squatter Mother	Satori Shakoor	1
76674	Truck	Ele Bardha	2
639817	Wayne Financial Employee	Inder Kumar	2
1561376	Party Guest	Brandon Bautista	0
1188194	Daily Planet Reporter (uncredited)	Laura Atwood	1
1636801	Wayne Enterprise Executive (uncredited)	Debbie Scaletta	1
1645569	Football Player (uncredited)	David Leach	2
74595	Gotham Seaport Cop (uncredited)	Gordon Michaels	2
87220	Wayne Security (uncredited)	Brian Boland	2
204261	Russian Foreign Minister (uncredited)	Taras Los	0
1019098	DC Paramedic (uncredited)	Jason Hughley	0
1062375	Building Supervisor (uncredited)	Sidi Henderson	2
1031686	Chilean President (uncredited)	Meighan Gerachis	0
1574911	First Class Lady (uncredited)	Nicole Santini	0
1597947	Basketball Player (uncredited)	Axel Harney	2
1675748	Funeral Attender (uncredited)	Wayne E. Brown	2
1729054	Police Officer (uncredited)	Dante Briggins	2
1729055	GCU Football Player (uncredited)	Shannon Garnett	2
87443	Protester (uncredited)	Lynch R. Travis	0
1594986	EMT (uncredited)	Carmen Gangale	2
1283943	Metropolis Survivor (uncredited)	Joe Cipriano	0
99166	Rusty - Metropolis Cop (uncredited)	Will Blagrove	0
1892479	Protester (uncredited)	Marcelo Bem	0
17271	Superman / Clark Kent	Brandon Routh	2
1979	Lex Luthor	Kevin Spacey	2
7517	Lois Lane	Kate Bosworth	1
11006	Richard White	James Marsden	2
7489	Kitty Kowalski	Parker Posey	1
8924	Perry White	Frank Langella	2
53492	Jimmy Olsen	Sam Huntington	0
2639	Martha Kent	Eva Marie Saint	1
3084	Jor-El	Marlon Brando	2
53493	Stanford	Kal Penn	2
53494	Jason White	Tristan Lake Leabu	2
41318	Brutus	David Fabrizio	2
1224391	Riley	Ian Roberts	0
1272955	Grant	Vincent Stone	0
193763	Bo the Bartender	Jack Larson	2
243805	Gertrude Vanderworth	Noel Neill	1
1252837	Boy with Camera	Keegan Joyce	2
971458	Little Girl	Jordana Beatty	1
18182	Camille Montes	Olga Kurylenko	1
8789	Dominic Greene	Mathieu Amalric	2
3753	René Mathis	Giancarlo Giannini	2
59620	Strawberry Fields	Gemma Arterton	1
2954	Felix Leiter	Jeffrey Wright	2
35029	Gregg Beam	David Harbour	2
62892	Elvis	Anatole Taubman	2
11276	Foreign Secretary	Tim Pigott-Smith	2
76857	General Medrano	Joaquín Cosio	2
574355	Henry Mitchell	Glenn Foster	0
34408	Corinne Veneau	Stana Katic	1
136290	Gemma	Lucrezia Lante della Rovere	1
20289	Monsieur Slate	Neil Jackson	2
566331	Perla de las Dunas Receptionist	Oona Chaplin	1
127000	Anna	Rachel McDowall	1
574361	Quantum Member	Gustavo Nanez	0
205222	MI6 Agent	Mark Wakeling	0
62961	Ocean Sky Receptionist	Sarah Hadland	0
193339	MI6 Agent (uncredited)	David Decio	0
424182	MI6 Agent (uncredited)	Aaron King	0
574364	Quantum Member	Alexandra Prusa	0
574365	Mario Cavaradossi	Brandon Jovanovich	0
574367	Spoletta	Alexandre Krawetz	0
149307	Colonel of Police	Fernando Guillén Cuervo	2
69865	Lt. Orso	Jesús Ochoa	2
1234388	Yusef	Simon Kassianides	0
1529894	Forensics Tech	Brendan O'Hea	0
2451	Captain Bellamy	Alex Norton	2
191751	Maccus	Dermot Keaney	2
11283	Koleniko	Clive Ashborn	2
64102	Jimmy Legs	Christopher Adamson	2
1229277	Ogilvey	Jonathan Linsley	0
140452	Burser	John Boswall	0
10960	Burser - Edinburgh	Max Baker	2
25441	Quartermaster - Edinburgh	Steve Speirs	2
82636	Frightened Sailor	Luke de Woolfson	2
1254626	Black Pearl Pirate	Jonathan Kite	2
53807	John Reid / The Lone Ranger	Armie Hammer	2
886	Butch Cavendish	William Fichtner	2
18473	Dan Reid	James Badge Dale	2
207	Latham Cole	Tom Wilkinson	2
47720	Rebecca Reid	Ruth Wilson	1
12834	Captain Jay Fuller	Barry Pepper	2
22063	Barret	James Frain	2
583040	Will	Mason Cook	2
71467	Skinny	Matt O'Leary	2
15374	Collins	Leon Rippy	2
45051	Frank	Harry Treadaway	2
62752	Ray	Damon Herriman	2
6951	Stache	W. Earl Brown	2
84225	Red Knee	Gil Birmingham	2
126829	Chief Big Bear	Saginaw Grant	0
1736738	Soldier #1	Stephen Brodie	2
1094319	Soldier #3	Matthew Page	2
1382010	Danny	Bryant Prince	0
1184011	Wendell	JD Cullum	2
92949	Fritz	Timothy V. Murphy	2
1471922	Blaine	Damon Carney	0
1240490	Clayton	Kevin Wiggins	2
208061	Martin	Chad Brummett	2
21723	Navarro	Robert Baker	2
37027	Hollis	Lew Temple	2
17401	Habberman	Stephen Root	2
102567	Shareholder	Randy Oglesby	2
56267	Shareholder	Brad Greenquist	2
22250	Engineer	Rance Howard	2
59847	Homer	Leonard Earl Howze	0
128560	Young Cavendish	Travis Hammer	2
1452636	Young Cole	Steve Corona	0
134171	Telegraph Operator	Jack Axelrod	0
1112414	Preacher	Christopher Hagen	0
51754	Kai	Freda Foh Shen	1
114977	Fat Lady	Margaret Bowman	1
1760466	Pilar	Luz P. Mendez	0
1760467	Rosalie	Laina Loucks	0
1760468	Dancer (Red's)	Devon J. Adams	0
1760469	Dancer (Red's)	Desirae Anslover	0
1760470	Dancer (Red's)	Charlotte Cormier	0
1459004	Dancer (Red's)	Megan Pribyl	0
1760471	Dancer (Red's)	Briana Van Schuyver	0
1760472	Dancer (Red's)	Julie Stracener	0
1391129	Pawing Drunk	Chad Randall	2
1333907	Mob Member	Jason E. Hill	2
967071	Mob Member	Beth Bailey	1
1178981	Glenda	Joanne Camp	1
104915	Stove Pipe	Bob Rumnock	2
1105706	Grizzled Soldier	Tait Fletcher	0
307885	Soldier #4	Alex Knight	0
569548	Farmer	Argos MacCallum	2
1759932	Band at Red's	Pokey Lafarge	2
1760474	Band at Red's	Joey Glynn	0
1760475	Band at Red's	Adam Hoskins	0
1760476	Band at Red's	Ryan Koenig	0
934	Jor-El	Russell Crowe	2
43202	Faora-Ul	Antje Traue	1
22227	Colonel Hardy	Christopher Meloni	2
213049	Lana Lang	Jadin Gould	1
77223	Emerson	Tahmoh Penikett	2
8786	Lara Lor-Van	Ayelet Zurer	1
31028	Dr. Emil Hamilton	Richard Schiff	2
236302	Clark Kent at 13	Dylan Sprayberry	2
50217	Steve Lombard	Michael Kelly	2
12371	Tor-An	Richard Cetrone	2
37698	Jax-Ur	Mackenzie Gray	2
2320	Lor-Em	Julian Richings	2
11831	Ro-Zar	Mary Black	1
1272968	Car-Vex	Samantha Jo	1
4095	Major Laramore	David Lewis	2
27138	Heraldson	Doug Abrahams	2
172809	Byrne	Brad Kelly	0
59312	Officer Sekowsky	Alessandro Juliani	2
1272971	Teenage Pete Ross	Jack Foley	0
1025970	Whitney Fordman	Robert Gerdisch	2
1371141	Student	Jacqueline Scislowski	0
1235591	Bar Buddy	Sean Campbell	2
1615574	Rubble Survivor (uncredited)	Raj Lal	2
25130	Prince Caspian	Ben Barnes	2
5528	Peter Pevensie	William Moseley	2
5529	Susan Pevensie	Anna Popplewell	1
5527	Edmund Pevensie	Skandar Keynes	2
5526	Lucy Pevensie	Georgie Henley	1
2166	King Miraz	Sergio Castellitto	2
25132	Queen Prunaprismia	Alicia Borrachero	1
22970	Trumpkin	Peter Dinklage	2
25133	Doktor Cornelius	Vincent Grass	2
17839	Lord Glozell	Pierfrancesco Favino	2
7370	Lord Sopespian	Damián Alcázar	2
24496	Lord Scythley	Simón Andreu	2
12044	Lord Donnon	Predrag Bjelac	2
25134	Asterius	Shane Rangi	2
25135	Glenstorm	Cornell John	2
25136	Trüffeljäger	Ken Stott	2
3063	White Witch	Tilda Swinton	1
1926	Reepicheep	Eddie Izzard	2
107943	Hag	Klára Issová	1
91606	Loki	Tom Hiddleston	2
9048	Agent Phil Coulson	Clark Gregg	2
12052	Virginia "Pepper" Potts	Gwyneth Paltrow	1
14464	World Security Council	Jenny Agutter	1
101522	Shield Pilot	Walter Perez	2
6280	World Security Council	Powers Boothe	2
188758	World Security Council	Arthur Darbinyan	2
168246	World Security Council	Donald Li	2
34486	Waitress	Ashley Johnson	1
5048	Security Guard	Harry Dean Stanton	2
81959	Carrier Bridge Techs	Alicia Sixtos	1
1033652	Gala Scientist	Dieter Riesle	0
79079	Celebration Montage Interviewee	Jamie McShane	2
51303	Tall Thug	Jeff Wolfe	2
43553	Georgi Luchkov	Jerzy Skolimowski	2
1018947	Agent Jasper Sitwell	Maximiliano Hernández	2
1214673	The Other	Alexis Denisof	2
19151	Senator Boynton	James Eckhouse	2
1224022	Young Cop	Enver Gjokaj	0
150194	Thanos / The Mad Titan (Uncredited)	Damion Poitier	2
60120	NASA Scientist	Tina Benko	1
1479945	Weaselly Thug	Kirill Nikiforov	2
1479946	Young Girl	M'laah Kaur Singh	1
86157	Calcutta Woman	Rashmi Rustagi	1
60878	Carrier BridgeTechs	Warren Kole	2
66525	Carrier BridgeTechs	Jesse Garcia	2
87128	German Old Man	Kenneth Tigar	2
1479957	Maintenance Guy	Josh Cowdery	2
1479959	Japanese Family	Katsumi Komatsu	2
1479961	Japanese Family	Yumiko Komatsu	0
1479962	Japanese Family	Momoko Komatsu	0
2256	Police Sergeant	Robert Clohessy	2
1479967	Office Woman	Fernanda Toker	0
1480042	News Reporter	Andrea Vecchio	1
1480043	News Reporter	Robin Swoboda	1
1480044	Faceless Pilot	Brent McGee	2
1203089	Celebration Montage Interviewee	Michael Zhang	2
98626	Celebration Montage Interviewee	William-Christopher Stephens	2
1480045	Celebration Montage Interviewee	Kelley Robins	1
156342	Shawna Lynde	Romy Rosemont	1
1480047	Himself	Pat Kiernan	2
1234512	Himself	Thomas Roberts	2
1263294	Woman in Restaurant (uncredited)	Jillian Morgese	0
1480048	German Pedestrian (uncredited)	Catherine Anderson	1
1153698	Lentil Merchant (uncredited)	Ricardo Andres	2
1480049	S.H.I.E.L.D. Agent (uncredited)	Logan Bennett	2
1191953	Celebration Montage Man Shaving Beard (uncredited)	Mayank Bhatter	2
1480051	Gala Guest (uncredited)	Sharita Bone	1
1480053	Museum Gala Patron (uncredited)	Jason Botsford	2
1480055	Stuttgart Biergarten patron (uncredited)	Mary Kate Campbell	0
1403346	S.H.I.E.L.D. Guard (uncredited)	Gene N. Chavez	0
1480056	Gala Guest (uncredited)	Layla Cushman	1
1466605	Soldier (uncredited)	Robert Dean	2
1480057	Museum Gala Guest (uncredited)	Rick Dremann	0
1480058	Captain Putz (uncredited)	Jeffrey Feingold	2
19137	The Hulk (voice) (uncredited)	Lou Ferrigno	0
1354406	Pedestrian (uncredited)	Rod Fielder	2
1480060	Stuttgart Citizen (uncredited)	Eric Frank	0
1480065	S.H.I.E.L.D. Agent (uncredited)	Israel Hall	2
1480066	Museum Gala Patron (uncredited)	Carmen Dee Harris	0
1480067	Mercenary (uncredited)	Alexander Christopher Jones	2
1480085	Pedestrian (uncredited)	Mike Karban	2
1480087	S.H.I.E.L.D. Agent (uncredited)	Demoine Kinney	2
1480091	Stuttgart Citizen (uncredited)	Andrew Knode	2
1480096	Hostage (uncredited)	Annette Lawless	1
1480097	Limo Driver (uncredited)	Kimberly J. Mahoney	1
1480124	Helicarrier Medical Team Leader (uncredited)	Todd Manes	2
1480132	Cafe Patron (uncredited)	Michael McMillan	2
1001496	Guard (uncredited)	Sean Meehan	2
1480146	Gala Museum Patron (uncredited)	Holly Neelie	1
1480148	Extra (uncredited)	Caleb Daniel Noal	2
1480152	S.H.I.E.L.D. Agent (uncredited)	Jeremy Orr	2
1480153	New York Pedestrian (uncredited)	Nate Paige	0
1365516	Shiel Employee (uncredited)	Martin Palmer	2
1480198	Museum Gala Guest (uncredited)	Maria Perossa	1
1480199	Extra (uncredited)	Caleb Pieplow	2
1480200	Helicarrier Shield Agent (uncredited)	Alexander Daniel Pimentel	2
1480202	S.H.I.EL.D Agent - Loki Escort (uncredited)	Frank Powers	2
1371850	S.H.I.E.L.D. Agent (uncredited)	Jaime Powers	2
1480204	Stuttgart Gala Patron (uncredited)	Brent Reichert	2
1480208	S.H.E.I.L.D. Agent (uncredited)	Kelly Ruble	2
1454362	Restaurant Patron (uncredited)	Gina Sarno	1
1480209	New York City Police Officer (uncredited)	Robert B. Schneider IV	2
1480210	New York Police Officer in Firefight (uncredited)	Jeff Seich	2
1480211	Stuttgart Beer Garden Patron (uncredited)	Christina Shaffer	0
1480212	Lab Tech (uncredited)	Alonda Shevette	1
1480213	Museum Gala Patron (uncredited)	Douglas Slygh	2
6037	S.H.I.E.L.D. Agent #4 (uncredited)	Colin Strause	2
1480218	Gala Patron (uncredited)	Robert P. Thitoff	2
1480219	S.H.I.E.L.D. Agent (uncredited)	George Thomas	0
1480220	Pedestrian (uncredited)	Shane Thompson	0
1480221	Mercenary (uncredited)	Jerry Lee Tucker	2
1480222	Child on News #1 (uncredited)	Tai Urban	2
1480224	Sweeper (uncredited)	Sandra Weston	1
1480226	Barbershop (uncredited)	Seth Zielicke	2
1673576	Tourist (uncredited)	Alex DeCourville	2
1343164	S.H.I.E.L.D agent (uncredited)	Andrea-Nichole Olivas	1
1376001	NYC Pedestrian (uncredited)	Tina Grimm	1
955	Angelica Teach	Penélope Cruz	1
6972	Captain Edward "Blackbeard" Teach	Ian McShane	2
237455	Philip Swift	Sam Claflin	2
469759	Syrena	Astrid Bergès-Frisbey	0
1115	Scrum	Stephen Graham	2
1712	Lieutenant Gillette	Damian O'Hare	0
59129	The Spaniard	Óscar Jaenada	2
10983	King George II	Richard Griffiths	2
55901	Tamara	Gemma Ward	0
199975	Quartermaster	Ian Mercer	2
88392	Cabin Boy	Robbie Kay	2
8399	Ezekiel	Christopher Fairbank	2
77955	Garheng	Yuki Matsuzaki	2
83814	Purser	Steve Evets	2
75076	Cook	Bronson Webb	2
51300	Master-at-Arms	Derek Mears	2
58758	Gunner	Deobia Oparei	2
229634	King Ferdinand of the Spanish Empire	Sebastian Armesto	2
27397	John Carteret	Anton Lesser	2
11279	Prime Minister Henry Pelham	Roger Allam	2
110075	Salaman	Paul Bazely	2
1321379	Derrick	Richard Thomson	2
1310385	Yeoman	Danny Le Boyer	0
1797040	Justice Smith	Alan J. Utley-Moore	0
214581	Captain of the Guard	Luke Roberts	2
1331023	English Girl	Emilia Jones	1
1770474	Mermaid	Sanya Hughes	0
1770475	British Sailor (uncredited)	Siegfried Peters	0
2888	Agent J	Will Smith	2
2176	Agent K	Tommy Lee Jones	2
72873	Griffin	Michael Stuhlbarg	2
7056	Agent O	Emma Thompson	1
55936	Boris The Animal	Jemaine Clement	0
151246	Boris's Girlfriend	Nicole Scherzinger	1
59860	Young Agent O	Alice Eve	1
19278	Andy Warhol	Bill Hader	2
87070	Jeffrey Price	Michael Chernus	2
33533	Agent X	David Rasche	2
91387	Mr. Wu	Keone Young	2
1068400	Colonel's Son	Cayen Martin	2
450	Colonel	Mike Colter	2
1506488	Downtown Hipster	Mela Hudson	1
21200	Agent AA	Will Arnett	2
1671443	Soldier (uncredited)	Kelvin Davis	2
1152008	MIB Tech #1 (uncredited)	Dan Bittner	0
7060	Bilbo Baggins	Martin Freeman	2
1327	Gandalf	Ian McKellen	2
30315	Thorin Oakenshield	Richard Armitage	2
95047	Dwalin	Graham McTavish	2
67123	Bifur	William Kircher	2
34715	Bofur	James Nesbitt	2
1193834	Bombur	Stephen Hunter	0
152566	Fili	Dean O'Gorman	2
207558	Kili	Aidan Turner	2
534336	Oin	John Callen	2
1193832	Gloin	Peter Hambleton	0
173451	Nori	Jed Brophy	0
81877	Dori	Mark Hadlow	2
1193833	Ori	Adam Brown	0
19034	Tauriel	Evangeline Lilly	1
72095	Thranduil	Lee Pace	2
112	Galadriel	Cate Blanchett	1
1331	Elrond	Hugo Weaving	2
113	Saruman	Christopher Lee	2
65	Old Bilbo	Ian Holm	2
52398	Beorn	Mikael Persbrandt	2
80112	Radagast	Sylvester McCoy	2
114019	Bard	Luke Evans	2
11275	Master of Laketown	Stephen Fry	2
126667	Bain	John Bell	2
60349	Alfrid	Ryan Gage	2
1359824	Sigrid	Peggy Nesbitt	1
1359823	Tilda	Mary Nesbitt	0
41782	Azog	Manu Bennett	2
205406	Bolg	John Tui	2
9188	Dain	Billy Connolly	0
71580	Smaug / Necromancer (voice)	Benedict Cumberbatch	2
15092	Hilda Bianca	Sarah Peirse	1
240024	Percy	Nick Blake	0
1440652	Feren	Simon London	0
127453	Keeper of the Dungeons	Conan Stevens	0
1484140	Ragash	Allan Smith	2
1086829	Olga	Miranda Harcourt	0
1356758	Astrid	Thomasin McKenzie	1
37625	Peter Parker / Spider-Man	Andrew Garfield	2
54693	Gwen Stacy	Emma Stone	1
7026	Dr. Curt Connors / The Lizard	Rhys Ifans	2
5724	Captain Stacy	Denis Leary	2
55152	Richard Parker	Campbell Scott	2
76793	Rajit Ratha	Irrfan Khan	2
8349	Uncle Ben	Martin Sheen	2
35	Aunt May	Sally Field	1
558928	Peter Parker (Age 4)	Max Charles	2
231547	Flash Thompson	Chris Zylka	2
6368	Mary Parker	Embeth Davidtz	1
1111328	Cash Register Thief	Leif Gantvoort	2
59261	Missy Kallenback	Hannah Marks	1
205976	Sally Avril	Kelsey Asbille	1
2878	Jack's Father	C. Thomas Howell	2
9289	Man in the Shadows	Michael Massee	2
156989	Helen Stacy	Kari Coleman	2
1424715	Philip Stacy	Charlie DePew	2
61263	Howard Stacy	Skyler Gisondo	2
930322	Simon Stacy	Jacob Rodier	2
1315833	Jack	Jake Keiffer	0
91658	Mr. Cramer	Kevin McCorkle	2
157146	Miss Ritter	Barbara Eve Harris	1
96753	Nicky's Girlfriend	Danielle Burgio	1
1338023	Store Clerk	Michael Barra	0
1232365	Gordon	Andy Pessoa	0
1338034	Physics Nerd	Andy Gladbach	0
1338061	Physics Nerd	Ring Hendricks-Tellefsen	0
1338215	Nicky	Tom Waite	0
15318	Car Thief	Keith Campbell	2
66668	Car Thief Cop	Steve DeCastro	0
932116	Police Officer	James Chen	2
979075	Officer (SWAT)	Alexander Bedria	2
58510	Newscaster (News Chopper)	John Burke	2
118494	Receptionist	Jill Flint	1
1183671	OsCorp Intern	Mark Daugherty	2
1657618	Rodrigo Guevara	Milton González	2
1983	Construction Worker	Vincent Laresca	2
1477809	Taxi Driver	Damien Lemon	2
1236007	Police Officer with Sketch	Ty Upshaw	2
68430	Sheila (Subway)	Tia Texada	1
14050	Subway Guy	Jay Caputo	2
1219576	Principal	Terry Bozeman	2
63470	Second Girl (Subway)	Jennifer Lyons	1
1187106	Ariel	Amber Stevens	1
1059597	Gossip Girl (uncredited)	Zoey Deutch	1
1657635	Science Teacher (uncredited)	Jody Cosgrove-Kao	1
1355105	Scientist (uncredited)	Max Bogner	2
63280	Lab Technician (uncredited)	Ethan Cohn	2
984614	Billy Connors (uncredited)	Miles Elliot	2
1657642	Cheerleader (uncredited)	Miranda LaDawn Hill	1
167263	Goth Girl (uncredited)	Amanda MacDonald	1
1657643	Tina (uncredited)	Maury Morgan	1
1499460	Pedestrian (uncredited)	Amy Novondo	1
1265835	Oscorp Intern (uncredited)	Kristin Quick	1
2201	Sir Walter Loxley	Max von Sydow	2
227	William Marshal	William Hurt	2
25072	Prince John	Oscar Isaac	2
6413	King Richard the Lionheart	Danny Huston	2
20300	Eleanor of Aquitaine	Eileen Atkins	1
13633	Friar Tuck	Mark Addy	2
15576	Sheriff of Nottingham	Matthew Macfadyen	2
79072	Little John	Kevin Durand	2
35091	Will Scarlet	Scott Grimes	2
147472	Allan A'Dayle	Alan Doyle	2
80149	Sir Robert Loxley	Douglas Hodge	2
17499	King Philip of France	Jonathan Zaccaï	2
47643	Baron Baldwin	Robert Pugh	2
43131	Baron Fitzrobert	Gerard McSorley	0
34515	Belvedere	Velibor Topic	2
556444	Loop	Ciaran Flynn	2
16358	Father Tancred	Simon McBurney	0
185460	Stone Mason Longstride	Mark Lewis Jones	2
81125	Adhemar	Denis Ménochet	0
226083	Margaret - Walter's Maid	Ruby Bentall	1
1151410	Princess Isabel of Gloucester	Jessica Raine	0
1796466	Farmer Paul	John Nicholas	0
24709	Gaffer Tom	Roy Holder	2
1182597	Village Mother	Denise Gough	0
146457	Groom	Arthur Darvill	2
58787	Lady-in-Waiting	Giannina Facio	1
3551	Distinctive Man	Jake Curran	0
58769	Laketown Spy	Stephen Colbert	2
206532	Narzug	Ben Mitchell	2
45589	Lyra Belacqua	Dakota Blue Richards	1
2227	Marisa Coulter	Nicole Kidman	1
16431	Lee Scoresby	Sam Elliott	2
10912	Serafina Pekkala	Eva Green	1
1281	Pantalaimon (voice)	Freddie Highmore	2
45585	Roger Parslow	Ben Walker	2
5470	Stelmania (voice)	Kristin Scott Thomas	1
8534	Hester (voice)	Kathy Bates	1
20070	John Faa	Jim Carter	2
14011	Farder Coram	Tom Courtenay	2
45587	Master	Jack Shepherd	2
45586	Mrs. Lonsdale	Magda Szubanski	1
937	Magisterial Emissary	Derek Jacobi	2
45588	Ma Coster	Clare Higgins	1
142389	Billy Costa	Charlie Rowe	2
1815740	Tony Costa	Steven Loton	0
28959	Kerim Costa	Michael Antoniou	0
1411061	Jaxer Costa	Mark Mottram	0
56103	Sister Clara	Hattie Morahan	1
63608	Bolvangar Official	Jason Watkins	2
1075144	Second in Command	Sam Hoare	0
1563381	Gobbler	Brian Nickels	0
1132749	Gobbler	Thomas Arnold	2
1105459	Witch	Helen Soraya	0
3489	Ann Darrow	Naomi Watts	1
70851	Carl Denham	Jack Black	2
3490	Jack Driscoll	Adrien Brody	2
3492	Preston	Colin Hanks	2
3493	Hayes	Evan Parke	2
478	Jimmy	Jamie Bell	2
3494	Choy	Lobo Chan	2
3495	Herb	John Sumner	2
3496	Mike	Craig Hall	2
3497	Bruce Baxter	Kyle Chandler	2
1166385	Manny	William Johnson	0
3541	Weston	David Pittu	2
1047942	Maude	Geraldine Brophy	0
107754	Taps	David Dennis	2
214979	Zelman	Pip Mushin	2
199432	Thuggish Executive	Jim Knobeloch	2
181186	Sleazy Executive	Ric Herbert	0
1504590	Studio Guy's Assistant	Lee Donahue	0
1205488	Young Assistant	Tom Hobbs	0
75892	Fruit Vendor	Tiriel Mora	2
1097645	Venture Crew	John Wraight	2
1169229	Venture Crew	William Wallace	0
1064428	Venture Crew	Frank Edwards	0
173539	Venture Crew	Crawford Thomson	0
1504591	Venture Crew	Richard Kavanagh	0
75950	Venture Crew	Stephen Hall	0
73889	Venture Crew	Joe Folau	2
173569	Old Security Guard	Chic Littlewood	2
1670104	Hooverville Child	Samuel Taylor	0
204	Rose DeWitt Bukater	Kate Winslet	1
6193	Jack Dawson	Leonardo DiCaprio	2
3713	Ruth Dewitt Bukater	Frances Fisher	1
1954	Caledon 'Cal' Hockley	Billy Zane	2
8535	Old Rose	Gloria Stuart	1
2053	Brock Lovett	Bill Paxton	2
1369	Captain Edward James Smith	Bernard Hill	2
2076	Spicer Lovejoy	David Warner	2
8536	Thomas Andrews	Victor Garber	2
8537	Bruce Ismay	Jonathan Hyde	2
2179	Lizzy Calvert	Suzy Amis	1
8538	Lewis Bodine	Lewis Abernathy	0
8539	Bobby Buell	Nicholas Cascone	2
8540	Fabrizio	Danny Nucci	2
8541	Tommy Ryan	Jason Barry	2
8543	Isidor Straus	Lew Palter	2
8544	John Jacob Astor IV	Eric Braeden	2
8545	Col. Archibald Gracie	Bernard Fox	2
3071	1st Officer Murdoch	Ewan Stewart	2
65524	Fifth Officer Lowe	Ioan Gruffudd	2
8547	2nd Officer Lightoller	Jonny Phillips	2
8548	6th Officer Moody	Edward Fletcher	0
8549	Frederick Fleet	Scott G. Anderson	2
8550	Reginald Lee	Martin East	0
8551	Jack Phillips	Gregory Cooke	2
8552	Cora Cartmell	Alexandrea Owens	1
8553	Slovakian 3 Year Old Boy	Seth Adkins	2
1080265	Benjamin Guggenheim	Michael Ensign	0
93215	Anatoly Milkailavich	Anatoly M. Sagalevitch	0
1054325	Slovakian Father	Martin Hub	2
41266	Chief Officer Wilde	Mark Lindsay Chapman	2
26863	Quartermaster Rowe	Richard Graham	2
1256066	Quartermaster Hichens	Paul Brightwell	0
63141	Master at Arms	Ron Donachie	2
55957	Madeleine Astor	Charlotte Chatton	1
1697673	Madame Aubert	Fannie Brett	1
3981	Irish Mommy	Jenette Goldstein	1
230727	Helga Dahl	Camilla Overbye Roos	1
1741441	3rd Class Woman	Linda Kerns	1
1741443	Trudy Bolt	Amy Gaipa	1
126363	Sir Duff Gordon	Martin Jarvis	2
29796	Lady Duff Gordon	Rosalind Ayres	1
1359176	Countess of Rothes	Rochelle Rose	1
1741450	Wallace Hartley	Jonathan Evans-Jones	0
1597443	Irish Man	Brian Walsh	0
40740	Bert Cartmell	Rocky Taylor	2
1451680	Harold Bride	Craig Kelly	0
1741459	Chief Baker Joughin	Liam Tuohy	0
142325	4th Officer Boxhall	Simon Crane	0
178557	Father Byles	James Lancaster	0
172280	Ida Strauss	Elsa Raven	1
1741663	Irish Little Boy	Reece P. Thompson III	0
1741664	Irish Little Girl	Laramie Landis	0
1227544	Yaley	Mark Rafael Truitt	0
131833	1st Class Husband	John Walcutt	2
1106167	Chief Engineer Bell	Terry Forrestal	0
97436	Leading Stoker Barrett	Derek Lea	2
1741665	Carpenter John Hutchinson	Richard Ashton	0
1398372	Elevator Operator	Sean Nepita	0
1741666	Scotland Road Steward	Brendan Connolly	0
40695	Crewman	David Cronnelly	0
158662	1st Class Waiter	Garth Wilton	2
1741667	Steward #1	Richard Fox	0
1228858	Steward #2	Nick Meaney	0
1741669	Steward #3	Kevin Owers	0
1520024	Steward #4	Mark Capri	2
592618	Hold Steward #1	Marc Cass	0
1237642	Hold Steward #2	Paul Herbert	0
1693876	1st Class Steward	Emmett James	0
930944	Stairwell Steward	Chris Byrne	2
1330728	Steward Barnes	Oliver Page	0
1338541	Porter	James Garrett	0
157989	Porter	Erik Holland	2
1741673	Bjorn Gunderson	Jari Kinnunen	0
1741675	Olaus Gunderson	Anders Falk	0
72742	Praying Man	Barry Dennen	2
1741678	Man in Water	Vern Urich	0
944614	Mother at Stern	Rebecca Klingler	1
42198	Woman	Tricia O'Neil	1
1402008	Woman in Water	Kathleen S. Dunn	1
1741688	Syrian Man	Romeo Francis	0
1741689	Syrian Woman	Mandana Marino	1
30148	Chinese Man	Van Ling	0
1741690	Olaf	Bjørn Olsen	0
1741691	Sven	Dan Pettersson	0
42290	Pubkeeper	Shay Duffin	2
1233436	News Reporter	Diana Morgan	1
1741692	Dancer	Kris Andersson	0
1741693	Dancer	Bobbie Bates	1
1741694	Dancer	Aaron James Cash	0
29214	Dancer	Anne Fletcher	1
1741697	Dancer	Edmond Alan Forsyth	0
1367898	Dancer	Andie Hicks	0
1028668	Dancer	Scott Hislop	2
1741700	Dancer	Stan Mazin	0
1741701	Dancer	Lisa Ratzin	1
1741707	Noble Sailor	Brian Baines	0
1741709	Tea Room Girl	Ellie Bensinger	1
146182	1st Class Woman	Alexandra Boyd	1
2134	Musician / Baker	Mike Butters	2
2710	Steerage Dancer	James Cameron	2
1639429	1st Class Man	Bruno Campolo	0
1741717	Victor Giglio	Chris Cragnotti	0
1741718	Titanic Crewmember	Kevyn Currie	0
75804	3rd Officer Pitman	Kevin De La Noy	2
1741719	Douglas Spedden	Thomas Fiss	0
1741720	1st Class Passenger / Praying Man	Griffin Howell	0
1741721	The Promenade Steward	Sean Howse	0
1337466	Deckhand	Tony Kenny	0
1741722	Passenger	Bret Aaron Knower	0
1741723	Waiter	George Kosty III	0
1741724	2nd Class Passenger	George Kosty Jr.	0
1741725	Seaman	Geoffrey C. Kosty	0
1741726	Seaman	Gregory Charles Kosty	0
2472	Leading Stroker Charles Hendrickson	Sean Lawlor	2
1741727	2nd Class Passenger	John Leonhardt	0
1741728	Rich Man	Miguel A. Lomelin	0
1029818	Frederick Spedden	Don Lynch	0
63423	Rescue Boat Crewman	Johnny Martin	2
1741729	2nd Class Passenger / Engine Room Crewman	Ryan McClurkin	0
1190237	First Class Passenger	Meghan McLeod	1
1730068	Engine Room Crewman	Mike O'Neal	0
1741737	Engineering Officer	Julian Oros	0
1275173	Button Accordionist	Phil Parlapiano	0
1741739	Praying Woman	Judy Prestininzi	1
93214	Engine Room Crewman	Steven Quale	2
11670	Mary Marvin	Olivia Rosewood	1
1741740	Ohio Man	John Slade	0
1741741	1st Class Dining Room Steward	Stephen Wolfe Smith	0
1741742	Drowning Man	R. Gern Trowbridge	0
1741743	Man Being Combed for Lice	Francisco Váldez	0
1741744	Kissing Couple	Lucie Zolcerova	1
60898	Bucky Barnes / Winter Soldier	Sebastian Stan	2
172069	T'Challa / Black Panther	Chadwick Boseman	2
22226	Scott Lang / Ant-Man	Paul Rudd	2
84247	Sharon Carter	Emily VanCamp	1
1136406	Peter Parker / Spider-Man	Tom Holland	2
81685	Brock Rumlow / Crossbones	Frank Grillo	2
3872	Zemo	Daniel Brühl	2
21134	Howard Stark	John Slattery	2
3141	May Parker	Marisa Tomei	1
51878	King T'Chaka	John Kani	2
15250	Maria Stark	Hope Davis	1
116969	Karpov	Gene Farber	2
139900	Ayo	Florence Kasumba	1
1981	Miriam	Alfre Woodard	1
161932	M.I.T. Liaison	Jim Rash	2
19272	Dr. Broussard	Joe Russo	2
1502949	MRI Tech	Michael A. Cook	0
1779511	Vicar	Laughton Parchment	0
1779512	Josef / Super Soldier #1	Jackson Spidell	0
1779513	Super Soldier #2	Yi Long	0
1582803	Super Soldier #3	Heidi Moneymaker	0
1566267	Super Soldier #4	Aaron Toney	2
1779514	Super Soldier #5	Cale Schultz	0
1483700	Zemo's Wife (voice)	Ann Russo	0
1327810	Man at Kiosk	Sven Hönig	0
1779516	GSG9 Task Force Gunner	Joshua Peck	0
1779517	German Innkeeper	Be Satrazemis	0
1003792	Raft Guard	Blair Jasin	2
1323073	Barge Man #1	Oli Bigalke	0
1779519	Barge Man #2	Rafael Banasik	0
114634	Custodian	David de Vries	2
1779520	Funeral Director	John Curran	0
1779521	Woman in Lobby #1	Katie Amess	0
1779522	Woman in Lobby #2	Austin Sanders	0
209125	Delivery Truck Driver	Brett Gentile	0
1779523	Choir	Matthew Anderson	0
1779524	Choir	Andrew Botchwey	0
1779525	Choir	Chase Bradfield	0
1779526	Choir	Ernest Charles	0
1779527	Choir	Hendricks Coates	0
1779528	Choir	Ethan Condon	0
1779529	Choir	Shen Dynes	0
1779530	Choir	Nathaniel Ellis	0
1779531	Choir	Jariah Ferguson	0
1779532	Choir	Evan Ffrench	0
1779533	Choir	Justin Freeman	0
1779534	Choir	Ralphael Grand'Pierre	0
1779535	Choir	Julian Grimes	0
1779536	Choir	Aaron Hayes	0
1779537	Choir	Austin Hooper	0
1779538	Choir	Amiri Jones	0
1779539	Choir	Myles Joseph	0
1779540	Choir	Stephen Lewis	0
1779541	Choir	Jacob Ludwick	0
1779542	Choir	D'Mahrei McRae	0
1779543	Choir	Ashwin Mudaliar	0
1779544	Choir	Eli Ollinger	0
1779545	Choir	Parker Pape	0
1779546	Choir	Daniel Parada	0
1779547	Choir	Jonah Ruffin	0
1779548	Choir	Darryl Sampson	0
1779549	Choir	Cameron Sardone	0
1779550	Choir	Stanley Sellers	0
1779551	Choir	Miles Selles	0
1779552	Choir	Jacob Sung	0
1779554	Choir	Caden Wilkinson	0
1779557	Chinese Newscaster	Kim Scar	0
1779562	German Newscaster #1	Jessica Walther-Gabory	0
1779563	German Newscaster #2	Beniamino Brogi	0
570756	News Reporter	Silvina Buchbauer	0
1779564	Busboy (Lagos)	Henry Amadi	0
1779565	Waiter (Lagos)	Ugochukwu Ani	0
1779567	Secretary Ross's Aide	Michael Anthony Rogers	2
1375186	Hero Merc #2	Umar Khan	0
1779569	Hero Merc #3	David Brown	0
1569801	Hero Merc #4	Guy Fernandez	0
1779570	Teenage Girl	Sophia Russo	0
232256	UN Staffer Gibson	Amelia Morck	0
78430	Stark's Assistant	Julianna Guill	1
1731337	Nurse	Surely Alvelo	0
1779572	Helicopter Pilot	Kevin LaRosa Jr.	0
91042	Helicopter Pilot	Al Cerullo	0
1738113	Helicopter Pilot	Frédéric North	0
592495	Auctioneer (uncredited)	Ray Sahetapy	0
28846	Commander Stone Hopper	Alexander Skarsgård	2
131519	Petty Officer Cora 'Weps' Raikes	Rihanna	1
131520	Sam	Brooklyn Decker	1
13275	Captain Yugi Nagata	Tadanobu Asano	2
1052162	Lieutenant Colonel Mick Canales	Gregory D. Gadson	2
184581	Cal Zapata	Hamish Linklater	2
88124	Boatswain Mate Seaman Jimmy "Ordy" Ord	Jesse Plemons	2
98953	Sampson JOOD Strodell	Jerry Ferrara	2
60875	NASA Director	David Jensen	2
36602	JPJ 2nd Gunner	Peter Berg	2
23429	Dr. Nogrady	Adam Godley	2
987677	Captain Browley	Rico McClinton	0
1331643	Chief Engineer Hiroki	Joji Yoshida	0
55205	JPJ OOD	Stephen Bishop	2
1044953	JPJ Fireman	Austin Naulty	0
1337274	Electronic Warfare Supervisor	Dustin J. Reno	0
1216133	Chairman, Joint Chiefs of Staff	Rick Hoffman	2
68180	Air Force Chief of Staff	Gary Grubbs	2
17838	Watch Officer	Rami Malek	2
12688	Secretary of Defense	Peter MacNicol	2
3218	Bartender	Louis Lombardi	2
1326245	JPJ Sailor	Jordan Kirkwood	0
210542	CIC Watch Supervisor	Doug Penty	0
66678	CIC Gunner	Carson Aune	0
1044956	JPJ Port Gunner	Lloyd Pitts	0
29054	British Newscaster	Michelle Arthur	1
1367223	Spanish Newscaster	Natalia Castellanos	0
937232	Japanese Newscaster	Leni Ito	0
1569054	Jackie Johnson	Jackie Johnson	1
1049830	Cal's Female Colleague	Kerry Cahill	1
1504579	Old Salt	Norman Vincent McLafferty	2
1504580	JPJ XO Mullenaro	Dante Jimenez	2
1504581	JPJ Helmsman	Daven Arce	2
1504582	JPJ Starboard Gunner	Ralph Richardson	2
1504583	JPJ BMOW	Biunca Love	0
84756	Regent Sea Commander	Kyle Russell Clements	2
204235	Myoko XO	Yutaka Takeuchi	0
1685026	JPJ Sailor	John A Weaver	2
1685027	Sampson OOD	Dane Justman	2
989607	Sampson XO	Drew Rausch	2
86536	Marine Commandant	Bill Stinchcomb	2
73457	Owen Grady	Chris Pratt	2
7132	Vic Hoskins	Vincent D'Onofrio	2
1108907	Zach Mitchell	Nick Robinson	2
17181	Gray Mitchell	Ty Simpkins	2
543505	Lowery Cruthers	Jake Johnson	2
78423	Barry	Omar Sy	2
14592	Henry Wu	BD Wong	2
20750	Karen Mitchell	Judy Greer	1
591834	Vivian	Lauren Lapkus	1
116278	Hamada	Brian Tee	2
150587	Zara Young	Katie McGrath	1
170635	Scott Mitchell	Andy Buckley	2
59297	Paddock Supervisor	Eric Edelstein	2
11669	Jimmy Fallon	Jimmy Fallon	2
97446	Hal Osterly	James DuMont	2
1809787	Jim Drucker	Matt Burke	0
1550012	Erica Brand	Anna Talakkottur	0
930707	Mr. DNA	Colin Trevorrow	2
568045	Mosasaurus Announcer	Courtney J. Clark	0
866906	Zach's Girlfriend	Kelly Washington	1
979412	Gyrosphere Operator	Matthew Cardarople	2
1522360	Italian Mother	Yvonne Angulo	0
1682513	Italian Girl	Chloe Perrin	1
1682512	Park Visitor (uncredited)	Erika Erica	1
1637724	Park Visitor (uncredited)	Tiffany Forest	1
3810	Silva	Javier Bardem	2
1030261	Sévérine	Bérénice Marlohe	1
3926	Kincade	Albert Finney	0
11045	Patrice	Ola Rapace	2
206273	Ronson	Bill Buckhurst	0
100242	Vanessa	Elize du Toit	1
1024234	Bond's Lover	Tonia Sotiropoulou	1
1224993	CNN News Anchor	Wolf Blitzer	0
92429	Silva's Henchman	Jens Hultén	0
47944	Commuter Husband	Anthony O'Donnell	2
1399567	Commuter Wife	Jo Cameron Brown	0
1168075	Vauxhall Bridge Police Guard	Peter Basham	0
1062405	Vauxhall Bridge Police Guard	Ben Loyd-Holmes	0
1333452	Shanghai Barman	Orion Lee	0
1574323	Floating Dragon Cashier	Yennis Cheung	0
658	Dr. Otto Octavius / Doctor Octopus	Alfred Molina	2
11641	Man on Balcony	Scott Spiegel	2
74949	Mr. Jacks	Joel McHale	2
75316	Elevator Passenger	Hal Sparks	0
115218	Pizza 'Heist' Witness	Donnell Rawlings	2
25933	Receptionist	Emily Deschanel	1
18307	Raymond	Daniel Dae Kim	2
20644	Mr. Aziz	Aasif Mandvi	2
75309	Train Passenger	Joey Diaz	2
20491	Louise	Vanessa Ferlito	1
52847	Woman at Web	Joy Bryant	1
4610	Doctor	John Landis	2
31549	Train Passenger (uncredited)	Phil LaMarr	2
17179	Dr. Davis	Gregg Edelman	2
9047	Mrs. Jameson	Christine Estabrook	1
59846	Skeptical Scientist	Joanne Baron	1
19489	OsCorp Representative	Peter McRobbie	2
62646	Amazed Kid	Marc John Jefferies	2
31508	Algernon	Reed Diamond	2
1217576	Theater Traffic Cop	Brendan Patrick Connor	0
27688	Jack	Dan Callahan	0
1051811	Clawing Nurse	Susie Park	0
52271	Train Passenger	Brianna Brown	1
54635	Train Conductor	Tom Carey	0
11750	Train Passenger	Dan Hicks	0
109180	Train Passenger	Tony Campisi	2
54586	Society Woman	Molly Cheek	1
1214542	Dr. Isaacs	Kelly Connell	2
1252313	Amazed Kid	Roshon Fegan	0
1355926	Mrs. Watson	Taylor Gilbert	1
188728	Injured Scientist	Timothy Jerome	2
64373	Violinist	Elyse Dinh	0
13029	Woman at Fire	Anne Betancourt	0
60925	Screaming Nurse	Tricia Peters	0
1279729	Chainsaw Doctor	Tim Storms	0
147592	Train Passenger	Bill Calvert	0
152939	Train Passenger	Peter Allas	2
1090378	Train Passenger	Chloe Dykstra	0
90558	Train Passenger	Julia Max	0
1278367	Boomer (uncredited)	Calvin Dean	0
138028	Pizza Man (uncredited)	Frank Bonsangue	0
1498435	Fireman 2 (uncredited)	Andre M. Johnson	0
1431984	Piano Player in Planetarium (uncredited)	Peter Cincotti	0
1254435	Little Girl Playing on Steps (uncredited)	Peyton List	1
92729	Little Boy Playing on Steps (uncredited)	Spencer List	0
1409953	Blue Collar Guy (uncredited)	Troy Metcalf	0
954650	Pedestrian (uncredited)	Scott Ross	2
66579	Screaming Woman (uncredited)	Bonnie Somerville	1
1378546	Columbia University Student (uncredited)	Wesley Volcy	0
1346430	Man at Web (uncredited)	Lou Volpe	0
1500999	Pedestrian (uncredited)	David Boston	0
956198	Bearded Doctor (uncredited)	Garrett Warren	2
1647723	NYPD Officer (uncredited)	Michael Arthur	2
58619	Chinese Daughter (uncredited)	Cindy Cheung	1
529	Aldrich Killian / The Mandarin	Guy Pearce	2
15556	Maya Hansen	Rebecca Hall	1
15277	Happy Hogan	Jon Favreau	2
2282	Trevor Slattery	Ben Kingsley	2
121953	Brandt	Stephanie Szostak	1
6573	President Ellis	William Sadler	2
46814	Mrs. Davis	Dale Dickey	1
15860	Vice President Rodriguez	Miguel Ferrer	2
77303	Doctor Wu (as Wang Xueqi)	Wang Xue-qi	2
17857	Ho Yinsen	Shaun Toub	2
1735538	Annoying Conference Guy	Matthew Sterling Nye	0
1735539	Himself	Josh Elliott	0
1212282	Herself	Megan Henderson	0
74086	Himself	Bill Maher	2
14670	Herself	Joan Rivers	1
1336882	Himself	George Kotsiopoulos	0
1171861	Neptune's Net Girl	Bronte D'Esposito	0
1171688	Neptune's Net Boy	Noah Visconti	0
992507	Taggert	Ashley Hamilton	2
1735541	Happy's Nurse	Brooke Jayne Taylor	0
1735542	Hospital Nurse Reporter	Kim Dean	0
1088938	Helicopter Pilot #1	Anthony Reynolds	0
1230922	Helicopter Pilot #2	Kendrick Cross	0
1735543	Reporter at House Wreckage	Tom Clark	0
1391612	Mandarin Look-Out	John Eddins	2
49275	Rose Hills Sherrif	Spencer Garrett	2
1463664	Rose Hill Deputy / Extremis Soldier	Rockey Dickey Jr.	0
1735545	Rose Hill Christmas Tree Shopper	Drew Michael Hershner	0
1383576	Junior Technician (as Sarah Burkharat)	Sarah Burkhardt	0
430313	Senior Technician	Jan Broberg	1
56979	Satellite Technician (as Andy Lauer)	Andrew Lauer	2
146329	Technical Director	Nate Bynum	0
1314963	Vice President's Analyst	Andrew Lander	0
38709	Thomas Richards	Tom Virtue	2
51464	President's Aide	Roy McCrerey	0
113008	Scared Insurgent	Serdar Kalsin	2
1735546	Laughing Insurgent	Demetrois Hodges	0
1241324	Pageant Emcee	Bobby Tisdale	0
37252	Miss Elk Ridge	Yvonne Zima	1
115974	Gary the Cameraman	Adam Pally	2
1735547	Chad Davis	James Rackley	0
1215021	Extremis Candidate	Cullen Moss	2
1735551	Room Service Waiter / Extremis Soldier	Jake Dewitt	0
54679	Sweat Shop Agent	Rebecca Mader	1
1735554	Mandarin Guard	Kevin Arnold	0
237347	Mandarin Guard (as Juan Bofill)	Juan C. Bofill	0
1735558	Mandarin Guard	David Buglione	0
1735559	Mandarin Guard	Adam Lytle	0
1309902	Mandarin Guard (as Paul O'Connor)	Paul Andrew O'Connor	2
1735560	Mandarin Guard	Phil Ortiz	0
1735561	Sleepy Mandarin Girl	Gwendalyn Barker	0
1228523	Annoyed Mandarin Guard	Steve Wilder	2
1323717	Mandarin Party Girl #1	Luciana Faulhaber	1
1735562	Mandarin Party Girl #2	Karina Florez	0
1530091	Tony's Guard	Mike Massa	2
1735564	Reluctant AIM Guard	Si-Fu Eric Oram	0
1735565	AIM Ping Pong Girl	Naomi Parshin	0
1699796	AIM Ping Pong Girl	Aurelia Riley	0
1735566	AIM Ping Pong Girl	Johanna Yunda	0
154158	Secret Service Agent	Wesley Thompson	2
974169	Vice President's Daughter	Jenna Ortega	1
1735568	Iron Patriot Fan #1	T. C. Anyachonkeya	0
1392385	Iron Patriot Fan #2	Chad Kurtz	0
1339959	Air Force One Officer	Cal Johnson	0
1154054	Navy Op	Corey Hawkins	2
57251	Commander	Linden Ashby	2
113745	Heather	Sarah Farooqui	1
1366	Extremis Soldier	Sala Baker	2
1735569	Extremis Soldier	Kial Butler	0
235778	Extremis Soldier	Nick Brandon	0
1535095	Extremis Soldier	Dan Brown	2
216782	Extremis Soldier	Fernando Chien	2
1735572	Extremis Soldier	Brycen Counts	0
1332241	Extremis Soldier	Kiante Elam	2
1648160	Extremis Soldier	Dane Farwell	2
1544395	Extremis Soldier	Mark Fichera	2
1352976	Extremis Soldier	Colin Follenweider	0
1544394	Extremis Soldier	Aja Frary	1
149731	Extremis Soldier	Mark Ginther	2
1735573	Extremis Soldier	Adrian Gonzalez	0
1221121	Extremis Soldier	Dennis Keiffer	0
1080216	Extremis Soldier	Samuel Le	0
590821	Extremis Soldier	Tara Macken	0
1700563	Extremis Soldier	William Morts	0
1619994	Extremis Soldier	Jade Quon	0
1735574	Extremis Soldier	J. C. Robaina	0
1735575	Extremis Soldier	Markos Rounthwaite	0
1454104	Extremis Soldier	Philip J Silvera	0
180838	Extremis Soldier	Brian Simpson	0
1622657	Extremis Soldier	Mark Aaron Wagner	2
169265	Juan (uncredited)	Chris Gethard	2
445918	Richie (uncredited)	Bridger Zadina	2
76070	Alice Kingsleigh	Mia Wasikowska	1
1064	The Knave of Hearts	Crispin Glover	2
20982	Charles Kingsleigh	Marton Csokas	2
30083	Helen Kingsleigh	Lindsay Duncan	1
26209	Tweedledee / Tweedledum	Matt Lucas	2
11855	Lady Ascot	Geraldine James	1
29237	Hamish Ascot	Leo Bill	2
47468	Aunt Imogene	Frances de la Tour	1
3968	The White Rabbit (voice)	Michael Sheen	2
34900	The March Hare (voice)	Paul Whitehouse	2
40942	The Dormouse (voice)	Barbara Windsor	1
3796	The Dodo (voice)	Michael Gough	2
11356	Tall Flower Faces (voice)	Imelda Staunton	1
73357	Fiona Chattaway	Eleanor Tomlinson	1
282628	Margaret Kingsleigh	Jemma Powell	2
119413	Faith Chattaway	Eleanor Gecks	1
1652888	Strange Woman Kisser	Rebecca Crookshank	1
1323226	Woman with Large Nose in Red Queen Court	Holly Hawkins	0
31737	Woman with Big Ears in Red Queen Court	Lucy Davenport	1
156136	Man with Large Belly in Red Queen Court	Joel Swetow	2
208507	Woman with Large Poitrine in Red Queen Court	Jessica Oyelowo	1
1350949	Hightopp Hat Juggler	Chris Grabher	0
1652908	Party Dancer	Bonnie Parker	1
1652911	Party Dancer	Simone Sault	1
487836	Party Dancer	Dale Mercer	2
1116282	Red Queen's Court	Cortney Palm	1
6968	Logan / Wolverine	Hugh Jackman	2
4587	Ororo Munroe / Storm	Halle Berry	1
2387	Charles Xavier / Professor X	Patrick Stewart	2
10696	Jean Grey / Phoenix	Famke Janssen	1
10690	Marie D'Ancanto / Rogue	Anna Paquin	1
7090	Dr. Henry 'Hank' McCoy / Beast	Kelsey Grammer	2
11023	Bobby Drake / Iceman	Shawn Ashmore	2
11022	John Allerdyce / Pyro	Aaron Stanford	2
27578	Katherine "Kitty" Pryde / Shadowcat	Ellen Page	1
11008	Raven Darkholme / Mystique	Rebecca Romijn	1
980	Cain Marko / Juggernaut	Vinnie Jones	2
11107	Warren Worthington III / Angel	Ben Foster	2
84222	Piotr Rasputin / Colossus	Daniel Cudmore	2
37046	Callisto	Dania Ramirez	1
52414	Jimmy / Leech	Cameron Bright	2
2131	Quentin Quire / Kid Omega	Ken Leung	2
58115	Jamie Madrox / Multiple Man	Eric Dane	2
1199720	Philippa Sontag / Arclight	Omahyra Mota	0
73590	Betsy Braddock / Psylocke	Meiling Melançon	0
115857	Jubilation Lee / Jubilee	Kea Wong	1
941988	Theresa Rourke Cassidy / Siryn	Shauna Kain	0
4776	Warren Worthington II	Michael Murphy	2
21041	Dr. Kavita Rao	Shohreh Aghdashloo	1
14792	The President	Josef Sommer	2
1103	Trask	Bill Duke	2
61555	Young Jean Grey	Haley Ramm	1
4741	Young Angel	Cayden Boyd	2
59243	Minivan Son #2	Alex Ferris	2
11616	Moira McTaggert	Olivia Williams	1
7904	Michael "Mike" Wazowski (voice)	Billy Crystal	2
1230	James P. "Sulley" Sullivan (voice)	John Goodman	2
884	Randall Boggs (voice)	Steve Buscemi	2
15735	Dean Hardscrabble (voice)	Helen Mirren	1
1271300	Young Mike (voice)	Noah Johnston	0
21198	Scott “Squishy” Squibbles (voice)	Peter Sohn	2
155649	Don Carlton (voice)	Joel Murray	2
52601	Terri Perry (voice)	Sean Hayes	2
21290	Terry Perry (voice)	Dave Foley	0
95101	Art (voice)	Charlie Day	2
51383	Brock Pearson (voice)	Tyler Labine	2
51797	Johnny Worthington (voice)	Nathan Fillion	2
119592	Claire Wheeler (voice)	Aubrey Plaza	1
452205	Chet Alexander (voice)	Bobby Moynihan	2
11806	Ms. Squibbles (voice)	Julia Sweeney	1
5149	Karen Graves (voice)	Bonnie Hunt	1
17697	“Frightening” Frank McCay (voice)	John Krasinski	2
482044	Carrie Williams (voice)	Beth Behrs	1
10	Roz (voice)	Bob Peterson	2
7907	Yeti (voice)	John Ratzenberger	2
7908	Fungus (voice)	Frank Oz	2
1340664	Additional Children's Voices (voice)	Ava Acres	1
10959	Sam Witwicky	Shia LaBeouf	2
19537	Mikaela Banes	Megan Fox	1
19536	Captain Lennox	Josh Duhamel	2
11678	College Professor	Rainn Wilson	2
8169	USAF Tech Sergeant Epps	Tyrese Gibson	2
1241	Agent Simmons	John Turturro	2
14721	Ron Witwicky	Kevin Dunn	0
24305	Judy Witwicky	Julie White	1
72985	Leo Spitz	Ramón Rodríguez	2
103554	Alice	Isabel Lucas	1
12797	General Morshower	Glenn Morshower	2
141956	Commander, US Central Command	Marc Evan Jackson	0
19540	Optimus Prime (voice)	Peter Cullen	2
1749473	Diego Garcia Soldier	Arnold Chun	0
108253	April the Resident Assistant	Katie Lowes	1
19541	Jetfire (voice)	Mark Ryan	2
117187	Mudflap (voice)	Reno Wilson	2
84495	Ironhide (voice)	Jess Harnell	2
2962	Ratchet (voice)	Robert Foxworth	2
177588	Sideswipe (voice)	André Sogliuzzo	0
15761	Arcee (voice)	Grey Griffin	1
19384	Fallen (voice)	Tony Todd	2
81178	Starscream (voice)	Charlie Adler	2
15831	Soundwave / Devastator / Reedman / Grindor (voice)	Frank Welker	2
78798	Wheelie / Skids (voice)	Tom Kenny	2
1508409	Wheelbot (voice)	Calvin Wimmer	0
110636	Doctor (voice)	John Di Crosta	0
13919	Prime #1 (voice)	Michael York	2
24362	Prime #2 / Skipjack / Rampage (voice)	Kevin Michael Richardson	2
183507	Aide	John Eric Bentley	2
78434	Frisbee Girl	America Olivo	1
67206	Special Air Service Forces	Andrew Howard	2
12793	Special Air Service Forces	Matthew Marsden	2
1295	Egyptian Guard	Deep Roy	2
13240	Cade Yeager	Mark Wahlberg	2
2283	Joshua	Stanley Tucci	2
61186	Tessa Yeager	Nicola Peltz	1
1007683	Shane	Jack Reynor	2
39389	Savoy	Titus Welliver	2
3971	Darcy	Sophia Myles	1
109432	Su Yueming	Li Bingbing	1
51990	Lucas Flannery	T.J. Miller	2
204100	Gill Wembley	James Bachman	2
1677237	Joshua's assistant	Greg Anderson	2
1717278	Joshua's Assistant	Melanie Specht	0
1087070	Joshua's Assistant	Victoria Summer	0
937809	Convertible Passenger	Han Geng	2
1837661	KSI Executive	Edward T. Welburn	0
928594	Motorist	Kevin Covais	2
3899	Drift (voice)	Ken Watanabe	2
31531	Crosshairs (voice)	John DiMaggio	0
27993	Powerglide (voice)	Jeffrey Combs	2
6576	Thrust (voice)	Mark Rolston	2
124112	CIA Director	Charles Parnell	2
971234	CIA Analyst	Erika Fong	1
1039678	Arctic Site Guard	David Midthunder	2
1347386	Arctic Site Foreman	Glenn Keogh	0
592343	Air Force Operator	Richard Gallion	0
1487978	Wembley's Associate	Kassem Gharaibeh	0
18262	Theater Landlord	Richard Riehle	2
1643621	Cemetery Wind Team	Tyrone Smith	2
1661677	Joshua's Assistant	Abigail Klein	1
1744759	Woman in Elevator	Candice Zhao	0
7574	Realtor	Cleo King	1
111080	Landlord's Grandson	Patrick Bristow	2
64896	Hong Kong Police Chief	Michael Wong	0
18973	Theodora	Mila Kunis	1
3293	Evanora	Rachel Weisz	1
1812	Annie / Glinda	Michelle Williams	1
5367	Frank / Finley	Zach Braff	2
8854	Master Tinker	Bill Cobbs	2
19754	Knuck	Tony Cox	2
224723	Winkie General	Stephen R. Hart	2
123725	May	Abigail Spencer	1
150673	Strongman	Tim Holmes	0
1157664	Firebreather	Rob Crites	0
36095	Front Gate Barker	William Dick	2
1194944	Wild West Barker	Gene Jones	0
1271755	Oz's Tent Barker	John Lord Booth III	0
220557	Concessioneer	Suzanne Keilly	1
1454303	Girl in Wheelchair's Mother	Shannon Murray	1
1018967	Disgruntled Kansas Man	John Manfredi	0
1032536	Disgruntled Kansas Man	Robert Stromberg	0
1735970	Coochie Girl	Channing Pierce	0
1735971	Clown	Brian Searle	0
1004624	Mr. Baum	Russell Bobbitt	0
1735972	Quadling Greeter	Julie Gershenson	1
1735973	Quadling Man with Flowers	Dan Nelson	0
554395	Quadling Mayor	T.J. Jagodowski	0
1735974	Quadling Woman with Broom	Melissa Exelberth	1
215162	Quadling Farmer	Steve Forbes	0
1735975	Quadling Blacksmith	Arnold Agee	0
1367929	Quadling Baker	Deborah Puette	1
1735976	Quadling Scarecrow Maker	Julius Kline III	0
11465	Quadling Seamstress	Theresa Tilly	1
11464	Quadling Woman	Betsy Baker	1
11462	Quadling Woman	Ellen Sandweiss	1
1591329	Quadling Child	Bella Shepard	0
1735977	Quadling Child	Sasha Kida Reynolds	1
1735978	Quadling Child	Ja'Vonne Cousins	0
1283945	Quadling Child	Victoria Lurz	0
1735979	Quadling Bugle Boy	Dashiell Raimi	0
1735980	Quadling Drummer Boy	Oliver Raimi	0
1735981	Singing & Dancing Munchkin	Brandon Hamilton	0
1735983	Munchkin Carriage Driver	Stevie Lee	2
1735984	Female Munchkin Rebel	Danielle Ragland	0
1192831	Emerald City Man	Bart McCarthy	0
1735985	Emerald City Boy	Nicholas Lindsay-Abaire	0
87445	Emerald City Citizen	Mia Serafino	1
1735988	Emerald City Citizen	Lanika Wise	0
1395067	Emerald City Citizen	Mikayla Bouchard	1
1463346	Emerald City Citizen	Nellie Ann Prestine-Lowery	1
1446431	Emerald City Citizen	Emma Raimi	0
1735989	Emerald City Citizen	Jayne Violassi	0
1735990	Emerald City Citizen	Jay Schwalm	0
1340674	Emerald City Citizen	Wendy Cutler	1
1735991	Emerald City Citizen	James Bird	0
1735993	Emerald City Citizen	Kenneth D. Ciszewski	0
1735996	Emerald City Citizen	Chester F. Guilmet	0
1239388	Emerald City Citizen	Robert Buck	0
1735999	Emerald City Citizen	Jim Moll	0
1182345	Dancing Munchkin	Bernie Allemon	0
1285754	Winkie Guard (uncredited)	Chidi Ajufo	0
1464485	Kansas Girl (uncredited)	Talia Akiva	0
1736003	Quadling Girl (uncredited)	AnnMarie Arcuri	1
1736004	Winkie Guard (uncredited)	Blake Arnold	0
1364762	Emerald City Man (uncredited)	Apollo Bacala	0
1594124	Emerald City Woman (uncredited)	Kelly Bacon	1
1736005	Emerald City Resident (uncredited)	Barb Baker	0
1088597	Quadling Man (uncredited)	Ron Baratono	0
1092687	Mayor's Assistant (uncredited)	Cameron Barnett	0
1471386	Quadling #10 (uncredited)	Robert T. Barrett	0
1736006	Emerald City Man Kevin (uncredited)	Kevin Wayne Berger	0
1736007	Quadling Child (uncredited)	Eric Brakke	0
1736008	Tinker (uncredited)	Wayne Brinston	0
1571435	Winkie (uncredited)	Colin Bryant	0
146414	Tinker (uncredited)	Ron Causey 	0
1736418	Quadling Man (uncredited)	Grady Chambless	0
1736419	Emerald City Citizen (uncredited)	Lee Christian	0
1736420	Kansas Magic Show Patron (uncredited)	Justin Chrzanowski	0
1736422	Emerald City Resident (uncredited)	Will Clarke	0
1558214	Tinker (uncredited)	Michael Clossin	0
1736424	Kansas Gentleman (uncredited)	Zachary Robert Craft	0
1736425	Quadling Carriage Driver (uncredited)	Zac Cunningham	0
1736426	Quadling Farmer (uncredited)	Michael Dault	0
18231	Winkie (uncredited)	Omar Diop	0
1736427	Emerald City Boy (uncredited)	Chase Edwards	0
1736428	Emerald City Girl (uncredited)	Summer Edwards	0
1194878	Theodora's Guard (uncredited)	Neil Ellice	0
1736429	Emerald City Girl (uncredited)	Courtney English	0
1154494	Winkie (uncredited)	John C. Epperson	2
20251	Mayor of Emerald City (uncredited)	Mike Estes	0
1736430	Winkie (uncredited)	Vi Faulkner	0
1207888	Quadling Woman (uncredited)	Jessee Foudray	1
1736431	Emerald City Woman (uncredited)	Carly Francavilla	1
1736432	Emerald City Citizen (uncredited)	Nesti Gee	0
1382396	Winkie (uncredited)	Derrick Gilliam	0
1736433	Tinker (uncredited)	Jacob Godzak	0
1736434	Winkie (uncredited)	John D. Green Sr.	0
1736435	Quadling Man (uncredited)	Ryan Groves	0
1736436	Winkie (uncredited)	Brice Harris	0
1736437	Quadling Man (uncredited)	Nate Hatton	0
1736438	Quadling Woman (uncredited)	Niki Haze	1
1469377	Kansas Man (uncredited)	Ron Heisler	0
1736496	Winkie (uncredited)	Hans Ihlenfeldt	0
1736497	Happy Clown (uncredited)	Roy Kellerman, Jr.	0
1242060	Tinker (uncredited)	Dennis Kleinsmith	0
240758	Emerald City Resident (uncredited)	Doug Kolbicz	0
1014618	Emerald City Man (uncredited)	Bryan Lee	0
1263199	Roustabout / Quadling Chimney Sweeper (uncredited)	Kef Lee	0
1736498	Emerald City Man (uncredited)	Vong Lee	0
1736500	Quadling Woman (uncredited)	Amanda Lewan	1
1736501	Emerald City Resident (uncredited)	Anna Li	0
1736502	Kansas Popcorn Girl (uncredited)	Linda Linsley	1
1736503	Emerald City Citizen (uncredited)	Hannah Madigan	1
1694864	Emerald City Citizen (uncredited)	Davy J. Marr	0
1736504	Quadling (uncredited)	Johnny Mara	0
1736505	Emerald City Resident (uncredited)	Rebecca Mccarthy	0
1736506	Quadling Child (uncredited)	Julia Metas	0
1484161	Baker (uncredited)	Bob Jay Mills	0
1736507	Quadling (uncredited)	Reza Mir	0
1736509	Quadling Woman (uncredited)	Lori Mulligan	0
1561708	Quadling Woman (uncredited)	Jessica Nichole	1
1736511	Emerald City Girl (uncredited)	Fionna Noori	0
933580	Emerald City Resident (uncredited)	Oz Noori	0
1736512	Quadling Woman (uncredited)	Heather Park	0
1736515	Quadling Woman (uncredited)	Jessica Petrik	1
1736517	Quadling (uncredited)	Sage Porter	1
1736518	Quadling (uncredited)	Jor él Quinn	0
128973	Quadling Man (uncredited)	Gene Richards	0
1736520	Winkie Soldier (uncredited)	Lukas Ridge	0
935714	Emerald City Resident (uncredited)	Nicholas Ritz	0
1736521	Fisherman (uncredited)	Ari Rufino	0
1736522	Tinker (uncredited)	Keith Schloemp	0
1736523	Tinker (uncredited)	David Schwager	0
1456724	Quadling Townsperson #2 (uncredited)	Ashley Siloac	1
1736524	Emerald City Resident (uncredited)	Nikki Smith	0
1736525	Roustabout (uncredited)	Paul J. Spear	0
1736526	Emerald City Citizen (uncredited)	Rachel Steele	0
1735577	Quadling Angry Townswoman (uncredited)	Amy Sutherland	1
1736528	Emerald City Resident (uncredited)	Eric Adam Swenson	0
1736529	Winkie (uncredited)	Stephen Tako	0
53760	Munchkin (uncredited)	Kevin Thompson	2
1736530	Quadling Child (uncredited)	Lauren Tischler	0
1736532	Quadling Farah (uncredited)	Francisca Viudes	0
1736533	Tinker (uncredited)	David Waldman	0
1586918	Guard #1 (uncredited)	Filip Watermann	2
1736534	Carriage Coachman (uncredited)	Michael O. Watkins	0
1519716	Winkie (uncredited)	Matt Weinglass	0
1736535	Quadling Woman (uncredited)	Alaina Whitney	1
1736537	Kansas Boy (uncredited)	Jake Williams	0
1736538	Winkie (uncredited)	Otis Winston	0
134	Max Dillon / Electro	Jamie Foxx	2
122889	Harry Osborn / Green Goblin	Dane DeHaan	2
10132	Donald Menken	Colm Feore	2
13242	Aleksei Sytsevich / The Rhino (Uncredited)	Paul Giamatti	2
72855	Felicia Hardy	Felicity Jones	1
2955	Norman Osborn	Chris Cooper	2
107770	Allistar Smythe	B. J. Novak	2
1093920	Woman in Statue Of Liberty Costume	Aidy Bryant	1
93053	Dr. Jallings - Science Investigator	J.D. Walsh	2
163731	Man in Black Suit	Louis Cancelmi	2
190895	Kari	Sarah Gadon	1
171886	Agent Berkley	Frank Deal	2
1634923	Swat Team Leader	Mark Doherty	2
1650216	Jorge	Jorge Vega	2
963767	G-5 Co-Pilot	Bill Heck	2
1232538	Gwen's Cabbie	Teddy Coluca	0
1657458	British Desk Attendant	Helen Stern	1
1657460	Principal Conway	Cal McCrystal	2
176658	Times Square Cop	Anslem Richardson	2
115975	Lead Officer	James Colby	2
1224691	Police Captain	Robert Newman	2
94432	Bodega Cashier	Adrian Martinez	2
1492018	Robber	Thaddeus Phillips	2
281638	Air Traffic Controller	James McCauley	2
1479737	Dispatcher	Rachael McOwen	1
1657469	Dispatcher	David Shabtai	2
928619	Osborn Butler	Greg Connolly 	2
205724	Pilot	Tug Coker	2
1454093	Pilot	Jabari Gray	2
1657471	Jorge's Mother	Jamie Lynn Concepcion	1
1279414	NY1 Reporter	Jessica Abo	1
4893	Chinese Grandpa	Clem Cheung	2
1054326	Armed Robber	Dusan Hyska	2
1286873	Armed Robber	Andrei Runtso	0
1047655	Ravencroft Guard	Brennan Taylor	2
1364346	Ravencroft Guard	Slate Holmgren	2
1657529	Bully	Salvatore L. Rossi	2
1455792	Bully	Drew Beasley	2
1657525	Bully	Matthew Tronieri	2
995205	Bully	Dario Barosso	2
60119	Doctor	Paul Urcioli	2
73933	OsCorp Department Head	Daniel Gerroll	2
132310	Times Square Bystander	Brian McElhaney	2
1266290	Times Square Bystander	Jonathan Braylock	2
1333666	Corporate Lawyer	Steven Hauck	2
1257860	Graduation Parent (uncredited)	Jessica Shea Alverson	1
1657532	Bully	Peter Tzotchev	2
1218185	Pilot	Timothy Adams	2
9828	Sam Flynn	Garrett Hedlund	2
1229	Kevin Flynn / Clu	Jeff Bridges	2
59315	Quorra	Olivia Wilde	1
2547	Alan Bradley / Tron	Bruce Boxleitner	2
60033	Siren	Yaya DaCosta	1
86268	Siren	Serinda Swan	1
20403	Gem	Beau Garrett	1
130108	Siren	Elizabeth Mathis	1
86269	Young Mrs. Flynn	Amy Esterle	0
58371	Sobel	Brandon Jay McLaren	2
109205	Young Sam	Owen Best	0
37980	Green Light Cycle Rider	Michael Teigen	2
67931	Masked DJ's	Daft Punk	0
10874	Chattering Homeless Man	Ron Selmour	2
43263	Bartik	Conrad Coates	2
145110	Half Faced Man	Kis Yurij	2
1459145	Young Man on Recognizer	Darren Dolynski	2
77622	Reporter #2	Catherine Lough Haggquist	1
186373	Reporter #3	Shaw Madson	2
887	Lightning McQueen (voice)	Owen Wilson	2
15897	Mater (voice)	Larry the Cable Guy	2
1246	Holley Shiftwell (voice)	Emily Mortimer	1
3266	Grem (voice)	Joe Mantegna	2
31514	Acer (voice)	Peter Jacobson	2
4252	Luigi (voice)	Tony Shalhoub	2
942993	Darrell Cartrip (voice)	Darrell Waltrip	2
15898	Guido (voice)	Guido Quaroni	2
188559	Brent Mustangburger (voice)	Brent Musburger	0
11355	Siddeley / Leland Turbo (voice)	Jason Isaacs	2
571731	David Hobbscap (voice)	David Hobbs	0
25074	Victor Hugo / Vladimir Trunkov / Ivan the Tow Truck (voice)	Stanley Townsend	2
116317	Fillmore / Combat Ship (voice)	Lloyd Sherr	0
15900	Sarge (voice)	Paul Dooley	2
1117785	Tomber (voice)	Michel Michelis	0
1224968	Crabby (voice)	Sig Hansen	0
22383	Uncle Topolino (voice)	Franco Nero	2
13333	The Queen / Mama Topolino (voice)	Vanessa Redgrave	1
11159	Ramone (voice)	Cheech Marin	2
15899	Flo (voice)	Jenifer Lewis	1
15902	Sheriff (voice)	Michael Wallis	0
381	Lizzie (voice)	Katherine Helmond	1
60074	Otis (voice)	Jeff Garlin	2
1117784	Mel Dorado (voice)	Patrick Walker	0
216294	Lewis Hamilton (voice)	Lewis Hamilton	2
1360072	J. Curby Gremlin (voice)	John Mainieri	0
32532	Tubbs Pacer (voice)	Brad Lewis	2
21125	Van (voice)	Richard Kind	2
3202	Minny (voice)	Edie McClurg	1
1230799	Mater's Computer (voice)	Teresa Gallagher	0
932719	Jeff Gorvette (voice)	Jeff Gordon	0
7879	Additional Voices (voice)	John Lasseter	2
1443765	Frosty (voice)	Mark Winterbottom	2
938203	Fernando Alonso (voice)	Fernando Alonso	0
1443756	Vitaly Petrov (voice)	Vitaly Petrov	0
1443755	Flash (voice)	Jan Nilsson	0
1443757	Memo Rojas (voice)	Memo Rojas	0
1156310	Jacques Villeneuve (voice)	Jacques Villeneuve	2
1443760	Sebastian Vettel (voice)	Sebastian Vettel	0
10859	Hal Jordan / Green Lantern	Ryan Reynolds	2
59175	Carol Ferris	Blake Lively	1
133	Hector Hammond	Peter Sarsgaard	2
504	Senator Hammond	Tim Robbins	2
7242	Abin Sur	Temuera Morrison	2
109942	Carol Ferris at 11	Jenna Craig	1
4602	Martin Jordan	Jon Tenney	2
27107	Jack Jordan	Mike Doyle	2
147719	Jim Jordan	NicK Jandl	0
147720	Jason Jordan	Dylan James	2
60887	Janice Jordan	Leanne Cochran	1
9780	Dr. Amanda Walker	Angela Bassett	1
55934	Tom Kalmaku	Taika Waititi	2
61981	Kilowog (voice)	Michael Clarke Duncan	2
6574	Parallax (voice)	Clancy Brown	2
1195675	Four Star General Caven	Deke Anderson	0
117885	Young Hal	Gattlin Griffith	2
223027	Mom	Tiffany Morgan	0
81321	Jessica Jordan	Amy Carlson	1
565498	Party Guest #1	Laura Cayouette	1
62735	Tomar-Re (uncredited)	Dorian Kingi	2
31	Woody (voice)	Tom Hanks	2
12898	Buzz Lightyear (voice)	Tim Allen	2
13726	Lotso (voice)	Ned Beatty	2
3234	Jessie the Yodeling Cowgirl (voice)	Joan Cusack	1
2232	Ken (voice)	Michael Keaton	2
2395	Stretch the Octopus (voice)	Whoopi Goldberg	1
12900	Rex (voice)	Wallace Shawn	2
7167	Mr. Potato Head (voice)	Don Rickles	2
61964	Mrs. Potato Head (voice)	Estelle Harris	1
1116442	Andy (voice)	John Morris	0
63978	Barbie (voice)	Jodi Benson	1
1096415	Bonnie (voice)	Emily Hahn	0
12133	Andy's Mom (voice)	Laurie Metcalf	1
21485	Slinky Dog (voice)	Blake Clark	0
59357	Chatter Telephone (voice)	Teddy Newton	2
109869	Trixie (voice)	Kristen Schaal	0
8655	Sarge (voice)	R. Lee Ermey	2
7918	Chuckles (voice)	Bud Luckey	2
97051	Molly (voice)	Beatrice Miller	0
10669	Mr. Pricklepants (voice)	Timothy Dalton	2
24358	Bonnie's Mom (voice)	Lori Alan	1
167295	Twitch (voice)	John Cygan	0
7882	Aliens (voice)	Jeff Pidgeon	2
19545	Chunk (voice)	Jack Angel	2
157626	Sparks (voice)	Jan Rabson	2
12901	Sid (voice)	Erik von Detten	2
1381777	Frog (voice)	Jack Willis	2
59784	Additional Voice (voice)	Carlos Alazraqui	2
117081	Additional Voice (voice)	Teresa Ganzel	1
52699	Additional Voice (voice)	Danny Mann	2
84493	Additional Voice (voice)	Mickie McGowan	0
35159	Additional Voice (voice)	Laraine Newman	1
1212864	Additional Voice (voice)	Colleen O'Shaughnessey	1
7960	Additional Voice (voice)	Jerome Ranft	2
8	Additional Voice (voice)	Lee Unkrich	2
1443485	Additional Voice (voice)	Colette Whitaker	0
214701	(voice) (uncredited)	Sherry Lynn	0
86007	(voice) (uncredited)	Jim Ward	0
21028	Kyle Reese	Anton Yelchin	2
56455	Blair Williams	Moon Bloodgood	1
4238	Barnes	Common	0
76542	Prototype T-800	Roland Kickinger	2
11086	General Ashdown	Michael Ironside	2
13724	Virginia	Jane Alexander	1
76543	Morrison	Chris Browning	2
76544	Richter	Chris Ashworth	0
213753	Star	Jadagrace	1
1100	The Terminator	Arnold Schwarzenegger	2
12835	Dominic Toretto	Vin Diesel	2
8167	Brian O'Conner	Paul Walker	2
18918	Hobbs	Dwayne Johnson	2
8171	Tej (as Chris 'Ludacris' Bridges)	Ludacris	2
22123	Mia	Jordana Brewster	1
938	Jakande	Djimon Hounsou	2
57207	Kiet	Tony Jaa	2
997887	Kara	Ronda Rousey	0
1251069	Ramsey	Nathalie Emmanuel	1
6856	Mr. Nobody	Kurt Russell	2
976	Deckard Shaw	Jason Statham	2
61697	Han	Sung Kang	2
155	Sean Boswell	Lucas Black	2
73269	Elena	Elsa Pataky	1
222906	Sheppard	John Brotherton	2
492791	Safar	Ali Fazal	2
1880145	Jack	Miller Kimsey	0
1880146	Jack	Charlie Kimsey	0
1533850	Samantha Hobbs	Eden Estrella	1
1534800	Letty Fan	Gentry White	2
1364893	Female Racer	Iggy Azalea	1
1161711	Male Racer	Jon Lee Brody	0
1578220	Race Starter	Levy Tran	1
118593	Hot Teacher	Anna Colwell	0
1880147	Doctor	Viktor Hernandez	0
80619	Priest	Steve Coulter	2
97844	Merc Tech	Robert Pralgo	0
1381712	Weapons Tech	Antwan Mills	0
1880148	Billionaire	J.J. Phillips	0
1880149	Dominican Priest	Jorge Ferragut	0
1440699	Hana	Sara Sohn	0
1093707	Merc Driver (as Ben Blankenship)	Benjamin Blankenship	0
1880150	DJ	D.J. Hapa	0
224092	DJ	T-Pain	0
54792	Drone Tech	Brian Mahoney	2
1128522	Jasmine	Brittney Alger	1
1451616	Mando	Romeo Santos	0
78804	Advisor	Jocelin Donahue	1
1880151	Field Reporter	Stephanie Langston	0
1448173	Cop	Jorge-Luis Pallo	0
96321	Leo (uncredited / archive)	Tego Calderón	2
116277	Neela (uncredited / archive)	Nathalie Kelley	1
58197	Twinkie (uncredited)	Shad Moss	0
90634	Santos (uncredited / archive)	Don Omar	0
1563213	Race Wars Racer (uncredited)	Klement Tinaj	0
1795034	Brian O'Conner (uncredited)	Caleb Walker	0
1480862	Brian O'Connor (uncredited)	Cody Walker	2
287	Gerry Lane	Brad Pitt	2
175826	Karen Lane	Mireille Enos	1
1027850	Rachel Lane	Abigail Hargrove	1
1186840	Constance Lane	Sterling Jerins	1
78050	Andrew Fassbach	Elyes Gabel	2
7219	Navy Captain Mullenaro	David Andrews	2
1180907	Segen	Daniella Kertesz	0
119297	Jurgen Warmbrunn	Ludi Boeken	2
2607	Thierry Umutoni	Fana Mokoena	0
1180908	Tomas	Fabrizio Zacharee Guido	0
52	Ex-CIA Agent	David Morse	2
28657	Parajumper	Matthew Fox	2
12982	W.H.O. Doctor	Peter Capaldi	2
677	W.H.O. Doctor	Moritz Bleibtreu	2
17018	W.H.O. Doctor	Ruth Negga	1
23440	Russian Fighter	Konstantin Khabenskiy	0
1221048	Argus Sailor	Troy Glasgow	2
19704	Market Attacker	Nick Bartlett	2
1694513	Israeli Camp Refugee	Julia Levy-Boeken	1
1360156	Camp Humphrey's Soldier	Ann Ogbomo	0
5530	Charles Xavier / Professor X (Young)	James McAvoy	2
17288	Erik Lehnsherr / Magneto (Young)	Michael Fassbender	2
72129	Raven Darkholme / Mystique	Jennifer Lawrence	1
3292	Hank McCoy / Beast	Nicholas Hoult	2
55089	Peter Maximoff / Quicksilver	Evan Peters	2
1056053	William Stryker	Josh Helman	2
64439	Clarice Ferguson / Blink	Fan Bingbing	1
1010189	Roberto da Costa / Sunspot	Adan Canto	2
121868	James Proudstar / Warpath	Booboo Stewart	0
429	Alex Summers / Havok	Lucas Till	2
1284084	Mortimer Toynbee / Toad	Evan Jonigkeit	0
173658	Congresman Davis	Len Wein	2
934847	Congressman Parker	Chris Claremont	0
4250	Senator Brickman	Michael Lerner	2
1322030	Ink	Gregg Lowe	0
7013	President Richard Nixon	Mark Camacho	2
9032	Man with a movie camera	Bryan Singer	2
1738056	En Sabah Nur	Brendan Pedder	0
1240748	Groundskeeper	Harry Standjofski	2
64674	Pinstripe Mafioso	Mike Dopud	2
102852	Col. Sanders	Andreas Apergis	2
1691154	Vietnam MP Guard	Robert Montcalm	0
1519259	Mutant Soldier	Jaa Smith-Johnson	2
96594	Quarantine Doctor	Alex Ivanovici	0
1674956	Congressman McCarter	François Paquette	0
171955	Trask Secretary	Zabryna Guevara	0
929943	Ms. Maximoff	Zehra Leverman	0
147892	Pentagon Tour Guide	Angela Galuppo	0
1207366	Surveillance Guard	Victor Cornfoot	0
522169	Surveillance Guard	Brent Skagford	2
131335	Pentagon Cook	Kyle Gatehouse	2
1320015	Pentagon Elevator Guard	Taris Tyler	0
139622	Armed Kitchen Guard	Darryl Scheelar	0
1300745	General Nhuan	Thai-Hoa Le	2
1671572	Vietnamese Captain	Johnny Tran	2
141741	General Petrov	Gregory Hlady	0
29461	Peace Summit Reporter	Julian Casey	0
60906	Nixon Aide	Robert Crooks	2
44237	Secretary of Defense	Matt Cooke	2
7009	US Army General	Tim Post	2
198540	Desk Anchor	Jason Deline	0
81418	French Emergency Nurse	Karine Vanasse	1
1691173	French TV Reporter	Pierre LeBlanc	2
198751	Female Traveler	Jude Beny	0
115596	Blue Suit Traveler	Arthur Holden	0
56418	Airport Backpacker	Sean Curley	2
1251615	Flight Attendant	Susanna Fournier	0
1684713	White House Reporter	Andrew Peplowski	2
1448201	White House Ticket Man	Moe Jeudy-Lamour	2
105496	Secret Service Agent	Neil Napier	0
1148496	Potomac River Cop	Mizinga Mwinga	0
1784732	Chinese Translator	Jimmy Chan	0
62064	James T. Kirk	Chris Pine	2
17306	Spock	Zachary Quinto	2
1372	Dr. Leonard 'Bones' McCoy	Karl Urban	2
11108	Montgomery 'Scotty' Scott	Simon Pegg	2
68842	Hikaru Sulu	John Cho	2
21089	Christopher Pike	Bruce Greenwood	2
27811	Alexander Marcus	Peter Weller	2
76242	Thomas Harewood	Noel Clarke	2
180997	Rima Harewood	Nazneen Contractor	1
13024	Ensign Brackett	Amanda Foreman	1
1192492	Navigation Officer Darwin	Aisha Hinds	1
58508	Science Officer 0718	Joseph Gatt	2
62093	Klingon	Sean Blakemore	2
224182	Klingon	Nick E. Tarabay	2
78494	Captain Abbot	Beau Billingslea	2
1352682	Doctor	Jack Laufer	0
1386113	Girl	Katie Cockrell	1
88706	Girl	Kellie Cockrell	1
41421	Winona Kirk	Jennifer Morrison	1
1749	Spock Prime	Leonard Nimoy	2
1271733	Madeline	Kimberly Arland	0
1228940	Ensign Froman	Jonathan Dixon	0
1051473	Lead Nibiran	Jeremy Raymond	2
60946	Lieutenant Chapin	Jay Scully	2
178452	Nibiran	Tony Guma	2
1110406	Lucille Harewood	Anjini Taneja Azhar	0
154702	Cupcake	Jason Matthew Smith	2
1225974	U.S.S. Enterprise Shuttle Ensign	Seth Ayott	0
62710	Torpedo Security	Marco Sanchez	2
119699	Uniformed Mercenary	Lee Reherman	2
1129806	U.S.S. Vengeance Officer	Usman Ally	0
19508	U.S.S. Vengeance Bridge Officer	Nolan North	2
58330	U.S.S. Vengeance Bridge Officer	James Hiroyuki Liao	2
162924	U.S.S. Vengeance Ensign	Rob Moran	2
5575	Starfleet Admiral	Akiva Goldsman	2
1386122	U.S.S. Enterprise Bridge Crew	Gianna Simone	0
204384	U.S.S. Enterprise Bridge Crew	Rene Rosado	0
1386119	Starfleet Admiral	Berit Francis	0
1386120	Starfleet Admiral	Benjamin P. Binswanger	0
1278368	Transport Officer	Christopher Doohan	0
1386121	U.S.S. Enterprise Bridge Crew	Andy Demetrio	0
1386123	U.S.S. Enterprise Bridge Crew	Jacquelynn King	0
1386124	U.S.S. Enterprise Bridge Crew	Long Tran	0
1386125	U.S.S. Enterprise Bridge Crew	Ningning Deng	0
1386126	U.S.S. Enterprise Bridge Crew	Jodi Johnston	0
1386127	Lady V	Colleen Harris	0
56448	U.S.S. Enterprise Security	Jeff Chase	2
1160181	U.S.S. Enterprise Red Shirt	Ser'Darius Blain	2
5141	Moto	Heather Langenkamp	1
1384191	Bar Girl	Melissa Paulo	0
182272	San Francisco Woman	Cynthia Addai-Robinson	1
1386128	U.S.S. Enterprise Nurse	Monisola Akiwowo	0
1386129	Shuttle Pilot	Paul K. Daniel	2
1386131	San Francisco Bar Patron	Drew Grey	0
1386130	U.S.S. Enterprise Crew	David C. Waite	0
1386132	U.S.S. Vengeance Security	Douglas Weng	0
1386134	San Francisco Resident	Charlie Haugk	0
1275519	San Francisco Resident	Max Chernov	0
1386136	San Francisco Resident	Marc Primiani	0
1275938	San Francisco Resident	Jesper Inglis	0
1386138	Nibiru Child	Jacob Rhodes	0
1386140	Nibiru Child	Kentucky Rhodes	0
1386141	Shaku	Anthony Wilson	0
1386144	Starfleet Ceremonial Guard	Eric Greitens	0
1386145	Starfleet Ceremonial Guard	Melissa Steinman	0
1386146	Starfleet Ceremonial Guard	Adam McCann	0
1386147	Starfleet Ceremonial Guard	Jon Orvasky	0
181879	Starfleet Memorial Admiral	Gerald W. Abrams	0
1275520	Starfleet Memorial Admiral	James McGrath	0
1386148	Additional Voices (voice)	Brian T. Delaney	2
78432	Additional Voices (voice)	Arlen Escarpeta	2
1277452	Additional Voices (voice)	Joe Moses	0
164614	Additional Voices (voice)	David Sobolov	2
71536	Additional Voices (voice)	Matthew Wood	2
60279	Additional Voices (voice)	Fred Tatasciore	2
86170	Additional Voices (voice)	Audrey Wasilewski	1
931939	Ensign Spyke (uncredited)	Tom Archdeacon	2
1039680	NYU Nurse (uncredited)	Britanni Johnson	0
1161712	Bar Patron (uncredited)	Hiram A. Murray	2
1386149	Additional Voices (voice)	Chris Gardner	0
135818	Additional Voices (voice)	Julianne Buescher	1
1386150	Additional Voices (voice)	Joe Hanna	0
1235786	Additional Voices (voice)	David Acord	0
1386151	Additional Voices (voice)	Ellie Newlands	0
1386152	Additional Voices (voice)	Candice Renee	0
1386153	Additional Voices (voice)	Emily Towers	0
1386154	Additional Voices (voice)	Gina Hirsch	0
3061	Elmont	Ewan McGregor	2
1665	Crawe	Eddie Marsan	2
1125	Wicke	Ewen Bremner	2
53916	General Entin	Ralph Brown	2
202760	Fye	Andrew Brooke	0
27632	Fumm	Ben Daniels	0
3072	Jack's Dad	Daniel Lapaine	2
590936	Horse Merchant	Christian Wolf-La'Moy 	2
590937	The kings Foot Soldier	Duncan JC Mais 	0
590938	Soothsayer	Santi Scinelli 	0
590939	Jack's Mum	Caroline Hayes	0
126042	Tour Guide	Alex MacQueen	0
33310	The Queen	Tandi Wright	1
138161	Badger	Lee Boardman	0
36662	Daisy Buchanan	Carey Mulligan	1
33192	Tom Buchanan	Joel Edgerton	2
1133349	Jordan Baker	Elizabeth Debicki	1
52848	Myrtle Wilson	Isla Fisher	1
76512	George Wilson	Jason Clarke	2
35780	Meyer Wolfsheim	Amitabh Bachchan	2
236851	Teen Jay Gatsby	Callan McAuliffe	2
205474	Catherine	Adelaide Clemens	1
45211	Dan Cody	Steve Bisley	2
44838	Herzog	Richard Carter	2
77496	Michaelis	Vince Colosimo	2
38665	Owl Eyes	Max Cullen	2
1272936	The Boss-Probity Trust	Mal Day	0
1272937	Pammy	Charlize Skinner	0
1272942	Klipspringer	Brendan Maclean	0
123884	Mrs. McKee	Kate Mulvany	0
1433766	The Twins	Kahlia Greksa	0
1272938	Barman	Garrett William Fountain	0
1272939	Walter Chase	David Furlong	0
1272940	Police Commissioner	Daniel Gill	0
1272941	Trimalchio the Orchestra Leader	Iota	2
150536	Benny McClenahan	Barry Otto	2
1243767	Newton Orchid	John O'Connell	2
61342	Clerk - Probity Trust	Ben McIvor	2
214545	Clerk - Probity Trust	Brian Rooney	2
61784	Head Waiter - Speakeasy	Goran D. Kleut	0
1889000	Clarinetist	Denning Isles	0
1102453	Extra (uncredited)	Ryan Cooper	2
131	Prince Dastan	Jake Gyllenhaal	2
55412	Seso	Steve Toussaint	2
20286	Garsiv	Toby Kebbell	2
52890	Tus	Richard Coyle	2
32556	King Sharaman	Ronald Pickup	2
54810	Bis	Reece Ritchie	0
587354	Hassansin Leader	Gísli Örn Garðarsson	2
15913	Hassansin Porcupine	Claudio Pacifico	0
169691	Hassansin Whip Man	Thomas DuPont	0
1327299	Tamina's Maid Servant	Farzana Dua Elahe	0
56365	Raleigh Becket	Charlie Hunnam	2
18054	Mako Mori	Rinko Kikuchi	0
94864	Herc Hansen	Max Martini	2
112692	Aleksis Kaidanovsky	Robert Maillet	2
1038379	Chuck Hansen	Robert Kazinsky	2
118590	Tommy T	Larry Joe Campbell	2
15376	Miles	Brad William Henke	2
5365	Ops Tendo Choi	Clifton Collins Jr	2
142193	Yancy Becket	Diego Klattenhoff	2
10847	Wizened Man	Santiago Segura	2
1428550	Raleigh and Yancy's Mom	Jane Watson	0
1480855	Hannibal Chau Thug	Jung-Yul Kim	0
83423	Lt. A. Kaidanovsky	Heather Doerksen	1
5925	Officer	Joshua Peace	2
559416	Young Mako	Mana Ashida	0
86237	Captain Merrit	Joe Pingue	2
1226806	McTighe	Milton Barnes	0
100464	1st Officer	Brian Frank	2
1683877	Gipsy Danger AI (voice)	Ellen McLain	0
4569	Old Man on Beach	David Fox	2
1255174	Child	Jake Goodman	2
41465	American UN Representative	Robin Thomas	2
1379395	British UN Representative	Julian Barnes	2
46906	Canadian UN Representative	David Richmond-Peck	2
224144	Engineer	Sebastian Pigott	2
1683916	Chinese Girl in Anti-Kaiju Refuge	Victoria Marie	0
1176955	TV Reporter	J.C. Kenny	0
1683922	Raleigh and Yancy's Dad	Robert Morse	2
59613	Saltchuck Crew	Mike Chute	2
1683931	Saltchuck Crew	Duncan McLeod	0
1517893	Saltchuck Crew	Louis Paquette	0
59198	Saltchuck Crew	Matthew G. Taylor	2
1239394	UN Representative	Frank Nakashima	2
1683938	UN Representative	Terry Belleville	0
1683941	UN Representative	Farzad Sadrian	0
125579	UN Representative	Mishu Vellani	0
231140	UN Representative	Clive Walton	0
1003550	Young Mako's Father	Peter Kosaka	2
1683943	Young Mako's Mother	Yiren Stark	0
6949	Bruce Brazos	John Malkovich	2
83586	Jerry Wang	Ken Jeong	2
3910	National Intelligence Director	Frances McDormand	1
236048	Carly	Rosie Huntington-Whiteley	1
18352	Dylan	Patrick Dempsey	2
21088	Dutch	Alan Tudyk	2
1736	Sideswipe (voice)	James Remar	2
60602	Roadbuster/Amp (voice)	Ron Bottitta	2
206334	Accuretta Executive	Scott Krinsky	2
87957	Laserbeak (voice)	Keith Szarabajka	2
14102	Que / Wheeljack (voice)	George Coe	2
1318952	Mailroom Worker	Derek Miller	0
1517868	Accuretta Worker	Katherine Sigismund	1
1585120	NEST Technician (uncredited)	David Hill	2
95875	Mailroom Worker	Andrew Daly	2
58925	Eddie	Lester Speight	2
106843	Buzz Aldrin	Buzz Aldrin	2
95777	Bill O'Reilly	Bill O'Reilly	0
11886	Dino (voice)	Francesco Quinn	2
1465852	Mailroom Worker	Stephen Monroe Taylor	0
3	Indiana Jones	Harrison Ford	2
5538	'Mac' George Michale	Ray Winstone	2
650	Marion Ravenwood	Karen Allen	1
5049	Professor Oxley	John Hurt	2
36218	Russian Soldier	Andrew Divoff	2
52761	Dovchenko	Igor Jijikine	2
52762	Russian Soldier	Pavel Lychnikoff	2
52760	General Ross	Alan Dale	2
58210	Cemetery Warrior	Ernie Reyes, Jr.	2
173269	Russian Suit	Dimitri Diatchenko	2
109667	Russian Suit	Ilia Volok	2
1133682	Russian Soldier	Emmanuel Todorov	0
1427626	Russian Soldier	Venya Manzyuk	0
155978	Taylor	Joel Stoffer	2
43776	Smith	Neil Flynn	2
122596	Minister	V.J. Foster	0
1421688	Student in Library	Chet Hanks	0
1427682	Letterman	Brian Knutson	2
1427688	Letterman	Dean Grimes	0
8700	Slugger	Sasha Spielberg	0
1427692	Diner Waitress	Nicole Luther	0
1427695	Malt Shop Teen	Sophia Stewart	0
1427698	College Brawler	Chris Todd	0
1365062	College Brawler	Dennis Nusbaum	0
1427700	Teenage Boy	T. Ryan Mooney	0
1058026	Teenage Girl	Audi Resendez	0
204408	Teenage Girl	Helena Barrett	0
1031791	Fast Speaking Inmate	Carlos Linares	0
1427707	Shouting Inmate	Gustavo Hernandez	0
1427708	Sanitarium Nun	Maria Luisa Minelli	0
1427711	Cemetery Warrior	Nito Larioza	0
1427715	Cave Warrior	Jon Valera	0
1427716	M.P. in Guard Hut	Kevin Collins	0
1656530	College Student (uncredited)	Steven A. Miller	0
963134	Arlo (voice)	Raymond Ochoa	0
1476748	Spot (voice)	Jack Bright	0
1540680	Young Libby (voice)	Maleah Nipay-Padilla	0
1540681	Young Buck (voice)	Ryan Teeple	0
1540682	Young Arlo (voice)	Jack McGraw	0
1348591	Buck (voice)	Marcus Scribner	2
18324	Thunderclap (voice)	Steve Zahn	2
1540683	Downpour (voice)	Mandy Freund	0
1406885	Coldfront (voice)	Steven Clay Hunter	0
60460	Nash (voice)	A.J. Buckley	2
87176	Bubbha (voice)	David Boat	0
1434508	Lurleane (voice)	Carrie Paff	0
204445	Pervis (voice)	Calum Grant	0
9015	Mérida (voice)	Kelly Macdonald	1
9013	Lord MacGuffin / Young MacGuffin (voice)	Kevin McKidd	2
24264	Lord Macintosh (voice)	Craig Ferguson	2
1113604	Young Merida (voice)	Peigi Barker	0
1102427	Young Macintosh (voice)	Steven Cree	0
137262	The Crow (voice)	Steve Purcell	2
1333216	Wee Dingwall (voice)	Callum O'Neill	0
9152	Martin (voice)	Patrick Doyle	2
1052100	Maudie (voice)	Sally Kinghorn	0
1438685	Maudie (voice)	Eilidh Fraser	0
568657	Jaylah	Sofia Boutella	1
592496	Manas/Anderson Le	Joe Taslim	2
1095524	Kalara	Lydia Wilson	1
1590377	Kalara (voice)	Sara Forsberg	1
1006731	Ensign Syl	Melissa Roxburgh	0
17305	Commander Finnegan	Greg Grunberg	2
205179	Fi'Ja	Danny Pudi	2
936415	Zavanko	Kim Kold	2
119758	Tyvanna	Anita Brown	1
65779	Ben	Doug Jung	0
85505	Wadjet	Dan Payne	2
74242	Teenaxi Leader (voice)	Shea Whigham	2
1686562	Starfleet Official	Jeff Bezos	0
1397812	Orion Girl	Fiona Vroom	0
1502989	Night Watch Captain	Priya Rajaratnam	0
936932	Injured Red Shirt	Adam DiMarco	2
1641530	USSE Bridge Crew	Roxanne Fernandes	0
1366510	Hider	Fraser Aitcheson	0
140182	Blue Shirt	Matthew MacCaull	0
1225951	Blue Shirt	Emy Aneke	0
1516834	Control Tower Technician	Jennifer Cheon	1
939589	Control Tower Technician	Jarod Joseph	2
670	WALL·E / M-O (voice)	Ben Burtt	2
72754	EVE (voice)	Elissa Knight	0
20753	Shelby Forthright, BnL CEO	Fred Willard	2
11074	Mary (voice)	Kathy Najimy	1
72755	AUTO (voice)	MacInTalk	0
78317	Axiom Passenger (voice)	Bob Bergen	2
12890	Axiom Passenger (voice)	Pete Docter	2
86006	Axiom Passenger (voice)	Paul Eiding	2
84494	Axiom Passenger (voice)	Donald Fullilove	0
225986	PR-T (voice)	Lori Richardson	1
7	Lifeguard Bot (voice)	Andrew Stanton	2
99639	Hoverchair Mother (uncredited)	Kim Kopf	0
7929	BURN-E (voice) (uncredited)	Angus MacLane	0
1174938	Blond Boy in Commercial (uncredited)	Garrett Palmer	0
66	Det. James Carter	Chris Tucker	2
18897	Chief Insp. Lee	Jackie Chan	2
9195	Kenji	Hiroyuki Sanada	0
2245	George	Yvan Attal	2
3556	Det. Revi	Roman Polanski	2
41894	Soo Yung	Zhang Jingchu	0
4492	Capt. William Diel	Philip Baker Hall	2
145633	Genevieve	Noémie Lenoir	1
164945	Zoe (uncredited)	Sarah Shahi	1
16145	Dragon Lady	Youki Kudoh	1
21629	Ambassador Han	Tzi Ma	2
13314	Sister Agnes	Dana Ivey	1
39829	Master Yu	Henry O	2
215130	Marsha	Mia Tyler	0
21631	Chinese Foreign Minister	Michael Chow	0
554599	French Assassin	Kentaro	0
1577430	Dressing Room Girl	Ann Christine	1
3036	Jackson Curtis	John Cusack	2
2956	Kate Curtis	Amanda Peet	1
5294	Adrian Helmsley	Chiwetel Ejiofor	2
9030	Laura Wilson	Thandie Newton	1
17485	Carl Anheuser	Oliver Platt	2
17867	Dr. Gordon Silberman	Tom McCarthy	0
57755	Charlie Frost	Woody Harrelson	2
2047	President Wilson	Danny Glover	2
83852	Noah Curtis	Liam James	2
74227	Lilly Curtis	Morgan Lily	1
101014	Tamara	Beatrice Rosen	1
101017	Sasha	Johann Urb	2
21722	Professor Frederic West	John Billingsley	2
101015	Tenzin	Chin Han	2
101016	Nima	Osric Chau	2
86633	Grandma Sonam	Lisa Lu	1
41664	Grandfather Sonam	Chang Tseng	2
44150	Harry Helmsley	Blu Mankuma	2
18364	Tony Delgatto	George Segal	2
230	Captain Michaels	Stephen McHattie	2
16756	Dr. Satnam Tsurutani	Jimi Mistry	2
153516	Scotty	Ryan McDonald	0
31960	Yuri Karpov	Zlatko Burić	2
1615554	Oleg	Philippe Haussmann	2
967933	Alec	Alexandre Haussmann	2
1055157	Cruise Ship Lady	Beverley Elliott	1
5274	Roland Picard	Patrick Bauchau	0
206669	Mrs. Birnbaum	Tanya Champoux	1
92079	German Chancellor	Merrilyn Gann	1
76828	Ark Communications Officer	Patrick Gilmore	2
79151	Ark Communications Officer	Dean Marshall	2
60601	Ark Boarding Officer	Viv Leacock	2
116400	Ark Boarding Officer	Chris Boyd	2
158560	Ark Tech Officer	Jason Diablo	2
143329	Arc Naval Officer	Anna Mae Routledge	1
203294	Ark Bridge Crew	Jill Morrison	1
60614	Ark Bridge Crew	Chad Riley	2
1366442	Ark Bridge Crew	Jason Anthony Griffith	2
62919	Ark Bridge Crew	Alex Zahara	2
177885	AF1 Science Officer	Donna Yamamoto	1
60609	AF1 Science Officer	Doron Bell	2
1221020	AF1 Lieutenant	David Orth	2
42711	AF1 Officer	Ty Olsson	2
1615565	Governor	Lyndall Grant	2
62173	Aparna	Agam Darshi	1
190944	Paris Reporter	Alexandra Castillo	1
1205803	Angry Billionaire	John Mee	0
41432	Cruise Ship Lady	Candus Churchill	1
205881	Vegas Tow Truck Driver	Luis Javier	2
206	Ebenezer Scrooge, Ghost of Christmas Past, Ghost of Christmas Present, Ghost of Christmas Yet To Come	Jim Carrey	2
558926	Tattered Caroler	Sage Ryan	2
1074139	Tattered Caroler / Well-Dressed Caroler	Amber Gainey Meade	0
492081	Tattered Caroler / Beggar Boy / Young Cratchit Boy / Ignorance Boy / Young Boy with Sleigh	Ryan Ochoa	2
1074140	Tattered Caroler / Well-Dressed Caroler	Bobbi Page	0
61831	Beggar Boy / Young Cratchit Girl / Want Girl	Sammi Hanratty	1
79635	Fat Cook / Portly Gentleman #2 / Business Man #3	Julian Holloway	2
5472	Fred	Colin Firth	2
2130	Portly Gentleman #1 / Dick Wilkins / Mad Fiddler / Guest #2 / Business Man #1	Cary Elwes	2
32	Fan / Belle	Robin Wright	1
382	Fezziwig / Old Joe	Bob Hoskins	2
72305	Mrs. Cratchit	Lesley Manville	1
96349	Belinda Cratchit	Molly C. Quinn	1
68287	Caroline's Husband	Callum Blue	2
38673	Caine Wise	Channing Tatum	2
48	Stinger Apini	Sean Bean	2
37632	Balem Abrasax	Eddie Redmayne	2
230680	Titus Abrasax	Douglas Booth	2
89822	Kalique Abrasax	Tuppence Middleton	1
1216606	Famulus	Gugu Mbatha-Raw	1
109319	Diomika Tsing	Nikki Amuka-Bird	1
47625	Gemma Chatterjee	Christina Cole	0
1360221	Nesh	Nicholas A. Newman	0
178622	Phylo Percadium	Ramon Tikaram	2
1238461	Greeghan	Ariyon Bakare	0
33394	Aleksa	Maria Doyle Kennedy	1
1394352	Aunt Nino	Frog Stone	0
971049	Ibis	David Ajala	2
21688	Razo	Bae Doona	1
280	Seal and Signet Minister	Terry Gilliam	2
556356	Katharine Dunlevy	Vanessa Kirby	1
19655	Maximilian Jones	James D'Arcy	2
1223149	Tskalikin	Simon Dutton	0
25451	Falque	Spencer Wilding	0
1394330	Abrasax Alien	Demi Kazanis	1
93111	Vladie	Kick Gurry	2
1084851	Kiza	Charlotte Beaumont	1
1394331	Sargon / Greegan	Neil Fingleton	2
3555	Vasilliy Bolodnikov	Jeremy Swift	2
1369057	Debutante	Katherine Cunningham	0
1052603	Royal guard	Luke Neal	2
114252	Chicanery Night	Edward Hogg	2
1388891	Commonwealth	Jozef Aoki	2
1368433	Plinth	Tamela D'Amico	0
1347128	Titus Handmaiden	Kara Lily Hayworth	0
1089920	Trigger	Tim Connolly	0
1394335	Peacock Hybrid	Alexandra Fraser	1
1394337	Synth	Charlotte Rickard	0
1394339	Shiro Miku	Hazel D'Jan	0
1394344	Zoe	Eric Ian	0
1383511	Shawn	Derek Blankenship	0
1394342	Aegis Crew	Symara A. Templeman	0
1394341	Cyber Beauty	Ekaterina Zalitko	0
1394345	Pedistrian	Sharon Coleman	0
1394346	Handmaiden	Georgia Winters	0
1394347	Servant	Mark Norris	2
1278780	Droid	Edd Osmond	0
1394343	Servant	Jon Norris	0
1394348	Robot Servant	Elina Alminas	0
1394350	Dante Rothemere	Andy Ahrens	2
1394351	Lime Orism	Jermaine Tindell	0
1218685	Droid	Karen Anderson	0
1379944	Kalique Gene Tech	Vander McLeod	0
1394354	Walker Dunlevy	Thomas Gaitsch	0
1394355	Zeno	Oleg Nasobin	0
1347063	Gynaecological Nurse	Sarah Campbell	0
1394356	Russian Refugee	Olia Klein	0
1394357	Test subject	Kenny Knight	0
1394358	Royal Guard	Rimmel Daniel	0
1356007	Bureaucrat	Sarah Crowden	0
91932	Pilot	Cliff Fleming	2
14470	Doctor	Sean Baker	2
1394359	Chicago Pedestrian (uncredited)	Nathan Geist	0
1298706	Chicago Pedestrian (uncredited)	Raiden Integra	0
1394360	Chicago Pedestrian (uncredited)	Ryan Browning Johnson	0
1394361	Kalique Coder (uncredited)	Clem So	0
1632611	Bureaucrat	Claire Benedict	0
234352	Jane Porter	Margot Robbie	1
1026019	Captain Kerchover	Casper Crump	2
1029045	Muviro	Yule Masiteng	0
21343	Captain Moulle	Ben Chaplin	2
1795843	Wasimbu	Sidney Ralitsoele	0
57461	Mr. Frum	Simon Russell Beale	2
1388917	Kwete	Osy Ikhile	0
1795844	Kolo	Mens-Sana Tamakloe	0
1795845	Kimanga	Edward Apeagyei	0
1659946	Kasai	Ashley Byam	2
1500875	Kulonga	Charles Babalola	2
1795846	Kerchak	William Wollen	0
1503072	Eshe	Mimi Ndiweni	1
219737	Akut	Matt Cross	0
1502431	Kala	Madeleine Worrall	1
1192006	Young Tarzan	Rory J. Saper	0
231674	John Clayton II	Hadley Fraser	2
139654	Alice Clayton	Genevieve O'Reilly	1
1795847	Lord Stanhope	Paul Hamilton	0
94021	Lord Knutsford	Christopher Benjamin	2
1641528	Kuba Villager	Abi Adeyemi	0
1641527	Kuba woman	Joy Isa	0
60416	Force Publique	Alex Ferns	0
1641529	Carriage Passenger	Liv Hansen	0
1563429	Carriage Rider	Alicia Woodhouse	0
1635843	Belgian Conscript	Matt Townsend	0
1363049	Mercenary	Lasco Atkins	2
5531	Ginarrbrik	Kiran Shah	2
2467	Father Christmas	James Cosmo	2
5532	Mrs. Pevensie	Judy McIntosh	1
5533	Mrs. MacReady	Elizabeth Hawthorne	1
5534	Oreius	Patrick Kake	2
5535	Older Lucy	Rachael Henley	0
5536	Older Edmund	Mark Wells	0
2050	Older Peter	Noah Huntley	2
5537	Older Susan	Sophie Winkleman	1
5539	Mrs. Beaver	Dawn French	1
4757	Fox	Rupert Everett	2
5540	Gryphon	Cameron Rhodes	0
5541	Philip the Horse (voice)	Philip Steuer	2
5542	Wolf	Sim Evan-Jones	0
147	Maugrim	Michael Madsen	2
9827	Moira MacTaggert	Rose Byrne	1
1001657	Jean Grey / Phoenix	Sophie Turner	1
1034681	Scott Summers / Cyclops	Tye Sheridan	2
113505	Kurt Wagner / Nightcrawler	Kodi Smit-McPhee	2
1452045	Warren Worthington III / Angel	Ben Hardy	0
1253199	Ororo Munroe / Storm	Alexandra Shipp	1
1452046	Jubilation Lee / Jubilee	Lana Condor	1
81364	Elizabeth 'Betsy' Braddock / Psylocke	Olivia Munn	1
1623329	Horseman - Pestilence	Warren Scherer	0
1547887	Horseman - Famine	Rochelle Okoye	1
102744	Horseman - Death	Monique Ganderton	1
1796383	Lead Conspiracy Guard	Abdulla Hamam	0
1547888	Conspirator Guard	Hesham Hammoud	0
1796384	Conspirator Guard	Antonio Daniel Hidalgo	0
1493134	High Priest	Al Maini	0
1796387	Old Apocalypse	Berdj Garabedian	0
12851	Scott's Teacher	Ally Sheedy	1
1381295	School Jock	Anthony Konechny	2
1433019	School Cheerleader	Emma Elle Paterson	0
1264152	Fight Announcer	Manuel Sinor	0
1796388	Defeated "Blob"	Gustave Ouimet	0
1796389	Electric Panel Guard	Lukas Penar	0
1389492	Mr. Summers	Ryan Hollyman	0
99181	Mrs. Summers	Joanne Boland	1
1796390	Falafel Shop Owner	Nabeel El Khafif	0
96592	Clan Akkaba Leader	Manuel Tadros	0
1796391	Clan Akkaba Disciple	Abanoub Andraous	0
1796392	Clan Akkaba Disciple	Aladeen Tawfeek	0
1447280	Magda	Carolina Bartczak	0
1796393	Nina	T. J. McGibbon	0
1796394	Cairo Shoe Shop Vendor	Davide Chiazzese	0
1796395	Milosz	Sebastian Naskrent	0
1796396	Polish Worker	Boris Sichon	0
1796397	Lead Polish Inspector	Martin Skorek	2
1239510	Jakob	Kamil Orzechowski	0
1796398	Polish Police Archer	Michael Terlecki	0
1796399	Threatening Cairo Vendor	Ahmed Osman	0
1337607	Egyptian Street Vendor	Ziad Ghanem	0
1796400	Egyptian Street Vendor	Moataz Fathi	0
18818	Caliban	Tómas Lemarquis	2
1796401	CNN Reporter	James Loye	0
1796402	News Anchor	Herb Luft	0
554456	Herself	Joan Lee	0
32031	Pentagon General Hastings	Stephen Bogaert	2
55378	Pentagon General Radford	John Bourgeois	2
180683	Defense Secretary Weisberg	Dan Lett	0
1015896	Military Official Brown	Adrian G. Griffiths	2
83029	Military Submarine Official	Shawn Campbell	2
51389	Air Force Official	Joe Cobden	2
1796406	Foyer Student	Henry Hallowell	0
1796408	Fish Bowl Girl	Danielle Dury	0
1747113	Kissing Girl	Naomi Frenette	1
1796414	Kissing Guy	Aj Risi	0
1294171	Computer Guy	Raphaël Dury	0
1796415	Darts Guy	Ian Rosenberg	0
1796416	Tab Girl	Erika Heather Mergl	0
1796417	Pizza Dog	Tauntaun	0
1796418	Student in Drapes	Mary-Piper Gaudet	0
1796419	Student in Drapes	Josh Madryga	0
1796420	Student in Drapes	Scott Cook	0
1470370	Student in Drapes	Allen Keng	2
1796421	Student in Drapes	Tally Rodin	0
1796422	Table Surfing Student	Francis Limoges	0
1796423	Table Surfing Student	Tsu-Ching Yu	0
1569228	Alkali Soldier	Karl Walcott	2
180996	Alkali Guard	Desmond Campbell	2
1796425	Alkali Communications Officer	Ian Geldart	0
9039	Confused Tech	John Ottman	2
1796431	Kenyan Teacher	Linda Joyce Nourse	0
6752	Pentagon Scientist	Zeljko Ivanek	2
1015987	Fishing Boat Captain	Christopher B. MacCabe	2
1676049	Finsherman	Chris Cavener	2
1796432	Finsherman	Ronald Tremblay	0
1193060	Harbor Master	Joseph Bellerose	0
1099770	Harbor Employee	Philippe Hartmann	2
1796433	Russian Submarine Sailors	Sebastien Teller	0
1796434	Russian Submarine Sailor	Alexander Peganov	0
1796435	US Weapons Technician	Simon Therrien	0
1796436	US Weapons Technician	Patrice Martre	0
1604604	Mystery Man	James Malloch	0
1327614	Salesperson (uncredited)	Vladimir Alexis	0
1810	Joker	Heath Ledger	2
6383	Harvey Dent	Aaron Eckhart	2
1579	Rachel	Maggie Gyllenhaal	1
53651	Ramirez	Monique Gabriela Curnen	1
57597	Wuertz	Ron Dean	2
21315	Maroni	Eric Roberts	2
13939	Chechen	Ritchie Coster	2
1904	Engel	Anthony Michael Hall	2
128386	Loeb	Colin McFarlane	2
34544	Reese	Joshua Harto	2
58692	Barbara Gordon	Melinda McGraw	0
18052	James Gordon	Nathan Gamble	2
1052875	Rossi	Michael Vieau	2
1196130	Dopey	Michael Stoyanov	0
1334139	Happy	William Smillie	0
64856	Gambol	Michael Jai White	2
16477	Grumpy	Danny Goldring	2
1208967	Chuckles	Matthew O'Neill	0
1056090	Drug Dealer	Olumiji Olawumi	0
1870607	Drug Buyer	Greg Beam	0
1870608	Junkie	Erik Hellman	0
24595	Crime Boss	Vincenzo Nicoli	2
20372	LSI VP	Edison Chen	0
1522073	Judge Surrillo	Nydia Rodriguez Terracina	0
1870609	Brian	Andy Luther	0
1870610	Man No. 1	James Farruggio	0
1840452	Man No. 2	Tom McElroy	0
1226696	Assistant DA	Will Zahrn	0
1870611	Thug at Party	James Fierro	0
1526574	Male Guest	Sam Derence	0
1870612	Female Guest	Jennifer Knox	0
1424043	Judge Freel	Patrick Clear	0
1220201	Maroni's Mistress	Sarah Jayne Dunn	1
147895	Gambol's Bodyguard (as Chucky Venn)	Charles Venn	0
1195758	Gambol's Bodyguard (as Winston Ellis)	Winston G. Ellis	0
83854	Joker's Thug	David Dastmalchian	2
1870613	Reporter	Sophia Hinshelwood	0
1313093	Heckler	Keith Kupferer	0
1678566	Cop Heckler	Joseph Luis Caballero	0
176227	Acting Commissioner	Richard Dillane	2
1870614	Officer at Intersection	Daryl Satcher	0
1870615	Convoy Leader	Chris Petschler	0
1870616	Fat Thug	Aidan Feore	0
1128854	Murphy	Philip Bulcock	0
29617	Cop with Fat Thug	Paul Birchard	2
1781739	Medic	Walter Lewis	0
26669	Cop at 250 52nd St.	Vincent Riotta	2
1631707	Nurse	Nancy Crane	0
143328	Polk	K. Todd Freeman	2
1464854	Berg	Matt Shallenberger	0
1870623	Cop at Hospital	Michael Andrew Gorman	0
1870620	Bartender	Lanny Lutz	0
1624910	Civilian	Peter DeFaria	2
78047	First Mate	Matt Rippy	2
47525	Prison Ferry Pilot	Andrew Bicknell	2
1232399	Businessman	Doug Ballard	0
1661772	Mother	Helene Wilson	0
122345	Passenger	Tommy Campbell	0
1215332	Passenger	Craig Heaney	0
209990	Passenger	Lorna Gayle	0
139946	Passenger	Lisa McAllister	1
1070855	Passenger	Peter Brooke	0
1674439	SWAT Sniper	Joshua Rollins	2
1870625	SWAT Leader	Dale Rivera	0
141770	Prisoner on Ferry	Matthew Leitch	2
8396	Tattooed Prisoner	Tom Lister Jr.	2
29616	Evans	William Armstrong	2
1870627	Honor Guard Man	Adam Kalesperis	0
170230	Uniform Cop	Tristan Tait	2
1870629	Fox's Secretary	Gertrude Kyles	0
119414	Passenger Ferry Pilot	Jonathan Ryland	2
1870631	Guardsman	James Scales	0
1655526	Warden	Nigel Carrington	0
95716	Corrections Officer	Ian Pirie	0
1122545	Prisoner	Lateef Lovejoy	0
578699	Prisoner	Grahame Edwards	0
126316	Prisoner	Roger Monk	0
1132153	Prisoner	Ronan Summers	2
1870636	Honor Guard Leader	Michael Corey Foster	0
1870637	Gordon's Daughter	Hannah Gunn	0
1870638	Armored Car SWAT	Brandon Lambdin	0
580566	Bank Patron (uncredited)	Debbi Burns	0
1128275	Party Guest (uncredited)	Maritza Cabrera	0
1185594	Party Guest with Glass (uncredited)	Shirin Caiola	0
1197335	Party Guest (uncredited)	Laura Chernicky	0
1552999	Lau Henchman (uncredited)	Henry Milton Chu	0
1192165	Paramedic (uncredited)	Kelli Clevenger	1
1131169	Chechen Gangster (uncredited)	Richard Divizio	0
580567	Press Conference Heckler (uncredited)	Tony Domino	0
228305	Pedestrian (uncredited)	David Fultz	0
1392731	Ferry Passenger (uncredited)	Natalie Hallam	1
593182	Police Officer (uncredited)	Jordon Hodges	0
1086373	Prisoner (uncredited)	Erron Jay	0
1207205	Immigrant Ferry Passenger (uncredited)	Daniel Jefferson	0
18070	Shotgun SWAT (uncredited)	Nicky Katt	2
580560	Parade Police Officer (uncredited)	Thomas Kosik	0
505400	Maroni's Henchman (uncredited)	Don Kress	0
1058964	Assistant D.A. (uncredited)	Tim Krueger	0
1261397	Police Sgt. Spellman / Gotham Bomb Squad (uncredited)	Dan Latham	0
1551776	Helicopter SWAT Sniper (uncredited)	Tom McComas	0
1111803	Ferry Passenger (uncredited)	James Mellor	2
1360008	Officer (uncredited)	Joseph Oliveira	2
1426334	Joker's Thug #2 (uncredited)	Buster Reeves	0
30450	Prisoner (uncredited)	Peter Rnic	2
1209046	Party Guest (uncredited)	Amit Shah	0
1058963	Angry Hospital Relative (uncredited)	Michelle Shields	0
98994	Evacuee (uncredited)	Sofiya Smirnova	0
1108073	High-Ranking Police Official (uncredited)	Bruce Spielbauer	0
1185600	Extra (uncredited)	Robert Patrick Stern	0
1209051	Dept. of Corrections Resident (uncredited)	Robert Stone	0
99223	Detective (uncredited)	Richard Strobel	0
79810	Police Officer (uncredited)	Tom Townsend	0
204276	Chechen's Bodyguard (uncredited)	John Turk	0
1209055	Detective (uncredited)	John Warman	0
99245	Ancient biologist	Isshin Inudô	2
1512023	Party Guest (uncredited)	Erik A. Williams	0
127005	Major Crime Unit Detective (uncredited)	Chris Wilson	2
1380656	Party Staff (uncredited)	Kevin Zaideman	0
68812	Carl Fredricksen (voice)	Ed Asner	2
290	Charles Muntz (voice)	Christopher Plummer	2
80676	Russell (voice)	Jordan Nagai	2
18792	Beta (voice)	Delroy Lindo	2
84490	Newsreel Announcer (voice)	David Kaye	2
84491	Young Ellie (voice)	Elie Docter	0
84492	Young Carl (voice)	Jeremy Leary	0
84496	Omega (voice)	Josh Cooley	0
19274	B.O.B. (voice)	Seth Rogen	2
368	Susan Murphy / Ginormica (voice)	Reese Witherspoon	1
41419	Dr. Cockroach Ph.D. (voice)	Hugh Laurie	2
2628	General W.R. Monger (voice)	Kiefer Sutherland	2
78303	Insectosaurus (voice)	Jimmy Kimmel	0
56322	Computer (voice)	Amy Poehler	1
27105	News Reporter (voice)	Ed Helms	2
9137	Katie (voice)	Renée Zellweger	1
64446	Private Bullhorn / Helicopter Pilot / Advisor Ortega (voice)	Sean Bishop	0
936666	Commander / Advisor Smith (voice)	Rich Dietl	2
65630	Secret Service Man #1 / Lieutenant (voice)	Rob Letterman	0
18864	Wilson (voice)	Tom McGrath	2
12098	Advisor Cole / Army Commander Jones (voice)	Chris Miller	2
64151	Advisor Wedgie (voice)	Mike Mitchell	2
45416	Technician Jerry (voice)	Kent Osborne	2
936669	Advisor Ouaou / Mrs. Ronson / Female Advisor #2 / Panicked Guest (voice)	Latifa Ouaou	1
1077843	Soldier #4 / Pilot / Soldier #3 / News Technician (voice)	Geoffrey Pomeroy	0
1077844	Soldier #1 / Advisor Jackson (voice)	David P. Smith	0
11652	Bridesmaid Candy (voice)	Lisa Stewart	1
12080	Advisor Hawk / Advisor Dither / Minister / Secret Service Man #2 / Mama Dietl (voice)	Conrad Vernon	2
1448984	Technician Bee (voice)	Stephen Kearin	0
18288	Lt. Col. James "Rhodey" Rhodes / War Machine	Terrence Howard	2
57452	Raza	Faran Tahir	2
57451	Christine Everhart	Leslie Bibb	1
163671	Award Ceremony Narrator (voice)	Will Lyman	2
78299	Guard	Tom Morello	0
203468	Jim Cramer	Jim Cramer	0
173810	Abu Bakaar	Sayed Badreya	2
17200	General Gabriel	Bill Smitrovich	2
12708	William Ginter Riva	Peter Billingsley	2
40275	Major Allen	Tim Guinee	2
54809	Guard	Marco Khan	2
944830	Guard	Daston Kalili	2
1209417	Guard	Ido Ezra	0
95698	Jimmy	Kevin Foster	2
1209418	Pratt	Garret Noël	2
62037	Ramirez	Eileen Weisinger	1
183439	Ahmed	Ahmed Ahmed	2
109669	Omar	Fahim Fazli	0
104669	Howard Stark	Gerard Sanders	2
1209419	Viper 1	Tim Rigby	0
195442	Viper 2	Russell Richardson	2
142213	Amira Ahmed	Nazanin Boniadi	1
1209702	Colonel Craig	Thomas Craig Plumer	0
1209703	Dealer at Craps Table	Robert Berkman	0
183037	Woman at Craps Table	Stacy Stas	1
1209704	Woman at Craps Table	Lauren Scyphers	0
214951	Engineer	Frank Nyi	0
205362	Air Force Officer	Marvin Jordan	2
939869	Woman In SUV	Donna Evans	1
1209705	Kid in SUV	Reid Harper	2
1209706	Kid in SUV	Summer Kylie Remington	0
1209707	Kid in SUV	Ava Rose Williams	1
1209708	Kid in SUV	Vladimir Kubr	0
1209709	Kid in SUV	Callie Croughwell	1
1209710	Gulmira Kid	Javan Tahir	0
206423	Gulmira Mom	Sahar Bibiyan	0
133121	Reporter	Patrick O'Connell	2
181895	Reporter	Adam Harrington	0
62843	Reporter	Meera Simhan	1
204606	Reporter	Ben Newmark	0
210842	Flight Attendant	Ricki Lander	0
205720	Flight Attendant	Jeannine Kaspar	1
1005698	Flight Attendant	Sarah Cahill	1
1209711	Air Force Lieutenant	Justin Rex	0
90721	Zorianna Kit	Zorianna Kit	0
169681	Stan's Girl	Lana Kinnear	0
1209712	Stan's Girl	Nicole Lindeblad	0
1209713	Stan's Girl	Masha Lund	0
169642	Stan's Girl	Gabrielle Tuite	0
27031	CAOC Analyst	Tim Griffin	2
150669	CAOC Analyst	Micah A. Hauptman	2
1209714	CAOC Analyst	James Bethea	0
1209715	Photographer (uncredited)	Jeffrey Ashkin	0
984619	Fireman's Wife (uncredited)	Vianessa Castaños	1
1209716	Gulmira Villager (uncredited)	Mike Cochrane	0
970218	Dubai Girl (uncredited)	Mellany Gandara	1
1209718	House wife at Award Ceremony (uncredited)	Halla	0
1202546	Insurgent (uncredited)	Rodrick Hersh	0
1209719	Reporter (uncredited)	Kristin J. Hooper	1
1209720	Dubai Waiter (uncredited)	Chris Jalandoni	0
1209721	Party Guest (uncredited)	Steve Janousek	0
1209722	Dancer in Ballroom (uncredited)	Laura Liguori	0
1089759	Reporter (uncredited)	Flavia Manes Rossi	0
1096679	Village Dad (uncredited)	Anthony Martins	2
1209723	Reporter (uncredited)	Robert McMurrer	0
1209724	Airforce Officer (uncredited)	James M. Myers	0
1209725	Staff Sergeant (uncredited)	Sylvette Ortiz	0
1209726	Journalist (uncredited)	Brett Padelford	0
1209727	Voice (uncredited)	Ajani Perkins	2
1209728	Reporter (uncredited)	Chris Reid	0
1209729	News Cameraman (uncredited)	Toi Rose	0
1209730	Rooftop Fireman (uncredited)	George F. Watson	0
1209731	Whiplash One (voice) (uncredited)	David Zyler	0
6730	The Station Inspector	Sacha Baron Cohen	2
77996	Hugo Cabret	Asa Butterfield	2
56734	Isabelle	Chloë Grace Moretz	1
9642	Hugo's Father	Jude Law	2
39185	Policeman	Kevin Eldon	2
234983	Young Tabard	Gulliver McGrath	2
1080628	Camera Technician	Edmund Kingsley	2
1202683	Train Engineer	Max Wrottesley	0
234981	Julien Carette	Marco Aponte	2
1052258	Arabian Knight	Christos Lawton	0
1413264	Salvador Dali	Ben Addis	0
1507591	Policeman (uncredited)	Eric Haldezos	0
1362403	Theater Guest (uncredited)	Hugo Malpeyre	0
1394384	Worker (uncredited)	Gino Picciano	0
10692	Projectionist (uncredited)	Michael Pitt	2
1032	Photographer (uncredited)	Martin Scorsese	2
938234	Party Guest (uncredited)	Brian Selznick	0
8945	U.S. Marshal Artemus Gordon	Kevin Kline	2
11181	Dr. Arliss Loveless	Kenneth Branagh	2
3136	Rita Escobar	Salma Hayek	1
588	Coleman	M. Emmet Walsh	2
15854	General 'Bloodbath' McGrath	Ted Levine	2
55254	Amazonia	Frederique van der Wal	1
1475	Munitia	Musetta Vander	1
55255	Miss Lippenrieder	Sofia Eng	1
31647	Belle	Garcelle Beauvais	1
39126	Miss East	Bai Ling	1
7853	Hudson	Rodney A. Grant	2
53778	Mr. Pinkerton	E.J. Callahan	2
168331	Dora Look-Alike	Debra Christofferson	1
71562	Cross-Eyed Reb	Buck Taylor	2
69502	Reb #1	James Lashly	2
1279744	Reb #2	Dean Rader Duval	2
1100323	Other Reb	Jerry Wills	2
16163	Big reb	Mike H. McGaughy	0
14740	French Dignitary	Christian Aubert	2
53403	Spanish Dignitary	Orestes Matacena	2
11764	British Dignitary	Ian Abercrombie	2
160375	Mexican Dignitary	Ismael 'East' Carlo	2
48136	Dr. Guillermo Escobar	Gary Carlos Cervantes	2
137910	George Washington	Jerry Potter	2
157021	Guard	Mik Scriba	2
1610268	Prof. Thaddeus Morton	Michael Sims	0
18269	Richard O'Connell	Brendan Fraser	2
1336	Emperor Han	Jet Li	2
10727	Jonathan Carnahan	John Hannah	2
49	Evelyn O’Connell	Maria Bello	1
55900	Alex O'Connell	Luke Ford	2
1620	Zi Juan	Michelle Yeoh	1
72040	Lin	Isabella Leong	1
66717	General Yang	Anthony Wong	2
21354	Ming Guo	Russell Wong	2
15498	Maguire	Liam Cunningham	2
10779	Roger Wilson	David Calder	2
554085	Choi	Jessey Meng	0
1172006	Li Zhou	Tian Liang	0
450628	Chu Wah	Albert Kwan	2
78871	Assassin	Wu Jing	2
92404	Rick Flag	Joel Kinnaman	2
19492	Amanda Waller	Viola Davis	1
7499	The Joker	Jared Leto	2
224181	George 'Digger' Harkness / Boomerang	Jai Courtney	2
19487	Chato Santana / El Diablo	Jay Hernandez	2
31164	Waylon Jones / Killer Croc	Adewale Akinnuoye-Agbaje	2
1289968	June Moone / Enchantress	Cara Delevingne	1
1461608	Tatsu Yamashiro / Katana	Karen Fukuhara	1
33527	Christopher Weiss / Slipknot	Adam Beach	2
198150	Keith Griggs	Ike Barinholtz	2
928572	Lieutenant GQ Edwards	Scott Eastwood	2
83968	Jonny Frost	Jim Parrack	2
84217	Gomez - Seal Team A	Alex Meraz	2
932158	Grace Santana	Corina Calderon	1
1456151	Zoe Lawton	Shailyn Pierre-Dixon	0
1727020	Dr. Van Criss	Matt Baram	0
90725	Gerard Davis / Incubus	Alain Chanoine	0
190900	Admiral Olsen	Ted Whittall	2
62679	Admiral Burns	Michael Murray	2
1138844	Sergeant Ames Bravo 14	Jaime FitzSimons	0
1488192	Missing Hand Guard	Christopher Dyson	2
965219	T-Shirt Vendor	Bambadjan Bamba	0
1072798	U.S. Marshal	Robert B. Kennedy	0
51041	Mafia Snitch	Billy Otis	2
1212929	Panda Man	James McGowan	0
1727014	Psych Patient	Derek Perks	0
237	Chairman	Aidan Devine	2
1727015	Navy One-Star Admiral	Andrew Bee	0
1727016	Air Force Two-Star General	Clive McLean	0
136959	Army One-Star General	Frank J. Zupancic	2
1727017	National Security Council	Kent Sheridan	2
1396920	National Security Council	Roger Shank	0
1480961	National Security Council	Dwight Ireland	2
1232769	National Security Council	Amanda Brugel	1
1520526	National Security Council	Peter Tufford Kennedy	0
1727018	Hot Girl Patron	Rosemary De Los Santos	0
1260782	Casino Boss	Kevin Hanchard	2
1486835	Cop At Rail Terminal	Joel Lacoursiere	0
1482610	Doctor At Rail Terminal	Jameson Kraemer	2
168771	Gate Guard	Ho Chow	2
1727022	Dr. Van Criss' Wife	Birgitte Solem	1
1345133	Kowalski - Seal Team A	Kevin Vance	0
1727023	Grey - Seal Team Member	Tyler Grey	0
1727024	Seal Team A #1 Member	Nathan Brown	0
41561	Yakuza Boss	Kenneth Choi	2
107411	Technician	Nicolas Van Burek	0
1727025	Technician 2	Agueda Cardenas	1
1727027	Diablo's Daughter	Daniela Uruena	1
1727028	Diablo's Son	Nicolas Uruena	0
1545155	Supermodel (uncredited)	Ariane Bellamar	1
1545157	Navy SEAL (uncredited)	Murray Urquhart	0
1545156	Hispanic Woman (uncredited)	Alyssa Veniece	1
1698765	U.S. Marshal	Tim Ajro	0
1754320	Bystander	Devlin Anderson	0
1754321	Dancer	Briana Andrade-Gomes	1
1754322	Bystander	Raffi Atamian	0
1754331	Air Force General Williams	John Byers	0
1754333	Injured Civilian	Heather Byrne	1
1754334	Wounded Civilian	Corey Chainey	0
1754335	US Ranger	Shak Chaudhry	0
1567040	Ranger	James Chilli Chillingworth	0
1754336	Marine	Andrew Christie	0
1754337	Van Criss Employee	Alex Chung	0
1754338	MP Soldier	Gavin R. Downes	0
1754339	Club Goer	Reid Eastwood	0
1355150	Distressed Civilian	Scott Edgecombe	0
1306573	Car Passenger	Brendan Egan	0
1754340	US Marshal	Jeff Ellenberger	0
1754342	Tatiana - Russian Girl	Tatyana Figueiredo	1
1379639	Navy SEAL Combat Medic - Bravo Team	Gary 'Si-Jo' Foo	0
1716602	US Marshal	Tazito Garcia	0
1656699	Operations Tech	Brianna Goldie	0
1754346	Secret Service Agent	William Hainsworth	0
1543542	Navy SEAL Howard	Shawn J. Hamilton	0
493769	SWAT Officer	Shane Harbinson	0
559644	LAPD Sergeant	Fatimah Hassan	0
1754347	Fighter Pilot	Dexter Howe	0
1754348	Bystander	Melanie Hubert	1
87577	FEMA Official	David Ingram	2
1754349	US Marshal / Military Escort	Shane Clinton Jarvis	0
1337623	Hispanic Man	Actor Sergio Kato	2
1513916	Prisoner	Kevin Kent	0
1754350	Bystander	Martin Kessler	0
1754351	Lieutenant Colonel Doctor	Melissa Lem	1
1366350	Arkham Guard Stewart	John MacDonald	0
1754352	EA Dancer	Stephanie Manchulenko	1
1754353	Marine	Matthew Mease	0
1754354	Hispanic Man	Christopher Meneses	0
1553096	Agent Bartoni	Valiant Michael	0
1284410	Naughty Waitress	Sabine Mondestin	0
1600910	Admiral's Staff	Justin Moses	0
1543547	Blackwater	Drew Moss	0
1540119	Gotham Police	Afsheen Olyaie	2
166518	Anvil	Dan Petronijevic	2
1754358	Executive Assistant	Alisha Phillips	0
1622765	EA Dancer	Tamina Pollack-Paris	1
1754361	Firefighter	Michael Prather	0
1240327	Cop Photographer	Dennisha Pratt	0
1754364	Military Guard	Asad Que	0
1754365	US Ranger	Mark Quigley	0
62711	Big Ugly Navy SEAL	Darryl Quon	2
1747278	S.W.A.T. Officer	Diezel Ramos	0
1376110	American Hostage	Hugh Scott	0
1754366	Military Officer	Jasmine Sean	0
1754368	Special Forces Escort	Attila Sebesy	0
1754370	Arresting Officer	Rick Silver	0
1754371	Graham - SEAL Team A	Connor Skific	0
1651271	Club Patron / Naughty Waitress	Jamie Soricelli	1
1369078	Janes - Navy SEAL	Amos Stern	0
1632662	Navy SEAL Clark	Goran Stjepanovic	0
1619926	Club Patron	Vivienne Taylor	1
1754375	EA Dancer	Jasmine Renée Thomas	0
1563912	Firefighter	Alen Toric	0
1754377	Helicopter Pilot	Dallas Wade	0
1744067	Club Patron	Joe Warshaw	0
1379566	Bystander	Tony Watt	0
1754379	US Army Ranger	James Weicht	0
1754380	Club Patron	Taylor Whittaker	0
1754383	FBI Agent Max Bidwell	Robert L. Wilson	0
4495	Evan Baxter	Steve Carell	2
16858	Joan Baxter	Lauren Graham	1
6860	Ryan Baxter	Jimmy Bennett	2
8265	Marty	John Michael Higgins	2
27102	Rita	Wanda Sykes	0
27103	Jordan Baxter	Graham Phillips	2
27104	Dylan Baxter	Johnny Simmons	2
21007	Eugene	Jonah Hill	2
14329	Officer Collins	Dean Norris	2
151124	Congressperson	James Newman	0
28640	Eve Adams	Molly Shannon	1
1388473	Court Stenographer	Lucia Forte	1
1349629	Neighbor	Harry S. Murphy	2
99090	News Room Camera Operator	Don Dowe	2
23211	Mail Lady	Maile Flanagan	0
500	Maj. William "Bill" Cage	Tom Cruise	2
5081	Sgt. Rita Vrataski	Emily Blunt	1
2039	General Brigham	Brendan Gleeson	2
119224	Skinner	Jonas Armstrong	0
147255	Kimmel	Tony Way	2
1363086	Ford	Franz Drameh	2
125740	Kuntz	Dragomir Mrsic	0
115679	Nance	Charlotte Riley	1
1095404	Takeda	Masayoshi Haneda	0
67205	Cruel Sergeant	Terence Maynard	0
1284	Dr. Carter	Noah Taylor	2
213083	Karen Lord	Lara Pulver	1
1258664	Julie	Madeleine Mantock	0
17352	Dr. Whittle	Marianne Jean-Baptiste	1
12799	Col. Walter Marx	Jeremy Piven	2
1211881	Secretary - Iris	Beth Goddard	1
1504930	Infirmary Nurse	Assly Zandry	0
1504931	Young Soldier	Sebastian Blunt	0
1504932	Dog Soldier 2	Aaron Romano	0
1504933	Dog Soldier 3	Usman Akram	0
1227322	Bar Maid	Mairead McKinley	0
219762	Old Man	Andrew Neil	0
1504935	Drunk	Martin Hyder	0
1504936	Old Man 2	John Dutton	0
1222021	Old Man 3	Harry Landis	0
1504937	Military Spokesperson 1	Rachel Handshaw	0
36901	Military Spokesperson 2	Martin McDougall	2
113361	Sky News Anchor	Anna Botting	0
590162	BBC News Anchor	Jane Hill	0
1237218	CNN News Anchor	Erin Burnett	0
1504938	Channel 2 News Anchor	Dany Cushmaro	0
1048574	UDF Commercial (voice)	David Kaye	0
1738236	Sergeant Battey (uncredited)	Elaine Caulfield	0
531772	J Squad Soldier (uncredited)	Lee Asquith-Coe	2
1295992	Soldier (uncredited)	Stuart Matthews	0
59350	Drifter	Chaim Girafi	0
3432	Gatesman	Rick Aviles	2
49832	Enforcer	R. D. Call	2
59352	Elder / Survivor	Zitto Kazann	2
10478	Helen	Jeanne Tripplehorn	1
2778	Deacon	Dennis Hopper	2
47458	Priam	Zakes Mokae	2
1240	Banker	Jack Kehler	2
53930	Enola	Tina Majorino	1
41741	Atoller	Rita Zohar	1
151943	Nord	Gerard Murphy	0
2169	Old Gregor	Michael Jeter	2
8335	Drifter	Kim Coates	2
6065	General Hawk	Dennis Quaid	2
9562	Ripcord	Marlon Wayans	2
23459	Ana Lewis / Baroness	Sienna Miller	1
5419	Breaker	Saïd Taghmaoui	0
2040	McCullen / Destro	Christopher Eccleston	2
25002	Storm Shadow	Lee Byung-hun	2
50347	Scarlet	Rachel Nichols	1
11007	Snake Eyes	Ray Park	2
16743	Zartan	Arnold Vosloo	2
18916	Doctor Mindbender	Kevin J. O'Connor	2
1040850	Baron de Cobray	Grégory Fitoussi	0
557921	Young Snake Eyes	Leo Howard	2
1115122	Young Storm Shadow	Brandon Soo Hoo	0
105047	Hard Master	Gerald Okamura	2
215317	Cover Girl	Karolina Kurkova	1
93211	James McCullen - 1641	David Murray	2
209680	Apache Navigator	Frederic Doss	0
159454	Dr. Hundtkinder	Peter Breitmayer	2
169200	Sadness (voice)	Phyllis Smith	1
59258	Anger (voice)	Lewis Black	2
125167	Disgust (voice)	Mindy Kaling	1
1371894	Riley (voice)	Kaitlyn Dias	0
6677	Dad (voice)	Kyle MacLachlan	2
196502	Forgetter Paula (voice)	Paula Poundstone	1
1226294	Dream Director // Mom's Anger // Additional Voices (voice)	Paula Pell	0
64181	Subconscious Guard Frank (voice)	Dave Goelz	2
1237	Mind Worker Cop Jake (voice)	Flea	2
1531657	Clown's Joy (voice)	Peter Sagal	0
80591	Cool Girl's Emotions (voice)	Rashida Jones	1
19547	Additional Voices (voice)	Gregg Berger	2
1565450	Additional Voices (voice)	Aurora Blue	0
1565451	Additional Voices (voice)	Veronika Bonell	0
1565452	Additional Voices (voice)	Lola Cooley	0
1565453	Additional Voices (voice)	Dani Dare	0
1565455	Additional Voices (voice)	Andrea Datzman	0
1236458	Additional Voices (voice)	Ronnie del Carmen	2
143346	Additional Voices (voice)	Keith Ferguson	0
1260745	Additional Voices (voice)	Tony Fucile	2
7905	Additional Voices (voice)	Mary Gibbs	1
1565456	Additional Voices (voice)	Randy Hahn	0
1141501	Additional Voices (voice)	Carter Hastings	2
969332	Additional Voices (voice)	Jacob Hopkins	2
1565457	Additional Voices (voice)	Emma Hudak	0
1565458	Additional Voices (voice)	Evan Hudak	0
1565459	Additional Voices (voice)	Dara Iruka	0
1504904	Additional Voices (voice)	Molly Jackson	0
1565460	Additional Voices (voice)	Daniella Jones	1
1565461	Additional Voices (voice)	Sophia Lee Karadi	0
1443472	Additional Voices (voice)	Erik Langley	0
87819	Additional Voices (voice)	Dawnn Lewis	1
1565465	Additional Voices (voice)	Tony Maki	0
111466	Additional Voices (voice)	Mona Marshall	0
7998	Additional Voices (voice)	Bret 'Brook' Parker	0
1565467	Additional Voices (voice)	Nick Pitera	0
61969	Additional Voices (voice)	Phil Proctor	2
1565470	Additional Voices (voice)	Murray Pearl Schaeffer	0
939345	Additional Voices (voice)	Patrick Seitz	0
1406892	Additional Voices (voice)	Paris Van Dyke	0
1008380	Additional Voices (voice)	James Kevin Ward	0
1098034	Additional Voices (voice)	Lennon Wynn	0
1565480	Additional Voices (voice)	Dash Zamm	0
1414734	Mowgli	Neel Sethi	2
1532	Baloo (voice)	Bill Murray	2
4690	King Louie (voice)	Christopher Walken	2
1267329	Raksha (voice)	Lupita Nyong'o	1
4808	Akela (voice)	Giancarlo Esposito	2
52865	Ikki (voice)	Garry Shandling	2
7623	Giant Squirrel (voice)	Sam Raimi	2
82417	Rocky the Rhino (voice)	Russell Peters	2
1662561	Gray (voice)	Brighton Rose	1
1259762	Young Wolf #1 (voice)	Emjay Anthony	2
1662562	Young Wolf #2 (voice)	Max Favreau	2
1662563	Young Wolf #3 (voice)	Chloe Hechter	0
1523670	Young Wolf #4 (voice)	Asher Blinkoff	0
1662564	Young Wolf #5 (voice)	Knox Gagnon	0
1662565	Young Wolf #6 (voice)	Sasha Schreiber	0
1662566	Young Wolf #7 (voice)	Kai Schreiber	0
1662567	Raquel the Rhino (voice)	Madeleine Favreau	0
1440178	Infant Mowgli's Father	Ritesh Rajan	2
1662568	Infant Mowgli	Kendrick Reyes	0
1378628	Neelgai Deer (voice)	Sara Arrington	0
1662569	Animal Voices (voice)	Artie Esposito	2
97956	Animal Voices (voice)	Allan Trautman	2
23680	Animal Voices (voice)	Dee Bradley Baker	2
1769351	Animal Voices (voice)	Sean W. Johnson	2
10846	Shere Kahn (mo-cap) (uncredited)	Daz Crawford	2
1519186	King Louie	Bugs Bhargava	0
2295	Ivan Vanko / Whiplash	Mickey Rourke	2
6807	Justin Hammer	Sam Rockwell	2
51072	U.S. Marshal	Kate Mara	1
73641	Herself	Christiane Amanpour	1
14741	Detective Lemieux	Philippe Bergeron	2
216601	Security Force #2	Michael Bruno	0
1265248	Expo Fan	Kate Clark	0
1265249	Russian Newscaster	Luminita Docan	0
1177850	French Photographer	François Duhamel	0
586090	Himself	Larry Ellison	0
1228219	Himself	Adam Goldstein	2
1230885	General Meade	Eric L. Haney	0
1265250	10 Rings Gangster	Ali Khan	0
1079976	Anton Vanko	Evgeniy Lazarev	0
1265251	AV Operator	Isaiah Guyman Martin IV	0
113676	Rebecca	Helena Mattsson	1
118755	Expo Cop	Keith Middlebrook	0
210292	Rebeka	Anya Monzikova	1
1265252	Bambi Arbogast	Margy Moore	0
57563	Himself	Elon Musk	0
81957	Strawberry Vendor	Alejandro Patino	0
1265795	Young Tony Stark	Davin Ransom	0
997632	Guard	Karim Saleh	0
201883	French Waiter	Phillipe Simon	0
1265797	Jack	Jack White	0
1265798	Ironette Dancer	Melanie Brown	0
1003061	Ironette Dancer	Krystal Ellsworth	1
1265799	Ironette Dancer	Victoria Gracie	0
1202543	Ironette Dancer	Gina Cantrell	0
1265800	Ironette Dancer	Renee Herlocker	0
1265801	Ironette Dancer	Jill Ann Pineda-Arnold	0
571240	Ironette Dancer	Sandy Colton	0
1265802	Ironette Dancer	Annika Ihnat	0
108725	Ironette Dancer	Jenny Robinson	1
1265803	Ironette Dancer	Lindsay Dennis	0
995348	Ironette Dancer	Jennifer D. Johnson	0
1265804	Ironette Dancer	Lindsay Rosenberg	0
1265805	Ironette Dancer	Hannah Douglass	1
1265806	Ironette Dancer	Brooke Long	0
83274	Ironette Dancer	Rachele Brooke Smith	1
168925	Ironette Dancer	Nadine Ellis	1
1265807	Ironette Dancer	Kylette Zamora	0
98999	News Cameraman (uncredited)	Ted Alderman	0
1265808	Birthday Party Guest / Expo Guest (uncredited)	Donessa Alexander	0
1265809	Expo Greeter (uncredited)	Martin Andris	0
1265810	Expo Patron (uncredited)	Cassity Atkins	0
1265811	Monaco Grand Prix Restaurant Guest (uncredited)	Gregory Baldi	0
1265812	Bartender (uncredited)	Elya Beer	0
1265813	Model (uncredited)	Ayelet Ben-Shahar	0
1265814	Little Girl at EXPO Gala (uncredited)	Jordan Bobbitt	0
1265815	Dignitary / Expo Attendee (uncredited)	Chris Borden	0
1078574	Air Force Major (uncredited)	Pete Brown	2
1265816	Tony Stark Racing Fan (uncredited)	Basilina Butler	0
1236642	Captain Anders (uncredited)	John Ceallach	0
1231548	Beautiful Girl (uncredited)	Katie Cleary	0
1265817	Expo Guest (uncredited)	Ajarae Coleman	0
1265818	Monte Carlo Race Fan (uncredited)	Rick L. Dean	2
1265819	French Prison Guard #2 (uncredited)	Timothy 'TJ' James Driscoll	0
1225936	Watermelon Girl (uncredited)	Jasmine Dustin	1
97447	Justin Hammer Expo Attendee (uncredited)	Mark Casimir Dyniewicz	2
1265820	Stark Expo Attendee (uncredited)	Sam Felman	0
1265821	I Love You girl (uncredited)	Caitlin Gallo	0
1265822	Pepper's Party Guest (uncredited)	Shakira Vanise Gamble	0
1265823	French Prison Guard #1 (uncredited)	Paul Grace	2
1265824	Expo Fan (uncredited)	James Granville	0
1265825	Expo Attendee (uncredited)	Kathryn Henzler	1
1265826	Expo Attendee (uncredited)	Jennifer Lynne Johnson	0
1265827	Senate Page (uncredited)	Cameron Lee	0
201951	Reporter (archive footage) (uncredited)	Jee-Yun Lee	1
1200895	Expo Guest (uncredited)	Waymond Lee	0
1200313	Prison Guard Chevalier (uncredited)	Mathew Lorenceau	0
101037	Reporter (uncredited)	Christopher Maleki	2
1265828	Photographer at Senate hearing (uncredited)	Richard Markman	0
1265829	Expo Guest (uncredited)	Bryan McCoy	0
1186481	Awards Attendee (uncredited)	Ed Moy	2
1265830	Russian Woman (uncredited)	Delka Nenkova	0
992389	SWAT Sergeant Bellows (uncredited)	Tony Nevada	2
1265831	Watermelon Girl (uncredited)	Allison Ochmanek	1
208056	French Reporter (uncredited)	Nicolas Pajon	0
1265832	White House Chief of Staff (uncredited)	H.E. Victor J.W. Pekarcik III	0
1265833	Expo Guest (uncredited)	Erin Pickett	0
223048	Expo VIP (uncredited)	Olivia Presley	0
1197358	Senate Gallery Member (uncredited)	Steven James Price	0
1265834	Expo Kid (uncredited)	Kiana Prudhont	0
1265836	1960's Film Crew (uncredited)	Tanner Alexander Redman	0
77824	Security Guard Fighting Happy Hogan (uncredited)	Tanoai Reed	2
1197040	Stark Expo Attendee (uncredited)	Kelly Sarah	0
1265837	Pepper's Birthday Party Guest (uncredited)	Torin Sixx	0
1265838	Senator (uncredited)	Peter Trenholm Smith	2
1265839	Model (uncredited)	Grace Stanley	0
92189	Party Guest (uncredited)	Doug Swander	2
1265840	US Senator (uncredited)	Michael A. Templeton	0
1265841	Background (uncredited)	Rosa Tyabji	0
1122811	Tony Stark Usher (uncredited)	Peter Sebastian Wrobel	0
37917	Snow White	Kristen Stewart	1
6885	Queen Ravenna	Charlize Theron	1
11109	Nion	Nick Frost	2
13014	Coll	Toby Jones	2
55585	Finn	Sam Spruell	2
32300	Quert	Johnny Harris	2
63364	Gus	Brian Gleeson	2
9831	Duke Hammond	Vincent Regan	2
1088912	Queen Eleanor	Liberty Ross	1
1088913	Mirror Man	Christopher Obi	2
53688	Greta	Lily Cole	1
18067	Anna	Rachael Stirling	1
1279512	Lily	Hattie Gotobed	1
1055230	Young Snow White	Raffey Cassidy	1
1279513	Young William	Xavier Atkins	0
142388	Young Ravenna	Izzy Meikle-Small	0
66791	Ravenna's mother	Anastasia Hille	1
1279514	Young Finn	Elliot Reeve	0
65303	Thomas	Mark Wingett	2
221985	Iain	Jamie Blackley	2
183151	Black Knight General	Greg Hicks	2
109833	Black Knight	Peter Ferdinando	2
115683	Guard on Duty	Andrew Hawley	0
29406	Aldan	Joey Ansah	2
214794	Duke's Commander	Gregor Truter	2
1279515	Soldier	Tom Mullion	0
1035907	Emaciated Peasant (uncredited)	Darren Kent	2
1488236	Percy	Matt Berry	0
11701	Maleficent	Angelina Jolie	1
18050	Princess Aurora	Elle Fanning	1
82191	Stefan	Sharlto Copley	2
32987	Diaval	Sam Riley	2
1017347	Prince Phillip	Brenton Thwaites	2
1355733	Young Maleficent	Isobelle Molloy	0
8436	Queen Ulla	Miranda Richardson	1
1833	Shepherd	Jamie Sives	2
116606	Young Stefan	Toby Regbo	2
26258	King Henry	Kenneth Cranham	2
1258225	Princess Leila	Hannah New	1
989325	Teen Maleficent	Ella Purnell	1
195286	Princess Leila's Handmaiden	Sarah Flind	0
1502461	Teen Stefan	Jackson Bews	0
1252814	Advisor to King Henry	Angus Wright	0
65451	Advisor to King Henry	Oliver Maltman	2
230697	Nobleman	Gary Cargill	2
140525	Nobleman	John O'Toole	0
1502462	Nobleman	Harry Attwell	0
115622	Nobleman	Anthony May	0
96281	Military Nobleman	James Hicks	2
185003	General	Stephan Chase	2
139811	General	Mark Caven	0
1238441	Servant in Wing Room	Chris Leaney	0
145071	Soldier in Wood	Jamie Maclachlan	0
1502463	Aurora (5 yrs.)	Vivienne Jolie-Pitt	0
1462923	Aurora (8 yrs.)	Eleanor Worthington-Cox	1
1001523	Farmer	Tim Treloar	0
568393	Guard (voice)	Peter G. Reed	0
1312266	Servant	Marama Corlett	0
75065	King Henry's Captain	Liam McKenna	2
91023	Fairies / Creatures (voice)	Sandy Fox	1
47627	Narrator (voice)	Janet McTeer	1
1502464	Stefans Guard (uncredited)	James Ayling	0
1174490	Palace Guard (uncredited)	Laura Black	1
1502465	Courtier (uncredited)	Sophie-Anna Brough	0
1430707	King Henry's General (uncredited)	Alfred Camp	0
1502466	Young Man (uncredited)	Raf Cross	0
1502467	Stefan's Guard (uncredited)	Nick Donald	0
186605	Curse Voice, Fairies, Creatures (uncredited)	Terri Douglas	1
1502468	Court Jester (uncredited)	Damon Driver	2
1502469	Stefan's Soldier / Henry's Soldier (uncredited)	Josh Dyer	0
1502470	Dancer (uncredited)	Stephanie Elstob	1
1502471	Courtier (uncredited)	Ellis Fuller	0
1502472	Blue Suit Performer (uncredited)	Craig Garner	0
1394404	King Henry's Solider (uncredited)	Alexander Gillison	0
1502473	Courtier (uncredited)	Victoria Gugenheim	0
1502474	Courtier (uncredited)	Daniel Harland	0
1375518	Soldier / Courtier (uncredited)	John Heartstone	0
1075104	Stefan's Soldier (uncredited)	Matt Hookings	0
1502475	King Henry's Soldier (uncredited)	Craig Izzard	0
1502476	Dancer (uncredited)	Ceri Jerome	0
1242871	Girl (uncredited)	Zahara Jolie-Pitt	0
1502477	Blue Suit Performer (uncredited)	Lee Edward Jones	0
1394405	Servant (uncredited)	Alex Marek	0
1207207	Palace Guard (uncredited)	João Costa Menezes	0
1502478	Courtier (uncredited)	Karen Mkrtchyan	0
1502479	King Stefan's Army (uncredited)	Matthew John Morley	0
1502480	Courtier (uncredited)	Steven John Nice	0
1278771	Blue Suit Performer (uncredited)	Jo Osmond	0
1279742	King Henry's Soldier (uncredited)	Andrew James Porter	0
1462424	Stefan's Page (uncredited)	Guy Potter	0
1502481	King Stefans Guard (uncredited)	Marc Rolfe	0
1394408	Palace Guard (uncredited)	Jd Roth-round	0
1394409	Stefan's General (uncredited)	Julian Seager	0
1502482	Soldier / Courtier (uncredited)	Peter Stacey	0
1481440	Screen Combat, Soldier (uncredited)	Daniel Stisen	0
1438979	Stefan Guard (uncredited)	Richard Summers-Calvert	0
1502483	Young Man (uncredited)	Leo Suter	0
1394377	Courtier (uncredited)	Tom Swacha	0
41292	Ellie	Keri Russell	1
55861	Carver	Kirk Acevedo	2
58395	Maurice	Karin Konoval	1
576041	Ash	Larramie Doc Shaw	0
557930	Blue Eyes	Nick Thurston	2
107939	Werner	Jocko Sims	2
12798	Kemp	Enrique Murciano	2
39213	Finney	Keir O'Donnell	2
93177	Grey	Lee Ross	2
4992	Terry	Lombardo Boyar	2
114000	McVeigh	Kevin Rankin	2
231857	Foster	Jon Eyez	0
1172813	Stoned	Richard King	0
1172814	Rationer	Lucky Johnson	2
156625	Manone	Al Vicente	2
1130809	Man 2	Matthew James	0
1393532	Luca	Scott Lang	2
29933	Woman	Deneen Tyler	1
1273239	Officer	Mustafa Harris	0
1123871	Driver	Mike Seal	0
129868	Sniper	J.D. Evermore	2
1388316	Recruit	Chase Boltin	0
43010	Old Man	Thomas Rosales, Jr.	0
60877	Old Woman	Carol Sutton	1
1173099	Gun-Clinching Man	Christopher Berry	2
2299	James Stewart / Jay Fennel	Josh Hartnett	2
76850	Clara Coldstream	Simone Kessell	1
66442	Laura Fennel	Tamsin Egerton	1
587823	Dolly	Alice Englert	0
85035	Tulaja Naik	Bipasha Basu	1
79003	Udaji	Abhay Deol	2
587822	Sonubai	Tehmina Sunny	1
30576	Governor of Bombay	Shane Briant	2
55578	York	Steve Nicolson	0
53676	Raoji	Atul Kulkarni	2
11851	\N	Om Puri	2
693	\N	Roshan Seth	0
1386458	The Assassin	Mahesh Jadu	2
1172316	Allie	Andrea Deck	0
1112872	Charles Stewart	James Mackay	2
1532766	Jamnabai	Aegina De Vas	0
1510862	Nurse Smith	Anna McNiven	1
1014587	Mostyn	Bryan Probets	0
1684358	Desai	Vijay Thombre	0
6384	Kai	Keanu Reeves	2
58593	Mika	Kou Shibasaki	1
136191	Lord Asano	Min Tanaka	2
1253541	Chikara	Jin Akanishi	0
1278788	Hazama	Hiroshi Sogabe	0
1278789	Basho	Takato Yonemoto	0
550560	Horibe	Shû Nakajima	2
1184036	Hara	Hiroshi Yamada	0
11398	Shogun Tsunayoshi	Cary-Hiroyuki Tagawa	2
1380499	Shogun's Adjutant	Tanroh Ishida	2
31387	Kapitan	Yorick van Wageningen	0
1628196	Riku	Natsuki Kunimoto	1
9192	Tengu Lord	Togo Igawa	2
112831	Kira's Spy	Akira Koieyama	0
1168128	Mika's Handmaiden	Haruka Abe	1
2249	Drunk Official	Clyde Kusatsu	2
1522260	Lead Soldier	Masashi Fujimoto	2
4135	Alexander Pierce	Robert Redford	2
156739	Councilman Singh	Bernard White	2
74750	Georges Batroc	Georges St-Pierre	2
7041	French Pirate #1	Salvator Xuereb	2
949852	French Pirate #2	Brian Duffy	2
186573	Engine Pirate	Zack Duhame	2
208096	French Radio Pirate	Adetokumboh M'Cormack	2
1751768	Skinny Steve	Christopher George Sarris	0
1751772	Launch Tech #2	Allan Chanes	0
5551	SHIELD Interrogator #1	Christopher Markus	2
5552	SHIELD Interrogator #2	Stephen McFeely	2
60846	Scientist #1	Pat Healy	2
139744	Scientist #2	Ed Brubaker	2
119590	Apple Employee	D.C. Pierson	2
1751774	Com Tech #2	Bernie Zilinskas	0
15268	Renata (as Branka Katic)	Branka Katić	0
1751775	Garcia	Angela Russo-Otstot	0
117190	Charlie XO	Jon Sklaroff	2
1216156	Charlie Weapons Tech	Chad Todhunter	0
179012	SHIELD Tech	Abigail Marlowe	1
98429	Lead SHIELD Pilot	Jeremy Maxwell	2
1392838	Senior SHIELD Agent	Emerson Brooks	0
1448939	Strike SGT. #1	Ricardo Chacon	0
1751780	Strike SGT. #2	Griffin M. Allen	0
1751783	Strike Agent	Joe Rosalina	0
1751784	Strike Agent	Michael Debeljak	0
18300	Strike Agent	Eddie J. Fernandez	2
1672052	25th Floor Strike Agent	Jody Hart	0
63544	Scudder	Steven Culp	2
88098	Human Resources Executive	Derek Hughes	2
164040	Doctor	Wendy Hoopes	1
964848	Lead EMT	Ethan Rains	2
146411	CIA Instructor	Dominic Rains	2
1751787	Capitol Hill Police	Charles Wittman	0
1751788	Capitol Hill Police	Andy Martinez, Jr.	2
1751789	FBI Agent	Michael De Geus	0
1751790	FBI Agent	Terence O'Rourke	0
1751791	Committee Member	Anne Grimenstein	0
1751792	Little Boy in the Smithsonian	Dante Rosalina	0
35172	Fury Car Voice (voice)	Robert Clotworthy	2
1196879	SHIELD Computer (voice)	June Christopher	1
33	The Smithsonian Narrator (voice)	Gary Sinise	2
1034648	SHIELD Agent (uncredited)	Dean Barlage	2
12073	Shrek (voice)	Mike Myers	2
776	Donkey (voice)	Eddie Murphy	2
6941	Princess Fiona (voice)	Cameron Diaz	1
3131	Puss in Boots (voice)	Antonio Banderas	2
5823	Queen (voice)	Julie Andrews	1
65717	Brogan (voice)	Jon Hamm	2
8930	King (voice)	John Cleese	0
64342	Cookie (voice)	Craig Robinson	2
118489	Rumpelstiltskin / Priest / Krekraw Ogre (voice)	Walt Dohrn	2
43775	Gretched (voice)	Jane Lynch	1
25703	Patrol Witch / Wagon Witch #2 (voice)	Lake Bell	1
3138	Dancing Witch / Wagon Witch #1 (voice)	Kathy Griffin	1
5960	Guard Witch (voice)	Mary Kay Place	1
118490	Broomsy Witch (voice)	Meredith Vieira	1
167662	Father of Butter Pants (voice)	Ryan Seacrest	2
12095	Pinocchio / Three Pigs (voice)	Cody Cameron	2
44127	Doris (voice)	Larry King	2
151657	Mabel (voice)	Regis Philbin	2
12097	Blind Mice (voice)	Christopher Knights	2
12106	Wolf (voice)	Aron Warner	0
1454441	Ogre Baby (voice)	Jasper Johannes Andrews	0
1784322	Ogre Baby (voice)	Ollie Mitchell	0
76743	Ogre Baby / Villager Kid (voice)	Miles Bakshi	0
76744	Ogre Baby / Tourist Girl / Villager Girl (voice)	Nina Zoe Bakshi	0
112821	Cackling Witch (voice)	Billie Hayes	1
1784323	Villager Fan #1 (voice)	Jeremy Hollingworth	0
1454420	Villager Fan #3 / Ogre Gnimrach (voice)	Brian Hopkins	0
1181220	Villager Fan #2 (voice)	James Ryan	0
86655	Witch / Pedestrian (voice) (uncredited)	Ashley Boettcher	1
1784324	Witch / Pedestrian (voice) (uncredited)	Danielle Soibelman	1
52018	Casey Newton	Britt Robertson	1
1461	Frank Walker	George Clooney	2
965224	Young Frank Walker	Thomas Robinson	2
17696	Ursula	Kathryn Hahn	1
298410	Hugo	Keegan-Michael Key	2
74428	Eddie Newton	Tim McGraw	2
4445	Frank's Dad	Chris Bauer	2
992427	Nate Newton	Pierce Gagnon	2
565222	Bus Driver	Matthew Kevin Anderson	2
15347	Small World Operator	Michael Giacchino	2
1235560	Skyscraper Foreman	D. Harlan Cutshall	0
1358561	Young Casey Newton	Shiloh Nelson	0
56750	History Teacher	Xantha Radley	1
53324	Science Teacher	David Nykl	2
26069	English Teacher	Paul McGillion	2
1502983	Beefy Cop	Pearce Visser	0
26089	Jail Desk Jockey	Garry Chalk	2
1502986	Jail Punk	Dagan Nish	0
1502987	Jetpack Dexter	Yusuf A. Ahmed	0
1368783	Jetpack Buddy	Alex Barima	0
1334653	Jetpack Buddy	Jedidiah Goodacre	2
1502988	Monorail Mother	Kate Crutchlow	0
1366824	Astronaut's Father	Parm Soor	0
1502990	Astronaut's Mother	Leena Manro	0
994754	Pickup Driver	Rick Pearce	2
85922	Police Captain	Tom Butler	2
1467737	Deputy	Michael Rowe	0
1655618	Deputy	Tim Perez	2
102742	Eiffel Tower Guard #1	Patrick Sabongui	2
1502991	Eiffel Tower Guard #2	Romuald Hivert	2
1070634	Pierre Clark	Mathieu Lardier	0
206654	Jensen	Fraser Corbett	0
60652	Tough Guard	Darren Shahlavi	2
1428779	Young British Recruiter	Aidan Gemme	0
1502992	Guitar Player	Takayuki Oki	0
1412193	GM Plant Worker	Natasha Davidson	0
1502993	Haitian Woman	Liliane Leilan Juma	0
1052900	Thick Glasses (uncredited)	Paul Anthony	0
1502994	DQ Patron (uncredited)	Kenia Arias	0
1502995	Hero Bus Patron (uncredited)	Kimberly Arklie	0
1502950	World's Fair Patron (uncredited)	Nicholas Barrera	0
1193924	Dave Clark #7 (uncredited)	Jason Bell	0
1502996	Guest (uncredited)	Wendy Bell	0
1502997	Pedestrian (uncredited)	Aimee Bowen	0
1502998	Gentleman - 1964 World Fair (uncredited)	Bradley Bowen	2
1591185	World's Fair Lady (uncredited)	Chrystall Friedemann	1
1651940	Pewdiepie (Uncredited)	Felix Kjellberg	2
66580	Baymax (voice)	Scott Adsit	2
515510	Hiro Hamada (voice)	Ryan Potter	2
82093	Tadashi Hamada (voice)	Daniel Henney	2
78324	GoGo Tomago (voice)	Jamie Chung	1
87822	Wasabi (voice)	Damon Wayans Jr.	2
589162	Honey Lemon (voice)	Génesis Rodríguez	1
52792	Aunt Cass (voice)	Maya Rudolph	1
21132	General (voice)	Abraham Benrubi	2
287341	Newscaster (voice)	Billy Bush	2
7884	Desk Sergeant (voice)	Daniel Gerson	2
1340669	Yama (voice)	Paul Briggs	0
54698	Additional Voices (voice)	Marcella Lentz-Pope	1
193254	Heathcliff (voice)	David Shaughnessy	2
60272	Additional Voice (voice)	Cam Clarke	0
36821	Additional Voice (voice)	Nicholas Guest	2
127387	Additional Voice (voice)	Yuri Lowenthal	2
1225886	Additional Voice (voice)	Sundra Oakley	0
1252466	Additional Voice (voice)	Brian R. Norris	0
158124	Additional Voice (voice)	Shane Sweet	2
60232	Additional Voice (voice)	David Cowgill	2
176035	Additional Voice (voice)	Kirk Baily	2
1502447	Ringleader (voice)	Charlotte Gulezian	0
1114051	Additional Voice (voice)	Reed Buck	0
56612	Additional Voice (voice)	Roy Conli	0
1502448	Additional Voice (voice)	Cooper Cowgill	0
950773	Additional Voice (voice)	Jackie Gonneau	0
1502449	Additional Voice (voice)	Marlie Crisafulli	0
173428	Additional Voice (voice)	Bridget Hoffman	1
1077829	Additional Voice (voice)	Kelly Hoover	0
1502450	Additional Voice (voice)	Leah Latham	0
1502451	Additional Voice (voice)	James Taku Leung	0
1502452	Additional Voice (voice)	Yumi Mizui	0
1371667	Additional Voice (voice)	Michael Powers	0
1296646	Additional Voice (voice)	Lynwood Robinson	0
1447307	Additional Voice (voice)	Josie Trinidad	0
1502453	Male Technician #1 (voice) (uncredited)	Dan Howell	2
4764	Wreck-It Ralph (voice)	John C. Reilly	2
7404	Vanellope von Schweetz (voice)	Sarah Silverman	1
58737	Fix-It Felix (voice)	Jack McBrayer	2
21131	Markowski (voice)	Joe Lo Truglio	2
18977	Mr. Litwak (voice)	Ed O'Neill	2
352	General Hologram (voice)	Dennis Haysbert	2
76245	Wynnchel (voice)	Adam Carolla	0
52117	Duncan (voice)	Horatio Sanz	2
165787	Sour Bill / Zangief (voice)	Rich Moore	2
46074	Deanna (voice)	Rachael Harris	1
73128	Roy (voice)	Skylar Astin	2
95002	Rancis Fluggerbutter (voice)	Jamie Elman	2
1461416	Crumbelina Di Caramello (voice)	Cymbre Walk	0
567562	Surge Protector (voice)	Phil Johnston	2
106490	Moppet Girl (voice)	Stefanie Scott	0
1223658	Gene / Zombie (voice)	Raymond S. Persi	2
1461363	Cyborg (voice)	Brian Kesinger	0
1340663	Sugar Rush Announcer / Turtle (voice)	Tucker Gilmore	0
1232689	Kohut (voice)	Brandon Scott	2
34521	Tapper (voice)	Maurice LaMarche	2
75038	Sonic the Hedgehog (voice)	Roger Craig Smith	2
571225	Ryu (voice)	Kyle Hebert	2
237163	Ken Masters (voice)	Reuben Langdon	0
1173048	M. Bison (voice)	Gerald C. Rivers	0
137194	Clyde (voice)	Kevin Deters	0
137198	Yuni Verse (voice)	Jamie Sparer Roberts	0
210877	Additional Voices (voice)	Isabella Acres	1
1457476	Additional Voices (voice)	Mike Carlsen	0
12077	Additional Voices (voice)	Jim Cummings	2
73016	Additional Voices (voice)	Debi Derryberry	1
146186	Additional Voices (voice)	Eddie Frierson	2
1341141	Additional Voices (voice)	Earl Ghaffari	2
81667	Additional Voices (voice)	Jennifer Hale	1
1340676	Additional Voices (voice)	Daniel Kaz	0
1610452	Additional Voices (voice)	Dave Kohut	0
1214800	Additional Voices (voice)	Lauren MacMullan	0
113916	Additional Voices (voice)	Scott Menville	2
174563	Additional Voices (voice)	Paul Pape	2
204505	Additional Voices (voice)	Trenton Rogers	2
1340685	Additional Voices (voice)	Jadon Sand	0
60739	Additional Voices (voice)	Kath Soucie	1
111467	Additional Voices (voice)	April Stewart	1
1464361	Additional Voices (voice)	Jennifer Christine Vera	0
15274	Additional Voices (voice)	E.G. Daily	1
18286	Hero Girl (voice)	Nona Gaye	1
42363	Lonely Boy Billy (voice)	Peter Scolari	2
42362	Know-It-All (voice)	Eddie Deezen	2
42287	Sister Sarah / Mother (voice)	Leslie Zemeckis	1
37935	Elf Lieutenant (voice)	Steven Tyler	2
23791	Toothless Boy (voice)	Chris Coppola	2
12826	Elf General (voice)	Charles Fleischer	2
96066	Jake Morrison	Liam Hemsworth	2
4785	David Levinson	Jeff Goldblum	2
8984	President Whitmore	Bill Pullman	2
1094091	Patricia Whitmore	Maika Monroe	1
6068	President Lanford	Sela Ward	1
2535	Jasmine	Vivica A. Fox	1
4273	Dr. Catherine Marceaux	Charlotte Gainsbourg	1
1213786	Dr. Brakish Okun	Brent Spiner	2
6167	Julius Levinson	Judd Hirsch	2
117437	Secretary of Defense	Patrick St. Esprit	0
1255069	Dylan Hiller	Jessie Usher	0
150899	Rain Lao	AngelaBaby	1
931264	Lin Tang	Grace Huang	1
76916	Officer Ryan Collins	Ryan Cartwright	2
1446466	Bobby	Garrett Wareing	0
81683	Agent Matthew Travis	Gbenga Akinnagbe	2
1172108	Daisy	Mckenna Grace	1
61703	Yeong	Ron Yuan	2
995358	Secret Service Agent	Alice Rietveld	0
73609	Floyd Rosenberg	Nicolas Wright	2
1278725	Charlie Miller	Travis Tope	2
80019	Lt. Ritter	James A. Woods	2
1162	General Grey	Robert Loggia	2
1172430	Dr. Isaacs	John Storey	2
1397784	Felix	Hays Wellford	0
1194214	Radar Officer	Sam Quinn	2
1458290	Aide 2	Alma Sisneros	0
1529185	Parisian Office Worker	Humberto Castro	0
1527955	Military Brass	Richard Beal	0
1046665	Armand	Joshua Mikel	0
1264845	Tech Officer	Monique Candelaria	1
1371849	Flight Officer	Stafford Douglas	2
78414	Captain McQuaide	Robert Neary	0
1706605	DC Hospital Nurse	Mona Malec	0
1574845	Road Rage / Confrontation Driver	Grizelda Quintana	0
1287802	Kevin	Lance Lim	2
1574846	Officer	Brandon K. Hampton	0
1474171	Ping Li	Kenny Leu	0
143647	Jaques	Joel Virgel	2
43596	Prison Tech	Jacob Browne	0
1706583	Prison Tech	Matthew Munroe	2
1706604	Salt Flat Tech	Jade Scott Lewis	0
1555648	Camper Henry	Zeb Sanders	2
1706602	Camper Marcus	Donovan Tyee Smith	0
1451123	Young Man	Stephen Oyoung	0
1404646	Local Reporter	Casey Messer	1
1706609	Local Reporter	J.P. Murrieta	2
1546075	Young Mother (uncredited)	Ava Del Cielo	0
1639911	Background (uncredited)	Leilei Chen	1
1527954	Flight Officer (uncredited)	Catharine Pilafas	0
1548734	ESD Tech (uncredited)	Katrina Kavanaugh	0
1706589	Scientist (uncredited)	Sylvie Hagan	0
1574844	Pilot P. Goodman (uncredited)	Evan Bryn Graves	1
1755293	Tug Pilot (uncredited)	Aaron Tyler	2
1821402	Voice of Sphere	Jenna Purdy	0
1126417	Bordeaux	Arturo del Puerto	0
122234	Chinese President	Ben Wang	0
79210	French President	Nicholas Ballas	0
449	Hiccup	Jay Baruchel	2
17276	Stoick	Gerard Butler	2
59174	Astrid	America Ferrera	1
54691	Fishlegs	Christopher Mintz-Plasse	2
41091	Ruffnut	Kristen Wiig	1
138619	Starkard	Philip McGrade	0
138620	Hoark the Haggard	Kieron Elliott	0
55398	Phlegma the Fierce	Ashley Jensen	1
20049	Spitelout	David Tennant	2
6408	John Connor	Nick Stahl	2
6194	Kate Brewster	Claire Danes	1
7218	T-X	Kristanna Loken	1
7220	Scott Petersen	Mark Famiglietti	2
2716	Dr. Peter Silberman	Earl Boen	2
7221	Betsy	Moira Harris	1
7222	Chief Engineer	Chopper Bernet	2
7223	Brewser's Aide	Christopher Lawford	2
7226	Bill's Girlfriend	Alana Curry	1
27738	Engineer	Chris Hardwick	2
1444239	Jose Barrera	Robert Alonzo	0
1178376	Roadhouse Clubgoer	Susan Merson	1
51329	Rocket  Raccoon (voice)	Bradley Cooper	2
12132	Yondu Udonta	Michael Rooker	2
543261	Nebula	Karen Gillan	1
515	Nova Prime	Glenn Close	1
1121	The Collector	Benicio del Toro	2
1148455	Young Quill	Wyatt Oleff	2
51663	Kraglin / On Set Rocket	Sean Gunn	2
82639	Carina	Ophelia Lovibond	1
11115	Denarian Saal	Peter Serafinowicz	2
2518	Grandpa	Gregg Henry	2
209578	Meredith Quill	Laura Haddock	0
1133011	Bereet	Melia Kreiling	0
1363394	Nova Prime's Assistant	Mikaela Hoover	1
1111204	Head Riot Guard	Emmett Scanlan	0
1211540	Moloka Dar	Alexis Rodney	0
95051	Horuz	Tom Proctor	2
1405553	Cosmo the Space Dog	Fred	0
15218	Maskless Sakaaran	James Gunn	2
85096	Knowhere Dispatcher	Stephen Blackehart	2
1229414	Nova Centurion	Naomi Ryan	1
78021	Prisoner (uncredited)	Lloyd Kaufman	2
16848	Ravager Navigator (voice)	Rob Zombie	2
15221	Ravager Pilot (uncredited)	Tyler Bates	2
13922	Howard the Duck (voice) (uncredited)	Seth Green	2
1405259	On Set Groot	Krystian Godlewski	0
1405269	Meredith's Mother	Janis Ahern	0
1405309	Meredith's Brother	Solomon Mousley	0
1405311	Meredith's Best Friend	Lindsay Morton	0
1405317	Dr. Fitzgibbon	Robert Firth	0
1237281	Horuz' Mate	Nick Holmes	0
1186515	Pretty Xandarian	Nicole Alexandra Shipley	1
1211966	Nova Arresting Pilot	Sharif Atkins	2
72440	Corpsman Dey's Partner	Brendan Fehr	2
1405441	Angry Guard	Dominic Grant	0
1405444	Sad Woman with Horns	Alison Lintott	1
1234991	Mottled Prisoner	Keeley Forsyth	0
1405453	Burly Prisoner	Frank Gilhooley	0
91494	Watchtower Guard	Enzo Cilenti	2
25679	One Legged Prisoner	Richard Katz	0
56617	Rifle Guard	Enoch Frost	0
59286	Tortured Pink Girl	Laura Ortiz	1
1405537	Lady of the Boot of Jemiah	Rosie Jones	0
1405538	Lady of the Boot of Jemiah	Abidemi Sobande	0
1405540	Lady of the Boot of Jemiah	Alex Rose	0
1405552	Lady of the Boot of Jemiah	Emily Redding	0
1405554	Sad Krylorian Girl	Jennifer Moylan-Taylor	0
1227575	One-Eyed Ravager	Bruce Mackinnon	0
92615	Alien Nova Pilot	Graham Shiels	2
1405566	Maskless Sakaaran	Douglas Robson	0
1405567	Corpsman Dey's Wife	Rachel Cullen	0
1362815	Goth Ravager	David Yarovesky	0
1283880	Crying Xandarian Citizen	Miriam Lucia	0
1502373	Ravager (uncredited)	Raed Abbas	0
1502374	Traveller (uncredited)	Freddie Andrews	0
1502375	Prisoner (uncredited)	Helen Banks	0
1873059	Peter Quill's Aunt (uncredited)	Marianna Dean	0
1744089	Xandar Resident (uncredited)	Erica Melargo	1
10297	Joseph Cooper	Matthew McConaughey	2
83002	Murph Cooper	Jessica Chastain	1
1893	Tom Cooper	Casey Affleck	2
851784	Young Murph Cooper	Mackenzie Foy	1
1190668	Young Tom Cooper	Timothée Chalamet	2
58549	TARS (voice)	Bill Irwin	2
1892	Dr. Mann	Matt Damon	2
9560	Old Murph Cooper	Ellen Burstyn	1
12074	Donald	John Lithgow	2
8210	Dr. Doyle	Wes Bentley	2
35013	Principal	David Oyelowo	2
86624	Ms. Kelly	Collette Wolfe	1
32202	Lois Cooper	Leah Cairns	1
171901	Nurse Practitioner	Lena Georgas	0
212689	Doctor	Jeff Hephner	2
31649	Nurse	Brooke Smith	1
1452481	Coop	Liam Dickinson	2
100650	Boots	Francis X. McCarthy	2
167720	Smith	Andrew Borba	2
1505363	Girl on Truck	Flora Nolan	1
1452865	NASA Employee (uncredited)	William Patrick Brown	2
1503849	NASA Scientist (uncredited)	Cici Leah Campbell	1
1573547	Scientist (uncredited)	Kristian Van der Heyden	2
1699056	Popcorn Seller (uncredited)	Ryan Irving	2
1663832	Construction Boss (uncredited)	Alexander Michael Helisek	2
1699057	NASA Scientist (uncredited)	Benjamin Hardy	2
13022	Browning	Tom Berenger	2
4935	Maurice Fischer	Pete Postlethwaite	2
526	Nash	Lukas Haas	2
66441	Blonde	Talulah Riley	1
173212	Japanese Security Guard	Tohoru Masamune	0
967376	Phillipa (5 years)	Taylor Geare	1
973135	Phillipa (3 years)	Claire Geare	1
1677266	James (3 years)	Johnathan Geare	2
56120	Saito's Attendant	Yuji Okumoto	2
2246	Elderly Bald Man	Earl Cameron	2
1677267	Lawyer	Ryan Hayward	2
72864	Thin Man	Tim Kelleher	2
1677498	Bridge Sub Con	Coralie Dedykere	1
13695	Bridge Sub Con	Silvie Laguna	0
133257	Bridge Sub Con	Virgile Bramly	2
1677507	Bridge Sub Con	Nicolas Clerc	2
1536351	Bridge Sub Con	Jean-Michel Dagory	2
203087	Lobby Sub Con	Marc Raducci	2
1098600	Rando Yaguchi : Deputy Chief Cabinet Secretary	Hiroki Hasegawa	2
588403	Hideki Akasaka : Special Advisor to the Prime Minister(National Security)	Yutaka Takenouchi	2
224664	Kayoko Ann Patterson : US special envoy	Satomi Ishihara	1
120690	Yuseuke Shimura : Secretary of Rando	Kengo Kora	2
1502395	Syuichi Izumi : Policy Research Council Vice Chairman	Matsuo Satoru	0
130654	Hiromi Ogashira : Ministry of the Environment  Nature / Wildlife Division Deputy Director	Mikako Ichikawa	1
87662	Ryu Yasuda : Ministry of Education, Culture, Sports, Science and Technology, Research / Promotion Bureau Director	Issei Takahashi	2
13256	Fumiya Mori : Ministry of Health, Labour and Welfare / Research and Development Division Director	Kanji Tsuda	0
58608	Kunio Hazama : Jouhoku University Associate professor	Shinya Tsukamoto	2
1405926	Tachikawa : Agency for Natural Resources and Energy / Electricity and Gas Industry Department Director	Toru Nomaguchi	2
1404981	Tatsuya Negisi : Nuclear Regulatory Agency / Monitoring information Division Director	Daisuke Kuroda	2
137029	Seiji Ookouchi : Prime minister	Ren Osugi	0
80864	Reiko Hanamori : Minister of Defense	Kimiko Yo	1
13283	Ryuta Azuma : Chief Cabinet Secretary	Akira Emoto	2
85939	Yusuke Satomi : Minister of Agriculture, Forestry and Fisheries	Sei Hiraizumi	0
58609	Sekiguchi : Minister of Education, Culture, Sports, Science and Technology	Toru Tezuka	0
52713	Yanagihara :  Minister of land, infrastructure and transportation	Kenichi Yajima	2
556796	Kouno : Minister of Internal Affairs and Communications	Akira Hamada	2
135200	Kanai : Minister of State for Special Missions	Ikuji Nakamura	0
20335	Kooriyama : Deputy Chief Cabinet Secretary for Crisis Management	Tetsu Watanabe	0
2541	Masao Zaizen : JSDF  Chief of Staff, Joint Staff Office	Jun Kunimura	2
58665	Yajima : JSDF Vice Chief of Staff, Joint Staff Office	Shingo Tsurumi	0
1015727	JSDF Eastern Army Chief of Staff	Jun Hashimoto	2
120434	Saigo  : Operation "TaBa" Combat leader	Pierre Taki	0
115700	1st. tank squadron captain	Takumi Saito	2
1684104	2nd. tank squadron captain	KREVA	2
120351	Kozuka : Governor of Tokyo	Ken Mitsuishi	2
127224	Katayama : Minister for Foreign Affairs ad interim	Kyusaku Shimada	0
20327	Tahara : Ministry of Internal Affairs and Communications / Disaster Management Division	Taro Suwa	2
1095922	Kazekoshi : Executive Secretary to the Prime Minister	Yû Kamio	0
146785	Sawaguchi : Police Agency Commissioner General's Secretariat	Arata Furuta	2
58615	National Police Agency Criminal Investigation Bureau Director-General	Moro Morooka	0
1431222	National Police Agency in charge of crisis management officer	Kôsei Katô	2
1637675	Fire and Disaster Management Agency in charge of crisis management officer	Shohei Abe	2
84725	Firefighters of Tokyo Fire Department	Keisuke Koide	0
123862	Prime Minister's Office staff	Hairi Katagiri	0
58613	Hayafune : Free Journalist	Suzuki Matsuo	2
1096815	Journalist	Takahiro Miura	0
1078683	Journalist	Yôta Kawase	2
1041467	Evacuees	Ren Mori	2
1029275	Evacuees Aqua tunnel	Atsuko Maeda	1
1077301	Biology professor	Kazuo Hara	2
1057942	Marine biologist	Akira Ogata	2
77921	Bus Driver	Hideaki Anno	2
85309	Dr.Goro Maki	Kihachi Okamoto	2
149405	Godzilla	Mansai Nomura	0
150296	\N	Mayumi Ogawa	1
1698019	\N	Katsuhiko Yokomitsu	0
109	Frodo	Elijah Wood	2
105584	Lindir	Bret McKenzie	2
22	Great Goblin	Barry Humphries	2
218563	King Thror	Jeffrey Thomas	2
235025	Goblin (uncredited)	Tim McLachlan	2
10883	Johnny Tran	Rick Yune	2
9186	Jesse	Chad Lindberg	2
12796	Leon	Johnny Strong	2
31841	Vince	Matt Schulze	2
8175	Agent Bilkins	Thom Barry	2
61658	Edwin	Ja Rule	2
61216	Harry	Vyto Ruginis	2
1479424	Muse	Stanton Rutledge	0
1479425	Danny Yamato	RJ de Vera	0
1005339	Ted Gassner	Beau Holden	2
100538	Rasta Racer	David Douglas	0
84757	Samoan Guard	Peter 'Navy' Tuiasosopo	2
84064	Dispatcher	F. Valentino Morales	0
11874	Ferrari Driver	Neal H. Moritz	2
18878	Pizza Hut Delivery Guy	Rob Cohen	2
80406	Big Rig Driver	Kevin Smith	2
1479427	Ferrari Passenger	Doria Clare Anselmo	0
1479428	Johnny's Father	Glenn K. Ota	0
1479429	Night Truck Driver	Mike White	0
106885	Racer's Edge Clerk	Delphine Pacific	1
1479430	Monica	Monica Tamayo	0
1479431	Gimel	Megan Baker	0
1479432	Edwin's Babe	Tammy Monica Gegamian	0
15887	Caroline	Julia Ormond	1
219666	Daisy Age 10	Madisen Beaty	1
973	Thomas Button	Jason Flemyng	2
13550	Monsieur Gateau	Elias Koteas	2
40036	Queenie	Taraji P. Henson	1
58953	Dorothy Baker	Faune A. Chambers	1
230995	Blanche Devereux	Donna DuPlantier	1
1074186	Martin Gateau	Jacob Tolano	2
231274	Teddy Roosevelt	Ed Metzger	0
1074187	Priest Giving Last Rites	Danny Vinson	0
203867	Caroline Button	Joeanna Sayler	1
52483	Robert Williams	Rus Blackwell	2
932967	Tizzy	Mahershala Ali	2
928295	David	Adrian Armas	2
17184	Grandma Fuller	Phyllis Somerville	1
101847	Preacher	Lance E. Nichols	2
1235414	Walter Abbott	David Ross Paterson	2
1219313	Mrs. Hollister	Fiona Hale	1
60388	Mrs. Horton	Marion Zinser	1
44063	Mrs. Maple	Edith Ivey	1
75325	Dr. Rose	Patrick Thomas O'Brien	2
86812	Mr. Daws	Ted Manson	2
60536	Young Mr. Daws	Clay Cullen	2
1592644	Sybil Wagner	Paula Gray	1
15440	Captain Mike	Jared Harris	2
60884	Man at Train Station	Earl Maddox	2
40038	Ballerina Who Ties Up Shoelace (uncredited)	Bianca Chiminello	1
1224131	Ballet Dancer (uncredited)	Emma Degerstedt	1
1169284	Woman Kissing Benjamin (uncredited)	Megan Brown	1
1503756	The Grumpy Sailor (uncredited)	Clay Chamberlin	2
4724	Sebastian Shaw / Black Bishop	Kevin Bacon	2
31717	Emma Frost / White Queen	January Jones	1
572541	Sean Cassidy / Banshee	Caleb Landry Jones	2
37153	Angel Salvadore / Tempest	Zoë Kravitz	1
39391	Armando Muñoz / Darwin	Edi Gathegi	2
1030252	Janos Quested / Riptide	Álex González	2
13525	CIA Director McCone	Matt Craven	2
1118	Russian General	Rade Serbedzija	2
456008	Charles Xavier (12 Years)	Laurence Belcher	2
81260	Young Erik	Bill Milner	0
1007	William Stryker	Don Creech	2
20471	Levene	Demetri Goritsas	2
6719	Secretary of State	Ray Wise	2
1610301	Soviet NCO	David Agranov	2
17199	Chief Warden	Corey Johnson	0
82809	Co-Ed	Annabelle Wallis	1
1658940	Edie Lensherr	Éva Magyar	0
2220	Man In Black Suit Agent	Tony Curran	2
36631	Man In Black Suit Agent	Randall Batinkoff	2
1465954	Mr. Lensherr (Erik's Dad)	Georg Nikoloff	0
9140	Swiss Bank Manager	James Faulkner	2
1088	1st German / Pig Farmer	Ludger Pistor	2
20021	2nd German / Tailor	Wilfried Hochholdinger	2
27972	Peeta Mellark	Josh Hutcherson	2
1231	President Alma Coin	Julianne Moore	1
1233	Plutarch Heavensbee	Philip Seymour Hoffman	2
55636	President Snow	Donald Sutherland	2
530025	Primrose Everdeen	Willow Shields	1
51682	Castor	Wes Chatham	2
58502	Cressida	Natalie Dormer	1
20220	Pollux	Elden Henson	2
94103	Messalla	Evan Ross	2
1366702	Commander Paylor	Patina Miller	1
47533	Mrs. Everdeen	Paula Malcomson	1
1085158	Annie Cresta	Stef Dawson	1
165242	Enobaria	Meta Golding	1
1011904	Commander Lyme	Gwendoline Christie	1
17343	Antonius	Robert Knepper	2
167862	Homes	Omid Abtahi	2
1317693	Tigris	Eugenie Bondurant	1
20275	Egeria	Sarita Choudhury	1
1329572	District 13 Civilian	Brandon Cyrus	2
41820	Lieutenant Jackson	Michelle Forbes	1
1334173	Rebel Sniper	Thomas Blake Jr.	2
1328185	Injured Career	Linds Edwards	0
141762	Mitchell	Joe Chrest	2
1249175	D4 Officiant	Mark Jeffrey Miller	2
558899	Commander of D5	Desmond Phillips	0
10691	Doctor Aurelius	April Grace	1
158045	Katniss's Father	Phillip Troy Linger	0
932107	Leeg #1	Misty Ormiston	0
932103	Leeg #2	Kim Ormiston	0
1511922	Girl in Lemon Yellow Coat	Elle Graham	0
1786255	Rebel Nurse	Lacy Dmitriew	0
1645312	Capitol Girl	Kate Rachesky	0
1006139	Greenhouse Guard #1	David Hallyday	0
1786259	Everdeen Child #1	Bear Lawrence	0
1786260	Everdeen Child #2	Theodore Lawrence	0
1669941	Capitol Citizen (uncredited)	Emma Elle Roberts	1
147642	District 13 Citizen (uncredited)	Alexander Yassin	0
1383491	District 13 Citizen (uncredited)	Lauren Henneberg	1
1669940	District 8 Hospital Patient (uncredited)	Jasmine Ahnie	1
1560335	District 8 (uncredited)	Sue-Lynn Ansari	1
2963	Balthazar Blake	Nicolas Cage	2
20374	Becky Barnes	Teresa Palmer	1
119586	Andre	Ethan Peck	2
2506	Morgana le Fay	Alice Krige	1
334	Bennet	Omar Benson Miller	0
17834	Young Dave	Jake Cherry	2
1187835	Merlin	James A. Stephens	2
1187836	Sun-Lok	Gregory Woo	0
210392	Physics Student	Ian Alda	2
3037	Richard Nelson	Richard Dreyfuss	2
6164	Dylan Johns	Josh Lucas	1
6857	Maggie James	Jacinda Barrett	1
4730	Jennifer Ramsey	Emmy Rossum	1
6858	Christian	Mike Vogel	2
6859	Elena	Mía Maestro	0
6861	Captain Bradford	Andre Braugher	2
6862	Valentin	Freddy Rodríguez	2
6863	Lucky Larry	Kevin Dillon	2
6864	Chief Officer Reynolds	Kirk B.R. Woller	2
20497	Gloria	Fergie	1
92808	1st Officer Chapman	Gabriel Jarret	0
25438	James Harcourt	Ed Speleers	2
1653293	Pimlick Hightopp	Tom Godwin	2
1538417	Young Mirana	Amelia Crouch	1
1374336	Young Iracebeth	Leilah de Meza	1
6975	Nobody (voice)	Meera Syal	1
1307014	Tyva Hightopp	Simone Kirby	1
992504	Bumalig Hightopp	Siobhan Redmond	1
135467	Wilkins (voice)	Matt Vogel	0
1742620	Chess King (voice)	Paul Hunter	0
19513	Humpty Dumpty (voice)	Wally Wingert	2
1742624	Young Hatter	Louis Ashbourne Serkis	0
144291	Alexandra	Joanna Bobin	1
1427990	Bim Hightopp	Joe Hurst	0
1742628	Young Bim Hightopp	Oliver Hawkes	0
1705493	Poomally Hightopp	Frederick Warder	0
1742629	Paloo Hightopp	Eve Hedderwick Turner	1
1413421	Boatswain	Daniel Hoffmann-Gill	0
1626984	First Mate	Jamie Baughan	0
1742630	Helmsman	Matt Wilman	0
1742631	Witzender	Siobhan McSweeney	1
1742632	Delivery Frog (voice)	Owain Rhys Davies	0
1220073	Gentleman Fish (voice)	Edward Petherbridge	0
390184	Board Member	Richard Syms	2
85970	Footman	Neil Edmond	2
14493	Driver	Bill Thomas	2
1742633	Dancer	Carol Been	1
1742635	Dancer	Ross Carpenter	0
76901	Dancer	Melissa Collier	1
1742636	Dancer	Heather Craig	1
1742637	Dancer	Janine Craig	1
1742640	Dancer	Leigh Daniels	1
1742643	Dancer	Jules Davison	0
1742644	Dancer	Matt Dempsey	0
1742645	Dancer	Nikki Dunsford	1
1212713	Dancer	Steve Fortune	0
1742654	Dancer	Jane Fowler	1
1742655	Dancer	Adam Galbraith	0
1742656	Dancer	Chris Grierson	0
1742657	Dancer	William Mowat	0
1742658	Dancer	Cris Penfold	0
1742659	Dancer	Kraig Thornber	0
1742660	Dancer	Carl Walker	0
1742661	Dancer	Claire Winsper	1
1379283	Lord Ascot's Maid	Lauren Beacham	1
234621	Witzender / Vendor	Alexander Bracq	2
1742683	Blue Man	Austin Burrows	0
571437	Goat	Adam Burton	0
1742684	Lady Ascot's Maid	Sarah Butterworth	1
1742685	Hong Kong Citizen	Yue Ting Cheng	0
1742688	Tick-Tock (voice)	Angela Dee	1
1742692	Ship's Porter	Wayne Gibbon	0
1742694	Unicorn	Ross Green	2
1742695	Townsboy	Jacob Greener-Tofts	0
1742699	Royal Guard	Bomber Hurley-Smith	0
1742701	Stevedore	Mark Jury	0
1742702	Maid	Minouche Kaftel	1
1742704	Gentleman	Martyn Mayger	0
1742705	Coronation Aristocrat	Alida Pantone	1
1742998	Townsboy	Alexander James Rodriguez	0
1742999	Royal Guard	Riku Rokkanen	0
1566183	Brilliam Hinkle	Steve Saunders	0
157954	Fisherman	Mike Simmrin	0
1687937	Asylum Patient	Karol Steele	1
1743005	Ascot Male	Tom Whelehan	0
1394397	Townswoman	Charlotte Worwood	1
10713	Merlin (voice)	Eric Idle	2
12110	Cinderella (voice)	Amy Sedaris	1
12111	Prince Artie (voice)	Justin Timberlake	2
89042	Evil Queen (voice)	Susanne Blakeslee	1
60252	Sleeping Beauty / Actress (voice)	Cheri Oteri	1
12071	Raul (voice)	Guillaume Aretos	0
12079	Master of Ceremonies / Fiddlesworth (voice)	Kelly Asbury	2
1784317	Ogre Baby (voice)	Zachary James Bernard	0
1335621	Evil Tree #1 (voice)	Andrew Birch	0
1571793	Cheerleader / Tiffany / Mother (voice)	Kelly Cooney	0
76745	Ogre Baby (voice)	Dante James Hauser	0
1784320	Ogre Baby (voice)	Jordan Alexander Hauser	0
71535	Guard #1 (voice)	Tom Kane	2
205030	Cheerleader (voice)	Alina Phelan	1
136530	Cyclops (voice)	Mark Valley	0
116315	Old Lady (voice)	Kari Wahlgren	0
52851	Garona Halforcen	Paula Patton	1
77700	Anduin Lothar	Travis Fimmel	2
55470	King Llane Wrynn	Dominic Cooper	2
224167	Khadgar	Ben Schnetzer	2
64436	Gul'dan	Daniel Wu	2
540	Moroes	Callum Keith Rennie	2
77164	Karos	Ryan Robbins	2
1382451	Callan	Burkley Duffield	0
111930	Squire	Donnie MacNeil	2
63566	King Magni	Michael Adamthwaite	2
1510489	Young Varian Wrynn	Dylan Schombing	2
106952	Draka	Anna Galvin	1
172873	Varis / Caged Frostwolf	Dean Redman	2
1233165	Compound Guard	Glenn Ennis	2
1679287	Draenei Mother	Elena Wurlitzer	1
290112	Aloman	Anna Van Hooft	1
1679290	Officer #1	Adrian Glynn McMorran	2
1127280	Officer #2	Kyle Rideout	2
103283	Officer #3	Mike Antonakos	0
172800	Westfall Woman	Elisabeth Rosen	1
1417044	Gate Guard	Wesley MacInnes	0
1508117	Elf Delegate	Christian Sloan	2
1504484	Kul Tiran Delegate	Valérie Wiseman	1
28871	Finden	Eugene Lipinski	2
158587	Archmage	Christina Jastrzembska	1
1233167	Prison Mage #1	Travis MacDonald	2
61167	Prison Mage #2	Frank C. Turner	2
1512660	Warrior	Trevor Mack	2
72045	Prison Soldier	Donavon Stinson	2
1679314	Dwarf Messenger	Joel Sturrock	2
119811	Tower Guard (uncredited)	G. Michael Gray	2
1368268	Human Villager (uncredited)	Michael Patric	2
1223786	Sarah Connor	Emilia Clarke	1
1030512	Danny Dyson	Dayo Okeniyi	2
136532	Alex	Matt Smith	2
24047	Miles Dyson	Courtney B. Vance	2
55596	Lieutenant Matias	Michael Gladis	2
65345	Detective Cheung	Sandrine Holt	1
1023458	Young O'Brien	Wayne Bastrup	2
37937	Detective Harding	Gregory Alan Williams	2
59739	Detective Timmons	Otto Sanchez	2
1451160	Agent Janssen	Matty Ferraro	0
76021	Agent Burke	Griff Furst	2
1394617	Refugee / Terminator	Aaron V. Williamson	0
1181558	Skynet - 18 yrs old	Seth Meriwether	0
37825	Perry	Afemo Omilami	2
565501	Mariam	Teri Wyble	1
304845	Kyle's Dad	Mark Adam	2
100567	Kyle's Mom	Kerry O'Malley	0
1576250	Young Sarah	Willa Taylor	1
177403	Security Guard #1	James Moses Black	2
1576251	Security Guard #2	Terry Dale Parks	2
60077	Eric Thompson	Douglas Smith	2
1411679	Lead Cop	Anthony Michael Frederick	2
203390	Uniform Cop	Brandon Stacy	2
1358087	Guardian - Young / Terminator T-800	Brett Azar	2
60881	Garber	Douglas M. Griffin	2
1810485	Garbage Man	Ernest Wells	2
75170	Lord Drinian	Gary Sweet	2
107474	Rhince	Arthur Angel	2
143270	Rynelf	Tony Nixon	0
143271	Auctioneer	Colin Moody	0
93491	Eustace	Will Poulter	2
187107	Lord Bern	Terry Norris	0
27752	Lord Rhoop	Bruce Spence	2
42393	Coriakin	Bille Brown	2
962438	Liliandil	Laura Brent	0
1633572	Gael	Arabella Morton	1
3967	Nurse Lt. Evelyn Johnson	Kate Beckinsale	1
9777	Petty Officer Doris Miller	Cuba Gooding Jr.	2
10127	President Franklin Delano Roosevelt	Jon Voight	2
7447	Lt. Col. James Doolittle	Alec Baldwin	2
3197	Sgt. Earl Sistern	Tom Sizemore	2
10128	Lt. Billy Thompson	William Lee Scott	2
10129	Lt. Anthony Fusco	Greg Zola	2
5915	Nurse Betty Bayer	Jaime King	1
10130	Nurse Barbara	Catherine Kellner	1
9278	Nurse Sandra	Jennifer Garner	1
10131	Nurse Martha	Sara Rue	1
707	Capt. Thurman	Dan Aykroyd	2
10134	Adm. Isoroku Yamamoto	Mako	2
10133	Nishikura	John Fujioka	2
10135	Young Rafe	Jesse James	2
10136	Young Danny	Reiley McClendon	2
10137	Rafe's Father	Steve Rankin	0
10138	Training Captain	Brian Haley	2
6110	Adm. Chester W. Nimitz	Graham Beckel	2
16692	British Pilot (Supporting)	Viv Weatherall	2
1630464	Japanese Aide	Angel Sing	2
112347	Dorie's Friend	Rufus Dorsey	2
56045	Joe	Matthew Davis	2
1219546	Flyer with Murmur	David Hornsby	0
6914	Gen. George C. Marshall	Scott Wilson	2
168981	George	Howard Mungo	2
1223812	Japanese Officer	Ping Wu	2
161904	Pentagon Lieutenant	Stan Cahill	2
140250	Secretary of the Navy Frank Knox	Tom Everett	2
5151	Motherly Secretary	Beth Grant	1
97943	Kimmel's Aide	Raphael Sbarge	2
60634	Louie, Sailor	Marty Belafsky	2
168020	Pvt. Ellis, Radar Operator	Josh Green	0
154295	Army Commander	Michael Milhoan	2
22109	Capt. Mervyn Bennion - USS West Virginia	Peter Firth	2
1707334	Pop-Up Sailor	Marco Gould	0
52366	Joe, Boxer	Andrew Bryniarski	2
115005	Terrified Sailor	Nicholas Downs	2
94998	Navy Doctor	Tim Choate	2
4942	Senior Doctor	John Diehl	2
173886	Medic	Joseph Patrick Kelly	2
99816	Minister	Ron Harper	2
18982	Army Major	Ted McGinley	2
118756	Adm. Raymond A. Spruance	Madison Mason	2
91607	Doolittle Co-Pilot	Paul Francis	2
83985	Ripley	Scott Wiper	2
29020	Gunner	Eric Christian Olsen	2
1707342	Navigator	Rod Biermann	0
1335986	Japanese Soldier	Noriaki Kamata	0
107489	Japanese Soldier	Garret Sato	2
1707343	Japanese Soldier	Eiji Inoue	0
1585650	Nursing Supervisor	Precious Chong	1
55075	Next Guy in Line	Jeff Wadlow	2
1707350	Train Conductor	Will Gill Jr.	0
1382045	Japanese Tourist	Seth Sakai	0
976231	18-Year-Old Typist	Curtis Andersen	2
1707363	Orderly in Aftermath	Blaine Pate	0
95638	Naval Officer in Hospital (as John Pyper Ferguson)	John Pyper-Ferguson	2
9291	Captain Marc Andrew Mitscher	Michael Shamus Wiles	2
202143	Samoan Bouncer	Toru Tanaka Jr.	0
1248816	Wounded Sailor #1	Josh Ackerman	0
1707383	Wounded Sailor	Matt Casper	0
157536	Young Nervous Doctor	David Kaufman	2
156038	Captain Low	Lindsey Ginter	0
828	Teeny Mayfield	Guy Torry	2
2221	Major Jackson	Leland Orser	2
80437	Mission listener	Peter James Smith	2
57421	Young Flier	Thomas Wilson Brown	2
1224490	Pearl Harbor Nurse	Chad Morgan	0
77155	Japanese Aide	James Saito	2
84656	Japanese Aide	Tak Kubota	0
52141	Sunburnt Sailor	Robert Jayne	2
109423	Japanese Doctor	Vic Chao	0
76513	Wounded Sailor	Fred Koehler	2
33297	Baja Sailor	Ben Easter	2
1368011	Baja Sailor	Cory Tucker	0
559299	Baja Sailor	Abe Sylvia	0
1334077	Baja Sailor	Jason Liggett	0
98051	Baja Sailor	Bret Roberts	2
55084	Danny's Gunner	Sean Faris	2
32357	RAF Squadron Leader	Nicholas Farrell	2
1670	Pilot	Daniel Mays	2
156963	Dentist	Toshi Toda	2
74197	Dental Assistant	Jaymee Ong	0
19538	Maggie Madsen	Rachael Taylor	1
18471	Glen Whitman	Anthony Anderson	2
21710	Tom Banacheck	Michael O'Neill	2
17341	ACWO Jorge "Fig" Figueroa	Amaury Nolasco	2
1897	Bobby Bolivia	Bernie Mac	2
211800	Cafe Kid	Colton Haynes	2
146391	Sector Seven Agent	Brian Stepanek	2
865	Guy Flicked by Megatron (uncredited)	Michael Bay	2
19197	Miles	John Robinson	2
51992	Socialite	Odette Annable	1
12714	First Sergeant Donnelly	Zack Ward	2
74290	Trent DeMarco	Travis Van Winkle	2
62553	Sarah Lennox	Samantha Smith	1
123532	Sheriff	Rick Gomez	2
62849	Analyst	Tom Lenk	2
205011	Socialite	Michelle Pierce	1
66145	Jazz (voice)	Darius McCrary	2
154998	Pentagon Watch Commander	Scott Peat	2
72466	Alexander	Colin Farrell	2
5576	Philip	Val Kilmer	2
1244	Cassander	Jonathan Rhys Meyers	2
4173	Old Ptolemy	Anthony Hopkins	2
20278	Child Alexander	Jessie Kamm	0
4738	Young Alexander	Connor Paolo	2
1650058	Young Hephaistion	Patrick Carroll	2
20281	Young Nearchus	Peter Williamson	2
1650067	Young Cassander	Morgan Christopher Ferris	2
1650963	Young Ptolemy	Robert Earley	2
1650965	Young Perdiccas	Aleczander Gordon	2
20282	Parmenion	John Kavanagh	2
20284	Cleitus	Gary Stretch	2
5916	Roxane	Rosario Dawson	1
20285	Roxane's Father	Féodor Atkine	2
20279	Nurse	Fiona O'Shaughnessy	1
20287	Greek Officer	Laird Macintosh	2
20288	Bagoas	Francisco Bosch	2
20290	Leonnatus	Garrett Lombard	2
20291	Polyperchon	Chris Aberdein	2
3075	Crateros	Rory McCann	2
135142	Darius III	Raz Degan	2
79505	Philotas	Joseph Morgan	2
146140	Scribe	David Bedella	2
8318	Wrestling Trainer	Brian Blessed	2
1650962	Eurydice	Marie Meyer	1
165434	Attalus	Nick Dunning	2
51120	Ptolemy	Elliot Cowan	2
1403284	Antigonus	Ian Beattie	2
63360	Nearchus	Denis Conway	2
73401	Campfire Soldier	Michael Dixon	2
27420	Persian Prince	Erol Sander	2
147591	Bactrian Commander	Stéphane Ferrara	2
1256162	Dying Soldier	Tadhg Murphy	2
51102	Stateira	Annelise Hesme	1
1650983	Persian Chamberlain	Tsouli Mohammed	2
39678	Attalus' Henchman	Rab Affleck	2
1116115	Roxane Dancer	Michelle Lukes	1
1651012	Roxane Dancer	Gillian Grueber	1
1651013	Roxane Dancer	Anjali Mehra	1
1650996	Bagoas Dancer	Benny Maslov	2
1650997	Bagoas Dancer	Monica Zamora	1
1651001	Bagoas dancer	Monica Perego	1
1651007	Bagoas Dancer	Tania Matos	1
1651021	Bagoas Dancer	Marta Barahona	1
10981	Petunia Dursley	Fiona Shaw	1
23076	Cornelius Fudge	Robert Hardy	2
10982	Dudley Dursley	Harry Melling	2
10992	Percy Weasley	Chris Rankin	2
1643	James Potter	Adrian Rawlins	2
72309	Arabella Figg	Kathryn Hunter	1
2247	Kingsley Shacklebolt	George Harris	2
186070	Elphias Doge	Peter Cartwright	0
17069	Amelia Bones	Sian Thomas	0
1093976	Wilhelmina Grubbly-Plank	Apple Brook	0
144867	Aberforth Dumbledore	Jim McManus	2
1093977	Zacharias Smith	Nick Shirm	0
189689	Michael Corner	Ryan Nelson	0
192865	Everard	Sam Beazley	0
559759	Phineas Nigellus Black	John Atterbury	0
16792	John Dawlish	Richard Leaf	2
1796482	Pansy Parkinson	Lauren Shotton	0
133031	Bob	Nicholas Blane	0
1093972	Piers Polkiss	Jason Boyd	0
1093973	Malcolm	Richard Macklin	0
1054379	Dennis	Christopher Rithin	0
79856	Grawp	Tony Maudsley	2
3548	Kreacher (voice)	Timothy Bateson	2
47730	Mafalda Hopkirk (voice)	Jessica Hynes	1
30085	Magorian	Michael Wildman	0
1173241	Bane	Jason Piper	0
234921	Antonin Dolohov	Arben Bajraktaraj	2
1796483	Walden Macnair	Peter Best	0
1796485	Augustus Rookwood	Richard Trinder	0
1229241	Jugson	Richard Cubison	0
1796484	Travers	Tav MacDougall	0
1796478	Young Severus Snape	Alec Hopkins	0
568390	Young James Potter	Robbie Jarvis	0
1796479	Young Sirius Black	James Walters	0
1796480	Young Peter Pettigrew	Charles Hughes	0
1796481	Young Remus Lupin	James Utechin	0
1387292	Frank Longbottom	James Payton	2
1796489	Alice Longbottom	Lisa Wood	0
1631516	Edgar Bones	Cliff Lanning	2
221857	TV Weatherman	Miles Jupp	0
1093975	Newspaper Vendor	Jamie Wolpert	0
209458	Voice of Lift	Daisy Haggard	1
11288	Cedric Diggory	Robert Pattinson	2
11290	Viktor Krum	Stanislav Yanevski	2
11291	Fleur Delacour	Clémence Poésy	1
81024	Barty Crouch, Sr.	Roger Lloyd Pack	2
20053	Frank Bryce	Eric Sykes	2
81022	Amos Diggory	Jeff Rawle	0
1220981	Ministry Witch	Sheila Allen	1
1221007	Ministry Witch	Su Elliott	1
1090771	Ministry Witch	Anne Lacy	0
20002	Ministry Witch	Flip Webster	0
117654	Ministry Wizard	David Sterne	2
193409	Ministry Wizard	Christopher Whittingham	0
1090776	Ministry Wizard	Campbell Graham	0
213222	Food Trolley Lady	Margery Mason	0
1090780	Gabrielle Delacour	Angelica Mandy	0
1090781	Karkaroff's Aide	Tolga Safer	0
1090782	Ernie MacMillan	Louis Doyle	0
1090783	Hannah Abbott	Charlotte Skeoch	0
72313	Photographer	Robert Wilfort	2
174713	Angelina Johnson	Tiana Benjamin	0
513677	Roger Davies	Henry Lloyd-Hughes	2
107170	Band Lead Singer	Jarvis Cocker	0
74333	Band Lead Guitar	Jonny Greenwood	0
74335	Band Drums	Phil Selway	0
1090784	Band Bass Guitar	Steve Mackey	0
1090785	Band Rhythm Guitar	Jason Buckle	0
1090786	Band Keyboards	Steve Claydon	0
1834	Moaning Myrtle	Shirley Henderson	1
203935	Assistant Judge	Alan Watt	0
23532	Ray Embrey	Jason Bateman	2
66658	Aaron Embrey	Jae Head	2
66634	Man Mountain	David Mattey	2
16478	Jeremy	Johnny Galecki	2
66623	Hottie	Hayley Marie Norman	1
61835	Jr exec	Trieu Tran	2
49921	Police Sergeant	Darrell Foster	2
66659	Guy In Back	Ryan Radis	2
21317	Michel	Daeg Faerch	1
66681	Reporter	Matt Bettinelli-Olpin	2
66666	Nurse	Samantha Cannon	0
66683	Inmate	Rico Devereaux	0
66669	Radio Caller (voice)	Brandon Ford Green	2
66684	Theater patron	Johnathan Hallgrey	2
66630	Fan	Alexa Havins	1
66685	Theater Guest	Edward M. Kelahan	0
66664	Mug Shot Officer	Algerita Wynn Lewis	1
66680	Corrections Guard	Rick Mali	0
66671	Chain Gang Guard	Chris Mitchell	0
66667	KCOT Reporter	Scott Michael Morgan	2
66663	ER Doctor	Bryan Keith Ponton	0
66686	Theatergoer	Dawn Ressy	0
66687	Police K-9 officer	Nicholas Rich	0
66661	Reporter	Ron Fassler	2
66660	Matt	Mark Simich	2
60677	Executive	Brad Leland	2
8602	Anna Montez	Alice Braga	1
49918	Ethan	Charlie Tahan	2
53918	Zoe Neville	Salli Richardson-Whitfield	1
49920	Marley Neville	Willow Smith	1
49922	Alpha Female	Joanna Numata	1
6066	Alpha Male	Dash Mihok	2
964035	Military Driver - Jay	Samuel Glen	2
1075145	Sergeant	Pedro Mojica	0
164094	Woman Evacuee	Marin Ireland	1
996224	Male Evacuee	Alexander DiPersia	2
1282	Grandpa Joe	David Kelly	2
1285	Violet Beauregarde	AnnaSophia Robb	1
1286	Veruca Salt	Julia Winter	1
1290	Mike Teavee	Jordan Fry	2
1291	Augustus Glupsch	Philip Wiegratz	2
1294	Mrs. Beauregard	Missi Pyle	1
1292	Mr. Salt	James Fox	2
1293	Mrs. Gloop	Franziska Troegner	1
7320	Grandma Georgina	Liz Smith	1
52313	Grandma Josephine	Eileen Essell	1
1815747	Grandpa George	David Morris	0
58776	Prince Pondicherry	Nitin Ganatra	2
73707	Princess Pondicherry	Shelley Conn	1
1588373	Prodnose	Chris Cresswell	0
568396	Finckelgruber	Tony Kirwood	0
1815748	Mr. Gloop	Harry Taylor	0
1370651	Mrs. Salt	Francesca Hunt	0
10225	Narrator (voice)	Geoffrey Holder	2
17354	TV Reporter	Todd Boyce	2
47712	Man with Dog	Mark Heap	0
184997	Shopkeeper	Oscar James	0
30320	Jolly Woman	Annette Badland	1
1090804	\N	Débora Monteiro	0
10872	Remy (voice)	Patton Oswalt	2
7962	Linguini (voice)	Lou Romano	2
6197	Django (voice)	Brian Dennehy	2
11390	Anton Ego (voice)	Peter O'Toole	2
21197	Colette (voice)	Janeane Garofalo	1
32536	Lalo / Francois (voice)	Julius Callahan	2
21199	Git (Lab Rat) (voice)	Jake Steinfeld	0
7087	Ambrister Minion (voice)	Brad Bird	2
1160045	Narrator (voice)	Stéphane Roux	0
1443329	Street Woman (voice)	Andrea Boerries	0
1443330	Food Snob #3 (voice)	Marco Boerries	0
72753	Abusive Girlfriend (voice)	Lindsey Collins	0
1266046	Food Snob #1 (voice)	Thomas Keller	0
3897	Rachel Dawes	Katie Holmes	1
585	Earle	Rutger Hauer	2
534	Flass	Mark Boone Junior	2
3900	Thomas Wayne	Linus Roache	2
544	Finch	Larry Holden	2
489467	Little Boy	Jack Gleeson	2
1317397	Crane Thug #1	T.J. Ramini	0
1695960	Crane Thug #2	Kieran Hurley	2
1334124	Blonde Female Reporter / Assassin	Catherine Porter	0
1172371	Bruce Wayne als Kind	Gus Lewis	2
3902	Martha Wayne	Sara Stewart	1
3901	Joe Chill	Richard Brake	2
78114	Rachel Dawes - age 8	Emma Lockhart	1
87194	Jessica	Christine Adams	1
79124	Courthouse Reporter #1	Karen David	1
1690773	Courthouse Reporter #2	Jonathan D. Ellis	2
39660	Faden's Limo Driver	Tamer Hassan	2
559209	Uniformed Policeman #1	Ronan Leahy	2
1257821	Old Asian Prisoner	Vincent Wong	2
67212	Bhutanese Prison Guard #1	Tom Wu	2
1690926	Bhutanese Prison Guard #2	Mark Chiu	2
998501	Enormous Prisoner	Turbo Kong	0
62937	Chinese Police Officer	Sai-Kit Yung	2
211586	Chinese Police Officer	Chike Chan	2
1646701	Stocky Chinese Man	Jamie Hayden	2
556445	Dock Thug	Darragh Kelly	2
1602370	Dock Thug	John Kazek	2
5415	Dock Cop	Joseph Rye	2
1691875	Dock Cop	Kwaku Ankomah	2
1691876	Police Prison Official	Jo Martin	1
281527	Wayne Enterprises Executive	Charles Edwards	2
28749	Female Restaurant Guest	Lucy Russell	0
1695959	Male Restaurant Guest	Mark Straker	2
1691887	Male Restaurant Guest	Timothy Deenihan	2
1691892	Restaurant Blonde #1	Flavia Masetto	1
1691895	Restaurant Blonde #2	Emily Steven-Daly	1
29615	Arkham Thug #1	Noah Lee Margetts	2
1233819	Arkham Thug #2	Joe Hanley	2
1592216	Arkham Thug #3	Karl Shiels	2
1225357	Arkham Uniformed Policeman	Roger Griffiths	2
39681	Arkham Lunatic	Stephen Walters	2
40687	Arkham Chase Cop	Richard Laing	2
27709	Gotham Car Cop	Matt Miller	2
1362118	Captain Simonson	Risteard Cooper	2
10657	Older Gotham Water Board Technician	Shane Rimmer	2
70230	Younger Gotham Water Board Technician	Jeremy Theobald	2
105159	Gotham Society Dame	Alexandra Bastedo	1
1226707	Narrows Bridge Cop	John Judd	2
1692416	Farmer	Soo Hee Ding	0
1692428	Transit Cop	Phill Curr	2
1094720	Mrs. Dawes	Sarah Wateridge	1
1451681	Basement Club Manager	Charlie Kranz	2
1111202	Bad Swat Cop #1	Terry McMahon	0
156598	Liquor Store Owner	Cedric Young	2
1469792	Victor Zsas	Tim Booth	2
101658	Valet	Tom Nolan	2
2974	Hazmat Technician	Roger Yuan	2
1695915	Narrows Teenager #1	Joe Sargent	2
1668	Narrows Teenager #2	Emmanuel Idowu	2
1208945	Narrows Resident	Mel Taylor	2
1237293	Barbara Gordon	Ilyssa Fradin	1
17291	Uniformed Policeman	Andrew Pleavin	2
135259	Driving Cop	Jeff Christian	2
1691868	Old Himalayan Man	Tenzin Gyurme	2
1691866	Himalayan Child	Tenzin Clive Ball	2
1583206	Arkham Lunatic Cell Mate	John Burke	2
1695939	Arkham Asylum Nurse	Earlene Bentley	1
208838	Arkham Asylum Orderly	Alex Moggridge	2
1695946	Asian Man - Ra's Al Ghul Decoy	Jay Buozzi	2
1048571	Opera Performer	Rory Campbell	2
1695948	Opera Performer Margaret - Soprano	Poppy Tierney	1
1214974	League of Shadows Warriors	Mark Smith	2
986518	League of Shadows Warriors	Khan Bonfils	0
1695954	League of Shadows Warriors	Ruben Halse	2
1695947	African Boy in Rags	Jordan Shaw	2
1232679	Narrows Cop	Dominic Burgess	2
1247020	Additional Restaurant Guest #1	Nadia Cameron-Blakey	1
937527	Bridge Cop	Jeff Tanner	0
369256	Falafel Stand Vendor	Omar Mostafa	2
1695900	Pedestrian	Leon Delroy Williams	2
1695949	Caterer	Fabio Cardascia	2
94384	League of Shadows Warriors (uncredited)	Dean Alexandrou	0
100586	League of Shadows Warriors (uncredited)	Jon Foo	2
1449198	League of Shadows Warriors (uncredited)	Emil Martirossian	2
81671	League of Shadows Warriors (uncredited)	Mark Strange	2
81687	Ghotam Car Cop (uncredited)	Rick Avery	2
123796	Narrows Person (uncredited)	Gil Kolirin	2
1207208	Opera Hag (uncredited)	Jane Osborn	0
1210410	Narrows Rioter (uncredited)	Dan Poole	0
1207204	Shadow Warrior (uncredited)	Tommy Gunn	0
968767	Victor Zsasz Attorney (uncredited)	Philip Harvey	0
121701	Opera Hag (uncredited)	Russell Wilcox	2
1392726	Gotham Police Officer (uncredited)	Ray Donn	0
7399	Alex (voice)	Ben Stiller	2
9575	Gloria (voice)	Jada Pinkett Smith	1
14409	Melman (voice)	David Schwimmer	2
2632	Marty / Additional Zebras (voice)	Chris Rock	2
5726	Maurice (voice)	Cedric the Entertainer	2
28637	Mort (voice)	Andy Richter	2
109561	Mom (voice)	Sherri Shepherd	1
82092	Moto Moto (voice)	Will.i.am	2
64445	Nana (voice)	Elisa Gabrielli	0
1077795	Baby Alex (voice)	Quinn Dempsey Stiller	0
1077796	Baby Alex (voice)	Declan Swift	0
18863	Joe the Witch Doctor / Poacher #2 (voice)	Eric Darnell	2
205171	Baby Marty (voice)	Thomas Stanley	0

