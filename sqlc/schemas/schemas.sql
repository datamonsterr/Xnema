-- Create table movie
CREATE TABLE movie (
    movie_id SERIAL PRIMARY KEY,
    title VARCHAR,
    overview TEXT,
    original_language VARCHAR,
    ageRes INTEGER,
    release_date DATE,
    status VARCHAR,
    tagline TEXT,
    length INTEGER,
    url TEXT
);
 
-- Create table gerne
CREATE TABLE gerne ( id_gerne SERIAL PRIMARY KEY, name VARCHAR );
 
-- Create table movie_Join_gerne
CREATE TABLE movie_Join_gerne (
    movie_id INTEGER,
    id_gerne INTEGER,
    FOREIGN KEY (movie_id) REFERENCES movie (movie_id),
    FOREIGN KEY (id_gerne) REFERENCES gerne (id_gerne)
);
 
-- Create table cast
CREATE TABLE casts (
    id_cast SERIAL PRIMARY KEY,
    character VARCHAR,
    name VARCHAR,
    gender INTEGER
);
 
-- Create table movie_join_cast
CREATE TABLE movie_join_cast (
    movie_id INTEGER,
    id_cast INTEGER,
    FOREIGN KEY (movie_id) REFERENCES movie (movie_id),
    FOREIGN KEY (id_cast) REFERENCES casts (id_cast)
);
 
-- Create table crew
CREATE TABLE crew (
    id_crew SERIAL PRIMARY KEY,
    gender VARCHAR,
    role VARCHAR
);
 
-- Create table movie_join_crew
CREATE TABLE movie_join_crew (
    movie_id INTEGER,
    id_crew INTEGER,
    FOREIGN KEY (movie_id) REFERENCES movie (movie_id),
    FOREIGN KEY (id_crew) REFERENCES crew (id_crew)
);
 
-- Create table users
CREATE TABLE users (
    user_id SERIAL PRIMARY KEY,
    username VARCHAR,
    email VARCHAR,
    birth_date DATE,
    password VARCHAR,
    phone VARCHAR
);
 
-- Create table cinema
CREATE TABLE cinema (
    cinema_id SERIAL PRIMARY KEY,
    name VARCHAR
);
 
-- Create table room
CREATE TABLE room (
    room_id SERIAL PRIMARY KEY,
    cinema_id INTEGER,
    type VARCHAR,
    FOREIGN KEY (cinema_id) REFERENCES cinema (cinema_id)
);
 
-- Create table Schedule
CREATE TABLE Schedule (
    schedule_id SERIAL PRIMARY KEY,
    schedule_movie_date DATE,
    schedule_movie_start TIME,
    movie_id INTEGER,
    room_id INTEGER,
    cinema_id INTEGER,
    FOREIGN KEY (movie_id) REFERENCES movie (movie_id),
    FOREIGN KEY (cinema_id) REFERENCES cinema (cinema_id),
    FOREIGN KEY (room_id) REFERENCES room (room_id)
);
 
-- Create table seat
CREATE TABLE seat (
    seat_id SERIAL PRIMARY KEY,
    room_id INTEGER,
    FOREIGN KEY (room_id) REFERENCES room (room_id)
);

-- Create table ticket
CREATE TABLE ticket (
    id SERIAL PRIMARY KEY,
    user_id INTEGER,
    movie_id INTEGER,
    cinema_id INTEGER,
    schedule_id INTEGER,
    seat_id INTEGER,
    FOREIGN KEY (user_id) REFERENCES users (user_id),
    FOREIGN KEY (movie_id) REFERENCES movie (movie_id),
    FOREIGN KEY (cinema_id) REFERENCES cinema (cinema_id),
    FOREIGN KEY (schedule_id) REFERENCES Schedule (schedule_id),
    FOREIGN KEY (seat_id) REFERENCES seat (seat_id)
);

CREATE TABLE bill
(
    bill_id serial NOT NULL PRIMARY KEY,
    user_id integer,
    ticket_id integer[]
);

CREATE TABLE coupons
(
    id serial NOT NULL PRIMARY KEY,
    code VARCHAR(255) NOT NULL UNIQUE,
    description VARCHAR(255),
    discount_percentage INTEGER,
    valid_from DATE,
    expires_at DATE
);
