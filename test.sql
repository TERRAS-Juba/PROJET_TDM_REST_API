--
-- PostgreSQL database dump
--

-- Dumped from database version 11.15
-- Dumped by pg_dump version 14.2

-- Started on 2022-06-03 16:59:31

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

--
-- TOC entry 200 (class 1259 OID 16826)
-- Name: am; Type: TABLE; Schema: public; Owner: postgres_admin
--

CREATE TABLE public.am (
    id_am character varying(28) NOT NULL,
    nom character varying(50) NOT NULL,
    prenom character varying(50) NOT NULL,
    numero_telephone character varying(10) NOT NULL,
    email character varying(50) NOT NULL,
    mot_de_passe character varying(50) NOT NULL,
    photo_am character varying(255) NOT NULL
);


ALTER TABLE public.am OWNER TO postgres_admin;

--
-- TOC entry 201 (class 1259 OID 16829)
-- Name: atc; Type: TABLE; Schema: public; Owner: postgres_admin
--

CREATE TABLE public.atc (
    id_atc character varying(28) NOT NULL,
    nom character varying(50) NOT NULL,
    prenom character varying(50) NOT NULL,
    numero_telephone character varying(10) NOT NULL,
    email character varying(50) NOT NULL,
    mot_de_passe character varying(50) NOT NULL,
    est_root boolean NOT NULL,
    photo_atc character varying(255) NOT NULL
);


ALTER TABLE public.atc OWNER TO postgres_admin;

--
-- TOC entry 202 (class 1259 OID 16836)
-- Name: decideur; Type: TABLE; Schema: public; Owner: postgres_admin
--

CREATE TABLE public.decideur (
    id_decideur character varying(28) NOT NULL,
    nom character varying(50) NOT NULL,
    prenom character varying(50) NOT NULL,
    numero_telephone character varying(10) NOT NULL,
    email character varying(50) NOT NULL,
    mot_de_passe character varying(50) NOT NULL,
    photo_decideur character varying(255) NOT NULL
);


ALTER TABLE public.decideur OWNER TO postgres_admin;

--
-- TOC entry 203 (class 1259 OID 16839)
-- Name: demandeinscription; Type: TABLE; Schema: public; Owner: postgres_admin
--

CREATE TABLE public.demandeinscription (
    id_demande_inscription integer NOT NULL,
    statut character varying(50) NOT NULL,
    date_inscription date NOT NULL,
    id_locataire character varying(28) NOT NULL,
    email character varying(50)
);


ALTER TABLE public.demandeinscription OWNER TO postgres_admin;

--
-- TOC entry 204 (class 1259 OID 16842)
-- Name: demandeinscription_id_demande_inscription_seq; Type: SEQUENCE; Schema: public; Owner: postgres_admin
--

CREATE SEQUENCE public.demandeinscription_id_demande_inscription_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.demandeinscription_id_demande_inscription_seq OWNER TO postgres_admin;

--
-- TOC entry 4457 (class 0 OID 0)
-- Dependencies: 204
-- Name: demandeinscription_id_demande_inscription_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres_admin
--

ALTER SEQUENCE public.demandeinscription_id_demande_inscription_seq OWNED BY public.demandeinscription.id_demande_inscription;


--
-- TOC entry 205 (class 1259 OID 16844)
-- Name: demandesupport; Type: TABLE; Schema: public; Owner: postgres_admin
--

CREATE TABLE public.demandesupport (
    id_demande_support integer NOT NULL,
    objet character varying(50) NOT NULL,
    descriptif character varying(255) NOT NULL,
    reponse character varying(255),
    email character varying(50) NOT NULL,
    id_louer integer NOT NULL
);


ALTER TABLE public.demandesupport OWNER TO postgres_admin;

--
-- TOC entry 206 (class 1259 OID 16850)
-- Name: demandesupport_id_demande_support_seq; Type: SEQUENCE; Schema: public; Owner: postgres_admin
--

CREATE SEQUENCE public.demandesupport_id_demande_support_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.demandesupport_id_demande_support_seq OWNER TO postgres_admin;

--
-- TOC entry 4460 (class 0 OID 0)
-- Dependencies: 206
-- Name: demandesupport_id_demande_support_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres_admin
--

ALTER SEQUENCE public.demandesupport_id_demande_support_seq OWNED BY public.demandesupport.id_demande_support;


--
-- TOC entry 234 (class 1259 OID 17178)
-- Name: demandesupport_id_louer_seq; Type: SEQUENCE; Schema: public; Owner: postgres_admin
--

CREATE SEQUENCE public.demandesupport_id_louer_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.demandesupport_id_louer_seq OWNER TO postgres_admin;

--
-- TOC entry 4462 (class 0 OID 0)
-- Dependencies: 234
-- Name: demandesupport_id_louer_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres_admin
--

ALTER SEQUENCE public.demandesupport_id_louer_seq OWNED BY public.demandesupport.id_louer;


--
-- TOC entry 207 (class 1259 OID 16852)
-- Name: facture; Type: TABLE; Schema: public; Owner: postgres_admin
--

CREATE TABLE public.facture (
    id_facture integer NOT NULL,
    date_facture date NOT NULL,
    montant real NOT NULL,
    heure time without time zone NOT NULL,
    tva real NOT NULL,
    id_louer integer NOT NULL,
    id_payer integer NOT NULL,
    CONSTRAINT facture_montant_check CHECK ((montant > (0)::double precision)),
    CONSTRAINT facture_tva_check CHECK ((tva > (0)::double precision))
);


ALTER TABLE public.facture OWNER TO postgres_admin;

--
-- TOC entry 208 (class 1259 OID 16857)
-- Name: facture_id_facture_seq; Type: SEQUENCE; Schema: public; Owner: postgres_admin
--

CREATE SEQUENCE public.facture_id_facture_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.facture_id_facture_seq OWNER TO postgres_admin;

--
-- TOC entry 4464 (class 0 OID 0)
-- Dependencies: 208
-- Name: facture_id_facture_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres_admin
--

ALTER SEQUENCE public.facture_id_facture_seq OWNED BY public.facture.id_facture;


--
-- TOC entry 227 (class 1259 OID 17090)
-- Name: facture_id_louer_seq; Type: SEQUENCE; Schema: public; Owner: postgres_admin
--

CREATE SEQUENCE public.facture_id_louer_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.facture_id_louer_seq OWNER TO postgres_admin;

--
-- TOC entry 4466 (class 0 OID 0)
-- Dependencies: 227
-- Name: facture_id_louer_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres_admin
--

ALTER SEQUENCE public.facture_id_louer_seq OWNED BY public.facture.id_louer;


--
-- TOC entry 235 (class 1259 OID 17198)
-- Name: facture_id_payer_seq; Type: SEQUENCE; Schema: public; Owner: postgres_admin
--

CREATE SEQUENCE public.facture_id_payer_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.facture_id_payer_seq OWNER TO postgres_admin;

--
-- TOC entry 4468 (class 0 OID 0)
-- Dependencies: 235
-- Name: facture_id_payer_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres_admin
--

ALTER SEQUENCE public.facture_id_payer_seq OWNED BY public.facture.id_payer;


--
-- TOC entry 229 (class 1259 OID 17104)
-- Name: marque; Type: TABLE; Schema: public; Owner: postgres_admin
--

CREATE TABLE public.marque (
    id_marque integer NOT NULL,
    libelle character varying(50) NOT NULL
);


ALTER TABLE public.marque OWNER TO postgres_admin;

--
-- TOC entry 228 (class 1259 OID 17102)
-- Name: id_marque_id_marque_seq; Type: SEQUENCE; Schema: public; Owner: postgres_admin
--

CREATE SEQUENCE public.id_marque_id_marque_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.id_marque_id_marque_seq OWNER TO postgres_admin;

