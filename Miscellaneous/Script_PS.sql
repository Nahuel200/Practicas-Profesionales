--
-- PostgreSQL database dump
--

-- Dumped from database version 12.12
-- Dumped by pg_dump version 12.12

-- Started on 2022-11-10 06:30:04

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

--
-- TOC entry 212 (class 1255 OID 24667)
-- Name: Eliminar_alumno(character varying); Type: PROCEDURE; Schema: public; Owner: postgres
--

CREATE PROCEDURE public."Eliminar_alumno"(legajo character varying)
    LANGUAGE sql
    AS $$DELETE FROM public.alumnos
	WHERE legajo_alumnos=legajo$$;


ALTER PROCEDURE public."Eliminar_alumno"(legajo character varying) OWNER TO postgres;

--
-- TOC entry 211 (class 1255 OID 24652)
-- Name: Listar_cuatrimestres(); Type: PROCEDURE; Schema: public; Owner: postgres
--

CREATE PROCEDURE public."Listar_cuatrimestres"()
    LANGUAGE sql
    AS $$select id_cuatrimestres,descripcion_cuatrimestres,"año_cuatrimestres",cuatrimestre_cuatrimestres from cuatrimestres$$;


ALTER PROCEDURE public."Listar_cuatrimestres"() OWNER TO postgres;

--
-- TOC entry 209 (class 1255 OID 24650)
-- Name: Listar_inscriptos(); Type: PROCEDURE; Schema: public; Owner: postgres
--

CREATE PROCEDURE public."Listar_inscriptos"()
    LANGUAGE sql
    AS $$Select idcuatrimestre_inscriptos,legajoalumno_inscriptos,condicion_inscriptos,encuesta_inscriptos,grupo_inscriptos,discord_inscriptos,documentacion_inscriptos,proyecto_inscriptos,observaciones_inscriptos,estado_inscriptos from inscriptos$$;


ALTER PROCEDURE public."Listar_inscriptos"() OWNER TO postgres;

--
-- TOC entry 210 (class 1255 OID 24651)
-- Name: Listar_usuarios(); Type: PROCEDURE; Schema: public; Owner: postgres
--

CREATE PROCEDURE public."Listar_usuarios"()
    LANGUAGE sql
    AS $$select id_usuarios,user_usuarios,apellido_usuarios,nombre_usuarios,mail_usuarios,fecha_alta_usuarios,fecha_baja_usuarios,causa_baja_usuarios from usuarios$$;


ALTER PROCEDURE public."Listar_usuarios"() OWNER TO postgres;

--
-- TOC entry 208 (class 1255 OID 24645)
-- Name: Seleccionar_Todos_Alumnos(); Type: PROCEDURE; Schema: public; Owner: postgres
--

CREATE PROCEDURE public."Seleccionar_Todos_Alumnos"()
    LANGUAGE sql
    AS $$Select legajo_alumnos, nombre_alumnos,apellido_alumnos,mail_alumnos from Alumnos$$;


ALTER PROCEDURE public."Seleccionar_Todos_Alumnos"() OWNER TO postgres;

--
-- TOC entry 213 (class 1255 OID 24668)
-- Name: eliminar_cuatrimestre(integer); Type: PROCEDURE; Schema: public; Owner: postgres
--

CREATE PROCEDURE public.eliminar_cuatrimestre(id integer)
    LANGUAGE sql
    AS $$DELETE FROM public.cuatrimestres
	WHERE id_cuatrimestres=id;$$;


ALTER PROCEDURE public.eliminar_cuatrimestre(id integer) OWNER TO postgres;

--
-- TOC entry 216 (class 1255 OID 24670)
-- Name: eliminar_inscripto(character varying, integer); Type: PROCEDURE; Schema: public; Owner: postgres
--

CREATE PROCEDURE public.eliminar_inscripto(legajo character varying, id integer)
    LANGUAGE sql
    AS $$DELETE FROM public.inscriptos
	WHERE idcuatrimestre_inscriptos=id and legajoalumno_inscriptos=legajo;$$;


ALTER PROCEDURE public.eliminar_inscripto(legajo character varying, id integer) OWNER TO postgres;

--
-- TOC entry 214 (class 1255 OID 24669)
-- Name: eliminar_usuario(integer); Type: PROCEDURE; Schema: public; Owner: postgres
--

CREATE PROCEDURE public.eliminar_usuario(id integer)
    LANGUAGE sql
    AS $$DELETE FROM public.usuarios
	WHERE id_usuarios=id;$$;


