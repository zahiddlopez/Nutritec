
/*Creacion de tablas de la Base de Datos SQL*/
DROP DATABASE IF EXISTS NUTRITEC;
CREATE SCHEMA NUTRITEC DEFAULT COLLATE utf8_unicode_ci;

CREATE TABLE NUTRITEC.CARRERAS(
	CARRERA_ID 		BIGINT NOT NULL AUTO_INCREMENT,
	CARRERA_NOMBRE 	VARCHAR(255),
	CARRERA_PLAN	VARCHAR(100),
	PRIMARY KEY (CARRERA_ID)
);

CREATE TABLE NUTRITEC.ALUMNOS(
	ALUMNO_ID 		BIGINT NOT NULL AUTO_INCREMENT,
	ALUNMO_NOMBRE 	VARCHAR(255),
	ALUNMO_AP	 	VARCHAR(255),
	ALUNMO_AM	 	VARCHAR(255),
	CARRERA_GENERO	VARCHAR(5),
	CARRERA_ID		BIGINT,
	MATERIA_ID		BIGINT,
	PRIMARY KEY (ALUMNO_ID)
);

CREATE TABLE NUTRITEC.MATERIAS(
	MATERIA_ID		BIGINT NOT NULL AUTO_INCREMENT,
	MATERIA_CICLO 	VARCHAR(10),
	MATERIA_NOMBRE	VARCHAR(255),
	MATERIA_GRADO	VARCHAR(10),
	MATERIA_ES		VARCHAR(5),
	MATERIA_CAMPUS	VARCHAR(5),
	PRIMARY KEY (MATERIA_ID)
);

CREATE TABLE NUTRITEC.CLINICAS_TURNOS(
	TURNO_ID 		BIGINT NOT NULL AUTO_INCREMENT,
	TURNO_HORARIO 	VARCHAR(255),
	TURNO_TIPO		VARCHAR(10),
	CLINICA_ID		BIGINT,
	PRIMARY KEY (TURNO_ID)
);

CREATE TABLE NUTRITEC.CLINICAS(
	CLINICA_ID 		BIGINT NOT NULL AUTO_INCREMENT,
	CLINICA_NOMBRE 	VARCHAR(255),
	CLINICA_GRUPO	VARCHAR(10),
	CLINICAS_VACANTES	INTEGER,
	CLINICAS_PERIODO	VARCHAR(10),
	CLINICA_DIRECCION	LONGTEXT,

	PRIMARY KEY (CLINICA_ID)
);

CREATE TABLE NUTRITEC.ASIGNACIONES(
	ASIGNACION_ID	BIGINT NOT NULL AUTO_INCREMENT,
	CLINICA_ID		BIGINT,
	ALUMNO_ID		BIGINT,
	ASIGNACION_PRACT_NOM 	VARCHAR(255),
  ASIGNACION_FECHA_CREACION DATETIME,
	PRIMARY KEY (ASIGNACION_ID)
);

/*Tablas del sistema*/
CREATE TABLE NUTRITEC.auth_group (
  id int(11) NOT NULL AUTO_INCREMENT,
  name varchar(80) NOT NULL,
  PRIMARY KEY (id),
  UNIQUE KEY name (name)
);

CREATE TABLE NUTRITEC.auth_group_permissions(
  id int(11) NOT NULL AUTO_INCREMENT,
  group_id int(11) NOT NULL,
  permission_id int(11) NOT NULL,
  PRIMARY KEY (id),
  UNIQUE KEY auth_group_permissions_unique (group_id,permission_id),
  KEY auth_group_permissio_key (permission_id)
);

CREATE TABLE NUTRITEC.auth_permission(
  id int(11) NOT NULL AUTO_INCREMENT,
  name varchar(255) NOT NULL,
  content_type_id int(11) NOT NULL,
  codename varchar(100) NOT NULL,
  PRIMARY KEY (id),
  UNIQUE KEY auth_permission_unique(content_type_id,codename)
);

CREATE TABLE NUTRITEC.auth_user(
  id int(11) NOT NULL AUTO_INCREMENT,
  password varchar(128) NOT NULL,
  last_login datetime(6) DEFAULT NULL,
  is_superuser tinyint(1) NOT NULL,
  username varchar(150) NOT NULL,
  first_name varchar(30) NOT NULL,
  last_name varchar(150) NOT NULL,
  email varchar(254) NOT NULL,
  is_staff tinyint(1) NOT NULL,
  is_active tinyint(1) NOT NULL,
  date_joined datetime(6) NOT NULL,
  PRIMARY KEY (id),
  UNIQUE KEY username(username)
);

CREATE TABLE NUTRITEC.auth_user_groups(
  id int(11) NOT NULL AUTO_INCREMENT,
  user_id int(11) NOT NULL,
  group_id int(11) NOT NULL,
  PRIMARY KEY (id),
  UNIQUE KEY auth_user_groups_unique (user_id,group_id),
  KEY auth_user_groups_key (group_id)
);

CREATE TABLE NUTRITEC.auth_user_user_permissions(
  id int(11) NOT NULL AUTO_INCREMENT,
  user_id int(11) NOT NULL,
  permission_id int(11) NOT NULL,
  PRIMARY KEY (id),
  UNIQUE KEY auth_user_user_permissions_unique (user_id,permission_id),
  KEY auth_user_user_permi_permission_key (permission_id)
);

CREATE TABLE NUTRITEC.django_admin_log(
  id int(11) NOT NULL AUTO_INCREMENT,
  action_time datetime(6) NOT NULL,
  object_id longtext,
  object_repr varchar(200) NOT NULL,
  action_flag smallint(5) unsigned NOT NULL,
  change_message longtext NOT NULL,
  content_type_id int(11) DEFAULT NULL,
  user_id int(11) NOT NULL,
  PRIMARY KEY (id),
  KEY django_admin_log_key1 (content_type_id),
  KEY django_admin_log_key2 (user_id)
);

CREATE TABLE NUTRITEC.django_content_type(
  id int(11) NOT NULL AUTO_INCREMENT,
  app_label varchar(100) NOT NULL,
  model varchar(100) NOT NULL,
  PRIMARY KEY (id),
  UNIQUE KEY django_content_type_unique(app_label,model)
);

CREATE TABLE NUTRITEC.django_migrations(
  id int(11) NOT NULL AUTO_INCREMENT,
  app varchar(255) NOT NULL,
  name varchar(255) NOT NULL,
  applied datetime(6) NOT NULL,
  PRIMARY KEY (id)
);

CREATE TABLE NUTRITEC.django_session(
  session_key varchar(40) NOT NULL,
  session_data longtext NOT NULL,
  expire_date datetime(6) NOT NULL,
  PRIMARY KEY (session_key),
  KEY django_session_key (expire_date)
);

/* Llaves que usan tablas del sistema*/
CREATE TABLE NUTRITEC.ROLES(
	ROLID int NOT NULL AUTO_INCREMENT,
	ROL_NOMBRE varchar(40) NOT NULL,
	USUARIO_ID INT,
	PRIMARY KEY (ROLID)
);