--
-- TOC entry 4470 (class 0 OID 0)
-- Dependencies: 228
-- Name: id_marque_id_marque_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres_admin
--

ALTER SEQUENCE public.id_marque_id_marque_seq OWNED BY public.marque.id_marque;


--
-- TOC entry 209 (class 1259 OID 16859)
-- Name: justificatif; Type: TABLE; Schema: public; Owner: postgres_admin
--

CREATE TABLE public.justificatif (
    id_justificatif integer NOT NULL,
    objet character varying(50) NOT NULL,
    descriptif character varying(50) NOT NULL,
    id_demande_inscription integer NOT NULL
);


ALTER TABLE public.justificatif OWNER TO postgres_admin;

--
-- TOC entry 210 (class 1259 OID 16862)
-- Name: justificatif_id_demande_inscription_seq; Type: SEQUENCE; Schema: public; Owner: postgres_admin
--

CREATE SEQUENCE public.justificatif_id_demande_inscription_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.justificatif_id_demande_inscription_seq OWNER TO postgres_admin;

--
-- TOC entry 4473 (class 0 OID 0)
-- Dependencies: 210
-- Name: justificatif_id_demande_inscription_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres_admin
--

ALTER SEQUENCE public.justificatif_id_demande_inscription_seq OWNED BY public.justificatif.id_demande_inscription;


--
-- TOC entry 211 (class 1259 OID 16864)
-- Name: justificatif_id_justificatif_seq; Type: SEQUENCE; Schema: public; Owner: postgres_admin
--

CREATE SEQUENCE public.justificatif_id_justificatif_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.justificatif_id_justificatif_seq OWNER TO postgres_admin;

--
-- TOC entry 4475 (class 0 OID 0)
-- Dependencies: 211
-- Name: justificatif_id_justificatif_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres_admin
--

ALTER SEQUENCE public.justificatif_id_justificatif_seq OWNED BY public.justificatif.id_justificatif;


--
-- TOC entry 212 (class 1259 OID 16866)
-- Name: locataire; Type: TABLE; Schema: public; Owner: postgres_admin
--

CREATE TABLE public.locataire (
    id_locataire character varying(28) NOT NULL,
    nom character varying(50) NOT NULL,
    prenom character varying(50) NOT NULL,
    numero_telephone character varying(10) NOT NULL,
    email character varying(50) NOT NULL,
    mot_de_passe character varying(50) NOT NULL,
    statut_compte boolean NOT NULL,
    photo_identite_recto character varying(255) NOT NULL,
    photo_selfie character varying(255) NOT NULL,
    photo_identite_verso character varying(255) NOT NULL,
    stripe_id character varying(18)
);


ALTER TABLE public.locataire OWNER TO postgres_admin;

--
-- TOC entry 213 (class 1259 OID 16872)
-- Name: louer; Type: TABLE; Schema: public; Owner: postgres_admin
--

CREATE TABLE public.louer (
    status_demande_location character varying(50) NOT NULL,
    id_locataire character varying(28) NOT NULL,
    numero_chassis character varying(10),
    id_louer integer NOT NULL,
    en_cours boolean,
    heure_debut time without time zone,
    heure_fin time without time zone,
    region character varying(50) NOT NULL,
    date_debut date NOT NULL,
    latitude_depart real NOT NULL,
    longitude_depart real NOT NULL,
    latitude_arrive real NOT NULL,
    longitude_arrive real NOT NULL,
    suivi_location character varying(50)
);


ALTER TABLE public.louer OWNER TO postgres_admin;

--
-- TOC entry 226 (class 1259 OID 17078)
-- Name: louer_id_louer_seq; Type: SEQUENCE; Schema: public; Owner: postgres_admin
--

CREATE SEQUENCE public.louer_id_louer_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.louer_id_louer_seq OWNER TO postgres_admin;

--
-- TOC entry 4479 (class 0 OID 0)
-- Dependencies: 226
-- Name: louer_id_louer_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres_admin
--

ALTER SEQUENCE public.louer_id_louer_seq OWNED BY public.louer.id_louer;


--
-- TOC entry 232 (class 1259 OID 17114)
-- Name: modele; Type: TABLE; Schema: public; Owner: postgres_admin
--

CREATE TABLE public.modele (
    id_modele integer NOT NULL,
    id_marque integer NOT NULL,
    libelle character varying(50) NOT NULL
);


ALTER TABLE public.modele OWNER TO postgres_admin;

--
-- TOC entry 231 (class 1259 OID 17112)
-- Name: modele_id_marque_seq; Type: SEQUENCE; Schema: public; Owner: postgres_admin
--

CREATE SEQUENCE public.modele_id_marque_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.modele_id_marque_seq OWNER TO postgres_admin;

--
-- TOC entry 4482 (class 0 OID 0)
-- Dependencies: 231
-- Name: modele_id_marque_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres_admin
--

ALTER SEQUENCE public.modele_id_marque_seq OWNED BY public.modele.id_marque;


--
-- TOC entry 230 (class 1259 OID 17110)
-- Name: modele_id_modele_seq; Type: SEQUENCE; Schema: public; Owner: postgres_admin
--

CREATE SEQUENCE public.modele_id_modele_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.modele_id_modele_seq OWNER TO postgres_admin;

--
-- TOC entry 4484 (class 0 OID 0)
-- Dependencies: 230
-- Name: modele_id_modele_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres_admin
--

ALTER SEQUENCE public.modele_id_modele_seq OWNED BY public.modele.id_modele;


--
-- TOC entry 214 (class 1259 OID 16881)
-- Name: panne; Type: TABLE; Schema: public; Owner: postgres_admin
--

CREATE TABLE public.panne (
    id_panne integer NOT NULL,
    numero_chassis character varying(10) NOT NULL,
    id_tache integer NOT NULL
);


ALTER TABLE public.panne OWNER TO postgres_admin;

--
-- TOC entry 215 (class 1259 OID 16884)
-- Name: panne_id_panne_seq; Type: SEQUENCE; Schema: public; Owner: postgres_admin
--

CREATE SEQUENCE public.panne_id_panne_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.panne_id_panne_seq OWNER TO postgres_admin;

--
-- TOC entry 4487 (class 0 OID 0)
-- Dependencies: 215
-- Name: panne_id_panne_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres_admin
--

ALTER SEQUENCE public.panne_id_panne_seq OWNED BY public.panne.id_panne;


--
-- TOC entry 216 (class 1259 OID 16886)
-- Name: panne_id_tache_seq; Type: SEQUENCE; Schema: public; Owner: postgres_admin
--

CREATE SEQUENCE public.panne_id_tache_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.panne_id_tache_seq OWNER TO postgres_admin;

--
-- TOC entry 4489 (class 0 OID 0)
-- Dependencies: 216
-- Name: panne_id_tache_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres_admin
--

ALTER SEQUENCE public.panne_id_tache_seq OWNED BY public.panne.id_tache;


--
-- TOC entry 217 (class 1259 OID 16888)
-- Name: payer; Type: TABLE; Schema: public; Owner: postgres_admin
--

CREATE TABLE public.payer (
    id_locataire character varying(28) NOT NULL,
    type_paiement character varying(50) NOT NULL,
    heure_paiement time without time zone NOT NULL,
    date_paiement date NOT NULL,
    id_payer integer NOT NULL
);


ALTER TABLE public.payer OWNER TO postgres_admin;

--
-- TOC entry 233 (class 1259 OID 17169)
-- Name: payer_id_payer_seq; Type: SEQUENCE; Schema: public; Owner: postgres_admin
--

CREATE SEQUENCE public.payer_id_payer_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.payer_id_payer_seq OWNER TO postgres_admin;

--
-- TOC entry 4492 (class 0 OID 0)
-- Dependencies: 233
-- Name: payer_id_payer_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres_admin
--

ALTER SEQUENCE public.payer_id_payer_seq OWNED BY public.payer.id_payer;