ALTER PROCEDURE public.eliminar_usuario(id integer) OWNER TO postgres;

--
-- TOC entry 219 (class 1255 OID 24660)
-- Name: insertar usuarios(character varying, character varying, character varying, character varying, character varying, date); Type: PROCEDURE; Schema: public; Owner: postgres
--

CREATE PROCEDURE public."insertar usuarios"(usuario character varying, apellido character varying, nombre character varying, mail character varying, pass character varying, fecha_alta date)
    LANGUAGE sql
    AS $$INSERT INTO public.usuarios(
	 user_usuarios, apellido_usuarios, nombre_usuarios, mail_usuarios, password_usuarios, fecha_alta_usuarios)
	VALUES (usuario,apellido,nombre,mail,pass,fecha_alta);$$;


ALTER PROCEDURE public."insertar usuarios"(usuario character varying, apellido character varying, nombre character varying, mail character varying, pass character varying, fecha_alta date) OWNER TO postgres;

--
-- TOC entry 217 (class 1255 OID 24658)
-- Name: insertar_alumno(integer, character varying, character varying, character varying); Type: PROCEDURE; Schema: public; Owner: postgres
--

CREATE PROCEDURE public.insertar_alumno(legajo integer, nombre character varying, apellido character varying, mail character varying)
    LANGUAGE sql
    AS $$INSERT INTO public.alumnos(
	legajo_alumnos, nombre_alumnos, apellido_alumnos, mail_alumnos)
	VALUES ('legajo', 'nombre','apellido','mail');$$;


ALTER PROCEDURE public.insertar_alumno(legajo integer, nombre character varying, apellido character varying, mail character varying) OWNER TO postgres;

--
-- TOC entry 215 (class 1255 OID 24655)
-- Name: insertar_cuatrimestre(character varying, date, boolean); Type: PROCEDURE; Schema: public; Owner: postgres
--

CREATE PROCEDURE public.insertar_cuatrimestre(cuatrimestre character varying, "año" date, estadocua boolean)
    LANGUAGE sql
    AS $$insert into cuatrimestres(
	descripcion_cuatrimestres,"año_cuatrimestres",cuatrimestre_cuatrimestres) 
	VALUES ( cuatrimestre , año, estadocua)							 $$;


ALTER PROCEDURE public.insertar_cuatrimestre(cuatrimestre character varying, "año" date, estadocua boolean) OWNER TO postgres;

--
-- TOC entry 218 (class 1255 OID 24659)
-- Name: insertar_inscriptos(integer, character varying, character varying, character varying, integer, character varying, character varying, character varying, character varying, character varying); Type: PROCEDURE; Schema: public; Owner: postgres
--

CREATE PROCEDURE public.insertar_inscriptos(idcuatrimestre integer, legajo character varying, condicion character varying, encuesta character varying, grupo integer, discord character varying, documentacion character varying, proyecto character varying, observaciones character varying, estado character varying)
    LANGUAGE sql
    AS $$INSERT INTO public.inscriptos(
	idcuatrimestre_inscriptos, legajoalumno_inscriptos, condicion_inscriptos, encuesta_inscriptos, grupo_inscriptos, discord_inscriptos, documentacion_inscriptos, proyecto_inscriptos, observaciones_inscriptos, estado_inscriptos)
	VALUES (idcuatrimestre,legajo,condicion,encuesta,grupo,discord,documentacion,proyecto,observaciones,estado);$$;


ALTER PROCEDURE public.insertar_inscriptos(idcuatrimestre integer, legajo character varying, condicion character varying, encuesta character varying, grupo integer, discord character varying, documentacion character varying, proyecto character varying, observaciones character varying, estado character varying) OWNER TO postgres;

--
-- TOC entry 220 (class 1255 OID 24662)
-- Name: update_alumnos(character varying, character varying, character varying, character varying); Type: PROCEDURE; Schema: public; Owner: postgres
--

CREATE PROCEDURE public.update_alumnos(nombre character varying, apellido character varying, mail character varying, legajo character varying)
    LANGUAGE sql
    AS $$UPDATE public.alumnos
	SET nombre_alumnos=nombre, apellido_alumnos=apellido, mail_alumnos=mail
	WHERE legajo_alumnos=legajo;$$;


ALTER PROCEDURE public.update_alumnos(nombre character varying, apellido character varying, mail character varying, legajo character varying) OWNER TO postgres;

