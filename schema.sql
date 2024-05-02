-- CREATE TABLE grade (
--     id INTEGER PRIMARY KEY AUTOINCREMENT,
--     subject INTEGER NOT NULL,
--     exercise TEXT,
--     grade REAL NOT NULL,
--     date TEXT NOT NULL,
--     FOREIGN KEY (subject) REFERENCES subject(id)
-- );

-- CREATE TABLE subject (
--     id INTEGER PRIMARY KEY AUTOINCREMENT,
--     name TEXT NOT NULL
-- );

CREATE TABLE grade (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    date TEXT NOT NULL,
    subject INTEGER NOT NULL,
    exercise TEXT NOT NULL,
    grade REAL NOT NULL,
    scale REAL NOT NULL,
    class_average REAL NOT NULL,
    trimester INTEGER NOT NULL,
    FOREIGN KEY (subject) REFERENCES subject(id),
    FOREIGN KEY (trimester) REFERENCES trimester(id)
);

CREATE TABLE subject (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL
);

CREATE TABLE trimester (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    number INTEGER NOT NULL
);