--
-- TOC entry 218 (class 1259 OID 16894)
-- Name: region; Type: TABLE; Schema: public; Owner: postgres_admin
--

CREATE TABLE public.region (
    id_region integer NOT NULL,
    libelle character varying(50) NOT NULL
);


ALTER TABLE public.region OWNER TO postgres_admin;

--
-- TOC entry 219 (class 1259 OID 16897)
-- Name: region_id_region_seq; Type: SEQUENCE; Schema: public; Owner: postgres_admin
--

CREATE SEQUENCE public.region_id_region_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.region_id_region_seq OWNER TO postgres_admin;

--
-- TOC entry 4497 (class 0 OID 0)
-- Dependencies: 219
-- Name: region_id_region_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres_admin
--

ALTER SEQUENCE public.region_id_region_seq OWNED BY public.region.id_region;


--
-- TOC entry 220 (class 1259 OID 16899)
-- Name: tache; Type: TABLE; Schema: public; Owner: postgres_admin
--

CREATE TABLE public.tache (
    id_tache integer NOT NULL,
    objet character varying(50) NOT NULL,
    descriptif character varying(255) NOT NULL,
    etat character varying(50) NOT NULL,
    date_debut date NOT NULL,
    date_fin date,
    id_am character varying(28) NOT NULL,
    etat_avancement double precision NOT NULL,
    type_tache character varying(50) NOT NULL
);


ALTER TABLE public.tache OWNER TO postgres_admin;

--
-- TOC entry 221 (class 1259 OID 16902)
-- Name: tache_id_tache_seq; Type: SEQUENCE; Schema: public; Owner: postgres_admin
--

CREATE SEQUENCE public.tache_id_tache_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tache_id_tache_seq OWNER TO postgres_admin;

--
-- TOC entry 4500 (class 0 OID 0)
-- Dependencies: 221
-- Name: tache_id_tache_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres_admin
--

ALTER SEQUENCE public.tache_id_tache_seq OWNED BY public.tache.id_tache;


--
-- TOC entry 222 (class 1259 OID 16909)
-- Name: typevehicule; Type: TABLE; Schema: public; Owner: postgres_admin
--

CREATE TABLE public.typevehicule (
    id_type_vehicule integer NOT NULL,
    libelle character varying(50) NOT NULL,
    tarification real NOT NULL,
    CONSTRAINT typevehicule_tarification_check CHECK ((tarification >= (0)::double precision))
);


ALTER TABLE public.typevehicule OWNER TO postgres_admin;

--
-- TOC entry 223 (class 1259 OID 16913)
-- Name: typevehicule_id_type_vehicule_seq; Type: SEQUENCE; Schema: public; Owner: postgres_admin
--

CREATE SEQUENCE public.typevehicule_id_type_vehicule_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.typevehicule_id_type_vehicule_seq OWNER TO postgres_admin;

--
-- TOC entry 4503 (class 0 OID 0)
-- Dependencies: 223
-- Name: typevehicule_id_type_vehicule_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres_admin
--

ALTER SEQUENCE public.typevehicule_id_type_vehicule_seq OWNED BY public.typevehicule.id_type_vehicule;


--
-- TOC entry 224 (class 1259 OID 16915)
-- Name: vehicule; Type: TABLE; Schema: public; Owner: postgres_admin
--

CREATE TABLE public.vehicule (
    numero_chassis character varying(10) NOT NULL,
    marque character varying(50) NOT NULL,
    modele character varying(50) NOT NULL,
    couleur character varying(50) NOT NULL,
    id_type_vehicule integer NOT NULL,
    id_am character varying(28),
    image_vehicule character varying(255) NOT NULL
);


ALTER TABLE public.vehicule OWNER TO postgres_admin;

--
-- TOC entry 225 (class 1259 OID 16918)
-- Name: vehicule_id_type_vehicule_seq; Type: SEQUENCE; Schema: public; Owner: postgres_admin
--

CREATE SEQUENCE public.vehicule_id_type_vehicule_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.vehicule_id_type_vehicule_seq OWNER TO postgres_admin;

--
-- TOC entry 4506 (class 0 OID 0)
-- Dependencies: 225
-- Name: vehicule_id_type_vehicule_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres_admin
--

ALTER SEQUENCE public.vehicule_id_type_vehicule_seq OWNED BY public.vehicule.id_type_vehicule;


--
-- TOC entry 4202 (class 2604 OID 16920)
-- Name: demandeinscription id_demande_inscription; Type: DEFAULT; Schema: public; Owner: postgres_admin
--

ALTER TABLE ONLY public.demandeinscription ALTER COLUMN id_demande_inscription SET DEFAULT nextval('public.demandeinscription_id_demande_inscription_seq'::regclass);


--
-- TOC entry 4203 (class 2604 OID 16921)
-- Name: demandesupport id_demande_support; Type: DEFAULT; Schema: public; Owner: postgres_admin
--

ALTER TABLE ONLY public.demandesupport ALTER COLUMN id_demande_support SET DEFAULT nextval('public.demandesupport_id_demande_support_seq'::regclass);


--
-- TOC entry 4204 (class 2604 OID 17180)
-- Name: demandesupport id_louer; Type: DEFAULT; Schema: public; Owner: postgres_admin
--

ALTER TABLE ONLY public.demandesupport ALTER COLUMN id_louer SET DEFAULT nextval('public.demandesupport_id_louer_seq'::regclass);


--
-- TOC entry 4205 (class 2604 OID 16922)
-- Name: facture id_facture; Type: DEFAULT; Schema: public; Owner: postgres_admin
--

ALTER TABLE ONLY public.facture ALTER COLUMN id_facture SET DEFAULT nextval('public.facture_id_facture_seq'::regclass);


--
-- TOC entry 4206 (class 2604 OID 17092)
-- Name: facture id_louer; Type: DEFAULT; Schema: public; Owner: postgres_admin
--

ALTER TABLE ONLY public.facture ALTER COLUMN id_louer SET DEFAULT nextval('public.facture_id_louer_seq'::regclass);


--
-- TOC entry 4207 (class 2604 OID 17200)
-- Name: facture id_payer; Type: DEFAULT; Schema: public; Owner: postgres_admin
--

ALTER TABLE ONLY public.facture ALTER COLUMN id_payer SET DEFAULT nextval('public.facture_id_payer_seq'::regclass);


--
-- TOC entry 4210 (class 2604 OID 16923)
-- Name: justificatif id_justificatif; Type: DEFAULT; Schema: public; Owner: postgres_admin
--

ALTER TABLE ONLY public.justificatif ALTER COLUMN id_justificatif SET DEFAULT nextval('public.justificatif_id_justificatif_seq'::regclass);


--
-- TOC entry 4211 (class 2604 OID 16924)
-- Name: justificatif id_demande_inscription; Type: DEFAULT; Schema: public; Owner: postgres_admin
--

ALTER TABLE ONLY public.justificatif ALTER COLUMN id_demande_inscription SET DEFAULT nextval('public.justificatif_id_demande_inscription_seq'::regclass);


--
-- TOC entry 4212 (class 2604 OID 17080)
-- Name: louer id_louer; Type: DEFAULT; Schema: public; Owner: postgres_admin
--

ALTER TABLE ONLY public.louer ALTER COLUMN id_louer SET DEFAULT nextval('public.louer_id_louer_seq'::regclass);


--
-- TOC entry 4221 (class 2604 OID 17107)
-- Name: marque id_marque; Type: DEFAULT; Schema: public; Owner: postgres_admin
--

ALTER TABLE ONLY public.marque ALTER COLUMN id_marque SET DEFAULT nextval('public.id_marque_id_marque_seq'::regclass);


--
-- TOC entry 4222 (class 2604 OID 17117)
-- Name: modele id_modele; Type: DEFAULT; Schema: public; Owner: postgres_admin
--