--
-- TOC entry 221 (class 1255 OID 24664)
-- Name: update_cuatrimestres(character varying, date, boolean, integer); Type: PROCEDURE; Schema: public; Owner: postgres
--

CREATE PROCEDURE public.update_cuatrimestres(descripcion character varying, "año" date, estado boolean, id integer)
    LANGUAGE sql
    AS $$UPDATE public.cuatrimestres
	SET  descripcion_cuatrimestres=descripcion, "año_cuatrimestres"=año, cuatrimestre_cuatrimestres=estado
	WHERE id_cuatrimestres=id;$$;


ALTER PROCEDURE public.update_cuatrimestres(descripcion character varying, "año" date, estado boolean, id integer) OWNER TO postgres;

--
-- TOC entry 234 (class 1255 OID 24665)
-- Name: update_usuarios(character varying, character varying, character varying, character varying, character varying, date, date, character varying[], integer); Type: PROCEDURE; Schema: public; Owner: postgres
--

CREATE PROCEDURE public.update_usuarios(usuario character varying, apellido character varying, nombre character varying, mail character varying, pass character varying, fecha_alta date, fecha_baja date, causa_baja character varying[], id integer)
    LANGUAGE sql
    AS $$UPDATE public.usuarios
	SET  user_usuarios=usuario, apellido_usuarios=apellido, nombre_usuarios=nombre, mail_usuarios=mail, password_usuarios=pass, fecha_alta_usuarios=fecha_alta, fecha_baja_usuarios=fecha_baja, causa_baja_usuarios=causa_baja
	WHERE id_usuarios=id;$$;


ALTER PROCEDURE public.update_usuarios(usuario character varying, apellido character varying, nombre character varying, mail character varying, pass character varying, fecha_alta date, fecha_baja date, causa_baja character varying[], id integer) OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 202 (class 1259 OID 16453)
-- Name: alumnos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.alumnos (
    legajo_alumnos character varying(15) NOT NULL,
    nombre_alumnos character varying(250) NOT NULL,
    apellido_alumnos character varying(250) NOT NULL,
    mail_alumnos character varying(250) NOT NULL
);


ALTER TABLE public.alumnos OWNER TO postgres;

--
-- TOC entry 204 (class 1259 OID 16465)
-- Name: cuatrimestres; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cuatrimestres (
    id_cuatrimestres integer NOT NULL,
    descripcion_cuatrimestres character varying(250) NOT NULL,
    "año_cuatrimestres" date NOT NULL,
    cuatrimestre_cuatrimestres boolean NOT NULL
);


ALTER TABLE public.cuatrimestres OWNER TO postgres;

--
-- TOC entry 203 (class 1259 OID 16463)
-- Name: cuatrimestres_id_cuatrimestres_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.cuatrimestres ALTER COLUMN id_cuatrimestres ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.cuatrimestres_id_cuatrimestres_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 205 (class 1259 OID 16474)
-- Name: inscriptos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.inscriptos (
    idcuatrimestre_inscriptos integer NOT NULL,
    legajoalumno_inscriptos character varying(15) NOT NULL,
    condicion_inscriptos character varying(20),
    encuesta_inscriptos character varying(20),
    grupo_inscriptos smallint,
    discord_inscriptos character varying(2),
    documentacion_inscriptos character varying(2),
    proyecto_inscriptos character varying(2),
    observaciones_inscriptos character varying(400),
    estado_inscriptos character varying(20)
);


ALTER TABLE public.inscriptos OWNER TO postgres;

--
-- TOC entry 207 (class 1259 OID 16481)
-- Name: usuarios; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.usuarios (
    id_usuarios integer NOT NULL,
    user_usuarios character varying(25) NOT NULL,
    apellido_usuarios character varying(250) NOT NULL,
    nombre_usuarios character varying(250) NOT NULL,
    mail_usuarios character varying(250) NOT NULL,
    password_usuarios character varying(250) NOT NULL,
    fecha_alta_usuarios date NOT NULL,
    fecha_baja_usuarios date,
    causa_baja_usuarios character varying(400)
);


ALTER TABLE public.usuarios OWNER TO postgres;

--
-- TOC entry 206 (class 1259 OID 16479)
-- Name: usuarios_id_usuarios_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.usuarios ALTER COLUMN id_usuarios ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.usuarios_id_usuarios_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 2862 (class 0 OID 16453)
-- Dependencies: 202
-- Data for Name: alumnos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.alumnos (legajo_alumnos, nombre_alumnos, apellido_alumnos, mail_alumnos) FROM stdin;
22270	alexander	cosmo	ale@gmail.com
\.


