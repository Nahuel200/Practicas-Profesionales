CREATE SCHEMA IF NOT EXISTS practica_supervisada

CREATE TABLE IF NOT EXISTS practica_supervisada.Alumnos (

Legajo_Alumnos VARCHAR(15),
Nombre_Alumnos VARCHAR(250) NOT NULL,
Apellido_Alumnos VARCHAR(250) NOT NULL,
Mail_Alumnos VARCHAR(250) NOT NULL,

CONSTRAINT PK_ALUMNOS PRIMARY KEY (Legajo_Alumnos),
CONSTRAINT UNIQUE_MAIL_ALUMNO UNIQUE (Mail_Alumnos)
);

CREATE TABLE IF NOT EXISTS practica_supervisada.Cuatrimestres (

ID_Cuatrimestres INT GENERATED ALWAYS AS IDENTITY,
Descripcion_Cuatrimestres VARCHAR(250) NOT NULL,
Año_Cuatrimestres DATE NOT NULL,
Cuatrimestre_Cuatrimestres BOOLEAN NOT NULL,

CONSTRAINT PK_CUATRIMESTRES PRIMARY KEY (ID_Cuatrimestres),
CONSTRAINT UNIQUE_NAME_CUATRIMESTRE UNIQUE (Descripcion_Cuatrimestres)
);

CREATE TABLE IF NOT EXISTS practica_supervisada.Inscriptos (

IDCuatrimestre_Inscriptos INT,
LegajoAlumno_Inscriptos VARCHAR(15),
Condicion_Inscriptos VARCHAR(20),
Encuesta_Inscriptos VARCHAR(20),
Grupo_Inscriptos SMALLINT,
Discord_Inscriptos VARCHAR(2),
Documentacion_Inscriptos VARCHAR(2),
Proyecto_Inscriptos VARCHAR(2),
Observaciones_Inscriptos VARCHAR(400),
Estado_Inscriptos VARCHAR(20),

CONSTRAINT PK_INSCRIPTOS PRIMARY KEY (IDCuatrimestre_Inscriptos,LegajoAlumno_Inscriptos)
);


CREATE TABLE IF NOT EXISTS practicas_supervisada.Usuarios (

ID_Usuarios INT GENERATED ALWAYS AS IDENTITY,
User_Usuarios VARCHAR(25) NOT NULL,
Apellido_Usuarios VARCHAR(250) NOT NULL,
Nombre_Usuarios VARCHAR(250) NOT NULL,
Mail_Usuarios VARCHAR(250) NOT NULL,
Password_Usuarios VARCHAR(250) NOT NULL,
Fecha_Alta_Usuarios DATE NOT NULL,
Fecha_Baja_Usuarios DATE,
Causa_Baja_Usuarios VARCHAR(400),

CONSTRAINT PK_USUARIOS PRIMARY KEY (ID_Usuarios),
CONSTRAINT UNIQUE_USER_USUARIOS UNIQUE (User_Usuarios),
CONSTRAINT UNIQUE_MAIL_USUARIOS UNIQUE (Mail_Usuarios),
);

ALTER TABLE practica_supervisada.Inscriptos ADD CONSTRAINT FK_ALUMNOS_INSCRIPTOS FOREIGN KEY
(LegajoAlumno_Inscriptos) REFERENCES practica_supervisada.Alumnos (Legajo_Alumnos);

ALTER TABLE practica_supervisada.Inscriptos ADD CONSTRAINT FK_ID_CUATRIMESTRES_INSCRIPTOS FOREIGN KEY
(IDCuatrimestre_Inscriptos) REFERENCES practica_supervisada.Cuatrimestres (ID_Cuatrimestres);