ALTER TABLE ONLY public.modele ALTER COLUMN id_modele SET DEFAULT nextval('public.modele_id_modele_seq'::regclass);


--
-- TOC entry 4223 (class 2604 OID 17118)
-- Name: modele id_marque; Type: DEFAULT; Schema: public; Owner: postgres_admin
--

ALTER TABLE ONLY public.modele ALTER COLUMN id_marque SET DEFAULT nextval('public.modele_id_marque_seq'::regclass);


--
-- TOC entry 4213 (class 2604 OID 16928)
-- Name: panne id_panne; Type: DEFAULT; Schema: public; Owner: postgres_admin
--

ALTER TABLE ONLY public.panne ALTER COLUMN id_panne SET DEFAULT nextval('public.panne_id_panne_seq'::regclass);


--
-- TOC entry 4214 (class 2604 OID 16929)
-- Name: panne id_tache; Type: DEFAULT; Schema: public; Owner: postgres_admin
--

ALTER TABLE ONLY public.panne ALTER COLUMN id_tache SET DEFAULT nextval('public.panne_id_tache_seq'::regclass);


--
-- TOC entry 4215 (class 2604 OID 17171)
-- Name: payer id_payer; Type: DEFAULT; Schema: public; Owner: postgres_admin
--

ALTER TABLE ONLY public.payer ALTER COLUMN id_payer SET DEFAULT nextval('public.payer_id_payer_seq'::regclass);


--
-- TOC entry 4216 (class 2604 OID 16931)
-- Name: region id_region; Type: DEFAULT; Schema: public; Owner: postgres_admin
--

ALTER TABLE ONLY public.region ALTER COLUMN id_region SET DEFAULT nextval('public.region_id_region_seq'::regclass);


--
-- TOC entry 4217 (class 2604 OID 16932)
-- Name: tache id_tache; Type: DEFAULT; Schema: public; Owner: postgres_admin
--

ALTER TABLE ONLY public.tache ALTER COLUMN id_tache SET DEFAULT nextval('public.tache_id_tache_seq'::regclass);


--
-- TOC entry 4218 (class 2604 OID 16934)
-- Name: typevehicule id_type_vehicule; Type: DEFAULT; Schema: public; Owner: postgres_admin
--

ALTER TABLE ONLY public.typevehicule ALTER COLUMN id_type_vehicule SET DEFAULT nextval('public.typevehicule_id_type_vehicule_seq'::regclass);


--
-- TOC entry 4220 (class 2604 OID 16935)
-- Name: vehicule id_type_vehicule; Type: DEFAULT; Schema: public; Owner: postgres_admin
--

ALTER TABLE ONLY public.vehicule ALTER COLUMN id_type_vehicule SET DEFAULT nextval('public.vehicule_id_type_vehicule_seq'::regclass);


--
-- TOC entry 4409 (class 0 OID 16826)
-- Dependencies: 200
-- Data for Name: am; Type: TABLE DATA; Schema: public; Owner: postgres_admin
--

COPY public.am (id_am, nom, prenom, numero_telephone, email, mot_de_passe, photo_am) FROM stdin;
9pDUGJmecohDBDBaVkixyxMPcaH3	MALKI	Mohammed	0749421818	am2@gmail.com	mdp_am2	https://firebasestorage.googleapis.com/v0/b/autotek-8c725.appspot.com/o/AM%2Fam2.jpg?alt=media&token=ae722708-8370-407a-a160-36827299cc0b
CRivUqM8fZZ9I6Iwv34qwlAdXOe2	BELKACEM	Farid	0749220132	am1@gmail.com	123456	https://firebasestorage.googleapis.com/v0/b/autotek-8c725.appspot.com/o/AM%2F2spAeE8rWichOQayRQLlvU5L3Hw2am1.jpg?alt=media&token=9ce4be2e-9b5e-4c44-b366-c09d42d68a32
\.


--
-- TOC entry 4410 (class 0 OID 16829)
-- Dependencies: 201
-- Data for Name: atc; Type: TABLE DATA; Schema: public; Owner: postgres_admin
--

COPY public.atc (id_atc, nom, prenom, numero_telephone, email, mot_de_passe, est_root, photo_atc) FROM stdin;
LY9pvuwC5CcrJUJ0BIRg3A0Iw8y2	ATC	ROOT	0561726686	atc@root.dz	autotekatcroot	t	https://firebasestorage.googleapis.com/v0/b/autotek-8c725.appspot.com/o/ATC%2FLY9pvuwC5CcrJUJ0BIRg3A0Iw8y2atcRoot.jpg?alt=media&token=5e1c3b66-5332-4a6a-8dbc-749454218bab
nXG54qIidnTXhFKnp0j4MWdMzPI2	Atc	2	0561077902	atc2@gmail.dz	autotekatc2	f	https://firebasestorage.googleapis.com/v0/b/autotek-8c725.appspot.com/o/ATC%2FnXG54qIidnTXhFKnp0j4MWdMzPI2atc2.jpg?alt=media&token=b7d8d5d7-f6d8-48c8-9876-8eaefb0a31d9
\.


--
-- TOC entry 4411 (class 0 OID 16836)
-- Dependencies: 202
-- Data for Name: decideur; Type: TABLE DATA; Schema: public; Owner: postgres_admin
--

COPY public.decideur (id_decideur, nom, prenom, numero_telephone, email, mot_de_passe, photo_decideur) FROM stdin;
OVPOyaNhumXF9PaEyh9lsO1Tfxp2	Sabih	Racim	023160420	sabihR@gmail.dz	jesuisdecideur	https://firebasestorage.googleapis.com/v0/b/autotek-8c725.appspot.com/o/Decideur%2FOVPOyaNhumXF9PaEyh9lsO1Tfxp2sabih.jpg?alt=media&token=4e140a83-f901-4a69-aa6b-73950b1fe8f4
S5qOIKgIA2NXOBGeZcflRjvr46C3	Esaidi	Lamia	0561726686	decideur1@autotek.dz	autotekdecideur1	https://firebasestorage.googleapis.com/v0/b/autotek-8c725.appspot.com/o/Decideur%2FS5qOIKgIA2NXOBGeZcflRjvr46C3pose-portrait-professionnel-1024x819.jpg?alt=media&token=a58b5b56-2ba0-4c90-b33f-c415bd3113bc
\.


--
-- TOC entry 4412 (class 0 OID 16839)
-- Dependencies: 203
-- Data for Name: demandeinscription; Type: TABLE DATA; Schema: public; Owner: postgres_admin
--
--
-- TOC entry 4414 (class 0 OID 16844)
-- Dependencies: 205
-- Data for Name: demandesupport; Type: TABLE DATA; Schema: public; Owner: postgres_admin
--



--
-- TOC entry 4418 (class 0 OID 16859)
-- Dependencies: 209
-- Data for Name: justificatif; Type: TABLE DATA; Schema: public; Owner: postgres_admin
--

--
-- TOC entry 4421 (class 0 OID 16866)
-- Dependencies: 212
-- Data for Name: locataire; Type: TABLE DATA; Schema: public; Owner: postgres_admin
--