--
-- TOC entry 2864 (class 0 OID 16465)
-- Dependencies: 204
-- Data for Name: cuatrimestres; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cuatrimestres (id_cuatrimestres, descripcion_cuatrimestres, "año_cuatrimestres", cuatrimestre_cuatrimestres) FROM stdin;
1	cuatrimestre 22	2020-09-10	t
\.


--
-- TOC entry 2865 (class 0 OID 16474)
-- Dependencies: 205
-- Data for Name: inscriptos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.inscriptos (idcuatrimestre_inscriptos, legajoalumno_inscriptos, condicion_inscriptos, encuesta_inscriptos, grupo_inscriptos, discord_inscriptos, documentacion_inscriptos, proyecto_inscriptos, observaciones_inscriptos, estado_inscriptos) FROM stdin;
1	22270	aprobado	si	3	si	si	si	mejorar	recursa
\.


--
-- TOC entry 2867 (class 0 OID 16481)
-- Dependencies: 207
-- Data for Name: usuarios; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.usuarios (id_usuarios, user_usuarios, apellido_usuarios, nombre_usuarios, mail_usuarios, password_usuarios, fecha_alta_usuarios, fecha_baja_usuarios, causa_baja_usuarios) FROM stdin;
1	usuario12	cosmo	alexander	alexander@gmail.com	1125453380	2020-09-14	\N	\N
\.


--
-- TOC entry 2873 (class 0 OID 0)
-- Dependencies: 203
-- Name: cuatrimestres_id_cuatrimestres_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cuatrimestres_id_cuatrimestres_seq', 2, true);


--
-- TOC entry 2874 (class 0 OID 0)
-- Dependencies: 206
-- Name: usuarios_id_usuarios_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.usuarios_id_usuarios_seq', 1, true);


--
-- TOC entry 2719 (class 2606 OID 16460)
-- Name: alumnos pk_alumnos; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.alumnos
    ADD CONSTRAINT pk_alumnos PRIMARY KEY (legajo_alumnos);


--
-- TOC entry 2723 (class 2606 OID 16469)
-- Name: cuatrimestres pk_cuatrimestres; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cuatrimestres
    ADD CONSTRAINT pk_cuatrimestres PRIMARY KEY (id_cuatrimestres);


--
-- TOC entry 2727 (class 2606 OID 16478)
-- Name: inscriptos pk_inscriptos; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inscriptos
    ADD CONSTRAINT pk_inscriptos PRIMARY KEY (idcuatrimestre_inscriptos, legajoalumno_inscriptos);


--
-- TOC entry 2729 (class 2606 OID 16488)
-- Name: usuarios pk_usuarios; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT pk_usuarios PRIMARY KEY (id_usuarios);


--
-- TOC entry 2721 (class 2606 OID 16462)
-- Name: alumnos unique_mail_alumno; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.alumnos
    ADD CONSTRAINT unique_mail_alumno UNIQUE (mail_alumnos);


--
-- TOC entry 2731 (class 2606 OID 16492)
-- Name: usuarios unique_mail_usuarios; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT unique_mail_usuarios UNIQUE (mail_usuarios);


--
-- TOC entry 2725 (class 2606 OID 16471)
-- Name: cuatrimestres unique_name_cuatrimestre; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cuatrimestres
    ADD CONSTRAINT unique_name_cuatrimestre UNIQUE (descripcion_cuatrimestres);


--
-- TOC entry 2733 (class 2606 OID 16490)
-- Name: usuarios unique_user_usuarios; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT unique_user_usuarios UNIQUE (user_usuarios);


--
-- TOC entry 2734 (class 2606 OID 16493)
-- Name: inscriptos fk_alumnos_inscriptos; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inscriptos
    ADD CONSTRAINT fk_alumnos_inscriptos FOREIGN KEY (legajoalumno_inscriptos) REFERENCES public.alumnos(legajo_alumnos);


--
-- TOC entry 2735 (class 2606 OID 16498)
-- Name: inscriptos fk_id_cuatrimestres_inscriptos; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inscriptos
    ADD CONSTRAINT fk_id_cuatrimestres_inscriptos FOREIGN KEY (idcuatrimestre_inscriptos) REFERENCES public.cuatrimestres(id_cuatrimestres);


-- Completed on 2022-11-10 06:30:06

--
-- PostgreSQL database dump complete
--

