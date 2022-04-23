CREATE TABLE IF NOT EXISTS movie (
	movie_id VARCHAR(10),
	title VARCHAR(255),
	original_language VARCHAR(10),
	budget NUMERIC (15,1),
	popularity NUMERIC (10,6),
	release_date DATE,
	revenue NUMERIC (15,1),
	runtime NUMERIC (5,1),
	PRIMARY KEY (movie_id)
);

CREATE TABLE IF NOT EXISTS actor (
	actor_id 			VARCHAR(10),
	gender         		VARCHAR(10),   /* 1: female; 2: male*/
	name         		VARCHAR(50) NOT NULL,
	PRIMARY KEY (actor_id),
	CHECK (gender IN ('0', '1', '2'))
);

CREATE TABLE IF NOT EXISTS movie_actor (
	movie_id			VARCHAR(10),
	actor_id 			VARCHAR(10),
	character   		VARCHAR(500),
	actor_order         VARCHAR(10), 
	PRIMARY KEY (movie_id, actor_id),
	FOREIGN KEY (movie_id) REFERENCES movie,
	FOREIGN KEY (actor_id) REFERENCES actor
);

CREATE TABLE IF NOT EXISTS crew (
	crew_id 			VARCHAR(50),
	gender         		VARCHAR(10),   /* 1: female; 2: male*/
	name         		VARCHAR(50),
	PRIMARY KEY (crew_id),
	CHECK (gender IN ('0', '1', '2'))
);

CREATE TABLE IF NOT EXISTS movie_crew (
	movie_id			VARCHAR(10),
	crew_id 			VARCHAR(50),
	department   		VARCHAR(100) NOT NULL,
	job                 VARCHAR(100) NOT NULL,
	PRIMARY KEY (movie_id, crew_id),
	FOREIGN KEY (movie_id) REFERENCES movie,
	FOREIGN KEY (crew_id) REFERENCES crew
);

CREATE TABLE IF NOT EXISTS ratings (
	user_id 			VARCHAR(10),
	movie_id   			VARCHAR(10),
	rating         		NUMERIC(2,1) NOT NULL,   
	timestamp       	TIMESTAMP,
	PRIMARY KEY (user_id, movie_id),
	FOREIGN KEY (movie_id) REFERENCES movie
);

CREATE TABLE IF NOT EXISTS company (
	company_id 			VARCHAR(10),
	company_name   		VARCHAR(200) NOT NULL,
	PRIMARY KEY (company_id)
);

CREATE TABLE IF NOT EXISTS movie_company (
	movie_id			VARCHAR(10),
	company_id 			VARCHAR(10),
	PRIMARY KEY (movie_id, company_id),
	FOREIGN KEY (movie_id) REFERENCES movie,
	FOREIGN KEY (company_id) REFERENCES company
);

CREATE TABLE IF NOT EXISTS genres (
	genre_id			VARCHAR(10),
	genre_name			VARCHAR(50) NOT NULL,
	PRIMARY KEY (genre_id)
);

CREATE TABLE IF NOT EXISTS movie_genres (
	movie_id			VARCHAR(10),
	genre_id			VARCHAR(10),
	PRIMARY KEY (movie_id, genre_id),
	FOREIGN KEY (movie_id) REFERENCES movie,
	FOREIGN KEY (genre_id) REFERENCES genres
);

CREATE TABLE IF NOT EXISTS keywords (
	keyword_id VARCHAR(10),
	keyword_name VARCHAR(255),
	PRIMARY KEY (keyword_id)
);

CREATE TABLE IF NOT EXISTS movie_keywords (
	movie_id VARCHAR(10),
	keyword_id VARCHAR(10),
	PRIMARY KEY (movie_id, keyword_id),
	FOREIGN KEY (movie_id) REFERENCES movie,
	FOREIGN KEY (keyword_id) REFERENCES keywords
);

CREATE TABLE IF NOT EXISTS country (
	country_abbr VARCHAR(5),
	country_name VARCHAR(50),
	PRIMARY KEY (country_abbr)
);

CREATE TABLE IF NOT EXISTS movie_country (
	movie_id VARCHAR(10),
	country_abbr VARCHAR(5),
	PRIMARY KEY (movie_id, country_abbr),
	FOREIGN KEY (movie_id) REFERENCES movie,
	FOREIGN KEY (country_abbr) REFERENCES country
);