COPY public.locataire (id_locataire, nom, prenom, numero_telephone, email, mot_de_passe, statut_compte, photo_identite_recto, photo_selfie, photo_identite_verso, stripe_id) FROM stdin;
ZUExZYd1IoZlfSYtH6Bq5APLF8H3	AKLI	Hiba	0541251311	ih_akli@esi.dz	123456	t	https://firebasestorage.googleapis.com/v0/b/autotek-8c725.appspot.com/o/Locataire%2FPi%C3%A8ces%20identit%C3%A9%20Recto%2Fimg1.jpg?alt=media&token=37b6feed-27b0-4c13-a52a-4e6b11db774b	https://firebasestorage.googleapis.com/v0/b/autotek-8c725.appspot.com/o/Locataire%2FSelfies%2FAKLI.jpg?alt=media&token=f57ab2fe-69bd-4cfe-8523-5da863155a20	https://firebasestorage.googleapis.com/v0/b/autotek-8c725.appspot.com/o/Locataire%2FPi%C3%A8ces%20identit%C3%A9%20Recto%2Fimg1.jpg?alt=media&token=37b6feed-27b0-4c13-a52a-4e6b11db774b	\N
yNWgm5wI8OZ6Gm9igOCnIH9c9eX2	aissaoui	asma	0770567316	asma@esi.dz	123456	t	https://firebasestorage.googleapis.com/v0/b/autotek-8c725.appspot.com/o/Locataire%2FSelfies%2FAKLI.jpg?alt=media&token=f57ab2fe-69bd-4cfe-8523-5da863155a20	https://firebasestorage.googleapis.com/v0/b/autotek-8c725.appspot.com/o/Locataire%2FSelfies%2FAKLI.jpg?alt=media&token=f57ab2fe-69bd-4cfe-8523-5da863155a20	https://firebasestorage.googleapis.com/v0/b/autotek-8c725.appspot.com/o/Locataire%2FSelfies%2FAKLI.jpg?alt=media&token=f57ab2fe-69bd-4cfe-8523-5da863155a20	\N
\.


--
-- TOC entry 4422 (class 0 OID 16872)
-- Dependencies: 213
-- Data for Name: louer; Type: TABLE DATA; Schema: public; Owner: postgres_admin
--
--
-- TOC entry 4438 (class 0 OID 17104)
-- Dependencies: 229
-- Data for Name: marque; Type: TABLE DATA; Schema: public; Owner: postgres_admin
--

COPY public.marque (id_marque, libelle) FROM stdin;
1	Toyota
2	Nissan
3	Audi
5	Volkswagen
4	Renault
\.
--
-- TOC entry 4441 (class 0 OID 17114)
-- Dependencies: 232
-- Data for Name: modele; Type: TABLE DATA; Schema: public; Owner: postgres_admin
--

COPY public.modele (id_modele, id_marque, libelle) FROM stdin;
1	1	Toyota Yaris Red Edition
2	1	Toyota Hilux Legend 7
3	2	Nissan Sunny Visia
4	2	NISSAN MICRA VISIA PLUS
5	3	Audi A1 Sportback Sensation
6	3	Audi A3 Limousine Addiction
7	3	Audi Q5 Ambition
8	4	Renault Clio 4 GT Line
9	5	Volkswagen Golf 7 JOIN
\.


--
-- TOC entry 4423 (class 0 OID 16881)
-- Dependencies: 214
-- Data for Name: panne; Type: TABLE DATA; Schema: public; Owner: postgres_admin
--

--
-- TOC entry 4426 (class 0 OID 16888)
-- Dependencies: 217
-- Data for Name: payer; Type: TABLE DATA; Schema: public; Owner: postgres_admin




--
-- TOC entry 4431 (class 0 OID 16909)
-- Dependencies: 222
-- Data for Name: typevehicule; Type: TABLE DATA; Schema: public; Owner: postgres_admin
--

COPY public.typevehicule (id_type_vehicule, libelle, tarification) FROM stdin;
1	vehicule 4x4	400
2	vehicule 2 portes	350
\.

SELECT pg_catalog.setval('public.demandeinscription_id_demande_inscription_seq', 105, true);


--
-- TOC entry 4509 (class 0 OID 0)
-- Dependencies: 206
-- Name: demandesupport_id_demande_support_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres_admin
--

SELECT pg_catalog.setval('public.demandesupport_id_demande_support_seq', 11, true);


--
-- TOC entry 4510 (class 0 OID 0)
-- Dependencies: 234
-- Name: demandesupport_id_louer_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres_admin
--

SELECT pg_catalog.setval('public.demandesupport_id_louer_seq', 1, false);


--
-- TOC entry 4511 (class 0 OID 0)
-- Dependencies: 208
-- Name: facture_id_facture_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres_admin
--

SELECT pg_catalog.setval('public.facture_id_facture_seq', 19, true);


--
-- TOC entry 4512 (class 0 OID 0)
-- Dependencies: 227
-- Name: facture_id_louer_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres_admin
--

SELECT pg_catalog.setval('public.facture_id_louer_seq', 1, false);


--
-- TOC entry 4513 (class 0 OID 0)
-- Dependencies: 235
-- Name: facture_id_payer_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres_admin
--

SELECT pg_catalog.setval('public.facture_id_payer_seq', 17, true);


--
-- TOC entry 4514 (class 0 OID 0)
-- Dependencies: 228
-- Name: id_marque_id_marque_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres_admin
--

SELECT pg_catalog.setval('public.id_marque_id_marque_seq', 5, true);


--
-- TOC entry 4515 (class 0 OID 0)
-- Dependencies: 210
-- Name: justificatif_id_demande_inscription_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres_admin
--

SELECT pg_catalog.setval('public.justificatif_id_demande_inscription_seq', 1, false);


--
-- TOC entry 4516 (class 0 OID 0)
-- Dependencies: 211
-- Name: justificatif_id_justificatif_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres_admin
--

SELECT pg_catalog.setval('public.justificatif_id_justificatif_seq', 93, true);


--
-- TOC entry 4517 (class 0 OID 0)
-- Dependencies: 226
-- Name: louer_id_louer_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres_admin
--

SELECT pg_catalog.setval('public.louer_id_louer_seq', 163, true);


--
-- TOC entry 4518 (class 0 OID 0)
-- Dependencies: 231
-- Name: modele_id_marque_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres_admin
--

SELECT pg_catalog.setval('public.modele_id_marque_seq', 1, false);


--
-- TOC entry 4519 (class 0 OID 0)
-- Dependencies: 230
-- Name: modele_id_modele_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres_admin
--

SELECT pg_catalog.setval('public.modele_id_modele_seq', 9, true);


--
-- TOC entry 4520 (class 0 OID 0)
-- Dependencies: 215
-- Name: panne_id_panne_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres_admin
--

SELECT pg_catalog.setval('public.panne_id_panne_seq', 77, true);


--
-- TOC entry 4521 (class 0 OID 0)
-- Dependencies: 216
-- Name: panne_id_tache_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres_admin
--

SELECT pg_catalog.setval('public.panne_id_tache_seq', 1, false);


--
-- TOC entry 4522 (class 0 OID 0)
-- Dependencies: 233
-- Name: payer_id_payer_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres_admin
--

SELECT pg_catalog.setval('public.payer_id_payer_seq', 46, true);


--
-- TOC entry 4523 (class 0 OID 0)
-- Dependencies: 219
-- Name: region_id_region_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres_admin
--

SELECT pg_catalog.setval('public.region_id_region_seq', 1, false);


--
-- TOC entry 4524 (class 0 OID 0)
-- Dependencies: 221
-- Name: tache_id_tache_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres_admin
--

SELECT pg_catalog.setval('public.tache_id_tache_seq', 80, true);


--
-- TOC entry 4525 (class 0 OID 0)
-- Dependencies: 223
-- Name: typevehicule_id_type_vehicule_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres_admin
--

SELECT pg_catalog.setval('public.typevehicule_id_type_vehicule_seq', 2, true);


--
-- TOC entry 4526 (class 0 OID 0)
-- Dependencies: 225
-- Name: vehicule_id_type_vehicule_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres_admin
--

SELECT pg_catalog.setval('public.vehicule_id_type_vehicule_seq', 2, true);


--
-- TOC entry 4225 (class 2606 OID 16937)
-- Name: am am_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres_admin
--

ALTER TABLE ONLY public.am
    ADD CONSTRAINT am_email_key UNIQUE (email);


--
-- TOC entry 4227 (class 2606 OID 16939)
-- Name: am am_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres_admin
--

ALTER TABLE ONLY public.am
    ADD CONSTRAINT am_pkey PRIMARY KEY (id_am);


