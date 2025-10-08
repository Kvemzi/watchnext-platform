-- WatchNext Database Schema - Clean Version

CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    username VARCHAR(50) UNIQUE NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    password_hash VARCHAR(255) NOT NULL,
    bio TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE content (
    id SERIAL PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    type VARCHAR(20) NOT NULL,
    year INTEGER,
    genres TEXT[],
    director VARCHAR(255),
    description TEXT,
    duration INTEGER,
    seasons INTEGER,
    episodes INTEGER,
    imdb_rating DECIMAL(3,1),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE watched (
    id SERIAL PRIMARY KEY,
    user_id INTEGER REFERENCES users(id) ON DELETE CASCADE,
    content_id INTEGER REFERENCES content(id) ON DELETE CASCADE,
    date_watched DATE NOT NULL,
    rating INTEGER CHECK (rating >= 1 AND rating <= 10),
    review TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE watchlist (
    id SERIAL PRIMARY KEY,
    user_id INTEGER REFERENCES users(id) ON DELETE CASCADE,
    content_id INTEGER REFERENCES content(id) ON DELETE CASCADE,
    priority VARCHAR(20) DEFAULT 'medium',
    notes TEXT,
    added_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    UNIQUE(user_id, content_id)
);

CREATE TABLE friendships (
    id SERIAL PRIMARY KEY,
    user_id INTEGER REFERENCES users(id) ON DELETE CASCADE,
    friend_id INTEGER REFERENCES users(id) ON DELETE CASCADE,
    status VARCHAR(20) DEFAULT 'accepted',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    UNIQUE(user_id, friend_id)
);

CREATE INDEX idx_watched_user ON watched(user_id);
CREATE INDEX idx_content_type ON content(type);
CREATE INDEX idx_watchlist_user ON watchlist(user_id);

INSERT INTO users (username, email, password_hash, bio) VALUES
('marko123', 'marko@example.com', 'hash123', 'Sci-fi fanatic'),
('ana_movies', 'ana@example.com', 'hash456', 'Horror lover'),
('filmfan', 'petar@example.com', 'hash789', 'Watch everything');

INSERT INTO content (title, type, year, genres, director, description, duration, imdb_rating) VALUES
('Inception', 'movie', 2010, ARRAY['Sci-Fi', 'Thriller'], 'Christopher Nolan', 'Dream heist movie', 148, 8.8),
('The Matrix', 'movie', 1999, ARRAY['Sci-Fi', 'Action'], 'Wachowski Brothers', 'Reality simulation', 136, 8.7),
('Interstellar', 'movie', 2014, ARRAY['Sci-Fi', 'Drama'], 'Christopher Nolan', 'Space exploration', 169, 8.6),
('The Dark Knight', 'movie', 2008, ARRAY['Action', 'Crime'], 'Christopher Nolan', 'Batman vs Joker', 152, 9.0),
('Breaking Bad', 'series', 2008, ARRAY['Crime', 'Drama'], NULL, 'Teacher turned criminal', 5, 9.5),
('Stranger Things', 'series', 2016, ARRAY['Sci-Fi', 'Horror'], NULL, 'Kids vs supernatural', 4, 8.7);

INSERT INTO watched (user_id, content_id, date_watched, rating, review) VALUES
(1, 1, '2024-12-01', 10, 'Mind-blowing!'),
(1, 2, '2024-12-05', 9, 'Classic!'),
(2, 4, '2024-12-03', 9, 'Best Batman ever'),
(3, 3, '2024-12-08', 10, 'Space epic!');

INSERT INTO watchlist (user_id, content_id, priority, notes) VALUES
(1, 5, 'high', 'Must watch!'),
(2, 6, 'medium', 'Looks interesting');
