-- SQL to create GCPD db

CREATE TABLE crimes (
  crime_id SERIAL PRIMARY KEY,
  name character varying(255) NOT NULL,
	degree integer DEFAULT 1,
  active boolean DEFAULT true
);

CREATE TABLE units (
  unit_id SERIAL PRIMARY KEY,
  name character varying(255) NOT NULL,
  active boolean DEFAULT true
);

CREATE TABLE officers (
	officer_id SERIAL PRIMARY KEY,
	first_name character varying(25) NOT NULL,
	last_name character varying(25) NOT NULL,
	unit_id integer, 
	rank character varying(255),
	joined_gcpd_on date NOT NULL,
	active boolean DEFAULT true
);

CREATE TABLE criminals (
	criminal_id SERIAL PRIMARY KEY,
	first_name character varying(25) NOT NULL,
	last_name character varying(25) NOT NULL,
	alias character varying(255),
	convicted_felon boolean,
	super_criminal boolean
);

CREATE TABLE cases (
	case_id SERIAL PRIMARY KEY,
	title character varying(255) NOT NULL,
	description text,
	crime_id integer NOT NULL,
	crime_location character varying(255),
	date_opened date NOT NULL,
	date_closed date,
	solved boolean DEFAULT false,
	batman_involved boolean DEFAULT false
);

CREATE TABLE assignments (
	case_id integer NOT NULL,
	officer_id integer NOT NULL,
	start_date date NOT NULL,
	end_date date,
	PRIMARY KEY (case_id, officer_id)
);

CREATE TABLE suspects (
	case_id integer NOT NULL,
	criminal_id integer NOT NULL,
	became_suspect_on date NOT NULL,
	dropped_as_suspect_on date,
	PRIMARY KEY (case_id, criminal_id)
);