--
-- TOC entry 4231 (class 2606 OID 16941)
-- Name: atc atc_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres_admin
--

ALTER TABLE ONLY public.atc
    ADD CONSTRAINT atc_email_key UNIQUE (email);


--
-- TOC entry 4233 (class 2606 OID 16943)
-- Name: atc atc_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres_admin
--

ALTER TABLE ONLY public.atc
    ADD CONSTRAINT atc_pkey PRIMARY KEY (id_atc);


--
-- TOC entry 4237 (class 2606 OID 16947)
-- Name: decideur decideur_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres_admin
--

ALTER TABLE ONLY public.decideur
    ADD CONSTRAINT decideur_email_key UNIQUE (email);


--
-- TOC entry 4239 (class 2606 OID 16949)
-- Name: decideur decideur_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres_admin
--

ALTER TABLE ONLY public.decideur
    ADD CONSTRAINT decideur_pkey PRIMARY KEY (id_decideur);


--
-- TOC entry 4243 (class 2606 OID 16951)
-- Name: demandeinscription demandeinscription_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres_admin
--

ALTER TABLE ONLY public.demandeinscription
    ADD CONSTRAINT demandeinscription_pkey PRIMARY KEY (id_demande_inscription);


--
-- TOC entry 4245 (class 2606 OID 16953)
-- Name: demandesupport demandesupport_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres_admin
--

ALTER TABLE ONLY public.demandesupport
    ADD CONSTRAINT demandesupport_pkey PRIMARY KEY (id_demande_support);


--
-- TOC entry 4247 (class 2606 OID 16955)
-- Name: facture facture_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres_admin
--

ALTER TABLE ONLY public.facture
    ADD CONSTRAINT facture_pkey PRIMARY KEY (id_facture);


--
-- TOC entry 4271 (class 2606 OID 17109)
-- Name: marque id_marque_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres_admin
--

ALTER TABLE ONLY public.marque
    ADD CONSTRAINT id_marque_pkey PRIMARY KEY (id_marque);


--
-- TOC entry 4249 (class 2606 OID 16957)
-- Name: justificatif justificatif_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres_admin
--

ALTER TABLE ONLY public.justificatif
    ADD CONSTRAINT justificatif_pkey PRIMARY KEY (id_justificatif);


--
-- TOC entry 4253 (class 2606 OID 16959)
-- Name: locataire locataire_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres_admin
--

ALTER TABLE ONLY public.locataire
    ADD CONSTRAINT locataire_email_key UNIQUE (email);


--
-- TOC entry 4255 (class 2606 OID 16961)
-- Name: locataire locataire_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres_admin
--

ALTER TABLE ONLY public.locataire
    ADD CONSTRAINT locataire_pkey PRIMARY KEY (id_locataire);


--
-- TOC entry 4257 (class 2606 OID 17082)
-- Name: louer louer_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres_admin
--

ALTER TABLE ONLY public.louer
    ADD CONSTRAINT louer_pkey PRIMARY KEY (id_louer);


--
-- TOC entry 4273 (class 2606 OID 17123)
-- Name: modele modele_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres_admin
--

ALTER TABLE ONLY public.modele
    ADD CONSTRAINT modele_pkey PRIMARY KEY (id_modele);


--
-- TOC entry 4259 (class 2606 OID 16965)
-- Name: panne panne_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres_admin
--

ALTER TABLE ONLY public.panne
    ADD CONSTRAINT panne_pkey PRIMARY KEY (id_panne);


--
-- TOC entry 4261 (class 2606 OID 17176)
-- Name: payer payer_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres_admin
--

ALTER TABLE ONLY public.payer
    ADD CONSTRAINT payer_pkey PRIMARY KEY (id_payer);


--
-- TOC entry 4263 (class 2606 OID 16969)
-- Name: region region_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres_admin
--

ALTER TABLE ONLY public.region
    ADD CONSTRAINT region_pkey PRIMARY KEY (id_region);


--
-- TOC entry 4265 (class 2606 OID 16971)
-- Name: tache tache_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres_admin
--

ALTER TABLE ONLY public.tache
    ADD CONSTRAINT tache_pkey PRIMARY KEY (id_tache);


--
-- TOC entry 4267 (class 2606 OID 16975)
-- Name: typevehicule typevehicule_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres_admin
--

ALTER TABLE ONLY public.typevehicule
    ADD CONSTRAINT typevehicule_pkey PRIMARY KEY (id_type_vehicule);


--
-- TOC entry 4269 (class 2606 OID 16977)
-- Name: vehicule vehicule_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres_admin
--

ALTER TABLE ONLY public.vehicule
    ADD CONSTRAINT vehicule_pkey PRIMARY KEY (numero_chassis);


--
-- TOC entry 4228 (class 1259 OID 16978)
-- Name: index_am_email; Type: INDEX; Schema: public; Owner: postgres_admin
--

CREATE UNIQUE INDEX index_am_email ON public.am USING btree (email);


--
-- TOC entry 4229 (class 1259 OID 16979)
-- Name: index_am_id_am; Type: INDEX; Schema: public; Owner: postgres_admin
--

CREATE UNIQUE INDEX index_am_id_am ON public.am USING btree (id_am);


--
-- TOC entry 4234 (class 1259 OID 16980)
-- Name: index_atc_email; Type: INDEX; Schema: public; Owner: postgres_admin
--

CREATE UNIQUE INDEX index_atc_email ON public.atc USING btree (email);


--
-- TOC entry 4235 (class 1259 OID 16981)
-- Name: index_atc_id_atc; Type: INDEX; Schema: public; Owner: postgres_admin
--

CREATE UNIQUE INDEX index_atc_id_atc ON public.atc USING btree (id_atc);


--
-- TOC entry 4240 (class 1259 OID 16983)
-- Name: index_decideur_email; Type: INDEX; Schema: public; Owner: postgres_admin
--

CREATE UNIQUE INDEX index_decideur_email ON public.decideur USING btree (email);


--
-- TOC entry 4241 (class 1259 OID 16984)
-- Name: index_decideur_id_decideur; Type: INDEX; Schema: public; Owner: postgres_admin
--

CREATE UNIQUE INDEX index_decideur_id_decideur ON public.decideur USING btree (id_decideur);


--
-- TOC entry 4250 (class 1259 OID 16985)
-- Name: index_locataire_email; Type: INDEX; Schema: public; Owner: postgres_admin
--

CREATE UNIQUE INDEX index_locataire_email ON public.locataire USING btree (email);


--
-- TOC entry 4251 (class 1259 OID 16986)
-- Name: index_locataire_id_locataire; Type: INDEX; Schema: public; Owner: postgres_admin
--

CREATE UNIQUE INDEX index_locataire_id_locataire ON public.locataire USING btree (id_locataire);


--
-- TOC entry 4274 (class 2606 OID 16997)
-- Name: demandeinscription demandeinscription_id_locataire_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres_admin
--

ALTER TABLE ONLY public.demandeinscription
    ADD CONSTRAINT demandeinscription_id_locataire_fkey FOREIGN KEY (id_locataire) REFERENCES public.locataire(id_locataire) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 4275 (class 2606 OID 17188)
-- Name: demandesupport demandesupport_id_louer_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres_admin
--

ALTER TABLE ONLY public.demandesupport
    ADD CONSTRAINT demandesupport_id_louer_fkey FOREIGN KEY (id_louer) REFERENCES public.louer(id_louer) NOT VALID;


--
-- TOC entry 4277 (class 2606 OID 17205)
-- Name: facture facture_id_payer_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres_admin
--

ALTER TABLE ONLY public.facture
    ADD CONSTRAINT facture_id_payer_fkey FOREIGN KEY (id_payer) REFERENCES public.payer(id_payer) NOT VALID;


--
-- TOC entry 4276 (class 2606 OID 17097)
-- Name: facture id_louer; Type: FK CONSTRAINT; Schema: public; Owner: postgres_admin
--

ALTER TABLE ONLY public.facture
    ADD CONSTRAINT id_louer FOREIGN KEY (id_louer) REFERENCES public.louer(id_louer) ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;


--
-- TOC entry 4278 (class 2606 OID 17007)
-- Name: justificatif justificatif_id_demande_inscription_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres_admin
--

ALTER TABLE ONLY public.justificatif
    ADD CONSTRAINT justificatif_id_demande_inscription_fkey FOREIGN KEY (id_demande_inscription) REFERENCES public.demandeinscription(id_demande_inscription) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 4285 (class 2606 OID 17124)
-- Name: modele modele_id_marque_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres_admin
--

ALTER TABLE ONLY public.modele
    ADD CONSTRAINT modele_id_marque_fkey FOREIGN KEY (id_marque) REFERENCES public.marque(id_marque) ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;


--
-- TOC entry 4279 (class 2606 OID 17037)
-- Name: panne panne_id_tache_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres_admin
--

ALTER TABLE ONLY public.panne
    ADD CONSTRAINT panne_id_tache_fkey FOREIGN KEY (id_tache) REFERENCES public.tache(id_tache) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- TOC entry 4280 (class 2606 OID 17042)
-- Name: panne panne_numero_chassis_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres_admin
--

ALTER TABLE ONLY public.panne
    ADD CONSTRAINT panne_numero_chassis_fkey FOREIGN KEY (numero_chassis) REFERENCES public.vehicule(numero_chassis) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 4281 (class 2606 OID 17052)
-- Name: payer payer_id_locataire_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres_admin
--

ALTER TABLE ONLY public.payer
    ADD CONSTRAINT payer_id_locataire_fkey FOREIGN KEY (id_locataire) REFERENCES public.locataire(id_locataire);


--
-- TOC entry 4282 (class 2606 OID 17062)
-- Name: tache tache_id_am_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres_admin
--

ALTER TABLE ONLY public.tache
    ADD CONSTRAINT tache_id_am_fkey FOREIGN KEY (id_am) REFERENCES public.am(id_am) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 4284 (class 2606 OID 17193)
-- Name: vehicule vehicule_id_am_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres_admin
--

ALTER TABLE ONLY public.vehicule
    ADD CONSTRAINT vehicule_id_am_fkey FOREIGN KEY (id_am) REFERENCES public.am(id_am) ON UPDATE CASCADE ON DELETE SET NULL NOT VALID;


--
-- TOC entry 4283 (class 2606 OID 17072)
-- Name: vehicule vehicule_id_type_vehicule_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres_admin
--

ALTER TABLE ONLY public.vehicule
    ADD CONSTRAINT vehicule_id_type_vehicule_fkey FOREIGN KEY (id_type_vehicule) REFERENCES public.typevehicule(id_type_vehicule);


--
-- TOC entry 4450 (class 0 OID 0)
-- Dependencies: 237
-- Name: FUNCTION pg_buffercache_pages(); Type: ACL; Schema: public; Owner: azure_superuser
--

GRANT ALL ON FUNCTION public.pg_buffercache_pages() TO utilisateur_autotek;


--
-- TOC entry 4451 (class 0 OID 0)
-- Dependencies: 250
-- Name: FUNCTION pg_stat_statements(showtext boolean, OUT userid oid, OUT dbid oid, OUT queryid bigint, OUT query text, OUT calls bigint, OUT total_time double precision, OUT min_time double precision, OUT max_time double precision, OUT mean_time double precision, OUT stddev_time double precision, OUT rows bigint, OUT shared_blks_hit bigint, OUT shared_blks_read bigint, OUT shared_blks_dirtied bigint, OUT shared_blks_written bigint, OUT local_blks_hit bigint, OUT local_blks_read bigint, OUT local_blks_dirtied bigint, OUT local_blks_written bigint, OUT temp_blks_read bigint, OUT temp_blks_written bigint, OUT blk_read_time double precision, OUT blk_write_time double precision); Type: ACL; Schema: public; Owner: azure_superuser
--

GRANT ALL ON FUNCTION public.pg_stat_statements(showtext boolean, OUT userid oid, OUT dbid oid, OUT queryid bigint, OUT query text, OUT calls bigint, OUT total_time double precision, OUT min_time double precision, OUT max_time double precision, OUT mean_time double precision, OUT stddev_time double precision, OUT rows bigint, OUT shared_blks_hit bigint, OUT shared_blks_read bigint, OUT shared_blks_dirtied bigint, OUT shared_blks_written bigint, OUT local_blks_hit bigint, OUT local_blks_read bigint, OUT local_blks_dirtied bigint, OUT local_blks_written bigint, OUT temp_blks_read bigint, OUT temp_blks_written bigint, OUT blk_read_time double precision, OUT blk_write_time double precision) TO utilisateur_autotek;


--
-- TOC entry 4452 (class 0 OID 0)
-- Dependencies: 236
-- Name: FUNCTION pg_stat_statements_reset(); Type: ACL; Schema: public; Owner: azure_superuser
--

GRANT ALL ON FUNCTION public.pg_stat_statements_reset() TO utilisateur_autotek;


--
-- TOC entry 4453 (class 0 OID 0)
-- Dependencies: 200
-- Name: TABLE am; Type: ACL; Schema: public; Owner: postgres_admin
--

GRANT ALL ON TABLE public.am TO utilisateur_autotek;


--
-- TOC entry 4454 (class 0 OID 0)
-- Dependencies: 201
-- Name: TABLE atc; Type: ACL; Schema: public; Owner: postgres_admin
--

GRANT ALL ON TABLE public.atc TO utilisateur_autotek;


--
-- TOC entry 4455 (class 0 OID 0)
-- Dependencies: 202
-- Name: TABLE decideur; Type: ACL; Schema: public; Owner: postgres_admin
--

GRANT ALL ON TABLE public.decideur TO utilisateur_autotek;


--
-- TOC entry 4456 (class 0 OID 0)
-- Dependencies: 203
-- Name: TABLE demandeinscription; Type: ACL; Schema: public; Owner: postgres_admin
--

GRANT ALL ON TABLE public.demandeinscription TO utilisateur_autotek;


--
-- TOC entry 4458 (class 0 OID 0)
-- Dependencies: 204
-- Name: SEQUENCE demandeinscription_id_demande_inscription_seq; Type: ACL; Schema: public; Owner: postgres_admin
--

GRANT ALL ON SEQUENCE public.demandeinscription_id_demande_inscription_seq TO utilisateur_autotek;


--
-- TOC entry 4459 (class 0 OID 0)
-- Dependencies: 205
-- Name: TABLE demandesupport; Type: ACL; Schema: public; Owner: postgres_admin
--

GRANT ALL ON TABLE public.demandesupport TO utilisateur_autotek;


--
-- TOC entry 4461 (class 0 OID 0)
-- Dependencies: 206
-- Name: SEQUENCE demandesupport_id_demande_support_seq; Type: ACL; Schema: public; Owner: postgres_admin
--

GRANT ALL ON SEQUENCE public.demandesupport_id_demande_support_seq TO utilisateur_autotek;


--
-- TOC entry 4463 (class 0 OID 0)
-- Dependencies: 207
-- Name: TABLE facture; Type: ACL; Schema: public; Owner: postgres_admin
--

GRANT ALL ON TABLE public.facture TO utilisateur_autotek;


--
-- TOC entry 4465 (class 0 OID 0)
-- Dependencies: 208
-- Name: SEQUENCE facture_id_facture_seq; Type: ACL; Schema: public; Owner: postgres_admin
--

GRANT ALL ON SEQUENCE public.facture_id_facture_seq TO utilisateur_autotek;


--
-- TOC entry 4467 (class 0 OID 0)
-- Dependencies: 227
-- Name: SEQUENCE facture_id_louer_seq; Type: ACL; Schema: public; Owner: postgres_admin
--

GRANT ALL ON SEQUENCE public.facture_id_louer_seq TO utilisateur_autotek;


--
-- TOC entry 4469 (class 0 OID 0)
-- Dependencies: 229
-- Name: TABLE marque; Type: ACL; Schema: public; Owner: postgres_admin
--

GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.marque TO utilisateur_autotek;


--
-- TOC entry 4471 (class 0 OID 0)
-- Dependencies: 228
-- Name: SEQUENCE id_marque_id_marque_seq; Type: ACL; Schema: public; Owner: postgres_admin
--

GRANT ALL ON SEQUENCE public.id_marque_id_marque_seq TO utilisateur_autotek;


--
-- TOC entry 4472 (class 0 OID 0)
-- Dependencies: 209
-- Name: TABLE justificatif; Type: ACL; Schema: public; Owner: postgres_admin
--

GRANT ALL ON TABLE public.justificatif TO utilisateur_autotek;


--
-- TOC entry 4474 (class 0 OID 0)
-- Dependencies: 210
-- Name: SEQUENCE justificatif_id_demande_inscription_seq; Type: ACL; Schema: public; Owner: postgres_admin
--

GRANT ALL ON SEQUENCE public.justificatif_id_demande_inscription_seq TO utilisateur_autotek;


--
-- TOC entry 4476 (class 0 OID 0)
-- Dependencies: 211
-- Name: SEQUENCE justificatif_id_justificatif_seq; Type: ACL; Schema: public; Owner: postgres_admin
--

GRANT ALL ON SEQUENCE public.justificatif_id_justificatif_seq TO utilisateur_autotek;


--
-- TOC entry 4477 (class 0 OID 0)
-- Dependencies: 212
-- Name: TABLE locataire; Type: ACL; Schema: public; Owner: postgres_admin
--

GRANT ALL ON TABLE public.locataire TO utilisateur_autotek;


--
-- TOC entry 4478 (class 0 OID 0)
-- Dependencies: 213
-- Name: TABLE louer; Type: ACL; Schema: public; Owner: postgres_admin
--

GRANT ALL ON TABLE public.louer TO utilisateur_autotek;


--
-- TOC entry 4480 (class 0 OID 0)
-- Dependencies: 226
-- Name: SEQUENCE louer_id_louer_seq; Type: ACL; Schema: public; Owner: postgres_admin
--

GRANT ALL ON SEQUENCE public.louer_id_louer_seq TO utilisateur_autotek;


--
-- TOC entry 4481 (class 0 OID 0)
-- Dependencies: 232
-- Name: TABLE modele; Type: ACL; Schema: public; Owner: postgres_admin
--

GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.modele TO utilisateur_autotek;


--
-- TOC entry 4483 (class 0 OID 0)
-- Dependencies: 231
-- Name: SEQUENCE modele_id_marque_seq; Type: ACL; Schema: public; Owner: postgres_admin
--

GRANT ALL ON SEQUENCE public.modele_id_marque_seq TO utilisateur_autotek;


--
-- TOC entry 4485 (class 0 OID 0)
-- Dependencies: 230
-- Name: SEQUENCE modele_id_modele_seq; Type: ACL; Schema: public; Owner: postgres_admin
--

GRANT ALL ON SEQUENCE public.modele_id_modele_seq TO utilisateur_autotek;


--
-- TOC entry 4486 (class 0 OID 0)
-- Dependencies: 214
-- Name: TABLE panne; Type: ACL; Schema: public; Owner: postgres_admin
--

GRANT ALL ON TABLE public.panne TO utilisateur_autotek;


--
-- TOC entry 4488 (class 0 OID 0)
-- Dependencies: 215
-- Name: SEQUENCE panne_id_panne_seq; Type: ACL; Schema: public; Owner: postgres_admin
--

GRANT ALL ON SEQUENCE public.panne_id_panne_seq TO utilisateur_autotek;


--
-- TOC entry 4490 (class 0 OID 0)
-- Dependencies: 216
-- Name: SEQUENCE panne_id_tache_seq; Type: ACL; Schema: public; Owner: postgres_admin
--

GRANT ALL ON SEQUENCE public.panne_id_tache_seq TO utilisateur_autotek;


--
-- TOC entry 4491 (class 0 OID 0)
-- Dependencies: 217
-- Name: TABLE payer; Type: ACL; Schema: public; Owner: postgres_admin
--

GRANT ALL ON TABLE public.payer TO utilisateur_autotek;


--
-- TOC entry 4493 (class 0 OID 0)
-- Dependencies: 233
-- Name: SEQUENCE payer_id_payer_seq; Type: ACL; Schema: public; Owner: postgres_admin
--

GRANT ALL ON SEQUENCE public.payer_id_payer_seq TO utilisateur_autotek;


--
-- TOC entry 4494 (class 0 OID 0)
-- Dependencies: 199
-- Name: TABLE pg_buffercache; Type: ACL; Schema: public; Owner: azure_superuser
--

GRANT ALL ON TABLE public.pg_buffercache TO utilisateur_autotek;


--
-- TOC entry 4495 (class 0 OID 0)
-- Dependencies: 198
-- Name: TABLE pg_stat_statements; Type: ACL; Schema: public; Owner: azure_superuser
--

GRANT ALL ON TABLE public.pg_stat_statements TO utilisateur_autotek;


--
-- TOC entry 4496 (class 0 OID 0)
-- Dependencies: 218
-- Name: TABLE region; Type: ACL; Schema: public; Owner: postgres_admin
--

GRANT ALL ON TABLE public.region TO utilisateur_autotek;


--
-- TOC entry 4498 (class 0 OID 0)
-- Dependencies: 219
-- Name: SEQUENCE region_id_region_seq; Type: ACL; Schema: public; Owner: postgres_admin
--

GRANT ALL ON SEQUENCE public.region_id_region_seq TO utilisateur_autotek;


--
-- TOC entry 4499 (class 0 OID 0)
-- Dependencies: 220
-- Name: TABLE tache; Type: ACL; Schema: public; Owner: postgres_admin
--

GRANT ALL ON TABLE public.tache TO utilisateur_autotek;


--
-- TOC entry 4501 (class 0 OID 0)
-- Dependencies: 221
-- Name: SEQUENCE tache_id_tache_seq; Type: ACL; Schema: public; Owner: postgres_admin
--

GRANT ALL ON SEQUENCE public.tache_id_tache_seq TO utilisateur_autotek;


--
-- TOC entry 4502 (class 0 OID 0)
-- Dependencies: 222
-- Name: TABLE typevehicule; Type: ACL; Schema: public; Owner: postgres_admin
--

GRANT ALL ON TABLE public.typevehicule TO utilisateur_autotek;


--
-- TOC entry 4504 (class 0 OID 0)
-- Dependencies: 223
-- Name: SEQUENCE typevehicule_id_type_vehicule_seq; Type: ACL; Schema: public; Owner: postgres_admin
--

GRANT ALL ON SEQUENCE public.typevehicule_id_type_vehicule_seq TO utilisateur_autotek;


--
-- TOC entry 4505 (class 0 OID 0)
-- Dependencies: 224
-- Name: TABLE vehicule; Type: ACL; Schema: public; Owner: postgres_admin
--

GRANT ALL ON TABLE public.vehicule TO utilisateur_autotek;


--
-- TOC entry 4507 (class 0 OID 0)
-- Dependencies: 225
-- Name: SEQUENCE vehicule_id_type_vehicule_seq; Type: ACL; Schema: public; Owner: postgres_admin
--

GRANT ALL ON SEQUENCE public.vehicule_id_type_vehicule_seq TO utilisateur_autotek;


-- Completed on 2022-06-03 17:01:07

--
-- PostgreSQL database dump complete
--

